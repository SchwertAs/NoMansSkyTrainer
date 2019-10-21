:- module(spielStatusDialog, [spielStatusDialog/1]).

:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/spielStatusDialog', spielStatusDialog, []).
:- http_handler('/spielStatus', spielStatus, []).

spielStatusDialog(_Requese) :-
	(spielStatus:spielStatus(minenLaser, MinenLaser); MinenLaser = true),
	(spielStatus:spielStatus(verbesserterMinenLaser, VerbesserterMinenLaser); VerbesserterMinenLaser = true),
	(spielStatus:spielStatus(terrainFormer, TerrainFormer); TerrainFormer = true),
	(spielStatus:spielStatus(waffeVorhanden, WaffeVorhanden); WaffeVorhanden = true),
	(spielStatus:spielStatus(raumSchiffIstFlott, RaumSchiffIstFlott); RaumSchiffIstFlott = true),
	(spielStatus:spielStatus(exoFahrzeugMinenLaser, ExoFahrzeugMinenLaser); ExoFahrzeugMinenLaser = true),
	(spielStatus:spielStatus(frachterVorhanden, FrachterVorhanden); FrachterVorhanden = true),
	(spielStatus:spielStatus(sphaereRufbar, SphaereRufbar); SphaereRufbar = true),
	
	((MinenLaser = true, MinenLaserChecked = 'checked'); MinenLaserChecked = ''), 
	((VerbesserterMinenLaser = true, VerbesserterMinenLaserChecked = ' checked'); VerbesserterMinenLaserChecked = ''), 
	((TerrainFormer = true, TerrainFormerChecked = ' checked'); TerrainFormerChecked = ''), 
	((WaffeVorhanden = true, WaffeVorhandenChecked = ' checked'); WaffeVorhandenChecked = ''), 
	((RaumSchiffIstFlott = true, RaumSchiffIstFlottChecked = ' checked'); RaumSchiffIstFlottChecked = ''), 
	((ExoFahrzeugMinenLaser = true, ExoFahrzeugMinenLaserChecked = ' checked'); ExoFahrzeugMinenLaserChecked = ''), 
	((FrachterVorhanden = true, FrachterVorhandenChecked = ' checked'); FrachterVorhandenChecked = ''), 
	((SphaereRufbar = true, SphaereRufbarChecked = ' checked'); SphaereRufbarChecked = ''), 
	TermerizedBody = [
	\['<header>'],
	h1([align(center)], ['Vorraussetzungen für die Materialsammlung']),
	\['</header>'],
	\['<formSpace>'],       
	form([action('/spielStatus'), method('post'), autocomplete("off")], 
	   	 [fieldSet([legend('Multitool-Ausstattung'),
		       	    div(class('table'),
		       	        [div(class('tr'), 
		       	             [div(class('td'), 
		       	                  [input([name('minenlaser'), type('checkbox'), MinenLaserChecked]),
		       	                   label(for('minenlaser'), 'Minenlaser')
		       	                  ])
		       	             ]),
		       	             div(class('tr'), 
		       	                 [div(class('td'),
		       	                      [input([name('verbesserterMinenlaser'), type('checkbox'), VerbesserterMinenLaserChecked]),
		       	                       label(for('verbesserterMinenlaser'), 'verbesserter Minenlaser')
		       	                      ])
		       	                ]),
		       	             div(class('tr'), 
		       	                 [div(class('td'), 
		       	                      [input([name('terrainFromer'), type('checkbox'), TerrainFormerChecked]),
		       	                       label(for('terrainFromer'), 'Terrainformer')
		       	                      ])
		       	                 ]),
		       	             div(class('tr'), 
		       	                 [div(class('td'), 
		       	                      [input([name('waffe'), type('checkbox'), WaffeVorhandenChecked]),
		       	                       label(for('waffe'), 'Waffe')
		       	                      ])
		       	                 ])
		       	        ])
	   	  ]),
	   	  fieldSet([legend('Bewegungsmöglichkeiten'),
		       	    div(class('table'),
		       	          [div(class('tr'),
		       	               [div(class('td'),
		       	                    [input([name('raumschiff'), type('checkbox'), RaumSchiffIstFlottChecked]),
		       	                     label(for('raumschiff'), 'Raumschiff einsetzbar')
		       	                    ])
		       	               ]),
		       	           div(class('tr'),
		       	               [div(class('td'),
		       	                    [input([name('exoFahrzeug'), type('checkbox'), ExoFahrzeugMinenLaserChecked]),
		       	                     label(for('exoFahrzeug'), 'Minenlaser auf Exofahrzeug vorhanden')
		       	                    ])
		       	              ])
		       	          ])
	   	  ]),
	   	  fieldSet([legend('Umgebung'),
		       	    div(class('table'),
		       	          [div(class('tr'),
		       	               [div(class('td'),[input([name('frachter'), type('checkbox'), FrachterVorhandenChecked]),
		       	                    label(for('frachter'), 'Frachter rufbar')
		       	                   ])
		       	               ]),
		       	           div(class('tr'),
		       	               [div(class('td'),
		       	                    [input([name('spaere'), type('checkbox'), SphaereRufbarChecked]),
		       	                     label(for('spaere'), 'Anomalie / Sphäre rufbar')
		       	                    ])
		       	               ])
		       	          ])
	   	  ]),
	   	  p(table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
		    	  [td([button([name("submit"), type("submit")], 'OK')]),
		    	   td([button([name("reset"), type("reset")], 'reset')])
		    	  ]))	    
		  ]), 
	\['</formSpace>']],       
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
    ignore(retractall(spielStatus:spielStatus(_, _))),
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
	
	