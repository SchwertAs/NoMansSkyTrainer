:- module(planetMondNameDialog, [planetMondNameDialog/1]).

:- use_module(library(dcg/basics)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/planetMondNameDialog', planetMondNameDialog, []).
:- http_handler('/planetMondName', planetMondName, []).


planetMondNameDialog(_Request) :-
	findall(System, spielStatus:systeme(System, _), Systeme),
	server:baueOptionsFeld('auswahlSystem', Systeme, OptionList),
	TermerizedBody = [
		\['<header>'],
	    h1([align(center)], ['Eigenschaften Sternensystem eingeben']),
	    \['</header>'],
		\['<formSpace>'],       
	    form([action('/planetMondName'), method('post'), name('systemEigenschaftenForm')], 
	       	 [h3('Sternensystem'),
	       	  p(OptionList),
	       	  h3('Himmelskörpernamen'),
	       	  table([width("325px"), border("1"), cellspacing("3"), cellpadding("2")],
	       	        [tr([th([scope(col)], 'Planetenname'), 
	       	             th([scope(col)], 'Mondname')
	       	            ]),
	       	         tr([td([input([name('planet1'), type('text'), class('eingabeFeld'), id('planet1'), size(20), maxlength(20)])]),
	       	             td([input([name('mond1'), type('text'), class('eingabeFeld'), id('mond1'), size(20), maxlength(20)])])
	       	            ]), 
	       	         tr([td([input([name('planet2'), type('text'), class('eingabeFeld'), id('planet2'), size(20), maxlength(20)])]),
	       	             td([input([name('mond2'), type('text'), class('eingabeFeld'), id('mond2'), size(20), maxlength(20)])])
	       	            ]), 
	       	         tr([td([input([name('planet3'), type('text'), class('eingabeFeld'), id('planet3'), size(20), maxlength(20)])]),
	       	             td([input([name('mond3'), type('text'), class('eingabeFeld'), id('mond3'), size(20), maxlength(20)])])
	       	            ]), 
	       	         tr([td([input([name('planet4'), type('text'), class('eingabeFeld'), id('planet4'), size(20), maxlength(20)])]),
	       	             td([input([name('mond4'), type('text'), class('eingabeFeld'), id('mond4'), size(20), maxlength(20)])])
	       	            ]), 
	       	         tr([td([input([name('planet5'), type('text'), class('eingabeFeld'), id('planet5'), size(20), maxlength(20)])]),
	       	             td([input([name('mond5'), type('text'), class('eingabeFeld'), id('mond5'), size(20), maxlength(20)])])
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
	TermerizedHead = [\[StyleString], title('planetMondNameDialog')],
	reply_html_page(TermerizedHead, TermerizedBody).
	
planetMondName(Request) :-
	member(method(post), Request), !,
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0]),
     planet1(Planet1, [default('')]), mond1(Mond1, [default('')]),
     planet2(Planet2, [default('')]), mond1(Mond2, [default('')]),
     planet3(Planet3, [default('')]), mond1(Mond3, [default('')]),
     planet4(Planet4, [default('')]), mond1(Mond4, [default('')]),
     planet5(Planet5, [default('')]), mond1(Mond5, [default('')])
    ]),
    abolish(spielStatus:planeten/2),
    (Planet1 = ''; assertz(spielStatus:planeten(AuswahlSystem, Planet1))),
    (Planet2 = ''; assertz(spielStatus:planeten(AuswahlSystem, Planet2))),
    (Planet3 = ''; assertz(spielStatus:planeten(AuswahlSystem, Planet3))),
    (Planet4 = ''; assertz(spielStatus:planeten(AuswahlSystem, Planet4))),
    (Planet5 = ''; assertz(spielStatus:planeten(AuswahlSystem, Planet5))),
    (Mond1 = ''; assertz(spielStatus:planeten(AuswahlSystem, Mond1))),
    (Mond2 = ''; assertz(spielStatus:planeten(AuswahlSystem, Mond2))),
    (Mond3 = ''; assertz(spielStatus:planeten(AuswahlSystem, Mond3))),
    (Mond4 = ''; assertz(spielStatus:planeten(AuswahlSystem, Mond4))),
    (Mond5 = ''; assertz(spielStatus:planeten(AuswahlSystem, Mond5))),
    server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('planetMondName')],
	TermerizedBody = [
		\['<header>'],
		h3(align(center),'gespeichert!'),
		\['</header>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).
    
      

