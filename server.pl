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
:- http_handler('/minimaleSammlung', minSammlungForm, []).

rootForm(_Request) :-
	ListString = '<select name="stoffAuswahl" size="1" id="StoffAuswahl">~n',
	buildOptions(Options),
	string_concat(ListString, Options, ListString2),
    string_concat(ListString2, '</select>', ListString3),
	OptionList = [\[ListString3]],
	HtmlString = [
	  form([action='/minimaleSammlung', method='post'], [
	  	h1(['Empfohlene Handlungen um bestimmten Stoff zu erhalten']),
	    p([], [input([name='anzahl', type='text', value='', size='24'])]),
        p([], OptionList),
        p([], [input([name='Submit', type='submit', value='OK'])])
	  ])
	],
	reply_html_page(
	title('MinimaleSammlungDialog'), HtmlString
	).

minSammlungForm(Request) :-
        member(method(post), Request), !,
        format('Content-type: text/html~n~n', []),
		http_parameters(Request, [
          anzahl(AtomAnzahl, [default('1')]),
          stoffAuswahl(Stoff, [length > 1])
        ]),
        atom_number(AtomAnzahl, Anzahl),
        format('<table width="20%" border="1">
			  <caption>
			    <h2>Eingaben</h2>
			  </caption>
			  <tr>
			    <th scope="col">Anzahl&nbsp;</th>
			    <th scope="col">Gesuchter Stoff&nbsp;</th>
			  </tr>~n'
			),
        format('<tr>~n<td>~k</td>~n', Anzahl),
        format('<td>~k</td>~n<tr>~n', Stoff),
        format('</table>'),
	    format('<hr>~n', []),
	    \+minimaleSammlungLoesung(Anzahl, Stoff) -> ausgabe:nichtHerstellBar(Stoff); true/* */
        .

buildOptions(Optionen) :-
	findall(St, (ausgangsStoff:stoff(St, _), \+ausgangsStoff:bauRezept(St)), Stoffe),
	sort(Stoffe, StoffeSet),
	buildOptions(StoffeSet, "", Optionen).
	
buildOptions(StoffList, BisherList, NextList) :-
	StoffList = [],
	BisherList = NextList.

buildOptions(StoffList, BisherList, NextList) :-
	StoffList = [Stoff|Rest],
	format(string(StoffString), '<option>~k~n', Stoff),
	string_concat(BisherList, StoffString, BisherList2),
	buildOptions(Rest, BisherList2, NextList).
	
	