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
	textResources:getText(txtStoffErlangenAufenthaltsortSpielerSystemAuswählen, TxtStoffErlangenAufenthaltsortSpielerSystemAuswählen),
	planetAuswahlDialog:systemAuswahlDialog(
	  TxtStoffErlangenAufenthaltsortSpielerSystemAuswählen,
	  '/stoffErlangenDialogPlanetAusWahl').

/* -----------------------------------  Planetauswahl ----------------------------------------------- */
stoffErlangenDialogPlanetAusWahl(Request) :-
	textResources:getText(txtStoffErlangenAufenthaltsortSpielerPlanetAuswählen, TxtStoffErlangenAufenthaltsortSpielerPlanetAuswählen),
	planetAuswahlDialog:planetAuswahlDialog(
	  TxtStoffErlangenAufenthaltsortSpielerPlanetAuswählen,
	  '/stoffErlangenDialog',
	  Request
	).

/* ----------------------  Eingabe Formular ---------------------------------------------------*/
stoffErlangenDialog(Request) :-
	textResources:getText(txtBitteWaehlen, TxtBitteWaehlen),
	member(method(post), Request), 
	!,
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0]),
	 auswahlPlanet(AuswahlPlanet, [length > 0])
	]) ,
	((AuswahlPlanet = TxtBitteWaehlen, planetAuswahlDialog:fehlerBehandlung); 
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
	textResources:getText(txtAuswahlEmpfohleneHandlungenStoffErhalten, TxtAuswahlEmpfohleneHandlungenStoffErhalten),
	textResources:getText(txtAufenthaltsOrtSpieler, TxtAufenthaltsOrtSpieler),
	textResources:getText(txtOptimierung, TxtOptimierung),
	textResources:getText(txtMoeglichstWenig, TxtMoeglichstWenig),
	textResources:getText(txtZeitverbrauch, TxtZeitverbrauch),
	textResources:getText(txtSammlungsgegenstaende, TxtSammlungsgegenstaende),
	textResources:getText(txtKosten, TxtKosten),
	textResources:getText(txtGewuenschterStoff, TxtGewuenschterStoff),
	textResources:getText(txtAnzahlDp, TxtAnzahl),
	textResources:getText(txtRohstoffe, TxtRohstoffe),
	textResources:getText(txtProdukte, TxtProdukte),
	textResources:getText(txtBasisBauteile, TxtBasisBauteile),
	textResources:getText(txtModule, TxtModule),
	textResources:getText(txtGerichte, TxtGerichte),
	textResources:getText(txtOk, TxtOk),
	textResources:getText(txtReset, TxtReset),

	TermerizedBody = [
		\['<header>'],
	    h1([align(center)], [TxtAuswahlEmpfohleneHandlungenStoffErhalten]),
	    \['</header>'],
		\['<formSpace>'],       
	    form([action('/stoffErlangen'), method('post')], 
	       	 [h3(TxtAufenthaltsOrtSpieler),
       	      \eingabeTabelleReadOnly(AuswahlSystem, AuswahlPlanet),  	
       	      h3(TxtOptimierung),
       	      p(fieldset([name('fieldSet1')], [legend([TxtMoeglichstWenig]),
	       					p([input([type(radio), name('optimierungsZiel'), id('optimierungsZiel'), value('minimaleZeit')]),
	       					   label([for(TxtZeitverbrauch)])
	       					  ]),
	       					p([input([type(radio), checked(true), name('optimierungsZiel'), id('optimierungsZielSammelZahl'), value('minimaleSammlung')]),
	       					   label([for(TxtSammlungsgegenstaende)])
	       					  ]),
	       					p([
	       					   input([type(radio), name('optimierungsZiel'), id('optimierungsZielSammelKosten'), value('minimaleKosten')]),
							   label([for(TxtKosten)])
	       					  ])
	       		         ])
	       		),
			  	h3([TxtGewuenschterStoff]),
			  	p([label(for('anzahl', TxtAnzahl)),
			  	   input([name('anzahl'), type('text'), value(''), size='24', tabindex(1)])
			  	   
			  	]),
			    table([width('100%'), border(1), cellspacing(3), cellpadding(2)],
			      [tr([th(TxtRohstoffe), th(TxtProdukte), th(TxtBasisBauteile), th(TxtModule), th(TxtGerichte)]),
			       tr([td(OptionList1), td(OptionList2), td(OptionList3), td(OptionList4), td(OptionList5)])
			      ]),
			    p(
		    	table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
		    	      [td([button([name("submit"), type("submit")], TxtOk)]),
		    		   td([button([name("reset"), type("reset")], TxtReset)])
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
	textResources:getText(txtBitteWaehlen, TxtBitteWaehlen),
     ((Stoff1 == TxtBitteWaehlen, Stoff2 = TxtBitteWaehlen, Stoff3 = TxtBitteWaehlen,
         Stoff4 = TxtBitteWaehlen, Stoff5 = TxtBitteWaehlen,
       einenWaehlen
      );
      (nurEinenWaehlen
     )).

einenWaehlen() :-
	textResources:getText(txtBitteGenauEineAuswahlTreffen, TxtBitteGenauEineAuswahlTreffen),
	server:holeCssAlsStyle(StyleString),
   	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Stoff erlangen')],
	TermerizedBody = [
		\['<redHeader>'],
		h1(align(center), TxtBitteGenauEineAuswahlTreffen),
		\['</redHeader>']
		],
	
	reply_html_page(TermerizedHead, TermerizedBody).

nurEinenWaehlen() :-
	textResources:getText(txtBitteNurEineAuswahlTreffen, TxtBitteNurEineAuswahlTreffen),
	server:holeCssAlsStyle(StyleString),
   	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Stoff erlangen')],
	TermerizedBody = [
		\['<redHeader>'],
		h1(align(center), TxtBitteNurEineAuswahlTreffen),
		\['</redHeader>']
		],
	
	reply_html_page(TermerizedHead, TermerizedBody).

nurEinStoffGewaehlt(Stoff1, Stoff2, Stoff3, Stoff4, Stoff5, Stoff) :-
	textResources:getText(txtBitteWaehlen, TxtBitteWaehlen),
	((Stoff1 \= TxtBitteWaehlen, Stoff2 = TxtBitteWaehlen, Stoff3 = TxtBitteWaehlen, 
		Stoff4 = TxtBitteWaehlen, Stoff5 = TxtBitteWaehlen, Stoff = Stoff1);
	 (Stoff1 = TxtBitteWaehlen, Stoff2 \= TxtBitteWaehlen, Stoff3 = TxtBitteWaehlen, 
		Stoff4 = TxtBitteWaehlen, Stoff5 = TxtBitteWaehlen, Stoff = Stoff2);
	 (Stoff1 = TxtBitteWaehlen, Stoff2 = TxtBitteWaehlen, Stoff3 \= TxtBitteWaehlen, 
		Stoff4 = TxtBitteWaehlen, Stoff5 = TxtBitteWaehlen, Stoff = Stoff3);
	 (Stoff1 = TxtBitteWaehlen, Stoff2 = TxtBitteWaehlen, Stoff3 = TxtBitteWaehlen, 
		Stoff4 \= TxtBitteWaehlen, Stoff5 = TxtBitteWaehlen, Stoff = Stoff4);
	 (Stoff1 = TxtBitteWaehlen, Stoff2 = TxtBitteWaehlen, Stoff3 = TxtBitteWaehlen, 
		Stoff4 = TxtBitteWaehlen, Stoff5 \= TxtBitteWaehlen, Stoff = Stoff5)
	).
	
ergebnisAusgeben(System, Planet, Anzahl, Ziel, Stoff0) :-
    ignore(retractall(spielStatus:systemAusstattung([_, _, ortSpieler], _))),
    assertz(spielStatus:systemAusstattung([System, Planet, ortSpieler], 0)),
    textResources:getText(Stoff, Stoff0),
	(optimierteLoesung(System, Planet, Ziel, Anzahl, Stoff);
	 nichtHerstellBar(Ziel)),
	!.
	

optimierteLoesung(System, Planet, OptimierungsZiel, Anzahl, Stoff) :-  
	\+suchAlgorithmus:baue(System, Planet, OptimierungsZiel, Anzahl, Stoff),
	optimierung:optimierungsStrategie(OptimierungsZiel, Stoff, SammelSet, Vorgaenge, SammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes),
	zeigeOptimiertesErgebnis(System, Planet, Anzahl, Stoff, OptimierungsZiel, SammelSet, Vorgaenge, SammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes).

zeigeOptimiertesErgebnis(System, Planet, Anzahl, Stoff, Ziel, SammelSet, Vorgaenge, SammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes) :-
	textResources:getText(Stoff, Beschriftung),
	ausgabe:ausgabeSammlung(SammelSet, [], SammelSetPred),
    ausgabe:ausgabeVorgaenge(Vorgaenge, [], VorgaengePred),
	ausgabe:ausgabeSummen(SammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes, SummenPred),
	grafischeAusgabe:hierarchieGrafik(Vorgaenge, Svg),
   	server:holeCssAlsStyle(StyleString),
	textResources:getText(txtStoffErlangen, TxtStoffErlangen),
	textResources:getText(txtStoffErlangen, TxtStoffErlangen),
	textResources:getText(txtEingaben, TxtEingaben),
	textResources:getText(txtAnzahl, TxtAnzahl),
	textResources:getText(txtGesuchterStoff, TxtGesuchterStoff),
	textResources:getText(txtOptimierung, TxtOptimierung),
	textResources:getText(txtSystem, TxtSystem),
	textResources:getText(txtPlanet, TxtPlanet),
	textResources:getText(txtStoff, TxtStoff),
	textResources:getText(txtStueckliste, TxtStueckliste),
	textResources:getText(txtAktionsreihenfolge, TxtAktionsreihenfolge),
	textResources:getText(txtAnweisung, TxtAnweisung),
	textResources:getText(txtOperation, TxtOperation),
	textResources:getText(txtErgebnis, TxtErgebnis),
	textResources:getText(txtSummenwerte, TxtSummenwerte),
	textResources:getText(txtSummenwert, TxtSummenwert),
	textResources:getText(txtEinheit, TxtEinheit),
	textResources:getText(txtFunktionsAuswahl, TxtFunktionsAuswahl),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Stoff erlangen')],
	TermerizedBody = [
		  	\['<header>'],
		  	h1([align(center)], [TxtStoffErlangen]),
		  	\['</header>'],
		  	\['<formSpace>'],
		    table( [width('35%'), border(1)], 
				   [caption(h2(TxtEingaben)),
					tr([th([scope('col')],[TxtAnzahl]),
						th([scope('col')],[TxtGesuchterStoff]),
						th([scope('col')],[TxtOptimierung]),
						th([scope('col')],[TxtSystem]),
						th([scope('col')],[TxtPlanet])
				   	   ]),
					tr([td(Anzahl),
				    	td(Beschriftung),
				    	td(Ziel),
				    	td(System),
				    	td(Planet)
				   	   ])
			       ]),
    		table( [width('25%'), border(1)], 
		           [caption(h2(TxtStueckliste)),
		            tr([th([scope('col')],[TxtAnzahl]),
		            	th([scope('col')],[TxtStoff])
		               ]),
			           \ausgabeSammlungDcg(SammelSetPred)
		           ]),
		    p([],[]),
		    table( [width('98%'), border(1)], 
		           [ tr(\[Svg])
		           ]),
		    table( [width('100%'), border(1)], 
		           [caption(h2(TxtAktionsreihenfolge)),
		            tr([th([scope('col')],[TxtAnweisung]),
		                th([scope('col')],[TxtOperation]),
		                th([scope('col')],[TxtErgebnis])
		               ]) ,
			           \ausgabeVorgaengeDcg(VorgaengePred) 
		           ]),
		    table( [width('35%'), border(1)],
		    	   [caption(h2(TxtSummenwerte)),
		            tr([th([scope('col')],[TxtSummenwert]),
		                th([scope('col')],[TxtAnzahl]),
		                th([scope('col')],[TxtEinheit])
		               ]),
		               \ausgabeSummenDcg(SummenPred)
		           ]),
		p(a(['href="/"'],[TxtFunktionsAuswahl])),
		\['</formSpace>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).

ausgabeSammlungDcg([]) -->
	[].
	
ausgabeSammlungDcg([sam(Anzahl, Beschriftung) | Rest]) -->
	html([ tr([ td(Anzahl),
                td(Beschriftung)
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
	textResources:getText(txtBeschaffenUndHerstellenNichtMoeglich, TxtBeschaffenUndHerstellenNichtMoeglich),
	textResources:getText(txtBegruendungDp, TxtBegruendungDp),
	textResources:getText(txtFunktionsAuswahl, TxtFunktionsAuswahl),
	TermerizedBody = [
		\['<redHeader>'],
		h1(align(center), TxtBeschaffenUndHerstellenNichtMoeglich),
		\['</redHeader>'],
		\['<redFormSpace>'],
		h3(TxtBegruendungDp),
		\ausgabeBegruendungDcg(BegrTupel),
		p(a(['href="/"'],[TxtFunktionsAuswahl])),
		\['</redFormSpace>']
		            ],
	reply_html_page(TermerizedHead, TermerizedBody).

nichtHerstellBar(_) :-
   	server:holeCssAlsStyle(StyleString),
   	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Stoff erlangen')],
	textResources:getText(txtBeschaffungNichtMoeglichUndKeineRezepteVvorhanden, TxtBeschaffungNichtMoeglichUndKeineRezepteVvorhanden),
	textResources:getText(txtFunktionsAuswahl, TxtFunktionsAuswahl),
	TermerizedBody = [
		\['<redHeader>'],
		h1(align(center), TxtBeschaffungNichtMoeglichUndKeineRezepteVvorhanden),
		\['</redHeader>'],
		\['<formSpace>'], 
		p(a(['href="/"'],[TxtFunktionsAuswahl])),
		\['</formSpace>']
		],
	
	reply_html_page(TermerizedHead, TermerizedBody).

ausgabeBegruendungDcg([]) -->
	[].
	
ausgabeBegruendungDcg([begr(FehlStoff, VorgaengePred) | Rest]) -->
	{	textResources:getText(txtLeerKannNichtBeschafftWerden, TxtLeerKannNichtBeschafftWerden),
		textResources:getText(txtRezeptversuch, TxtRezeptversuch),
		string_concat(FehlStoff, TxtLeerKannNichtBeschafftWerden, Meldung)
	},
	html([	table( [width('100%'), border(1)], 
		           [caption(h3(Meldung)),
		            tr([th([scope('col')],[TxtRezeptversuch])
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

