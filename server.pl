:- module(server, [server/1]).

:- use_module(library(dcg/basics)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

server(Port) :-
        http_server(http_dispatch, [port(Port)]).


:- http_handler('/stoffErlangenAusWahl', stoffErlangenAusWahl, []).
:- http_handler('/favicon.ico', dummy, []).

stoffErlangenAusWahl(_Request) :-
	baueOptionsFeld('auswahlRohStoff', [rohStoff, rohUndKochStoff], OptionList1),
	baueOptionsFeld('auswahlProdukt', [produkt, produktUndKochStoff], OptionList2),
	baueOptionsFeld('auswahlBau', [basisBauEndStoff], OptionList3),
	baueOptionsFeld('auswahlModul', [modul], OptionList4),
	baueOptionsFeld('auswahlGericht', [kochStoff, produktUndKochStoff, rohUndKochStoff], OptionList5),

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
	holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('stoffErlangenDialog')],
	reply_html_page(TermerizedHead, TermerizedBody
	).
        
baueOptionsFeld(FeldName, StoffKlassen, OptionList) :-
	ListString1 = '<select name="',
	string_concat(ListString1, FeldName, ListString2),
	string_concat(ListString2, '" size="1" id="', ListString3),
	string_concat(ListString3, FeldName, ListString4),
	string_concat(ListString4, '">~n', ListString5),
	baueOptionen(StoffKlassen, Options),
	string_concat(ListString5, Options, ListString6),
	string_concat(ListString6, '</select>', ListString7),
	OptionList = [\[ListString7]].

baueOptionen(StoffKlassen, Optionen) :-
	findall(St, (select(Sk, StoffKlassen, _), stoff:stoff(Sk, St, _)), Stoffe),
	sort(Stoffe, StoffeSet),
	BisherList = '<option>Bitte wählen</option>',
	baueOption(StoffeSet, BisherList, Optionen).
	
baueOption(StoffList, BisherList, NextList) :-
	StoffList = [],
	BisherList = NextList.

baueOption(StoffList, BisherList, NextList) :-
	StoffList = [Stoff|Rest],
	format(string(StoffString), '<option>~k~n', Stoff),
	string_concat(BisherList, StoffString, BisherList2),
	baueOption(Rest, BisherList2, NextList).
	
	
holeCssAlsStyle(StyleString) :-
	StyleString = '<style>
body {
    margin: 0 auto;
    max-width: 85em;	
    display: grid;
  	grid-template-columns: repeat(3, 1fr); 
  	grid-template-rows: 160px auto, 30px; 
	}
header {
	grid-column: 1 / 4;
	grid-row: 1;
    }
formSpace {
	grid-column: 1 / 4;
	grid-row: 2;
	}
button1Space {
	grid-column: 1;
	grid-row: 3;
	}
button2Space {
	grid-column: 2;
	grid-row: 3;
	}
button3Space {
	grid-column: 3;
	grid-row: 3;
	}

header,
formSpace,
button1Space,
button2Space,
button3Space {

	background: #ebf5d7;
	border-color: #8db243;
	border-radius: 0px 0.5em 0.5em;
	border: 1px solid;
	padding: .5em;
	margin: .5em;
}
</style>'.

dummy(_)  :-
	format('').