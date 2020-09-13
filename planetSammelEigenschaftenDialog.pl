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
	planetAuswahlDialog:systemAuswahlDialog(
	  'Eigenschaften Himmelskörper eingeben: Systemauswahl',
	  '/planetSammelEigenschaftenDialogPlanetAuswahl').


/* -----------------------------------  Planetauswahl ----------------------------------------------- */
planetSammelEigenschaftenDialogPlanetAuswahl(Request) :-
	planetAuswahlDialog:planetAuswahlDialog(
	  'Eigenschaften Himmelskörper eingeben: Himmelskörperauswahl',
	  '/planetSammelEigenschaftenDialogSammelArtAuswahl',
	  Request
	).

/* -----------------------------------  Sammelartauswahl -------------------------------------------- */
planetSammelEigenschaftenDialogSammelArtAuswahl(Request) :-
	sammelArtAuswahlDialog(
	  'Sammelart eingeben: Himmelskörperauswahl',
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
	((AuswahlPlanet = 'Bitte wählen', planetAuswahlDialog:fehlerBehandlung); 
	(
	 findall(SammelArt, (sammelAktion:sammelAktion(SammelArt), SammelArt \= bekannt), SammelArten),
	 server:baueOptionsFeld('auswahlSammelArt', SammelArten, 2, OptionList),
	
	 TermerizedBody = [
	 \['<header>'],
     h1([align(center)], [HeaderText]),
     \['</header>'],
	 \['<formSpace>'],       
     form([action(Action), method('post'), name('sammelArtAuswahlForm')], 
       	 [h3('Auswahl Sammelart'),
       	  \sammelArtAnzeige(AuswahlSystem, AuswahlPlanet, OptionList),
       	  p(table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
		    	  [td([button([name("submit"), type("submit")], 'OK')]),
		    	   td([button([name("reset"), type("reset")], 'reset')])
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
	member(method(post), Request), !,
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0]),
	 auswahlPlanet(AuswahlPlanet, [length > 0]),
	 auswahlSammelArt(AuswahlSammelArt, [length > 0])
	]),
	(AuswahlSammelArt = 'Bitte wählen' -> planetAuswahlDialog:fehlerBehandlung; 
	 planetenSammelEigenschaftenAnzeigen(AuswahlSystem, AuswahlPlanet, AuswahlSammelArt)
	).

planetenSammelEigenschaftenAnzeigen(AuswahlSystem, AuswahlPlanet, AuswahlSammelArt) :-
    /* einlesen der Eigenschaften */
    GesamtZeilenZahl = 15,
	findall([RecordNo, Stoff, Operation, Haupt, Neben, Ruest], 
	       (sammlung:sammlung(RecordNo, AuswahlSystem, AuswahlPlanet, Operation, Stoff, Haupt, Neben, Ruest),
	        Operation = AuswahlSammelArt), 
	        RecordList),
	findall([FeldNo], between(1, GesamtZeilenZahl, FeldNo), FeldNoList),
	ausgabe:joinRecordsByRecordNo(FeldNoList, RecordList, 5, NumerierteRecordList),
	TermerizedBody = [
	\['<header>'],
    h1([align(center)], ['Sammelmöglichkeiten des Himmelskörpers eingeben']), 
    \['</header>'],
	\['<formSpace>'],       
    form([action('/planetSammelEigenschaften'), method('post'), name('planetenSammelEigenschaftenAuswahlForm')], 
       	 [\eingabeTabelleReadOnly(AuswahlSystem, AuswahlPlanet, AuswahlSammelArt),
       	  div([class('table')],
	       	        [div(class('tr'), 
	       	             [div(class('td'), \innereTabelle(NumerierteRecordList))
	       	             ])
	       	        ]),
       	  p(id(compactText), ['Zeitmessungen beginnen direkt vor der Sammelquelle und enden, sobald die Quelle erschöpft ist.']),
		  p(id(compactText), ['Dann die Art der Gewinnung und die Zahl der damit gewonnenen Stoffe eingeben!']),
		  p(id(compactText), ['Die Sekundärelemente nur eingeben, wenn das die einzige Möglichkeit auf dem Himmelskörper ist, den Stoff zu gewinnen!']),
       	  p(id(compactText), ['Es genügt die Angabe der schnellsten Methode.']),
       	  p(id(compactText), ['Stoffe, die nicht gewonnen werden können, auch nicht eingeben!']),
       	  p(table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
		    	  [td([button([name("submit"), type("submit")], 'OK')]),
		    	   td([button([name("reset"), type("reset")], 'reset')])
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
		    if(anzahl.value == "" && dauer.value == "" && gebinde.value == "") {
		    	anzahl.value = par1Tupel[1];
		    	dauer.value = par2Tupel[1];
		    	gebinde.value = par3Tupel[1];
		    }
		}
		); 
		if(rohstoff.value != ''Bitte wählen'' ) {
			var req = "AjaxSammlungDefault?ajaxMethode=" + methode.value
			     + "&" + "ajaxSystem=" + system.value
			     + "&" + "ajaxPlanet=" + planet.value
			     + "&" + "ajaxRohStoff=" + rohstoff.value;
			request.open("GET", req);
			request.send();
		}
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
	html(
   	  div(class('table70'),[
   	    div(class('tr'), [
   	    	\divInputReadOnly('auswahlSystem', 'System: ', AuswahlSystem, 1),
   	    	\divInputReadOnly('auswahlPlanet', 'Planet: ', AuswahlPlanet, 2),
   	    	\divInputReadOnly('auswahlSammelArt', 'Sammelart: ', AuswahlSammelArt, 3)
   	  	])
   	  ])).

sammelArtAnzeige(AuswahlSystem, AuswahlPlanet, OptionList) -->
	html(
   	  div(class('table70'),[
   	    div(class('tr'), [
   	    	\divInputReadOnly('auswahlSystem', 'System: ', AuswahlSystem, 1),
   	    	\divInputReadOnly('auswahlPlanet', 'Planet: ', AuswahlPlanet, 2),
   	  	    div(class('td'), [
   	  	  	label([for('SammelArt')],'Sammelart: '),
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

innereTabelle(NumerierteRecordList) -->
	html(
		[div(class('table'), 
			   [div(class('tr'), 
			   [div([class('th'), scope("col")],['Rohstoff']),
			    div([class('th'), scope("col")],['Anzahl']),
			    div([class('th'), scope("col")],['Dauer 1/100 s']),
			    div([class('th'), scope("col")],['Gebindezahl'])
   	           ]),
   	           \innereEingabeZeile(NumerierteRecordList)
   	           ])
   	    ]).
	
innereEingabeZeile([]) -->
	[].

innereEingabeZeile([Record|Rest]) -->
	{
	Record = [FeldNo, Stoff, Operation, Haupt, Neben, Ruest],
	((Stoff = '', Stoff0 = 'Bitte wählen'); (Stoff0 = Stoff)),
	((Haupt = '', Haupt0 = 0); (Haupt0 = Haupt)),
	((Neben = '', Neben0 = 0); (Neben0 = Neben)),
	((Ruest = '', Ruest0 = 0); (Ruest0 = Ruest)),
	arbeitsVorbereitung:toDauer(Operation, 1, Ruest0, Haupt0, Neben0, Dauer0),
	((Dauer0 = 0, Gebinde = '', Anzahl = '', Dauer = ''); (Gebinde = 1, Anzahl = 1, Dauer = Dauer0)),

	findall(St, (sammlung:sammlung(_, 'System', 'MeinPlanet', Op, St, _, _, _), Op \= bekannt), SammelStoffe0),
	sort(SammelStoffe0, SammelStoffe1),
	findall([Stoff0, St0], member(St0, SammelStoffe1), SammelStoffe)
	},
	html([	 
	      div(class('tr'), [ 
	      	div(class('td'), [label(FeldNo), \baueOptionsFeldMitVorwahl('auswahlRohStoff', FeldNo, 1, SammelStoffe)]),
			div(class('td'), [input([name('anzahl' + FeldNo), type('number'), min('1'), max('99999'), value(Anzahl)])]),
			div(class('td'), [input([name('dauer' + FeldNo), type('number'), min('1'), max('99999'), value(Dauer)])]),
			div(class('td'), [input([name('gebinde' + FeldNo), type('number'), min('1'), max('30'), value(Gebinde)])])
		 ])
   	   ]),
   	   innereEingabeZeile(Rest).   	   

baueOptionsFeldMitVorwahl(FeldName, FeldNo, StartIndex, OptionsWerteListe) -->
	{
		Index is FeldNo mod 100 + StartIndex,
		OptionsWerteListe = [[Wert,_]|_],
		((Wert = '', OptionText = option(selected, 'Bitte wählen')); (OptionText = option('Bitte wählen')))
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
		atom_string(Option, OptionText),
		((Wert = Option, OptionText0 = option(selected(selected), OptionText)); (OptionText0 = option(OptionText)))
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
	  nth1(3, VarValueList, AuswahlSammelArt),	
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
    nth1(OffsetRohStoff, VarValueList, RohStoff),
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
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Planetennamen')],
	TermerizedBody = [
		\['<header>'],
		h3(align(center),'gespeichert!'),
		\['</header>'],
		\['<formSpace>'], 
		p(\['<a href="/" > Funktionsauswahl </a>']),
		\['</formSpace>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).

fehlerZeile(FeldNo) :-
	server:holeCssAlsStyle(StyleString),
	ZeileNo is FeldNo mod 100,
   	string_concat('Die Zeile ', ZeileNo, FehlerMeldung0),
   	string_concat(FehlerMeldung0, ' ist unvollständig', FehlerMeldung),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Planeteneigenschaften Fehler')],
	TermerizedBody = [
		\['<redHeader>'],
		h3(align(center), FehlerMeldung),
		\['</redHeader>'],
		\['<formSpace>'], 
		p(\['<a href="/" > Funktionsauswahl </a>']),
		\['</formSpace>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).
	
gueltigeZeile(RohStoff, Dauer, Anzahl, Gebinde) :-
	RohStoff \= 'Bitte wählen',
	Dauer > 0,
	Anzahl > 0,
	Gebinde > 0.

leereZeile(RohStoff, Dauer, Anzahl, Gebinde) :-
	RohStoff = 'Bitte wählen',
	Dauer = 0,
	Anzahl = 0,
	Gebinde = 0.

/* -----------------------------------  Callback fuer vorausgefuellte Felder ------------------------ */
ajaxSammlungDefault(Request) :-
	debug(myTrace, '~k', 'ajaxSammlungDefault aufgerufen'),
	member(method(get), Request), !, 
	http_parameters(Request, 
	[ajaxRohStoff(AuswahlRohStoff, [length > 0]),
	 ajaxSystem(AuswahlSystem, [length > 0]),
	 ajaxPlanet(AuswahlPlanet, [length > 0]),
	 ajaxMethode(AuswahlMethode, [length > 0])
	]), !,
	debug(myTrace, 'System: ~k', AuswahlSystem),
	debug(myTrace, 'Planet: ~k', AuswahlPlanet),
	debug(myTrace, 'Rohstoff: ~k', AuswahlRohStoff),
	debug(myTrace, 'Methode: ~s', AuswahlMethode),
    format('Content-type: text/plain~n~n'),
    ((sammlung:sammlung(_, AuswahlSystem, AuswahlPlanet, AuswahlMethode, AuswahlRohStoff, Haupt, _, Ruest), Anzahl = 1);
	 (sammlung:sammlung(_, 'System', 'MeinPlanet', AuswahlMethode, AuswahlRohStoff, Haupt, _, Ruest), Anzahl = 1);
	 (Haupt = 0, Ruest = 0, Anzahl = 0)
	),
    debug(myTrace, 'Haupt: ~k, Ruest: ~k', [Haupt, Ruest]),
	Dauer is round(Haupt + Ruest),
	format('methode=~s&anzahl=~k&dauer=~k&gebinde=~k',[AuswahlMethode, Anzahl, Dauer, 1]).

