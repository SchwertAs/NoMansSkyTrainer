:- module(planetSammelEigenschaftenDialog, [planetSammelEigenschaftenDialog/1]).

:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/planetSammelEigenschaftenDialogSystemAuswahl', planetSammelEigenschaftenDialogSystemAuswahl, []).
:- http_handler('/planetSammelEigenschaftenDialogPlanetAuswahl', planetSammelEigenschaftenDialogPlanetAuswahl, []).
:- http_handler('/planetSammelEigenschaftenDialogSammelArtAuswahl', planetSammelEigenschaftenDialogSammelArtAuswahl, []).
:- http_handler('/planetSammelEigenschaftenDialog', planetSammelEigenschaftenDialog, []).
:- http_handler('/planetSammelEigenschaften', planetSammelEigenschaften, []).
:- http_handler('/AjaxSammlungDefault', ajaxSammlungDefault, []).

/* -----------------------------------  Systemauswahl ----------------------------------------------- */
planetSammelEigenschaftenDialogSystemAuswahl(_Request) :-
	textResources:getText(txtSammelDetailsEingeben, TxtSammelDetailsEingeben),
	textResources:getText(txtSternenSystemEingeben, TxtSternenSystemEingeben),
	string_concat(TxtSammelDetailsEingeben, ': ', Txt0),
	string_concat(Txt0, TxtSternenSystemEingeben, TxtHeader),
	planetAuswahlDialog:systemAuswahlDialog(
	  TxtHeader,
	  '/planetSammelEigenschaftenDialogPlanetAuswahl').


/* -----------------------------------  Planetauswahl ----------------------------------------------- */
planetSammelEigenschaftenDialogPlanetAuswahl(Request) :-
	textResources:getText(txtSammelDetailsEingeben, TxtSammelDetailsEingeben),
	textResources:getText(txtPlanetAuswaehlen, TxtPlanetAuswaehlen),
	string_concat(TxtSammelDetailsEingeben, ': ', Txt0),
	string_concat(Txt0, TxtPlanetAuswaehlen, TxtHeader),
	planetAuswahlDialog:planetAuswahlDialog(
	  TxtHeader,
	  '/planetSammelEigenschaftenDialogSammelArtAuswahl',
	  Request
	).

/* -----------------------------------  Sammelartauswahl -------------------------------------------- */
planetSammelEigenschaftenDialogSammelArtAuswahl(Request) :-
	textResources:getText(txtSammelDetailsEingeben, TxtSammelDetailsEingeben),
	textResources:getText(txtSammelartEingebenHimmelskoerperAuswahl, TxtSammelartEingebenHimmelskoerperAuswahl),
	string_concat(TxtSammelDetailsEingeben, ': ', Txt0),
	string_concat(Txt0, TxtSammelartEingebenHimmelskoerperAuswahl, TxtHeader),
	sammelArtAuswahlDialog(
	  TxtHeader,
	  '/planetSammelEigenschaftenDialog',
	  Request
	).

/* -----------------------------------  Sammelartauswahl -------------------------------------------- */
sammelArtAuswahlDialog(HeaderText, Action, Request) :-
	member(method(post), Request), !,
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0]),
	 auswahlPlanet(AuswahlPlanet, [length > 0])
	]),
	((AuswahlPlanet = txtBitteWaehlen, planetAuswahlDialog:fehlerBehandlung); 
	(
	 findall(SammelArt, 
	   (sammelAktion:sammelAktion(SammelArt0), 
	    SammelArt0 \= bekannt,
	    textResources:getText(SammelArt0, SammelArt)
	   )
	   , SammelArten),
	 server:baueOptionsFeld('auswahlSammelArt', SammelArten, 2, OptionList),
	 textResources:getText(txtAuswahlSammelart, TxtAuswahlSammelart),
	 textResources:getText(txtOk, TxtOk),
	 textResources:getText(txtReset, TxtReset),
	 TermerizedBody = [
	 \['<header>'],
     h1([align(center)], [HeaderText]),
     \['</header>'],
	 \['<formSpace>'],       
     form([action(Action), method('post'), name('sammelArtAuswahlForm')], 
       	 [h3(TxtAuswahlSammelart),
       	  \sammelArtAnzeige(AuswahlSystem, AuswahlPlanet, OptionList),
       	  p(table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
		    	  [td([button([name("submit"), type("submit")], TxtOk)]),
		    	   td([button([name("reset"), type("reset")], TxtReset)])
		    	  ]))    
		 ]),
	 \['</formSpace>']
		             ],       
	 server:holeCssAlsStyle(StyleString),
	 TermerizedHead = [\[StyleString], title('No mans Sky trainer: Planet-Auswahl')],
	 reply_html_page(TermerizedHead, TermerizedBody)
	)).

/* -----------------------------------  Eingabedialog ----------------------------------------------- */	
planetSammelEigenschaftenDialog(Request) :-
	 textResources:getText(txtBitteWaehlen, TxtBitteWaehlen),
	member(method(post), Request), !,
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0]),
	 auswahlPlanet(AuswahlPlanet, [length > 0]),
	 auswahlSammelArt(AuswahlSammelArt, [length > 0])
	]),
	(AuswahlSammelArt = TxtBitteWaehlen -> planetAuswahlDialog:fehlerBehandlung; 
	 planetenSammelEigenschaftenAnzeigen(AuswahlSystem, AuswahlPlanet, AuswahlSammelArt)
	).

planetenSammelEigenschaftenAnzeigen(AuswahlSystem, AuswahlPlanet, AuswahlSammelArt0) :-
	textResources:getText(AuswahlSammelArt, AuswahlSammelArt0),
    /* einlesen der Eigenschaften */
    GesamtZeilenZahl = 15,
	findall([RecordNo, Stoff, AuswahlSammelArt, Haupt, Neben, Ruest], 
	       (sammlung:sammlung(RecordNo, AuswahlSystem, AuswahlPlanet, AuswahlSammelArt, Stoff, Haupt, Neben, Ruest)
	       ), 
	       RecordList),
	findall([FeldNo], between(1, GesamtZeilenZahl, FeldNo), FeldNoList),
	ausgabe:joinRecordsByRecordNo(FeldNoList, RecordList, 5, NumerierteRecordList),
	textResources:getText(txtOk, TxtOk),
	textResources:getText(txtReset, TxtReset),
	textResources:getText(txtZeitmessungenBeginnenDirektVorDerSammelQuelleUndEndenSobaldDieQuelleErschoepftIst, TxtZeitmessungenBeginnenDirektVorDerSammelQuelleUndEndenSobaldDieQuelleErschoepftIst),
	textResources:getText(txtDannArtGewinnungUndZahlDamitGewonnenenStoffeEingeben, TxtDannArtGewinnungUndZahlDamitGewonnenenStoffeEingeben),
	textResources:getText(txtSekundaerelementeNurEingebenWennEinzigeMöglichkeitStoffGewinnen, TxtSekundaerelementeNurEingebenWennEinzigeMöglichkeitStoffGewinnen),
	textResources:getText(txtEsGenuegtAngabeSchnellsteMethode, TxtEsGenuegtAngabeSchnellsteMethode),
	textResources:getText(txtNurStoffeGewonnenWerdenKoennenEingeben, TxtNurStoffeGewonnenWerdenKoennenEingeben),

	textResources:getText(txtSammelDetailsEingeben, TxtSammelDetailsEingeben),
	textResources:getText(txtSammelmoeglichkeitenHimmelskörperEingeben, TxtSammelmoeglichkeitenHimmelskörperEingeben),
	string_concat(TxtSammelDetailsEingeben, ': ', Txt0),
	string_concat(Txt0, TxtSammelmoeglichkeitenHimmelskörperEingeben, TxtHeader),
	TermerizedBody = [
	\['<header>'],
    h1([align(center)], [TxtHeader]), 
    \['</header>'],
	\['<formSpace>'],       
    form([action('/planetSammelEigenschaften'), method('post'), name('planetenSammelEigenschaftenAuswahlForm')], 
       	 [\eingabeTabelleReadOnly(AuswahlSystem, AuswahlPlanet, AuswahlSammelArt),
       	  div([class('table')],
	       	        [div(class('tr'), 
	       	             [div(class('td'), \innereTabelle(NumerierteRecordList, AuswahlSammelArt, GesamtZeilenZahl))
	       	             ])
	       	        ]),
       	  p(id(compactText), [TxtZeitmessungenBeginnenDirektVorDerSammelQuelleUndEndenSobaldDieQuelleErschoepftIst]),
		  p(id(compactText), [TxtDannArtGewinnungUndZahlDamitGewonnenenStoffeEingeben]),
		  p(id(compactText), [TxtSekundaerelementeNurEingebenWennEinzigeMöglichkeitStoffGewinnen]),
       	  p(id(compactText), [TxtEsGenuegtAngabeSchnellsteMethode]),
       	  p(id(compactText), [TxtNurStoffeGewonnenWerdenKoennenEingeben]),
       	  p(table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
		    	  [td([button([name("submit"), type("submit")], TxtOk)]),
		    	   td([button([name("reset"), type("reset")], TxtReset)])
		    	  ]))    
		 ]),
	\['</formSpace>'],
	\['<script>		
    try {
		var rohs = document.getElementsByClassName("Nachschlagen");
		for(var i=0; i < rohs.length; i++) {
			rohs[i].addEventListener("change", Auswaehlen);
		}	
	}
	catch(err) {
		alert(err.message);
	}
	
	function Auswaehlen() {
		var system = document.getElementById("auswahlSystem");
		var planet = document.getElementById("auswahlPlanet");
		var methode = document.getElementById("auswahlSammelArt");
		var rohstoff = this.parentNode.parentNode.childNodes[1].childNodes[2];
		var anzahl = this.parentNode.parentNode.childNodes[3].childNodes[0];
		var dauer = this.parentNode.parentNode.childNodes[5].childNodes[0];
		var gebinde = this.parentNode.parentNode.childNodes[7].childNodes[0];
		
		var request = new XMLHttpRequest();
		request.addEventListener("load", function(event) {
		    var parameter = request.responseText.split(''&'');
			var par0Tupel = parameter[0].split(''='');
		    var par1Tupel = parameter[1].split(''='');
		    var par2Tupel = parameter[2].split(''='');
		    var par3Tupel = parameter[3].split(''='');
		    //console.log("Anzahl %s", par1Tupel[1]);
		    //console.log("Dauer %s", par2Tupel[1]);
		    //console.log("Gebindezahl %s", par3Tupel[1]);
		    if (par1Tupel[1] == "-1")
		    {
		    	//console.log("Bedingung1 erfüllt");
		    	anzahl.value = " ";
		    	dauer.value = " ";
		    	gebinde.value = " ";
		    } else
		    if(anzahl.value == "" && dauer.value == "" && gebinde.value == "")
		    {
		    	//console.log("Bedingung2 erfüllt");
		    	anzahl.value = par1Tupel[1];
		    	dauer.value = par2Tupel[1];
		    	gebinde.value = par3Tupel[1];
		    } 
		}
		); 
		var req = "AjaxSammlungDefault?ajaxMethode=" + methode.value
		     + "&" + "ajaxSystem=" + system.value
		     + "&" + "ajaxPlanet=" + planet.value
		     + "&" + "ajaxRohStoff=" + rohstoff.value;
		request.open("GET", req);
		request.send();
	}
	</script>'
     ]
	],
	server:holeCssAlsStyle(StyleString),
	TermerizedHead = [
		\[StyleString], 
		title('No mans Sky trainer: System-Sammel-Eigenschaften')    
		],
	reply_html_page(TermerizedHead, TermerizedBody).

eingabeTabelleReadOnly(AuswahlSystem, AuswahlPlanet, AuswahlSammelArt) -->
	{	textResources:getText(AuswahlSammelArt, TxtAuswahlSammelArt),
		textResources:getText(txtSystemDp, TxtSystemDp),
		textResources:getText(txtPlanetDp, TxtPlanetDp),
		textResources:getText(txtSammelartDp, TxtSammelartDp)
	},
	html(
   	  div(class('table70'),[
   	    div(class('tr'), [
   	    	\divInputReadOnly('auswahlSystem', TxtSystemDp, AuswahlSystem, 1),
   	    	\divInputReadOnly('auswahlPlanet', TxtPlanetDp, AuswahlPlanet, 2),
   	    	\divInputReadOnly('auswahlSammelArt', TxtSammelartDp, TxtAuswahlSammelArt, 3)
   	  	])
   	  ])).

sammelArtAnzeige(AuswahlSystem, AuswahlPlanet, OptionList) -->
	{	textResources:getText(txtSammelartDp, TxtSammelartDp),
		textResources:getText(txtSystemDp, TxtSystemDp),
		textResources:getText(txtPlanetDp, TxtPlanetDp)
	},
	html(
   	  div(class('table70'),[
   	    div(class('tr'), [
   	    	\divInputReadOnly('auswahlSystem', TxtSystemDp, AuswahlSystem, 1),
   	    	\divInputReadOnly('auswahlPlanet', TxtPlanetDp, AuswahlPlanet, 2),
   	  	    div(class('td'), [
   	  	  	label([for('SammelArt')],TxtSammelartDp),
   	  	  	\OptionList
   	  	    ]) 
   	  	])
   	  ])).
   	  
divInputReadOnly(Name, LabelText, Value, Index) -->
	html(
	div(class('td'), [
		label([ for(Name)],[LabelText]),
   	  	input([ class(text40Format),
   	  	        name(Name),
   	  			id(Name),
   	  	  		type('text'), 
   	  	  		size(20), 
   	  	  		maxlength(20),
   	  	  		value(Value),
   	  	  		tabindex(Index),
   	  	  		readonly(true)
   	  	  	  ])
   	  	])
	).

innereTabelle(NumerierteRecordList, AuswahlSammelArt, GesamtZeilenZahl) -->
	{	textResources:getText(rohStoff, TxtGrossRohStoff),
		textResources:getText(txtGrossAnzahl, TxtGrossAnzahl),
		textResources:getText(txtGrossDauerEinHundertstelSekunden, TxtGrossDauerEinHundertstelSecunden),
		textResources:getText(txtGrossGebindeZahl, TxtGrossGebindeZahl)
	},
	html(
		[div(class('table'), 
			   [div(class('tr'), 
			   [div([class('th'), scope("col")],[TxtGrossRohStoff]),
			    div([class('th'), scope("col")],[TxtGrossAnzahl]),
			    div([class('th'), scope("col")],[TxtGrossDauerEinHundertstelSecunden]),
			    div([class('th'), scope("col")],[TxtGrossGebindeZahl])
   	           ]),
   	           \innereEingabeZeile(NumerierteRecordList, AuswahlSammelArt, GesamtZeilenZahl)
   	           ])
   	    ]).
	
innereEingabeZeile([], _, _) -->
	[].

innereEingabeZeile([Record|Rest], AuswahlSammelArt, GesamtZeilenZahl) -->
	{
	textResources:getText(txtBitteWaehlen, TxtBitteWaehlen),
	Record = [FeldNo, Stoff, Operation, Haupt, Neben, Ruest],
	((Stoff = '', Stoff0 = TxtBitteWaehlen); (Stoff0 = Stoff)),
	((Haupt = '', Haupt0 = 0); (Haupt0 = Haupt)),
	((Neben = '', Neben0 = 0); (Neben0 = Neben)),
	((Ruest = '', Ruest0 = 0); (Ruest0 = Ruest)),
	arbeitsVorbereitung:toDauer(Operation, 1, Ruest0, Haupt0, Neben0, Dauer0),
	((Dauer0 = 0, Gebinde = '', Anzahl = '', Dauer = ''); (Gebinde = 1, Anzahl = 1, Dauer = Dauer0)),
	findall( St, sammlung:sammlung(_, 'System', 'MeinPlanet', AuswahlSammelArt, St, _, _, _), SammelStoffe0),
	sort(SammelStoffe0, SammelStoffe1),
	findall([Stoff0, St2], member(St2, SammelStoffe1), SammelStoffe)
	},
	html([	 
	      div(class('tr'), [ 
	      	div(class('td'), [label(FeldNo), \baueOptionsFeldMitVorwahl('auswahlRohStoff', FeldNo, 1, SammelStoffe)]),
			div(class('td'), [input([name('anzahl' + FeldNo), type('number'), min('1'), max('99999'), value(Anzahl)])]),
			div(class('td'), [input([name('dauer' + FeldNo), type('number'), min('1'), max('99999'), value(Dauer)])]),
			div(class('td'), [input([name('gebinde' + FeldNo), type('number'), min('1'), max('30'), value(Gebinde)])])
		 ])
   	   ]),
   	   innereEingabeZeile(Rest, AuswahlSammelArt, GesamtZeilenZahl).   	   

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
		OptionTupel = [VorwahlWert, Option],
		textResources:getText(Option, OptionText),
		((VorwahlWert = Option, OptionText0 = option(selected(selected), OptionText)); 
		 (OptionText0 = option(OptionText)))
	},
	html([
		OptionText0
	]),
	baueOptionMitVorwahl(Rest).
	
/* -----------------------------------  Abspeicherdialog -------------------------------------------- */
planetSammelEigenschaften(Request) :-
	member(method(post), Request), !,
	planetSammelEigenschaftenDialogParams:planetSammelEigenschaftenDialogParamList(Request, VarValueList),
	GesamtZeilenZahl = 14,
	debug(myTrace, 'abspeichern: VarValueList=~k GesamtZeilenZahl=~k', [VarValueList, GesamtZeilenZahl]),
	\+plausibleEingabe(VarValueList, GesamtZeilenZahl),
    ((nb_getval('ZeileNoFehler', ZeileNoFehler),
      ZeileNoFehler > 0,
      fehlerZeile(ZeileNoFehler)
	 );
	 (
	  nth1(1, VarValueList, AuswahlSystem),
	  nth1(2, VarValueList, AuswahlPlanet),
	  nth1(3, VarValueList, TxtAuswahlSammelArt),	
	  textResources:getText(AuswahlSammelArt, TxtAuswahlSammelArt),
	  ignore(retractall(sammlung:sammlung(_, AuswahlSystem, AuswahlPlanet, AuswahlSammelArt, _, _, _, _))),
	  \+ablegen(AuswahlSystem, AuswahlPlanet, AuswahlSammelArt, GesamtZeilenZahl, VarValueList),
      sammlung:vorgefertigeLoesungenErstellen,
      gespeichert
     )
	).
    
plausibleEingabe(VarValueList, GesamtZeilenZahl) :-
	nb_setval('ZeileNoFehler', 0),
	between(1, GesamtZeilenZahl, ZeileNo),
	pickeZeile(GesamtZeilenZahl, ZeileNo, VarValueList, RohStoff, AnzahlNum, DauerNum, GebindeNum),
	\+leereZeile(RohStoff, DauerNum, AnzahlNum, GebindeNum),
	\+gueltigeZeile(RohStoff, DauerNum, AnzahlNum, GebindeNum),
	nb_setval('ZeileNoFehler', ZeileNo),
	!, fail.
	
   
pickeZeile(GesamtZeilenZahl, ZeilenZahl, VarValueList, RohStoff, AnzahlNum, DauerNum, GebindeNum) :-
	OffsetAuswahlen = 3,
  	OffsetRohStoff is OffsetAuswahlen + 0 * GesamtZeilenZahl + ZeilenZahl,
    OffsetAnzahl is OffsetAuswahlen + 1 * GesamtZeilenZahl + ZeilenZahl,
    OffsetDauer is OffsetAuswahlen + 2 * GesamtZeilenZahl + ZeilenZahl,
    OffsetGebinde is OffsetAuswahlen + 3 * GesamtZeilenZahl + ZeilenZahl,
    nth1(OffsetRohStoff, VarValueList, RohStoff0),
    textResources:getText(RohStoff, RohStoff0),
    nth1(OffsetAnzahl, VarValueList, Anzahl),
    nth1(OffsetDauer, VarValueList, Dauer),
    nth1(OffsetGebinde, VarValueList, Gebinde),
	atom_number(Anzahl, AnzahlNum),
	atom_number(Dauer, DauerNum),
	atom_number(Gebinde, GebindeNum).

ablegen(AuswahlSystem, AuswahlPlanet, AuswahlSammelArt, GesamtZeilenZahl, VarValueList) :-
	between(1, GesamtZeilenZahl, ZeileNo),
	pickeZeile(GesamtZeilenZahl, ZeileNo, VarValueList, RohStoff, AnzahlNum, DauerNum, GebindeNum),
	gueltigeZeile(RohStoff, DauerNum, AnzahlNum, GebindeNum),
	arbeitsVorbereitung:toRuestHauptNebenZeit(RohStoff, AuswahlSammelArt, AnzahlNum, DauerNum, GebindeNum, Haupt, Neben, Ruest),
	debug(myTrace, 'abspeichern: ZeileNo=~k Sys=~k, Planet=~k, Roh=~k, Meth=~k, Ruest=~k, Haupt=~k, Neben=~k', 
		[ZeileNo, AuswahlSystem, AuswahlPlanet, RohStoff, AuswahlSammelArt, Ruest, Haupt, Neben]),
	assertz(sammlung:sammlung(ZeileNo, AuswahlSystem, AuswahlPlanet, AuswahlSammelArt, RohStoff, Ruest, Haupt, Neben)),
	fail.
	
gespeichert :-
    server:holeCssAlsStyle(StyleString),
	textResources:getText(txtGespeichert, TxtGespeichert),
	textResources:getText(txtFunktionsAuswahl, TxtFunktionsAuswahl),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Planetennamen')],
	TermerizedBody = [
		\['<header>'],
		h1(align(center), TxtGespeichert),
		\['</header>'],
		\['<formSpace>'], 
		p(a(['href="/"'],[TxtFunktionsAuswahl])),
		\['</formSpace>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).

fehlerZeile(FeldNo) :-
	textResources:getText(txtDieZeile, TxtDieZeile),
	textResources:getText(txtIstUnvollstaendig, TxtIstUnvollstaendig),
	textResources:getText(txtFunktionsAuswahl, TxtFunktionsAuswahl),
	server:holeCssAlsStyle(StyleString),
	ZeileNo is FeldNo mod 100,
   	string_concat(TxtDieZeile, ZeileNo, FehlerMeldung0),
   	string_concat(FehlerMeldung0, TxtIstUnvollstaendig, FehlerMeldung),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Planeteneigenschaften Fehler')],
	TermerizedBody = [
		\['<redHeader>'],
		h3(align(center), FehlerMeldung),
		\['</redHeader>'],
		\['<formSpace>'], 
		p(a(['href="/"'],[TxtFunktionsAuswahl])),
		\['</formSpace>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).
	
gueltigeZeile(RohStoff, Dauer, Anzahl, Gebinde) :-
	RohStoff \= txtBitteWaehlen,
	Dauer > 0,
	Anzahl > 0,
	Gebinde > 0.

leereZeile(RohStoff, Dauer, Anzahl, Gebinde) :-
	RohStoff = txtBitteWaehlen,
	Dauer = 0,
	Anzahl = 0,
	Gebinde = 0.

/* -----------------------------------  Callback fuer vorausgefuellte Felder ------------------------ */
ajaxSammlungDefault(Request) :-
	debug(myTrace, '~k', 'ajaxSammlungDefault aufgerufen'),
	member(method(get), Request), !, 
	http_parameters(Request, 
	[ajaxRohStoff(AuswahlRohStoff0, [length > 0]),
	 ajaxSystem(AuswahlSystem, [length > 0]),
	 ajaxPlanet(AuswahlPlanet, [length > 0]),
	 ajaxMethode(AuswahlMethode, [length > 0])
	]), !,
	textResources:getText(AuswahlRohStoff, AuswahlRohStoff0),
	debug(myTrace, 'System: ~k', AuswahlSystem),
	debug(myTrace, 'Planet: ~k', AuswahlPlanet),
	debug(myTrace, 'Rohstoff: ~k', AuswahlRohStoff),
	debug(myTrace, 'Methode: ~s', AuswahlMethode),
    format('Content-type: text/plain~n~n'),
    ((sammlung:sammlung(_, AuswahlSystem, AuswahlPlanet, AuswahlMethode, AuswahlRohStoff, Haupt, _, Ruest), Anzahl = 1, debug(myTrace, 'lokal', []));
	 (sammlung:sammlung(_, 'System', 'MeinPlanet', AuswahlMethode, AuswahlRohStoff, Haupt, _, Ruest), Anzahl = 1, debug(myTrace, 'allgemein', []));
	 (AuswahlRohStoff = txtBitteWaehlen, Haupt = -1, Ruest= -1, Anzahl = -1, debug(myTrace, 'leeren', []));
	 (Haupt = 0, Ruest = 0, Anzahl = 1, debug(myTrace, 'default', []))
	),
	Dauer is round(Haupt + Ruest),
    debug(myTrace, 'Anzahl: ~k Dauer: ~k', [Anzahl, Dauer]),
	format('methode=~s&anzahl=~k&dauer=~k&gebinde=~k',[AuswahlMethode, Anzahl, Dauer, 1]).

