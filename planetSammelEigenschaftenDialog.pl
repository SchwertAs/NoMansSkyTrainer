:- module(planetSammelEigenschaftenDialog, [planetSammelEigenschaftenDialog/1]).

:- use_module(library(dcg/basics)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/http_header)).
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
    /* TODO einlesen der Eigenschaften */
	/* Einlesen vorhandener Werte */
	findall(FeldNo1, between(101, 119, FeldNo1), FeldNoList1),
	TermerizedBody = [
	\['<header>'],
    h1([align(center)], ['Sammelmöglichkeiten des Himmelskörpers eingeben']),
    \['</header>'],
	\['<formSpace>'],       
    form([action('/planetSammelEigenschaften'), method('post'), name('planetenSammelEigenschaftenAuswahlForm')], 
       	 [\eingabeTabelleReadOnly(AuswahlSystem, AuswahlPlanet),
       	  div([class('table')],
	       	        [div(class('tr'), 
	       	             [div(class('td'), \innereTabelle(FeldNoList1))
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
		
		var request = new XMLHttpRequest();
		request.addEventListener("loadend", function(event) {
		    var parameter = request.responseText.split(''&'');
			var par0Tupel = parameter[0].split(''='');
		    var par1Tupel = parameter[1].split(''='');
		    var par2Tupel = parameter[2].split(''='');
		    methode.value = par0Tupel[1];
		    anzahl.value = par1Tupel[1];
		    dauer.value = par2Tupel[1];
		}
		); 
		if(rohstoff.value != ''Bitte wählen'' && methode.value != ''Bitte wählen'') {
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
	debug(myTrace, 'Methode: ~k', AuswahlMethode),
    format('Content-type: text/plain~n~n'),
	((sammlung:sammlung(AuswahlSystem, AuswahlPlanet, AuswahlMethode, AuswahlRohStoff, Haupt, Neben, Ruest), Anzahl=1);
	 (sammlung:sammlung('System', 'MeinPlanet', AuswahlMethode, AuswahlRohStoff, Haupt, Neben, Ruest), Anzahl=1);
	 (Haupt = 0, Neben = 0, Ruest = 0, Anzahl = 0)
	),
	Dauer is Haupt + Neben + Ruest,
	format('methode=~k&anzahl=~k&dauer=~k',[AuswahlMethode, Anzahl, Dauer]).

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

innereTabelle(FeldNoList) -->
	html(
		[div(class('table'), 
			   [div(class('tr'), 
			   [div([class('th'), scope("col")],['Rohstoff']),
			    div([class('th'), scope("col")],['Methode']),
			    div([class('th'), scope("col")],['Anzahl']),
			    div([class('th'), scope("col")],['Dauer 1/100 s'])
   	           ]),
   	           \innereEingabeZeile(FeldNoList)
   	           ])
   	    ]).
	
innereEingabeZeile([]) -->
	[].

innereEingabeZeile([FeldNo|Rest]) -->
	{
	ausgabe:baueStoffListeFuerStoffKlassen([rohStoff, rohUndKochStoff], RohStoffe),
	findall(Aktion, (sammelAktion:sammelAktion(Aktion, _), Aktion \= bekannt), SammelAktionen)
	},
	html([	
	      div(class('tr'), [
	      	div(class('td'), \baueOptionsFeld('auswahlRohStoff', FeldNo, 1, RohStoffe)),
			div(class('td'), \baueOptionsFeld('methode', FeldNo, 2, SammelAktionen)),
			div([class('td'), name('Anzahl' + FeldNo)], [input([name('anzahl' + FeldNo), type('number'), min('0'), max('99999')])]),
			div(class('td'), [input([name('dauer' + FeldNo), type('number'), min('0'), max('99999')])])
		 ])
   	   ]),
   	   innereEingabeZeile(Rest).   	   

baueOptionsFeld(FeldName, FeldNo, StartIndex, OptionsWerteListe) -->
	{
		Index is FeldNo mod 100 + StartIndex
	},
	html([select([name(FeldName + FeldNo), id(FeldName + FeldNo), class("Nachschlagen"), size("1"), maxlength(20), tabindex(Index)],
			     [option(selected, 'Bitte wählen'),
			      \baueOption(OptionsWerteListe)
   	        	 ])
	]).

baueOption([]) -->
	[].

baueOption([Option|Rest]) -->
	{
		atom_string(Option, OptionText)
	},
	html([
		option(OptionText)
	]),
	baueOption(Rest).
	
planetSammelEigenschaften(Request) :-
	member(method(post), Request), !,
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0]),
	 auswahlPlanet(AuswahlPlanet, [length > 0])
	]),
	/* TODO Plausi */
	/* TODO einlesen und Abspeichern */
	
	(AuswahlPlanet = 'Bitte wählen' -> planetAuswahlDialog:fehlerBehandlung; 
	 planetenSammelEigenschaftenAnzeigen(AuswahlSystem, AuswahlPlanet)
	).
