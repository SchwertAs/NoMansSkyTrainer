:- module(server, [server/1]).

:- use_module(library(dcg/basics)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

server(Port) :-
        http_server(http_dispatch, [port(Port)]).


:- http_handler('/', rootForm, []).
:- http_handler('/favicon.ico', dummy, []).

rootForm(_Request) :-
	baueOptionsFeld('auswahlRohStoff', [rohStoff, rohUndKochStoff], OptionList1),
	baueOptionsFeld('auswahlProdukt', [produkt, produktUndKochStoff], OptionList2),
	baueOptionsFeld('auswahlBau', [basisBauEndStoff], OptionList3),
	baueOptionsFeld('auswahlModul', [modul], OptionList4),
	baueOptionsFeld('auswahlGericht', [kochStoff, produktUndKochStoff, rohUndKochStoff], OptionList5),
	baueFelderMenge(FelderMenge),
	HtmlString = [
	  form([action='/stoffErlangen', method='post'], 
	       	[  	h1(['Empfohlene Handlungen um bestimmten Stoff zu erhalten']),
		        p([], [\[FelderMenge]]),
		        
			  	h2(['Anzahl']),
			    p([], [input([name='anzahl', type='text', value='', size='24'])]),
			    h2(['Rohstoffe']),
		        p([], OptionList1),
			    h2(['Produkte']),
		        p([], OptionList2),
			    h2(['Basis-Bauteile']),
		        p([], OptionList3),
			    h2(['Module']),
		        p([], OptionList4),
			    h2(['Gerichte']),
		        p([], OptionList5),
		        p([], [input([name='submit', type='submit', value='OK'])])
	      	]
	      )
	],
	reply_html_page(
	title('stoffErlangenDialog'), HtmlString
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
	
baueFelderMenge(FelderMenge) :-
	FelderMenge = '<h3>Optimierungsstrategie</h3>
     <fieldset>
        <legend>Möglichst wenig</legend>
        <label for="Zeitverbrauch">
            <input type="radio" name="optimierungsZiel" id="optimierungsZielZeit" value="minimaleZeit"> Zeitverbrauch
        </label>
        <label for="Sammlungsgegenstände">
            <input type="radio" checked="true" name="optimierungsZiel" id="optimierungsZielSammelZahl" value="minimaleSammlung"> Sammlungsgegenstände
        </label>
        <label for="Kosten">
            <input type="radio" name="optimierungsZiel" id="optimierungsZielSammelKosten" value="minimaleKosten"> Kosten
        </label>
     </fieldset>'.
	
dummy(_)  :-
	format('').