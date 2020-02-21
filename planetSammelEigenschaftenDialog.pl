:- module(planetSammelEigenschaftenDialog, [planetSammelEigenschaftenDialog/1]).

:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/planetSammelEigenschaftenDialogSystemAuswahl', planetSammelEigenschaftenDialogSystemAuswahl, []).
:- http_handler('/planetSammelEigenschaftenDialogPlanetAuswahl', planetSammelEigenschaftenDialogPlanetAuswahl, []).
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
	  '/planetSammelEigenschaftenDialog',
	  Request
	).

/* -----------------------------------  Eingabedialog ----------------------------------------------- */	
planetSammelEigenschaftenDialog(Request) :-
	member(method(post), Request), !,
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0]),
	 auswahlPlanet(AuswahlPlanet, [length > 0])
	]),
	(AuswahlPlanet = 'Bitte wählen' -> planetAuswahlDialog:fehlerBehandlung; 
	 planetenSammelEigenschaftenAnzeigen(AuswahlSystem, AuswahlPlanet)
	).

planetenSammelEigenschaftenAnzeigen(AuswahlSystem, AuswahlPlanet) :-
    /* einlesen der Eigenschaften */
    GesamtZeilenZahl = 136,
	findall([RecordNo, Stoff, Operation, Haupt, Neben, Ruest], 
	       (sammlung:sammlung(RecordNo, AuswahlSystem, AuswahlPlanet, Operation, Stoff, Haupt, Neben, Ruest),
	        Operation \= bekannt), 
	        RecordList),
	findall([FeldNo], between(1, GesamtZeilenZahl, FeldNo), FeldNoList),
	ausgabe:joinRecordsByRecordNo(FeldNoList, RecordList, 5, NumerierteRecordList),
	TermerizedBody = [
	\['<header>'],
    h1([align(center)], ['Sammelmöglichkeiten des Himmelskörpers eingeben']), 
    \['</header>'],
	\['<formSpace>'],       
    form([action('/planetSammelEigenschaften'), method('post'), name('planetenSammelEigenschaftenAuswahlForm')], 
       	 [\eingabeTabelleReadOnly(AuswahlSystem, AuswahlPlanet),
       	  div([class('table')],
	       	        [div(class('tr'), 
	       	             [div(class('td'), \innereTabelle(NumerierteRecordList))
	       	             ])
	       	        ]),
       	  p(['Zeitmessungen beginnen direkt vor der Sammelquelle und enden, sobald die Quelle erschöpft ist.   ',
       	  'Dann die Art der Gewinnung und die Zahl der damit gewonnenen Stoffe eingeben!   ',
       	  'Die Sekundärelemente nur eingeben, wenn das die einzige Möglichkeit auf dem Himmelskörper ist, den Stoff zu gewinnen!   ',
       	  'Es genügt die Angabe der schnellsten Methode.    ',
       	  'Stoffe, die nicht gewonnen werden können, auch nicht eingeben! '
       	  ]),
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
		var system = document.getElementById("auswahlSystem");
		var planet = document.getElementById("auswahlPlanet");
	}
	catch(err) {
		alert(err.message);
	}
	
	function Auswaehlen() {
		var rohstoff = this.parentNode.parentNode.childNodes[1].childNodes[1];
		var methode = this.parentNode.parentNode.childNodes[3].childNodes[1];
		var anzahl = this.parentNode.parentNode.childNodes[5].childNodes[0];
		var dauer = this.parentNode.parentNode.childNodes[7].childNodes[0];
		var gebinde = this.parentNode.parentNode.childNodes[9].childNodes[0];
		
		var request = new XMLHttpRequest();
		request.addEventListener("load", function(event) {
		    var parameter = request.responseText.split(''&'');
			var par0Tupel = parameter[0].split(''='');
		    var par1Tupel = parameter[1].split(''='');
		    var par2Tupel = parameter[2].split(''='');
		    var par3Tupel = parameter[3].split(''='');
		    if(methode.value == ''Bitte wählen'') {
		    	methode.value = par0Tupel[1];
		    }
		    if(anzahl.value == "" && dauer.value == "" && gebinde.value == "") {
		    	anzahl.value = par1Tupel[1];
		    	dauer.value = par2Tupel[1];
		    	gebinde.value = par3Tupel[1];
		    }
		}
		); 
		if(rohstoff.value != ''Bitte wählen'' ) {
			var req = "AjaxSammlungDefault?auswahlRohStoff=" + rohstoff.value
			     + "&" + "auswahlSystem=" + system.value
			     + "&" + "auswahlPlanet=" + planet.value
			     + "&" + "auswahlMethode=" + methode.value;
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

eingabeTabelleReadOnly(AuswahlSystem, AuswahlPlanet) -->
	html(
   	  div(class('table50'),[
   	    div(class('tr'), [
   	    	\divInputReadOnly('auswahlSystem', 'System: ', AuswahlSystem, 1),
   	    	\divInputReadOnly('auswahlPlanet', 'Planet: ', AuswahlPlanet, 2)
   	  	])
   	  ])).

divInputReadOnly(Name, LabelText, Value, Index) -->
	html(
	div(class('td'), [
		label([ for(Name)],[LabelText]),
   	  	input([ name(Name),
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
			    div([class('th'), scope("col")],['Methode']),
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
	((Operation = '', Operation0 = 'Bitte wählen'); (Operation0 = Operation)),
	((Haupt = '', Haupt0 = 0); (Haupt0 = Haupt)),
	((Neben = '', Neben0 = 0); (Neben0 = Neben)),
	((Ruest = '', Ruest0 = 0); (Ruest0 = Ruest)),
	arbeitsVorbereitung:toDauer(Operation, 1, Ruest0, Haupt0, Neben0, Dauer),
	((Dauer = 0, Gebinde = '', Anzahl = '', Dauer0 = ''); (Gebinde = 1, Anzahl = 1, Dauer0 = Dauer)),

	findall(St, (sammlung:sammlung(_, 'System', 'MeinPlanet', Op, St, _, _, _), Op \= bekannt), SammelStoffe0),
	sort(SammelStoffe0, SammelStoffe1),
	findall([Stoff0, St0], member(St0, SammelStoffe1), SammelStoffe),
	findall([Operation0, Aktion], (sammelAktion:sammelAktion(Aktion), Aktion \= bekannt), SammelAktionen)
	},
	html([	 
	      div(class('tr'), [ 
	      	div(class('td'), [label(FeldNo), \baueOptionsFeld('auswahlRohStoff', FeldNo, 1, SammelStoffe)]),
			div(class('td'), \baueOptionsFeld('methode', FeldNo, 2, SammelAktionen)),
			div(class('td'), [input([name('anzahl' + FeldNo), type('number'), min('1'), max('99999'), value(Anzahl)])]),
			div(class('td'), [input([name('dauer' + FeldNo), type('number'), min('1'), max('99999'), value(Dauer0)])]),
			div(class('td'), [input([name('gebinde' + FeldNo), type('number'), min('1'), max('30'), value(Gebinde)])])
		 ])
   	   ]),
   	   innereEingabeZeile(Rest).   	   

baueOptionsFeld(FeldName, FeldNo, StartIndex, OptionsWerteListe) -->
	{
		Index is FeldNo mod 100 + StartIndex,
		OptionsWerteListe = [[Wert,_]|_],
		((Wert = '', OptionText = option(selected, 'Bitte wählen')); (OptionText = option('Bitte wählen')))
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
		atom_string(Option, OptionText),
		((Wert = Option, OptionText0 = option(selected(selected), OptionText)); (OptionText0 = option(OptionText)))
	},
	html([
		OptionText0
	]),
	baueOption(Rest).
	
/* -----------------------------------  Abspeicherdialog -------------------------------------------- */
planetSammelEigenschaften(Request) :-
	member(method(post), Request), !,
	planetSammelEigenschaftenDialogParams:planetSammelEigenschaftenDialogParamList(Request, VarValueList),
	GesamtZeilenZahl = 136,
	\+plausibleEingabe(VarValueList, GesamtZeilenZahl),
    ((nb_getval('ZeileNoFehler', ZeileNoFehler),
      ZeileNoFehler > 0,
      fehlerZeile(ZeileNoFehler)
	 );
	 (nth1(1, VarValueList, AuswahlSystem),
	  nth1(2, VarValueList, AuswahlPlanet),
	  ignore(retractall(sammlung:sammlung(_, AuswahlSystem, AuswahlPlanet, _, _, _, _, _))),
	  \+ablegen(AuswahlSystem, AuswahlPlanet, GesamtZeilenZahl, VarValueList),
      gespeichert
     )
	).
    
plausibleEingabe(VarValueList, GesamtZeilenZahl) :-
	nb_setval('ZeileNoFehler', 0),
	between(1, GesamtZeilenZahl, ZeileNo),
	pickeZeile(GesamtZeilenZahl, ZeileNo, VarValueList, RohStoff, Methode, AnzahlNum, DauerNum, GebindeNum),
	\+leereZeile(RohStoff, Methode, DauerNum, AnzahlNum, GebindeNum),
	\+gueltigeZeile(RohStoff, Methode, DauerNum, AnzahlNum, GebindeNum),
	nb_setval('ZeileNoFehler', ZeileNo),
	!, fail.
	
   
pickeZeile(GesamtZeilenZahl, ZeilenZahl, VarValueList, RohStoff, Methode, AnzahlNum, DauerNum, GebindeNum) :-
  	OffsetRohStoff is 2 + 0 * GesamtZeilenZahl + ZeilenZahl,
    OffsetMethode is 2 + 1 * GesamtZeilenZahl + ZeilenZahl,
    OffsetAnzahl is 2 + 2 * GesamtZeilenZahl + ZeilenZahl,
    OffsetDauer is 2 + 3 * GesamtZeilenZahl + ZeilenZahl,
    OffsetGebinde is 2 + 4 * GesamtZeilenZahl + ZeilenZahl,
    nth1(OffsetRohStoff, VarValueList, RohStoff),
    nth1(OffsetMethode, VarValueList, Methode),
    nth1(OffsetAnzahl, VarValueList, Anzahl),
    nth1(OffsetDauer, VarValueList, Dauer),
    nth1(OffsetGebinde, VarValueList, Gebinde),
	atom_number(Anzahl, AnzahlNum),
	atom_number(Dauer, DauerNum),
	atom_number(Gebinde, GebindeNum).

ablegen(AuswahlSystem, AuswahlPlanet, GesamtZeilenZahl, VarValueList) :-
	between(1, GesamtZeilenZahl, ZeileNo),
	pickeZeile(GesamtZeilenZahl, ZeileNo, VarValueList, RohStoff, Methode, AnzahlNum, DauerNum, GebindeNum),
	gueltigeZeile(RohStoff, Methode, DauerNum, AnzahlNum, GebindeNum),
	arbeitsVorbereitung:toRuestHauptNebenZeit(Methode, AnzahlNum, DauerNum, GebindeNum, Ruest, Haupt, Neben),
	debug(myTrace, 'abspeichern: Sys=~k, Planet=~k, Roh=~k, Meth=~k, Ruest=~k, Haupt=~k, Neben=~k', 
		[AuswahlSystem, AuswahlPlanet, RohStoff, Methode, Ruest, Haupt, Neben]),
	assertz(sammlung:sammlung(ZeileNo, AuswahlSystem, AuswahlPlanet, Methode, RohStoff, Ruest, Haupt, Neben)),
	fail.
	
gespeichert :-
    server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Planetennamen')],
	TermerizedBody = [
		\['<header>'],
		h3(align(center),'gespeichert!'),
		\['</header>']
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
		\['</redHeader>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).
	
gueltigeZeile(RohStoff, Methode, Dauer, Anzahl, Gebinde) :-
	RohStoff \= 'Bitte wählen',
	Methode \= 'Bitte wählen',
	Dauer > 0,
	Anzahl > 0,
	Gebinde > 0.

leereZeile(RohStoff, Methode, Dauer, Anzahl, Gebinde) :-
	RohStoff = 'Bitte wählen',
	Methode = 'Bitte wählen',
	Dauer = 0,
	Anzahl = 0,
	Gebinde = 0.

ajaxSammlungDefault(Request) :-
	debug(myTrace, '~k', 'ajaxSammlungDefault aufgerufen'),
	member(method(get), Request), !, 
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0]),
	 auswahlPlanet(AuswahlPlanet, [length > 0]),
	 auswahlRohStoff(AuswahlRohStoff, [length > 0]),
	 auswahlMethode(AuswahlMethode, [length > 0])
	]), !,
	debug(myTrace, 'System: ~k', AuswahlSystem),
	debug(myTrace, 'Planet: ~k', AuswahlPlanet),
	debug(myTrace, 'Rohstoff: ~k', AuswahlRohStoff),
	debug(myTrace, 'Methode: ~s', AuswahlMethode),
    format('Content-type: text/plain~n~n'),
    (AuswahlMethode = 'Bitte wählen'; atom_string(Methode, AuswahlMethode)),
	((sammlung:sammlung(_, AuswahlSystem, AuswahlPlanet, Methode, AuswahlRohStoff, Haupt, _, Ruest), Anzahl = 1, atom_string(Methode, MethodeErgebnis));
	 (sammlung:sammlung(_, 'System', 'MeinPlanet', Methode, AuswahlRohStoff, Haupt, _, Ruest), Anzahl = 1, atom_string(Methode, MethodeErgebnis));
	 (Haupt = 0, Ruest = 0, Anzahl = 0, MethodeErgebnis = 'Bitte wählen')
	),
    debug(myTrace, 'Methode Ergebnis: ~k', MethodeErgebnis),
	Dauer is round(Haupt + Ruest),
	format('methode=~s&anzahl=~k&dauer=~k&gebinde=~k',[MethodeErgebnis, Anzahl, Dauer, 1]).

