:- module(stoffErlangen, [stoffErlangen/1]).

:- use_module(library(dcg/basics)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
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
          format('<p>Bitte eine Auswahl treffen!</p>'), !, fail
         );
         format('Bitte nur eine Auswahl treffen! Bei den nicht benötigten Auswahlen muss "Bitte wählen" eingestellt sein</p>'), !, fail
        ),
        atom_number(AtomAnzahl, Anzahl),
        format('<table width="25%" border="1">
			  <caption>
			    <h2>Eingaben</h2>
			  </caption>
			  <tr>
			    <th scope="col">Anzahl&nbsp;</th>
			    <th scope="col">Gesuchter Stoff&nbsp;</th>
			    <th scope="col">Ziel&nbsp;</th>
			  </tr>~n'
			),
        format('<tr>~n<td>~k</td>~n', Anzahl),
        format('<td>~k</td>~n', Stoff),
        format('<td>~k</td>~n<tr>~n', Ziel),
        format('</table>'),
	    format('<hr>~n', []),
	    !,
	    \+main:optimierteLoesung(Ziel, Anzahl, Stoff) -> \+ausgabe:nichtHerstellBar(Ziel, Stoff); true/* */
        .
