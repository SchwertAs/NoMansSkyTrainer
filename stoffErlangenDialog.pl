:- module(stoffErlangenDialog, [stoffErlangen/1]).

:- use_module(library(dcg/basics)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/stoffErlangenAusWahl', stoffErlangenAusWahl, []).
:- http_handler('/stoffErlangen', stoffErlangen, []).

/* ----------------------  Eingabe Formular ---------------------------------------------------*/

stoffErlangenAusWahl(_Request) :-
	baueStoffListeFuerStoffKlassen([rohStoff, rohUndKochStoff], Stoffe1),
	server:baueOptionsFeld('auswahlRohStoff', Stoffe1, OptionList1),
	baueStoffListeFuerStoffKlassen([produkt, produktUndKochStoff], Stoffe2),
	server:baueOptionsFeld('auswahlProdukt', Stoffe2, OptionList2),
	baueStoffListeFuerStoffKlassen([basisBauEndStoff], Stoffe3),
	server:baueOptionsFeld('auswahlBau', Stoffe3, OptionList3),
	baueStoffListeFuerStoffKlassen([modul], Stoffe4),
	server:baueOptionsFeld('auswahlModul', Stoffe4, OptionList4),
	baueStoffListeFuerStoffKlassen([kochStoff, produktUndKochStoff, rohUndKochStoff], Stoffe5),
	server:baueOptionsFeld('auswahlGericht', Stoffe5, OptionList5),

	TermerizedBody = [
		\['<header>'],
	    h1([align(center)], ['Auswahl für empfohlene Handlungen um bestimmten Stoff zu erhalten']),
	    \['</header>'],
		\['<formSpace>'],       
	    form([action('/stoffErlangen'), method('post')], 
	       	[  	fieldset([name('fieldSet1')], [legend(['Möglichst wenig']),
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
	       		         ]),
	       		/* [\[FelderMenge]]), */
			  	h2(['Anzahl']),
			    p(input([name('anzahl'), type('text'), value(''), size='24'])),

			    table([width('100%'), border(1), cellspacing(3), cellpadding(2)],
			      [tr([th('Rohstoffe'), th('Produkte'), th('Basis-Bauteile'), th('Module'), th('Gerichte')]),
			       tr([td(OptionList1), td(OptionList2), td(OptionList3), td(OptionList4), td(OptionList5)])
			      ]),
			    p(input([name('submit'), type('submit'), value('OK')]))
	      	]
	      ),
		\['</formSpace>']     
	],
	server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('stoffErlangenDialog')],
	reply_html_page(TermerizedHead, TermerizedBody
	).

baueStoffListeFuerStoffKlassen(StoffKlassen, Stoffe) :-
	findall(St, (select(Sk, StoffKlassen, _), stoff:stoff(Sk, St, _)), Stoffe).
	

/* ----------------------  Antwort Formular ---------------------------------------------------*/
stoffErlangen(Request) :-
    member(method(post), Request), !,
    format('Content-type: text/html~n~n', []),
	http_parameters(Request, [
      anzahl(AtomAnzahl, [default('1')]),
      auswahlRohStoff(Stoff1, [length > 1]),
      auswahlProdukt(Stoff2, [length > 1]),
      auswahlBau(Stoff3, [length > 1]),
      auswahlModul(Stoff4, [length > 1]),
      auswahlGericht(Stoff5, [length > 1]),
      optimierungsZiel(Ziel, [])
    ]),
	atom_number(AtomAnzahl, Anzahl),
    ((stoffAuswahl(Stoff1, Stoff2, Stoff3, Stoff4, Stoff5, Stoff),
      ergebnisAusgeben(Anzahl, Ziel, Stoff)
     );
     fehlerBehandlung(Stoff1, Stoff2, Stoff3, Stoff4, Stoff5)
    ),
    !.

fehlerBehandlung(Stoff1, Stoff2, Stoff3, Stoff4, Stoff5) :-    
     ((Stoff1 == 'Bitte wählen', Stoff2 = 'Bitte wählen', Stoff3 = 'Bitte wählen',
         Stoff4 = 'Bitte wählen', Stoff5 = 'Bitte wählen',
       phrase(html([p('Bitte eine Auswahl treffen!')]), Tok), 
       print_html(Tok)
      );
      (phrase(html([p('Bitte nur eine Auswahl treffen! Bei den nicht benötigten Auswahlen muss "Bitte wählen" eingestellt sein')]), Tok),
       print_html(Tok)
     )).


stoffAuswahl(Stoff1, Stoff2, Stoff3, Stoff4, Stoff5, Stoff) :-
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
	
ergebnisAusgeben(Anzahl, Ziel, Stoff) :-
	optimierteLoesung(Ziel, Anzahl, Stoff);
	nichtHerstellBar(Stoff).
	

optimierteLoesung(OptimierungsZiel, Anzahl, Stoff) :-  
	\+suchAlgorithmus:baue(OptimierungsZiel, Anzahl, Stoff),
	optimierung:optimierungsStrategie(OptimierungsZiel, Stoff, SammelSet, Vorgaenge, MinimalSammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes),
	printMinSammlungForm(Anzahl, Stoff, OptimierungsZiel, SammelSet, Vorgaenge, MinimalSammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes).

printMinSammlungForm(Anzahl, Stoff, Ziel, SammelSet, Vorgaenge, MinimalSammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes) :-
	ausgabe:ausgabeSammlung(SammelSet, [], SammelSetPred),
    ausgabe:ausgabeVorgaenge(Vorgaenge, [], VorgaengePred),
	ausgabe:ausgabeSummen(MinimalSammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes, SummenPred),
    server:holeCssAlsStyle(StyleString),
	Head = [\[StyleString], title('stoffErlangenDialog')],
		phrase(html([head(Head),
		  body([
		  	\['<header>'],
		  	h1([align(center)], ['Stoff erlangen']),
		  	\['</header>'],
		  	\['<formSpace>'],
		    table( [width('25%'), border(1)], 
				   [caption(h2('Eingaben')),
					tr([th([scope('col')],['Anzahl']),
						th([scope('col')],['Gesuchter Stoff']),
						th([scope('col')],['Ziel'])
				   	   ]),
					tr([td(Anzahl),
				    	td(Stoff),
				    	td(Ziel)
				   	   ])
			       ]),
    		table( [width('25%'), border(1)], 
		           [caption(h2('Stückliste')),
		            tr([th([scope('col')],['Anzahl']),
		            	th([scope('col')],['Stoff'])
		               ]),
			           \ausgabeSammlungDcg(SammelSetPred)
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
		  	\['</formSpace>']
		 ])
    			   ]), Tok), 
    print_html(Tok).

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
        
nichtHerstellBar(Stoff) :-
	stoff:stoff(_, Stoff, Wert),
	phrase(html([h3('Stoff kann nicht hergestellt werden. Kaufwert ca. '),  '~k', Wert]), Tok), print_html(Tok).

