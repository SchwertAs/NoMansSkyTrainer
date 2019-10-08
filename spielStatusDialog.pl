:- module(spielStatusDialog, [spielStatusDialog/1]).

:- use_module(library(dcg/basics)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/spielStatusDialog', spielStatusDialog, []).
:- http_handler('/spielStatus', spielStatus, []).

spielStatusDialog(_Requese) :-
		TermerizedBody = [
		\['<header>'],
	    h1([align(center)], ['Vorraussetzungen für die Materialsammlung']),
	    \['</header>'],
		\['<formSpace>'],       
	    form([action('/spielStatus'), method('post'), name('spielStatusDialogForm')], 
	       	 [fieldSet([legend('Multitool-Ausstattung'),
			       	    table([width("100%"), border("0"), cellspacing("3"), cellpadding("2")],
			       	          [tr([td([input([name('minenlaser'), type('checkbox'), checked]),
			       	                   label(for('minenlaser'), 'Minenlaser')
			       	                  ])
			       	              ]),
			       	           tr([td([input([name('verbesserterMinenlaser'), type('checkbox'), checked]),
			       	                   label(for('verbesserterMinenlaser'), 'verbesserter Minenlaser')
			       	                  ])
			       	              ]),
			       	           tr([td([input([name('terrainFromer'), type('checkbox'), checked]),
			       	                   label(for('terrainFromer'), 'Terrainformer')
			       	                  ])
			       	              ]),
			       	           tr([td([input([name('waffe'), type('checkbox'), checked]),
			       	                   label(for('waffe'), 'Waffe')
			       	                  ])
			       	              ])
			       	          ])
	       	  ]),
	       	  fieldSet([legend('Bewegungsmöglichkeiten'),
			       	    table([width("100%"), border("0"), cellspacing("3"), cellpadding("2")],
			       	          [tr([td([input([name('raumschiff'), type('checkbox'), checked]),
			       	                   label(for('raumschiff'), 'Raumschiff einsetzbar')
			       	                  ])
			       	              ]),
			       	           tr([td([input([name('exoFahrzeug'), type('checkbox'), checked]),
			       	                   label(for('exoFahrzeug'), 'Minenlaser auf Exofahrzeug vorhanden')
			       	                  ])
			       	              ])
			       	          ])
	       	  ]),
	       	  fieldSet([legend('Umgebung'),
			       	    table([width("100%"), border("0"), cellspacing("3"), cellpadding("2")],
			       	          [tr([td([input([name('frachter'), type('checkbox'), checked]),
			       	                   label(for('frachter'), 'Frachter rufbar')
			       	                  ])
			       	              ]),
			       	           tr([td([input([name('spaere'), type('checkbox'), checked]),
			       	                   label(for('spaere'), 'Anomalie / Sphäre rufbar')
			       	                  ])
			       	              ])
			       	          ])
	       	  ]),
	       	  p(table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
			    	  [td([button([name("submit"), type("submit")], 'OK')]),
			    	   td([button([name("reset"), type("reset")], 'reset')])
			    	  ]))	    ]), /*, 
    */
		\['</formSpace>']
		             ],       
	server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('No mans sky trainer: Vorraussetzungen Materialsammlung')],
	reply_html_page(TermerizedHead, TermerizedBody).
	
spielStatus(Request) :-
	member(method(post), Request), !,
	http_parameters(Request, 
	[
	minenlaser(MinenLaser, [default(off)]),
	verbesserterMinenlaser(VerbesserterMinenlaser, [default(off)]),
	terrainFromer(TerrainFromer, [default(off)]),
	waffe(Waffe, [default(off)]),
	raumschiff(Raumschiff, [default(off)]),
	exoFahrzeug(ExoFahrzeug, [default(off)]),
	frachter(Frachter, [default(off)]),
	spaere(Spaere, [default(off)])
    ]),
    spielStatus:initSpielStatus,
    (MinenLaser = off -> assertz(spielStatus:spielStatus(minenLaser, false)); assertz(spielStatus:spielStatus(minenLaser, true))),
    (VerbesserterMinenlaser = off -> assertz(spielStatus:spielStatus(verbesserterMinenLaser, false)); assertz(spielStatus:spielStatus(verbesserterMinenLaser, true))),
    (TerrainFromer = off -> assertz(spielStatus:spielStatus(terrainFormer, false)); assertz(spielStatus:spielStatus(terrainFormer, true))),
    (Waffe = off -> assertz(spielStatus:spielStatus(waffeVorhanden, false)); assertz(spielStatus:spielStatus(waffeVorhanden, true))),
    (Raumschiff = off -> assertz(spielStatus:spielStatus(raumSchiffIstFlott, false)); assertz(spielStatus:spielStatus(raumSchiffIstFlott, true))),
    (ExoFahrzeug = off -> assertz(spielStatus:spielStatus(exoFahrzeugMinenLaser, false)); assertz(spielStatus:spielStatus(exoFahrzeugMinenLaser, true))),
    (Frachter = off -> assertz(spielStatus:spielStatus(frachterVorhanden, false)); assertz(spielStatus:spielStatus(frachterVorhanden, true))),
    (Spaere = off -> assertz(spielStatus:spielStatus(sphaereRufbar, false)); assertz(spielStatus:spielStatus(sphaereRufbar, true))),
    sammlung:sammelbarReInit,
    server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('No mans sky trainer: Vorraussetzungen Materialsammlung')],
	TermerizedBody = [
		\['<header>'],
		h3(align(center),'gespeichert!'),
		\['</header>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).
	
	