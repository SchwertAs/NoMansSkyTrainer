:- module(stoffErlangenDialog, [stoffErlangen/1]).

:- use_module(library(dcg/basics)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/stoffErlangen', stoffErlangen, []).

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
    ((
      (Stoff1 \= 'Bitte wählen', Stoff2 = 'Bitte wählen', Stoff3 = 'Bitte wählen', Stoff4 = 'Bitte wählen', Stoff5 = 'Bitte wählen', Stoff = Stoff1);
      (Stoff1 = 'Bitte wählen', Stoff2 \= 'Bitte wählen', Stoff3 = 'Bitte wählen', Stoff4 = 'Bitte wählen', Stoff5 = 'Bitte wählen', Stoff = Stoff2);
      (Stoff1 = 'Bitte wählen', Stoff2 = 'Bitte wählen', Stoff3 \= 'Bitte wählen', Stoff4 = 'Bitte wählen', Stoff5 = 'Bitte wählen', Stoff = Stoff3);
      (Stoff1 = 'Bitte wählen', Stoff2 = 'Bitte wählen', Stoff3 = 'Bitte wählen', Stoff4 \= 'Bitte wählen', Stoff5 = 'Bitte wählen', Stoff = Stoff4);
      (Stoff1 = 'Bitte wählen', Stoff2 = 'Bitte wählen', Stoff3 = 'Bitte wählen', Stoff4 = 'Bitte wählen', Stoff5 \= 'Bitte wählen', Stoff = Stoff5)
     );
     (Stoff1 == 'Bitte wählen', Stoff2 = 'Bitte wählen', Stoff3 = 'Bitte wählen', Stoff4 = 'Bitte wählen', Stoff5 = 'Bitte wählen', Stoff = nil,
      phrase(html([p('Bitte eine Auswahl treffen!')]), Tok), print_html(Tok), !, fail
     );
     phrase(html([p('Bitte nur eine Auswahl treffen! Bei den nicht benötigten Auswahlen muss "Bitte wählen" eingestellt sein')]), Tok), print_html(Tok), !, fail
    ),
    atom_number(AtomAnzahl, Anzahl),
    
    (optimierteLoesung(Ziel, Anzahl, Stoff);
     nichtHerstellBar(Stoff)
    ),
    !.


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
    			   ]), Tok), print_html(Tok).

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

