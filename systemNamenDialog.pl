:- module(systemNamenDialog, [systemNamenDialog/1]).

:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).

:- http_handler('/systemNamenDialog', systemNamenDialog, []).
:- http_handler('/systemNamen', systemNamen, []).

/* ----------------------  Eingabe Sternensysteme  --------------------------------------------*/
systemNamenDialog(_Request) :-
	findall([FeldNo, System, Farbe], (spielStatus:systeme(FeldNo, System, Farbe), System \= 'System'), SystemList),
	ausgabe:partialList(SystemList, 1, 20, SystemList1),
	ausgabe:partialList(SystemList, 21, 40, SystemList2),
	ausgabe:partialList(SystemList, 41, 60, SystemList3),
	findall([FeldNo1], between(101, 120, FeldNo1), FeldNoList1),
	findall([FeldNo2], between(201, 220, FeldNo2), FeldNoList2),
	findall([FeldNo3], between(301, 320, FeldNo3), FeldNoList3),
	ausgabe:joinRecordsByRecordNo(FeldNoList1, SystemList1, 2, NumerierteRecordList1),
	ausgabe:joinRecordsByRecordNo(FeldNoList2, SystemList2, 2, NumerierteRecordList2),
	ausgabe:joinRecordsByRecordNo(FeldNoList3, SystemList3, 2, NumerierteRecordList3),
	textResources:getText(txtSternenSystemeEingeben, TxtSternenSystemeEingeben),
	textResources:getText(txtEingabeSternenSysteme, TxtEingabeSternenSysteme),	
	string_concat(TxtSternenSystemeEingeben, ': ', Txt0),
	string_concat(Txt0, TxtEingabeSternenSysteme, TxtHeader),
	textResources:getText(txtOk, TxtOk),
	textResources:getText(txtReset, TxtReset),
	
	TermerizedBody = [
		\['<header>'],
	    h1([align(center)], [TxtHeader]),
	    \['</header>'],
		\['<formSpace>'],       
	    form([action('/systemNamen'), method('post')], 
	       	 [div(class('table'),
	       	      [div(class('tr'), 
	       	           [div(class('td'), \innereTabelle(NumerierteRecordList1)),
	       	            div(class('td'), \innereTabelle(NumerierteRecordList2)),
	       	            div(class('td'), \innereTabelle(NumerierteRecordList3))
	       	           ])
	       	      ]),
			 table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
			       [td([button([name("submit"), type("submit")], TxtOk)]),
			    		td([button([name("reset"), type("reset")], TxtReset)])
			    	   ])
			       ]),
		\['</formSpace>']
		             ],       
	server:holeCssAlsStyle(StyleString),
	textResources:getText(txtNoMansSkyTrainerSternensystemeEingeben, TxtNoMansSkyTrainerSternensystemeEingeben),	
	TermerizedHead = [\[StyleString], title(TxtNoMansSkyTrainerSternensystemeEingeben)],
	reply_html_page(TermerizedHead, TermerizedBody).

innereTabelle(NumerierteRecordList) -->
	{
		textResources:getText(txtSystemName, TxtSystemName),	
		textResources:getText(txtFarbe, TxtFarbe)
	},
	html(
		[div(class('table'), 
			 [div(class('tr'), 
			      [div([class('th'), scope("col")], TxtSystemName),
			       div([class('th'), scope("col")], TxtFarbe)
   	              ]),
   	           \innereEingabeZeile(NumerierteRecordList)
   	         ])
   	    ]).
	
innereEingabeZeile([]) -->
	[].

innereEingabeZeile([Record|Rest]) -->
	{
		Record = [FeldNo, System, Farbe],
		SpalteNo is floor(FeldNo / 100),
		findall([Farbe, Farbe0], spielStatus:sternFarbe(Farbe0), Farben)
	},
	html([div(class('tr'), 
	          [div(class('td'), 
	               input([class(text40Format), name('systemName' + FeldNo), type("text"), maxlength("40"), pattern("^(?!System$).*$"), value(System)])
	              ),
			   div(class('td'), \baueOptionsFeld('farbe', FeldNo, SpalteNo, Farben))
   	          ])
   	     ]),
   	     innereEingabeZeile(Rest).   	   

baueOptionsFeld(FeldName, FeldNo, StartIndex, OptionsWerteListe) -->
	{
		textResources:getText(txtBitteWaehlen, TxtBitteWaehlen),
		Index is (FeldNo mod 100 - 1) * 3 + StartIndex,
		OptionsWerteListe = [[Wert,_]|_],
		((Wert = '', OptionText = option(selected, TxtBitteWaehlen)); (OptionText = option(TxtBitteWaehlen)))
	},
	html([select([name(FeldName + FeldNo), id(FeldName + FeldNo), class("Nachschlagen"), size("1"), maxlength(20), tabindex(Index)],
			     [
			      OptionText,
			      \baueOption(OptionsWerteListe)
   	        	 ])
	]).

baueOption([]) -->
	[].
 
baueOption([OptionTupel|Rest]) -->
	{
		OptionTupel = [Wert, Option],
		textResources:getText(Option, OptionText),
		((Wert = Option, OptionText0 = option(selected, OptionText)); (OptionText0 = option(OptionText)))
	},
	html([
		OptionText0
	]),
	baueOption(Rest).
	

/* ----------------------  Antwort Formular ---------------------------------------------------*/
systemNamen(Request) :-
	member(method(post), Request), !,
	systemNamenDialogParams:systemNamenDialogParamList(Request, VarValueList),
	GesamtZeilenZahl = 20,
	\+plausibleEingabe(VarValueList, GesamtZeilenZahl),
    ((nb_getval('ZeileNoFehler', ZeileNoFehler),
      nb_getval('SpalteNoFehler', SpalteNoFehler),
      ZeileNoFehler > 0,
      fehlerZeile(ZeileNoFehler, SpalteNoFehler)
	 );
	 (
	  \+ablegen(GesamtZeilenZahl, VarValueList),
	  loescheWeggefalleneSysteme(GesamtZeilenZahl, VarValueList),
      server:gespeichert
     )
	).

plausibleEingabe(VarValueList, GesamtZeilenZahl) :-
	nb_setval('ZeileNoFehler', 0),
	nb_setval('SpalteNoFehler', 0),
	between(1, 3, Spalte),
	between(1, GesamtZeilenZahl, Zeile),
	pickeZeile(GesamtZeilenZahl, Zeile, Spalte, VarValueList, System, Farbe),
	\+leereZeile(System, Farbe),
	\+gueltigeZeile(System, Farbe),
	nb_setval('ZeileNoFehler', Zeile),
	nb_setval('SpalteNoFehler', Spalte),
	!, fail.
	
pickeZeile(GesamtZeilenZahl, Zeile, Spalte, VarValueList, System, Farbe) :-
  	OffsetSystem is 2 * (Spalte - 1) * GesamtZeilenZahl + Zeile,
    OffsetFarbe is 2 * (Spalte - 1) * GesamtZeilenZahl + GesamtZeilenZahl + Zeile,
    nth1(OffsetSystem, VarValueList, System),
    nth1(OffsetFarbe, VarValueList, TxtFarbe),
    textResources:getText(Farbe, TxtFarbe).

loescheWeggefalleneSysteme(GesamtZeilenZahl, VarValueList) :-
	findall(VorhandenesSystem, spielStatus:systeme(_, VorhandenesSystem, _), VorhandeneSysteme),
	findall( System, (between(1, 3, Spalte),
	                  between(1, GesamtZeilenZahl, Zeile),
	                  pickeZeile(GesamtZeilenZahl, Zeile, Spalte, VarValueList, System, _),
					  System \= ""), EingegebeneSysteme0),
	append(EingegebeneSysteme0, ['System'], EingegebeneSysteme),
	subtract(VorhandeneSysteme, EingegebeneSysteme, ZuLoeschendeSysteme),
	forall(member(System, ZuLoeschendeSysteme), loescheSystem(System)).

/* löschen cascade */
loescheSystem(SystemAlt) :-
	debug(myTrace, 'delete: SystemAlt=~k', [SystemAlt]),
	retractall(sammlung:sammlung(_, SystemAlt, _, _, _, _, _, _)),
	retractall(spielStatus:systemAusstattung([SystemAlt, _, _], _)),
	retractall(spielStatus:planeten(_, SystemAlt, _, _)),	
	retractall(spielStatus:systeme(_, SystemAlt, _)).
	
ablegen(GesamtZeilenZahl, VarValueList) :-
	between(1, 3, Spalte),
	between(1, GesamtZeilenZahl, Zeile),
	pickeZeile(GesamtZeilenZahl, Zeile, Spalte, VarValueList, System, Farbe),
	FeldNummer is Spalte * 100 + Zeile,
	insUpdDel(FeldNummer, System, Farbe),
	fail.

/* leeres System */
insUpdDel(_, System, _) :-
	System = "",
	debug(myTrace, 'Leeres Feld (wird später gelöscht)', []),
	!.
	
/* identisch */
insUpdDel(FeldNummer, System, Farbe) :-
	spielStatus:systeme(FeldNummer, System, Farbe),
	debug(myTrace, 'unverändert: Feld=~k System=~k Farbe=~k', [FeldNummer, System, Farbe]),
	!.
	
/* Umbenennung System */
insUpdDel(FeldNummer, SystemNeu, FarbeNeu) :-
	SystemNeu \= "",
	\+spielStatus:systeme(_, SystemNeu, _), /* Wenn System schon existiert, keine Umbenennung sondern Verschiebung */
	spielStatus:systeme(FeldNummer, SystemAlt, FarbeAlt),
	SystemNeu \= SystemAlt,
	debug(myTrace, 'System-Umbenennung: Feld=~k SystemAlt=~k SystemNeu=~k', [FeldNummer, SystemAlt, SystemNeu]),
	/* Systemname in planet updaten */
	forall(spielStatus:planeten(RecNo0, SystemAlt, Planet0, AtmospherenTyp), 
	 assertz(spielStatus:planeten(RecNo0, SystemNeu, Planet0, AtmospherenTyp))
	),
	retractall(spielStatus:planeten(_, SystemAlt, _, _)),
	/* sammlung updaten */
	forall(sammlung:sammlung(RecNo1, SystemAlt, Planet1, Operation, Stoff, Haupt, Neben, Ruest),
	       assertz(sammlung:sammlung(RecNo1, SystemNeu, Planet1, Operation, Stoff, Haupt, Neben, Ruest))
	      ),
	retractall(sammlung:sammlung(_, SystemAlt, _, _, _, _, _, _)),
	/* systemausstattung updaten */
	forall(spielStatus:systemAusstattung([SystemAlt, Planet2, Ort], Entfernung),
		   assertz(spielStatus:systemAusstattung([SystemNeu, Planet2, Ort], Entfernung))
	      ),
	retractall(spielStatus:systemAusstattung([SystemAlt, _, _], _)),
	/*  */
	retractall(spielStatus:systeme(FeldNummer, SystemAlt, _)),
	assertz(spielStatus:systeme(FeldNummer, SystemNeu, FarbeNeu)),	
	ignore(updFarbe(SystemNeu, FarbeAlt, FarbeNeu)),
	!.

/* insert */
insUpdDel(FeldNummerNeu, SystemNeu, FarbeNeu) :-
	\+spielStatus:systeme(_, SystemNeu, _),
	debug(myTrace, 'insert: FeldNummerNeu=~k SystemNeu=~k, FarbeNeu=~k', [FeldNummerNeu, SystemNeu, FarbeNeu]),
	assertz(spielStatus:systeme(FeldNummerNeu, SystemNeu, FarbeNeu)),
	!.

/* move evtl. mit anderer farbe */
insUpdDel(FeldNummerNeu, System, FarbeNeu) :-
	spielStatus:systeme(FeldNummerAlt, System, FarbeAlt),
	FeldNummerNeu \= FeldNummerAlt,
	debug(myTrace, 'verschoben: FeldAlt=~k FeldNeu=~k System=~k', [FeldNummerAlt, FeldNummerNeu, System]),
	retractall(spielStatus:systeme(FeldNummerAlt, System, _)),
	assertz(spielStatus:systeme(FeldNummerNeu, System, FarbeNeu)),
	ignore(updFarbe(System, FarbeAlt, FarbeNeu)),
	!.
	
/* Attibuts-update */
insUpdDel(FeldNummerNeu, System, FarbeNeu) :-
	spielStatus:systeme(FeldNummerNeu, System, FarbeAlt),
	debug(myTrace, 'Attribut-Update: Feld=~k System=~k Farbe=~k', [FeldNummerNeu, System, FarbeNeu]),
	retractall(spielStatus:systeme(FeldNummerNeu, System, _)),
	assertz(spielStatus:systeme(FeldNummerNeu, System, FarbeNeu)),
	updFarbe(System, FarbeAlt, FarbeNeu),
	!.

updFarbe(System, FarbeAlt, FarbeNeu) :-
	FarbeNeu \= FarbeAlt,
	forall(planetSammelEigenschaftenDefaults:sammelDefaultSystemTyp(FarbeAlt, Aktion1, Stoff1),
	ignore(retractall(sammlung:sammlung(_, System, _, Aktion1, Stoff1, _, _, _)))),
	/* neue Defaults anlegen */
	forall((planetSammelEigenschaftenDefaults:sammelDefaultSystemTyp(FarbeNeu, Aktion2, Stoff2),
	        sammlung:sammlung(_, 'System', 'MeinPlanet', Aktion2, Stoff2, Haupt, Neben, Ruest),
	        spielStatus:planeten(_, System, Planet, _),
	        sammelAktion:pruefeSammelAktionVorraussetzung(System, Planet, Aktion2)),
	        assertz(sammlung:sammlung(-1, System, Planet, Aktion2, Stoff2, Haupt, Neben, Ruest))
	      ).

fehlerZeile(Zeile, Spalte) :-
	server:holeCssAlsStyle(StyleString),
	textResources:getText(txtDieZeile, TxtDieZeile),
	textResources:getText(txtInSpalte, TxtInSpalte),
	textResources:getText(txtIstUnvollstaendig, TxtIstUnvollstaendig),
	textResources:getText(txtFunktionsAuswahl, TxtFunktionsAuswahl),
	textResources:getText(txtNoMansSkyTrainerSternensystemeEingeben, TxtNoMansSkyTrainerSternensystemeEingeben),
	string_concat(TxtDieZeile, Zeile, FehlerMeldung0),
	string_concat(FehlerMeldung0, TxtInSpalte, FehlerMeldung1),
	string_concat(FehlerMeldung1, Spalte, FehlerMeldung2),
   	string_concat(FehlerMeldung2, TxtIstUnvollstaendig, FehlerMeldung),
	TermerizedHead = [\[StyleString], title(TxtNoMansSkyTrainerSternensystemeEingeben)],
	TermerizedBody = [
		\['<redHeader>'],
		h3(align(center), FehlerMeldung),
		\['</redHeader>'],
		\['<formSpace>'], 
		p(a(['href="/"'],[TxtFunktionsAuswahl])),
		\['</formSpace>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).

gueltigeZeile(System, Farbe) :-
	System \= "",
	Farbe \= txtBitteWaehlen.

leereZeile(System, Farbe) :-
	System = "",
	Farbe = txtBitteWaehlen.

	