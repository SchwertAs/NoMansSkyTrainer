:- module(planetMondNameDialog, [planetMondNameDialog/1, planetMondName/1]).

:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/planetMondNameSystemAuswahlDialog', planetMondNameSystemAuswahlDialog, []).
:- http_handler('/planetMondNameDialog', planetMondNameDialog, []).
:- http_handler('/planetMondName', planetMondName, []).

/* ----------------------  Auswahl System  ----------------------------------------------------*/
planetMondNameSystemAuswahlDialog(_Request) :-
	textResources:getText(txtHimmelsKoerperEingeben, TxtHimmelsKoerperEingeben),
	textResources:getText(txtSternenSystemEingeben, TxtSternenSystemEingeben),
	string_concat(TxtHimmelsKoerperEingeben, ': ', Txt0),
	string_concat(Txt0, TxtSternenSystemEingeben, TxtHeader),

	planetAuswahlDialog:systemAuswahlDialog(
		TxtHeader, 
		'/planetMondNameDialog'). 
		
/* ----------------------  Eingabe Himmelskörper  ---------------------------------------------*/
planetMondNameDialog(Request) :-
	member(method(post), Request), !,
	textResources:getText(txtBitteWaehlen, TxtBitteWaehlen),
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0])
	]),
	(AuswahlSystem = TxtBitteWaehlen -> planetAuswahlDialog:fehlerBehandlung; 
	 planetMondNameAnzeigen(AuswahlSystem)
	).

planetMondNameAnzeigen(AuswahlSystem) :-
	findall([FeldNo1], between(1, 8, FeldNo1), FeldNoList),
	findall([RecordNo, HimmelsKoerper, PlanetenTyp], spielStatus:planeten(RecordNo, AuswahlSystem, HimmelsKoerper, PlanetenTyp), HimmelsKoerperListe0),
	sort(HimmelsKoerperListe0, HimmelsKoerperListe),
	ausgabe:joinRecordsByRecordNo(FeldNoList, HimmelsKoerperListe, 2, NumerierteRecordList),
	textResources:getText(txtHimmelsKoerperEingeben, TxtHimmelsKoerperEingeben),
	textResources:getText(txtSternenSystemNamenHimmelskoerperEingeben, TxtSternenSystemNamenHimmelskoerperEingeben),
	string_concat(TxtHimmelsKoerperEingeben, ': ', Txt0),
	string_concat(Txt0, TxtSternenSystemNamenHimmelskoerperEingeben, TxtHeader),
	
	textResources:getText(txtSternensystem, TxtSternensystem),
	textResources:getText(txtPlanetenUndMonde, TxtPlanetenUndMonde),
	textResources:getText(txtName, TxtName),
	textResources:getText(txtPlanetenTyp, TxtPlanetenTyp),
	textResources:getText(txtPlanetenTypBeiScanAusWeltraumAngezeigt, TxtPlanetenTypBeiScanAusWeltraumAngezeigt),
	textResources:getText(txtAlternativStehtErAuchInDerEndtdeckungsListe, TxtAlternativStehtErAuchInDerEndtdeckungsListe),
	textResources:getText(txtOk, TxtOk),
	textResources:getText(txtReset, TxtReset),
	TermerizedBody = [
		\['<header>'],
	    h1([align(center)], [TxtHeader]),
	    \['</header>'] ,
		\['<formSpace>'],       
	    form([action('/planetMondName'), method('post'), name('systemEigenschaftenForm')], 
	       	 [h3(TxtSternensystem),
       	  	  \eingabeTabelleReadOnly(AuswahlSystem),
	       	  h3(TxtPlanetenUndMonde),
	       	  div(class('table50'),
	       	        [div(class('tr'), 
	       	             [div([class('th'), scope("col")], TxtName),
	       	              div([class('th'), scope("col")], TxtPlanetenTyp)
	       	             ]),
	       	         \innereEingabeZeile(NumerierteRecordList)
	       	             ]), 
			       	  p(id(compactText), [TxtPlanetenTypBeiScanAusWeltraumAngezeigt]),
			       	  p(id(compactText), [TxtAlternativStehtErAuchInDerEndtdeckungsListe]),
			       	  p(table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
			    	  [td([button([name("submit"), type("submit")], TxtOk)]),
			    	   td([button([name("reset"), type("reset")], TxtReset)])
			    	  ]))
 			 ]),
		\['</formSpace>'] 
		             ],       
	server:holeCssAlsStyle(StyleString),
	textResources:getText(txtNoNansSkyTrainerHimmelskoerperEingeben, TxtNoNansSkyTrainerHimmelskoerperEingeben),
	TermerizedHead = [\[StyleString], title(TxtNoNansSkyTrainerHimmelskoerperEingeben)],
	reply_html_page(TermerizedHead, TermerizedBody).

eingabeTabelleReadOnly(AuswahlSystem) -->
	html(
   	  div(class('table30'),[
   	    div(class('tr'), [
   	    	\divInputReadOnly('auswahlSystem', 'System: ', AuswahlSystem, 1)
   	  	])
   	  ])).

divInputReadOnly(Name, LabelText, Value, Index) -->
	html(
	div(class('td'), [
		label([ for(Name)],[LabelText]),
   	  	input([ class(text40Format),
   	  	        name(Name),
   	  	  		type('text'), 
   	  	  		size(40), 
   	  	  		maxlength(40),
   	  	  		value(Value),
   	  	  		tabindex(Index),
   	  	  		readonly(true)
   	  	  	  ])
   	  	])
	).
	
innereEingabeZeile([]) -->
	[].

innereEingabeZeile([Record|Rest]) -->
	{
		Record = [FeldNo, Planet, PlanetenTyp],
		textResources:getText(txtBitteWaehlen, TxtBitteWaehlen),
		((PlanetenTyp = '', PlanetenTyp0 = TxtBitteWaehlen); (PlanetenTyp0 = PlanetenTyp)),
		findall([PlanetenTyp0, PlanTyp], 
			planetenTypen:planetenGruppePlanetenTyp(PlanTyp, _),
			PlanetenTypen0),
		sort(PlanetenTypen0, PlanetenTypen)
	},
	html([div(class('tr'), 
	          [div(class('td'), input([class(text40Format), name('planet' + FeldNo), type("text"), maxlength("40"), value(Planet)])
	              ),
	           div(class('td'), \baueOptionsFeldMitVorwahl('planetenTyp', FeldNo, 2, PlanetenTypen)
	              )  
   	          ])
   	     ]),
   	     innereEingabeZeile(Rest).   	   

baueOptionsFeldMitVorwahl(FeldName, FeldNo, StartIndex, OptionsWerteListe) -->
	{
		textResources:getText(txtBitteWaehlen, TxtBitteWaehlen),
		Index is FeldNo mod 100 + StartIndex,
		OptionsWerteListe = [[Wert,_]|_],
		((Wert = '', OptionText = option(selected, TxtBitteWaehlen)); (OptionText = option(TxtBitteWaehlen)))
	},
	html([select([name(FeldName + FeldNo), id(FeldName + FeldNo), class("Nachschlagen"), size("1"), maxlength(20), tabindex(Index)],
			     [
			      OptionText,
			      \baueOptionMitVorwahl(OptionsWerteListe)
   	        	 ])
	]).

baueOptionMitVorwahl([]) -->
	[].
 
baueOptionMitVorwahl([OptionTupel|Rest]) -->
	{
		OptionTupel = [Wert, Option],
		textResources:getText(Option, OptionText),
		((Wert = Option, OptionText0 = option(selected(selected), OptionText)); (OptionText0 = option(OptionText)))
	},
	html([
		OptionText0
	]),
	baueOptionMitVorwahl(Rest).

/* ----------------------  Antwort Formular ---------------------------------------------------*/
planetMondName(Request) :-
	member(method(post), Request), !,
	planetMondNameParamList(Request, VarValueList),
    debug(myTrace, 'Antwort: VarValueList=~k', [VarValueList]),
	GesamtZeilenZahl = 8,
	\+plausibleEingabe(VarValueList, GesamtZeilenZahl),
    ((nb_getval('ZeileNoFehler', ZeileNoFehler),
      ZeileNoFehler > 0,
      fehlerZeile(ZeileNoFehler)
	 );
	 (nth1(1, VarValueList, AuswahlSystem),
	  \+ablegen(AuswahlSystem, GesamtZeilenZahl, VarValueList),
      gespeichert
     )
	).

planetMondNameParamList(Request, VarValueList) :-
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0]),
     planet1(Planet1, [default("")]),
     planet2(Planet2, [default("")]),
     planet3(Planet3, [default("")]),
     planet4(Planet4, [default("")]),
     planet5(Planet5, [default("")]),
     planet6(Planet6, [default("")]),
     planet7(Planet7, [default("")]),
     planet8(Planet8, [default("")]),
     planetenTyp1(PlanetenTyp1, [default("")]),
     planetenTyp2(PlanetenTyp2, [default("")]),
     planetenTyp3(PlanetenTyp3, [default("")]),
     planetenTyp4(PlanetenTyp4, [default("")]),
     planetenTyp5(PlanetenTyp5, [default("")]),
     planetenTyp6(PlanetenTyp6, [default("")]),
     planetenTyp7(PlanetenTyp7, [default("")]),
     planetenTyp8(PlanetenTyp8, [default("")])
    ]),
	VarValueList = [AuswahlSystem,
	 Planet1, Planet2, Planet3, Planet4, Planet5, Planet6, Planet7, Planet8,
	 PlanetenTyp1, PlanetenTyp2, PlanetenTyp3, PlanetenTyp4, PlanetenTyp5, PlanetenTyp6, PlanetenTyp7, PlanetenTyp8
	].
	
plausibleEingabe(VarValueList, GesamtZeilenZahl) :-
	nb_setval('ZeileNoFehler', 0),
	between(1, GesamtZeilenZahl, ZeileNo),
	pickeZeile(GesamtZeilenZahl, ZeileNo, VarValueList, Planet, PlanetenTyp),
    \+leereZeile(Planet, PlanetenTyp),
	\+gueltigeZeile(Planet, PlanetenTyp),
	nb_setval('ZeileNoFehler', ZeileNo),
	!, fail.

pickeZeile(GesamtZeilenZahl, ZeilenZahl, VarValueList, Planet, PlanetenTyp) :-
    OffsetPlanet is 1 + 0 * GesamtZeilenZahl + ZeilenZahl,
    OffsetPlanetenTyp is 1 + 1 * GesamtZeilenZahl + ZeilenZahl,
    nth1(OffsetPlanet, VarValueList, Planet),
    nth1(OffsetPlanetenTyp, VarValueList, PlanetenTyp0),
    textResources:getText(PlanetenTyp, PlanetenTyp0).

leereZeile(Planet, PlanetenTyp) :-
	Planet = "",
	PlanetenTyp = txtBitteWaehlen.

gueltigeZeile(Planet, PlanetenTyp) :-
	Planet \= "",
	PlanetenTyp \= txtBitteWaehlen.

fehlerZeile(FeldNo) :-
	server:holeCssAlsStyle(StyleString),
	ZeileNo is FeldNo mod 100,
   	textResources:getText(txtDieZeile, TxtDieZeile),	
	textResources:getText(txtInSpalte, TxtInSpalte),
	textResources:getText(txtIstUnvollstaendig, TxtIstUnvollstaendig),	
	textResources:getText(txtFunktionsAuswahl, TxtFunktionsAuswahl),	
	string_concat(TxtDieZeile, ZeileNo, FehlerMeldung0),
	string_concat(FehlerMeldung0, TxtInSpalte, FehlerMeldung1),
	string_concat(FehlerMeldung1, 1, FehlerMeldung2),
   	string_concat(FehlerMeldung2, TxtIstUnvollstaendig, FehlerMeldung),
   	textResources:getText(txtNoMansSkyTrainerFehlerInZeile, TxtNoMansSkyTrainerFehlerInZeile),	
	TermerizedHead = [\[StyleString], title(TxtNoMansSkyTrainerFehlerInZeile)],
	TermerizedBody = [
		\['<redHeader>'],
		h3(align(center), FehlerMeldung),
		\['</redHeader>'],
		\['<formSpace>'], 
		p(a(['href="/"'],[TxtFunktionsAuswahl])),
		\['</formSpace>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).

ablegen(AuswahlSystem, GesamtZeilenZahl, VarValueList) :-
	between(1, GesamtZeilenZahl, ZeileNo),
	pickeZeile(GesamtZeilenZahl, ZeileNo, VarValueList, Planet, PlanetenTyp0),
	defaultBehandlung(PlanetenTyp0, PlanetenTyp),
    debug(myTrace, 'Auswahlsystem=~k', [AuswahlSystem]),
    debug(myTrace, 'Planet=~k PlanetenTyp=~k', [Planet, PlanetenTyp]),
    insUpdDel(AuswahlSystem, Planet, ZeileNo, PlanetenTyp),
	fail.

defaultBehandlung(PlanetenTyp0, PlanetenTyp) :-
	textResources:getText(txtBitteWaehlen, TxtBitteWaehlen),
	PlanetenTyp0 = TxtBitteWaehlen,
	PlanetenTyp = '',
	!.
	
defaultBehandlung(PlanetenTyp0, PlanetenTyp) :-
	PlanetenTyp = PlanetenTyp0.
	
gespeichert :-
    server:holeCssAlsStyle(StyleString),
	textResources:getText(txtNoMansSkyTrainerGespeichert, TxtNoMansSkyTrainerGespeichert),
	TermerizedHead = [\[StyleString], title(TxtNoMansSkyTrainerGespeichert)],
	textResources:getText(txtGespeichert, TxtGespeichert),
	textResources:getText(txtFunktionsAuswahl, TxtFunktionsAuswahl),	
	TermerizedBody = [
		\['<header>'],
		h1(align(center), TxtGespeichert),
		\['</header>'],
		\['<formSpace>'], 
		p(a(['href="/"'],[TxtFunktionsAuswahl])),
		\['</formSpace>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).

/* unverändert */
insUpdDel(System, PlanetNew, RecNo, PlanetenTyp) :-
	gueltigeZeile(PlanetNew, PlanetenTyp),
	spielStatus:planeten(RecNo, System, PlanetNew, PlanetenTyp),
	debug(myTrace, 'unverändert: RecNo=~k System=~k Planet=~k PlanetenTyp=~k', [RecNo, System, PlanetNew, PlanetenTyp]),
	!.

/* attribut-update */
insUpdDel(System, PlanetNew, RecNo, PlanetenTyp) :-
	gueltigeZeile(PlanetNew, PlanetenTyp),
	spielStatus:planeten(RecNo, System, PlanetNew, PlanetenTyp0),
	PlanetenTyp0 \= PlanetenTyp,
	debug(myTrace, 'Attribut-Update: RecNo=~k System=~k Planet=~k PlanetenTyp=~k', [RecNo, System, PlanetNew, PlanetenTyp]),
	retractall(spielStatus:planeten(RecNo, System, PlanetNew, _)),
	assertz(spielStatus:planeten(RecNo, System, PlanetNew, PlanetenTyp)),
	!.

/* in anderes Zeile verschoben */
insUpdDel(System, PlanetNew, RecNoNew, PlanetenTyp) :-
	gueltigeZeile(PlanetNew, PlanetenTyp),
	PlanetNew \= "",
	\+spielStatus:planeten(RecNoNew, System, PlanetNew, _),
	spielStatus:planeten(RecNoOld, System, PlanetNew, _),
	debug(myTrace, 'Zeile verschoben: RecNoOld=~k RecNoNew=~k System=~k Planet=~k PlanetenTyp=~k', [RecNoOld, RecNoNew, System, PlanetNew, PlanetenTyp]),
	retractall(spielStatus:planeten(RecNoOld, System, PlanetNew, _)),
	assertz(spielStatus:planeten(RecNoNew, System, PlanetNew, PlanetenTyp)),
	!.

/* umbenannt */
insUpdDel(System, PlanetNew, RecNoNew, PlanetenTyp) :-
	gueltigeZeile(PlanetNew, PlanetenTyp),
	spielStatus:planeten(RecNoNew, System, PlanetOld, _),
	PlanetNew \= "",
	debug(myTrace, 'Schlüsselupdate: RecNoNew=~k System=~k Planet=~k PlanetenTyp=~k', [RecNoNew, System, PlanetNew, PlanetenTyp]),
	forall(sammlung:sammlung(RecNo, System, PlanetOld, Operation, Stoff, Haupt, Neben, Ruest),
	       assertz(sammlung:sammlung(RecNo, System, PlanetNew, Operation, Stoff, Haupt, Neben, Ruest))
	      ),
	retractall(sammlung:sammlung(_, System, PlanetOld, _, _, _, _, _)),
	forall(spielStatus:systemAusstattung([System, PlanetOld, Ort], Entfernung),
		   assertz(spielStatus:systemAusstattung([System, PlanetNew, Ort], Entfernung))
	      ),
	retractall(spielStatus:systemAusstattung([System, PlanetOld, _], _)),
	retractall(spielStatus:planeten(RecNoNew, System, PlanetOld, _)),
	assertz(spielStatus:planeten(RecNoNew, System, PlanetNew, PlanetenTyp)),
	!.

/* insert */
insUpdDel(System, PlanetNew, RecNoNew, PlanetenTyp) :-
	gueltigeZeile(PlanetNew, PlanetenTyp),
	\+spielStatus:planeten(RecNoNew, System, _, _),
	PlanetNew \= "",
	debug(myTrace, 'insert: RecNoNew=~k System=~k Planet=~k PlanetenTyp=~k', [RecNoNew, System, PlanetNew, PlanetenTyp]),
	assertz(spielStatus:planeten(RecNoNew, System, PlanetNew, PlanetenTyp)),
	sammlung:copyDefaultIfEmpty(System, PlanetNew),
	spielStatus:copyDefaultIfEmpty(System, PlanetNew),
	!.
	
/* löschen cascade */
insUpdDel(System, PlanetNew, RecNoNew, _) :-
	spielStatus:planeten(RecNoNew, System, PlanetOld, _),
	PlanetNew = "",
	debug(myTrace, 'löschen: RecNoNew=~k System=~k PlanetOld=~k', [RecNoNew, System, PlanetOld]),
	retractall(sammlung:sammlung(_, System, PlanetOld, _, _, _, _, _)),
	retractall(spielStatus:systemAusstattung([System, PlanetOld, _], _)),
	retractall(spielStatus:planeten(RecNoNew, System, _, _)),
	!.

/* ungenutze zeilen skippen */
insUpdDel(_, PlanetNew, _, _) :-
	PlanetNew = "",
	!.

