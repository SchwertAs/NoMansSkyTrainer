:- module(planetMondNameDialog, [planetMondNameDialog/1, planetMondName/1]).

:- use_module(library(dcg/basics)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/planetMondNameSystemAuswahlDialog', planetMondNameSystemAuswahlDialog, []).
:- http_handler('/planetMondNameDialog', planetMondNameDialog, []).
:- http_handler('/planetMondName', planetMondName, []).

planetMondNameSystemAuswahlDialog(_Request) :-
	planetAuswahlDialog:systemAuswahlDialog(
		'Eigenschaften Sternensystem eingeben', 
		'/planetMondNameDialog').
		
planetMondNameDialog(Request) :-
	member(method(post), Request), !,
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0])
	]),
	(AuswahlSystem = 'Bitte wählen' -> planetAuswahlDialog:fehlerBehandlung; 
	 planetMondNameAnzeigen(AuswahlSystem)
	).

planetMondNameAnzeigen(AuswahlSystem) :-
	findall(HimmelsKoerper, spielStatus:planeten(AuswahlSystem, HimmelsKoerper), HimmelsKoerperListe),
	(nth1(1, HimmelsKoerperListe, Planet1); Planet1 = ''),
	(nth1(2, HimmelsKoerperListe, Planet2); Planet2 = ''),
	(nth1(3, HimmelsKoerperListe, Planet3); Planet3 = ''),
	(nth1(4, HimmelsKoerperListe, Planet4); Planet4 = ''),
	(nth1(5, HimmelsKoerperListe, Planet5); Planet5 = ''),
	(nth1(6, HimmelsKoerperListe, Planet6); Planet6 = ''),
	(nth1(7, HimmelsKoerperListe, Planet7); Planet7 = ''),
	(nth1(8, HimmelsKoerperListe, Planet8); Planet8 = ''),
	TermerizedBody = [
		\['<header>'],
	    h1([align(center)], ['Sternensystem: Namen der Himmelskörper eingeben']),
	    \['</header>'],
		\['<formSpace>'],       
	    form([action('/planetMondName'), method('post'), name('systemEigenschaftenForm')], 
	       	 [h3('Sternensystem'),
       	  	  \eingabeTabelleReadOnly(AuswahlSystem),
	       	  h3('Planeten und Monde'),
	       	  div(class('table20'),
	       	        [div(class('tr'), 
	       	             [div([class('th'), scope("col")], 'Name') 
	       	             ]),
	       	         div(class('tr'), 
	       	             [div(class('td'), [input([name('planet1'), type('text'), class('eingabeFeld'), id('planet1'), size(20), maxlength(20), value(Planet1)])])
	       	             ]), 
	       	         div(class('tr'), 
	       	             [div(class('td'), [input([name('planet2'), type('text'), class('eingabeFeld'), id('planet2'), size(20), maxlength(20), value(Planet2)])])
	       	             ]), 
	       	         div(class('tr'), 
	       	             [div(class('td'), [input([name('planet3'), type('text'), class('eingabeFeld'), id('planet3'), size(20), maxlength(20), value(Planet3)])])
	       	             ]), 
	       	         div(class('tr'), 
	       	             [div(class('td'), [input([name('planet4'), type('text'), class('eingabeFeld'), id('planet4'), size(20), maxlength(20), value(Planet4)])])
	       	             ]), 
	       	         div(class('tr'), 
	       	             [div(class('td'), [input([name('planet5'), type('text'), class('eingabeFeld'), id('planet5'), size(20), maxlength(20), value(Planet5)])])
	       	             ]), 
	       	         div(class('tr'), 
	       	             [div(class('td'), [input([name('planet6'), type('text'), class('eingabeFeld'), id('planet6'), size(20), maxlength(20), value(Planet6)])])
	       	             ]), 
	       	         div(class('tr'), 
	       	             [div(class('td'), [input([name('planet7'), type('text'), class('eingabeFeld'), id('planet7'), size(20), maxlength(20), value(Planet7)])])
	       	             ]), 
	       	         div(class('tr'), 
	       	             [div(class('td'), [input([name('planet8'), type('text'), class('eingabeFeld'), id('planet8'), size(20), maxlength(20), value(Planet8)])])
	       	             ]) 
	       	        ]),
	       	  p(table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
			    	  [td([button([name("submit"), type("submit")], 'OK')]),
			    	   td([button([name("reset"), type("reset")], 'reset')])
			    	  ]))    
			 ]),
		\['</formSpace>']
		             ],       
	server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Planetennamen')],
	reply_html_page(TermerizedHead, TermerizedBody).

eingabeTabelleReadOnly(AuswahlSystem) -->
	html(
   	  div(class('table20'),[
   	    div(class('tr'), [
   	    	\divInputReadOnly('auswahlSystem', 'System: ', AuswahlSystem, 1)
   	  	])
   	  ])).

divInputReadOnly(Name, LabelText, Value, Index) -->
	html(
	div(class('td'), [
		label([ for(Name)],[LabelText]),
   	  	input([ name(Name),
   	  	  		type('text'), 
   	  	  		size(20), 
   	  	  		maxlength(20),
   	  	  		value(Value),
   	  	  		tabindex(Index),
   	  	  		readonly(true)
   	  	  	  ])
   	  	])
	).
	
planetMondName(Request) :-
	member(method(post), Request), !,
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0]),
     planet1(Planet1, [default('')]),
     planet2(Planet2, [default('')]),
     planet3(Planet3, [default('')]),
     planet4(Planet4, [default('')]),
     planet5(Planet5, [default('')]),
     planet6(Planet6, [default('')]),
     planet7(Planet7, [default('')]),
     planet8(Planet8, [default('')])
    ]),
	spielStatus:initPlaneten(AuswahlSystem),
    (Planet1 = ''; assertz(spielStatus:planeten(AuswahlSystem, Planet1))),
    (Planet2 = ''; assertz(spielStatus:planeten(AuswahlSystem, Planet2))),
    (Planet3 = ''; assertz(spielStatus:planeten(AuswahlSystem, Planet3))),
    (Planet4 = ''; assertz(spielStatus:planeten(AuswahlSystem, Planet4))),
    (Planet5 = ''; assertz(spielStatus:planeten(AuswahlSystem, Planet5))),
    (Planet6 = ''; assertz(spielStatus:planeten(AuswahlSystem, Planet6))),
    (Planet7 = ''; assertz(spielStatus:planeten(AuswahlSystem, Planet7))),
    (Planet8 = ''; assertz(spielStatus:planeten(AuswahlSystem, Planet8))),
    server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Himmelskörper-Namen')],
	TermerizedBody = [
		\['<header>'],
		h3(align(center),'gespeichert!'),
		\['</header>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).
      