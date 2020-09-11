:- module(stoffErlangenDialog, [stoffErlangen/1]).

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/stoffErlangenDialogSystemAusWahl', stoffErlangenDialogSystemAusWahl, []).
:- http_handler('/stoffErlangenDialogPlanetAusWahl', stoffErlangenDialogPlanetAusWahl, []).
:- http_handler('/stoffErlangenDialog', stoffErlangenDialog, []).
:- http_handler('/stoffErlangen', stoffErlangen, []).

/* -----------------------------------  Systemauswahl ----------------------------------------------- */
stoffErlangenDialogSystemAusWahl(_Request) :-
	planetAuswahlDialog:systemAuswahlDialog(
	  'Stoff erlangen - Aufenthaltsort des Spielers: System auswählen',
	  '/stoffErlangenDialogPlanetAusWahl').

/* -----------------------------------  Planetauswahl ----------------------------------------------- */
stoffErlangenDialogPlanetAusWahl(Request) :-
	planetAuswahlDialog:planetAuswahlDialog(
	  'Stoff erlangen - Aufenthaltsort des Spielers: Planet auswählen',
	  '/stoffErlangenDialog',
	  Request
	).

/* ----------------------  Eingabe Formular ---------------------------------------------------*/
stoffErlangenDialog(Request) :-
	member(method(post), Request), 
	!,
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0]),
	 auswahlPlanet(AuswahlPlanet, [length > 0])
	]) ,
	((AuswahlPlanet = 'Bitte wählen', planetAuswahlDialog:fehlerBehandlung); 
	 stoffErlangenAnzeigen(AuswahlSystem, AuswahlPlanet)
	).

	
stoffErlangenAnzeigen(AuswahlSystem, AuswahlPlanet) :-
	ausgabe:baueStoffListeFuerStoffKlassen([rohStoff, rohUndKochStoff], Stoffe1),
	server:baueOptionsFeld('auswahlRohStoff', Stoffe1, 2, OptionList1),
	ausgabe:baueStoffListeFuerStoffKlassen([produkt, produktUndKochStoff], Stoffe2),
	server:baueOptionsFeld('auswahlProdukt', Stoffe2, 3, OptionList2),
	ausgabe:baueStoffListeFuerStoffKlassen([basisBauEndStoff], Stoffe3),
	server:baueOptionsFeld('auswahlBau', Stoffe3, 4, OptionList3),
	ausgabe:baueStoffListeFuerStoffKlassen([modul], Stoffe4),
	server:baueOptionsFeld('auswahlModul', Stoffe4, 5, OptionList4),
	ausgabe:baueStoffListeFuerStoffKlassen([kochStoff, produktUndKochStoff, rohUndKochStoff], Stoffe5),
	server:baueOptionsFeld('auswahlGericht', Stoffe5, 6, OptionList5),

	TermerizedBody = [
		\['<header>'],
	    h1([align(center)], ['Auswahl für empfohlene Handlungen um bestimmten Stoff zu erhalten']),
	    \['</header>'],
		\['<formSpace>'],       
	    form([action('/stoffErlangen'), method('post')], 
	       	 [h3('Aufenthaltsort des Spielers'),
       	      \eingabeTabelleReadOnly(AuswahlSystem, AuswahlPlanet),  	
       	      h3('Optimierung'),
       	      p(fieldset([name('fieldSet1')], [legend(['Möglichst wenig']),
	       					p([input([type(radio), name('optimierungsZiel'), id('optimierungsZiel'), value('minimaleZeit')]),
	       					   label([for('Zeitverbrauch')])
	       					  ]),
	       					p([input([type(radio), checked(true), name('optimierungsZiel'), id('optimierungsZielSammelZahl'), value('minimaleSammlung')]),
	       					   label([for('Sammlungsgegenstände')])
	       					  ]),
	       					p([
	       					   input([type(radio), name('optimierungsZiel'), id('optimierungsZielSammelKosten'), value('minimaleKosten')]),
							   label([for('Kosten')])
	       					  ])
	       		         ])
	       		),
			  	h3(['gewünschter Stoff']),
			  	p([label(for('anzahl', 'Anzahl: ')),
			  	   input([name('anzahl'), type('text'), value(''), size='24', tabindex(1)])
			  	   
			  	]),
			    table([width('100%'), border(1), cellspacing(3), cellpadding(2)],
			      [tr([th('Rohstoffe'), th('Produkte'), th('Basis-Bauteile'), th('Module'), th('Gerichte')]),
			       tr([td(OptionList1), td(OptionList2), td(OptionList3), td(OptionList4), td(OptionList5)])
			      ]),
			    p(
		    	table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
		    	      [td([button([name("submit"), type("submit")], 'OK')]),
		    		   td([button([name("reset"), type("reset")], 'reset')])
		    	      ])
		    	)
	      	]
	      ),
		\['</formSpace>']     
	],
	server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Stoff erlangen')],
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
   	  	input([ class(text40Format),
   	  	        name(Name),
   	  	  		type('text'), 
   	  	  		size(20), 
   	  	  		maxlength(20),
   	  	  		value(Value),
   	  	  		tabindex(Index),
   	  	  		readonly(true)
   	  	  	  ])
   	  	])
	).

/* ----------------------  Antwort Formular ---------------------------------------------------*/
stoffErlangen(Request) :-
    member(method(post), Request), !,
    http_parameters(Request, [
      auswahlSystem(AuswahlSystem, [length > 0]),
	  auswahlPlanet(AuswahlPlanet, [length > 0]),
      anzahl(AtomAnzahl, [default('1')]),
      auswahlRohStoff(Stoff1, [length > 1]),
      auswahlProdukt(Stoff2, [length > 1]),
      auswahlBau(Stoff3, [length > 1]),
      auswahlModul(Stoff4, [length > 1]),
      auswahlGericht(Stoff5, [length > 1]),
      optimierungsZiel(Ziel, [])
    ]),
	atom_number(AtomAnzahl, Anzahl),
    ((nurEinStoffGewaehlt(Stoff1, Stoff2, Stoff3, Stoff4, Stoff5, Stoff),
      ergebnisAusgeben(AuswahlSystem, AuswahlPlanet, Anzahl, Ziel, Stoff)
     );
     fehlerBehandlung(Stoff1, Stoff2, Stoff3, Stoff4, Stoff5)
    ),
    !.

fehlerBehandlung(Stoff1, Stoff2, Stoff3, Stoff4, Stoff5) :-    
     ((Stoff1 == 'Bitte wählen', Stoff2 = 'Bitte wählen', Stoff3 = 'Bitte wählen',
         Stoff4 = 'Bitte wählen', Stoff5 = 'Bitte wählen',
       einenWaehlen
      );
      (nurEinenWaehlen
     )).

einenWaehlen() :-
	server:holeCssAlsStyle(StyleString),
   	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Stoff erlangen')],
	TermerizedBody = [
		\['<redHeader>'],
		h1(align(center), 'Bitte genau eine Auswahl treffen!'),
		\['</redHeader>']
		],
	
	reply_html_page(TermerizedHead, TermerizedBody).

nurEinenWaehlen() :-
	server:holeCssAlsStyle(StyleString),
   	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Stoff erlangen')],
	TermerizedBody = [
		\['<redHeader>'],
		h1(align(center), 'Bitte nur eine Auswahl treffen! Bei den nicht benötigten Eingaben muss "Bitte wählen" eingestellt sein!'),
		\['</redHeader>']
		],
	
	reply_html_page(TermerizedHead, TermerizedBody).

nurEinStoffGewaehlt(Stoff1, Stoff2, Stoff3, Stoff4, Stoff5, Stoff) :-
	((Stoff1 \= 'Bitte wählen', Stoff2 = 'Bitte wählen', Stoff3 = 'Bitte wählen', 
		Stoff4 = 'Bitte wählen', Stoff5 = 'Bitte wählen', Stoff = Stoff1);
	 (Stoff1 = 'Bitte wählen', Stoff2 \= 'Bitte wählen', Stoff3 = 'Bitte wählen', 
		Stoff4 = 'Bitte wählen', Stoff5 = 'Bitte wählen', Stoff = Stoff2);
	 (Stoff1 = 'Bitte wählen', Stoff2 = 'Bitte wählen', Stoff3 \= 'Bitte wählen', 
		Stoff4 = 'Bitte wählen', Stoff5 = 'Bitte wählen', Stoff = Stoff3);
	 (Stoff1 = 'Bitte wählen', Stoff2 = 'Bitte wählen', Stoff3 = 'Bitte wählen', 
		Stoff4 \= 'Bitte wählen', Stoff5 = 'Bitte wählen', Stoff = Stoff4);
	 (Stoff1 = 'Bitte wählen', Stoff2 = 'Bitte wählen', Stoff3 = 'Bitte wählen', 
		Stoff4 = 'Bitte wählen', Stoff5 \= 'Bitte wählen', Stoff = Stoff5)
	).
	
ergebnisAusgeben(System, Planet, Anzahl, Ziel, Stoff) :-
    ignore(retractall(spielStatus:systemAusstattung([_, _, ortSpieler], _))),
    assertz(spielStatus:systemAusstattung([System, Planet, ortSpieler], 0)),
	(optimierteLoesung(System, Planet, Ziel, Anzahl, Stoff);
	 nichtHerstellBar(Ziel)),
	!.
	

optimierteLoesung(System, Planet, OptimierungsZiel, Anzahl, Stoff) :-  
	\+suchAlgorithmus:baue(System, Planet, OptimierungsZiel, Anzahl, Stoff),
	optimierung:optimierungsStrategie(OptimierungsZiel, Stoff, SammelSet, Vorgaenge, SammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes),
	zeigeOptimiertesErgebnis(System, Planet, Anzahl, Stoff, OptimierungsZiel, SammelSet, Vorgaenge, SammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes).

zeigeOptimiertesErgebnis(System, Planet, Anzahl, Stoff, Ziel, SammelSet, Vorgaenge, SammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes) :-
	ausgabe:ausgabeSammlung(SammelSet, [], SammelSetPred),
    ausgabe:ausgabeVorgaenge(Vorgaenge, [], VorgaengePred),
	ausgabe:ausgabeSummen(SammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes, SummenPred),
	grafischeAusgabe:hierarchieGrafik(Vorgaenge, Svg),
   	server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Stoff erlangen')],
	TermerizedBody = [
		  	\['<header>'],
		  	h1([align(center)], ['Stoff erlangen']),
		  	\['</header>'],
		  	\['<formSpace>'],
		    table( [width('35%'), border(1)], 
				   [caption(h2('Eingaben')),
					tr([th([scope('col')],['Anzahl']),
						th([scope('col')],['Gesuchter Stoff']),
						th([scope('col')],['Optimierung']),
						th([scope('col')],['System']),
						th([scope('col')],['Planet'])
				   	   ]),
					tr([td(Anzahl),
				    	td(Stoff),
				    	td(Ziel),
				    	td(System),
				    	td(Planet)
				   	   ])
			       ]),
    		table( [width('25%'), border(1)], 
		           [caption(h2('Stückliste')),
		            tr([th([scope('col')],['Anzahl']),
		            	th([scope('col')],['Stoff'])
		               ]),
			           \ausgabeSammlungDcg(SammelSetPred)
		           ]),
		    p([],[]),
		    table( [width('98%'), border(1)], 
		           [ tr(\[Svg])
		           ]),
		    table( [width('100%'), border(1)], 
		           [caption(h2('Aktionsreihenfolge')),
		            tr([th([scope('col')],['Anweisung']),
		                th([scope('col')],['Operation']),
		                th([scope('col')],['Ergebnis'])
		               ]) ,
			           \ausgabeVorgaengeDcg(VorgaengePred) 
		           ]),
		    table( [width('35%'), border(1)],
		    	   [caption(h2('Summenwerte')),
		            tr([th([scope('col')],['Summenwert']),
		                th([scope('col')],['Anzahl']),
		                th([scope('col')],['Einheit'])
		               ]),
		               \ausgabeSummenDcg(SummenPred)
		           ]),
			p(\['<a href="/" > Funktionsauswahl </a>']),
		\['</formSpace>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).

ausgabeSammlungDcg([]) -->
	[].
	
ausgabeSammlungDcg([sam(Anzahl, Stoff) | Rest]) -->
	html([ tr([ td(Anzahl),
                td(Stoff)
                  ])
             ]),
        ausgabeSammlungDcg(Rest).

ausgabeVorgaengeDcg([]) -->
	[].
	
ausgabeVorgaengeDcg([vorg(Anweisung, Operation, Ergebnis) | Rest]) -->
	html([ tr([ td(Anweisung),
                td(Operation),
                td(Ergebnis)
              ])
         ]),
   ausgabeVorgaengeDcg(Rest).
   
ausgabeSummenDcg([]) -->
	[].
	
ausgabeSummenDcg([sum(Name, Wert, Einheit) | Rest]) -->
	html([ tr([ td(Name),
                td(Wert),
                td(Einheit)
              ])
         ]),
   ausgabeSummenDcg(Rest).

nichtHerstellBar(Ziel) :-
	ausgabe:baueBegruendung(Ziel, BegrTupel),
   	server:holeCssAlsStyle(StyleString),
   	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Stoff erlangen')],
	BegrTupel \= [],
	TermerizedBody = [
		\['<redHeader>'],
		h1(align(center), 'Beschaffen und herstellen nicht möglich.'),
		\['</redHeader>'],
		\['<redFormSpace>'],
		h3('Begründung:'),
		\ausgabeBegruendungDcg(BegrTupel),
		p(\['<a href="/" > Funktionsauswahl </a>']),
		\['</redFormSpace>']
		            ],
	reply_html_page(TermerizedHead, TermerizedBody).

nichtHerstellBar(_) :-
   	server:holeCssAlsStyle(StyleString),
   	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Stoff erlangen')],
	TermerizedBody = [
		\['<redHeader>'],
		h1(align(center), 'Beschaffung nicht möglich und keine Rezepte vorhanden'),
		\['</redHeader>'],
		\['<formSpace>'], 
		p(\['<a href="/" > Funktionsauswahl </a>']),
		\['</formSpace>']
		],
	
	reply_html_page(TermerizedHead, TermerizedBody).

ausgabeBegruendungDcg([]) -->
	[].
	
ausgabeBegruendungDcg([begr(FehlStoff, VorgaengePred) | Rest]) -->
	{ string_concat(FehlStoff, ' kann nicht beschafft werden', Meldung)
	},
	html([	table( [width('100%'), border(1)], 
		           [caption(h3(Meldung)),
		            tr([th([scope('col')],['Rezeptversuch'])
		               ]) ,
			           \ausgabeVorgaengeBegrDcg(VorgaengePred) 
		           ])
         ]),
   ausgabeBegruendungDcg(Rest).

ausgabeVorgaengeBegrDcg([]) -->
	[].
	
ausgabeVorgaengeBegrDcg([vorg(Anweisung, _, _) | Rest]) -->
	html([ tr([ td(Anweisung)
              ])
         ]),
   ausgabeVorgaengeBegrDcg(Rest).

