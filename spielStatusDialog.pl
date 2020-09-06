:- module(spielStatusDialog, [spielStatusDialog/1]).

:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/spielStatusDialog', spielStatusDialog, []).
:- http_handler('/spielStatus', spielStatus, []).

spielStatusDialog(_Request) :-
	(spielStatus:spielStatus(minenLaser, MinenLaser); MinenLaser = true),
	(spielStatus:spielStatus(verbesserterMinenLaser, VerbesserterMinenLaser); VerbesserterMinenLaser = true),
	(spielStatus:spielStatus(terrainFormer, TerrainFormer); TerrainFormer = true),
	(spielStatus:spielStatus(waffeVorhanden, WaffeVorhanden); WaffeVorhanden = true),
	(spielStatus:spielStatus(solarStrahl, SolarStrahl); SolarStrahl = true),
	(spielStatus:spielStatus(gemuetsStrahl, GemuetsStrahl); GemuetsStrahl = true),
	(spielStatus:spielStatus(anzugRaffinerie, AnzugRaffinerie); AnzugRaffinerie = true),
	(spielStatus:spielStatus(raumSchiffIstFlott, RaumSchiffIstFlott); RaumSchiffIstFlott = true),
	(spielStatus:spielStatus(exoFahrzeugMinenLaser, ExoFahrzeugMinenLaser); ExoFahrzeugMinenLaser = true),
	(spielStatus:spielStatus(frachterVorhanden, FrachterVorhanden); FrachterVorhanden = true),
	(spielStatus:spielStatus(sphaereRufbar, SphaereRufbar); SphaereRufbar = true),
	
	((MinenLaser = true, MinenLaserChecked = 'checked'); MinenLaserChecked = ''), 
	((VerbesserterMinenLaser = true, VerbesserterMinenLaserChecked = ' checked'); VerbesserterMinenLaserChecked = ''), 
	((TerrainFormer = true, TerrainFormerChecked = ' checked'); TerrainFormerChecked = ''), 
	((WaffeVorhanden = true, WaffeVorhandenChecked = ' checked'); WaffeVorhandenChecked = ''), 
	((SolarStrahl = true, SolarStrahlChecked = ' checked'); SolarStrahlChecked = ''), 
	((GemuetsStrahl = true, GemuetsStrahlChecked = ' checked'); GemuetsStrahlChecked = ''), 
	((AnzugRaffinerie = true, AnzugRaffinerieChecked = ' checked'); AnzugRaffinerieChecked = ''), 
	((RaumSchiffIstFlott = true, RaumSchiffIstFlottChecked = ' checked'); RaumSchiffIstFlottChecked = ''), 
	((ExoFahrzeugMinenLaser = true, ExoFahrzeugMinenLaserChecked = ' checked'); ExoFahrzeugMinenLaserChecked = ''), 
	((FrachterVorhanden = true, FrachterVorhandenChecked = ' checked'); FrachterVorhandenChecked = ''), 
	((SphaereRufbar = true, SphaereRufbarChecked = ' checked'); SphaereRufbarChecked = ''), 
	assertz(spielStatus:spielStatus(konfiguriert, false)),
	TermerizedBody = [
	\['<header>'],
	h1([align(center)], ['Vorraussetzungen für die Materialsammlung']),
	\['</header>'],
	\['<formSpace>'],       
	form([action('/spielStatus'), method('post'), autocomplete("off")], 
	   	 [fieldSet([legend('Ausstattung'),
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
		       	                      [input([name('terrainFormer'), type('checkbox'), TerrainFormerChecked]),
		       	                       label(for('terrainFormer'), 'Terrainformer')
		       	                      ])
		       	                 ]),
		       	             div(class('tr'), 
		       	                 [div(class('td'), 
		       	                      [input([name('waffe'), type('checkbox'), WaffeVorhandenChecked]),
		       	                       label(for('waffe'), 'Waffe')
		       	                      ])
		       	                 ]),
		       	             div(class('tr'), 
		       	                 [div(class('td'), 
		       	                      [input([name('solarStrahl'), type('checkbox'), SolarStrahlChecked]),
		       	                       label(for('solarStrahl'), 'Solarstrahl')
		       	                      ])
		       	                 ]),
		       	             div(class('tr'), 
		       	                 [div(class('td'), 
		       	                      [input([name('gemuetsStrahl'), type('checkbox'), GemuetsStrahlChecked]),
		       	                       label(for('gemuetsStrahl'), 'Gemütsstrahl')
		       	                      ])
		       	                 ]),
		       	             div(class('tr'), 
		       	                 [div(class('td'), 
		       	                      [input([name('anzugRaffinerie'), type('checkbox'), AnzugRaffinerieChecked]),
		       	                       label(for('anzugRaffinerie'), 'Anzug-Raffinerie')
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
		       	                    label(for('frachter'), 'Frachter vorhanden')
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
	terrainFormer(TerrainFormer, [default(off)]),
	waffe(Waffe, [default(off)]),
	solarStrahl(SolarStrahl, [default(off)]),
	gemuetsStrahl(GemuetsStrahl, [default(off)]),
	anzugRaffinerie(AnzugRaffinerie, [default(off)]),
	raumschiff(Raumschiff, [default(off)]),
	exoFahrzeug(ExoFahrzeug, [default(off)]),
	frachter(Frachter, [default(off)]),
	spaere(Spaere, [default(off)])
    ]),
    ignore(retractall(spielStatus:spielStatus(_, _))),
    (MinenLaser = off -> assertz(spielStatus:spielStatus(minenLaser, false)); assertz(spielStatus:spielStatus(minenLaser, true))),
    (VerbesserterMinenlaser = off -> assertz(spielStatus:spielStatus(verbesserterMinenLaser, false)); assertz(spielStatus:spielStatus(verbesserterMinenLaser, true))),
    (TerrainFormer = off -> assertz(spielStatus:spielStatus(terrainFormer, false)); assertz(spielStatus:spielStatus(terrainFormer, true))),
    (Waffe = off -> assertz(spielStatus:spielStatus(waffeVorhanden, false)); assertz(spielStatus:spielStatus(waffeVorhanden, true))),
    (SolarStrahl = off -> assertz(spielStatus:spielStatus(solarStrahl, false)); assertz(spielStatus:spielStatus(solarStrahl, true))),
    (GemuetsStrahl = off -> assertz(spielStatus:spielStatus(gemuetsStrahl, false)); assertz(spielStatus:spielStatus(gemuetsStrahl, true))),
    (AnzugRaffinerie = off -> assertz(spielStatus:spielStatus(anzugRaffinerie, false)); assertz(spielStatus:spielStatus(anzugRaffinerie, true))),
    (Raumschiff = off -> assertz(spielStatus:spielStatus(raumSchiffIstFlott, false)); assertz(spielStatus:spielStatus(raumSchiffIstFlott, true))),
    (ExoFahrzeug = off -> assertz(spielStatus:spielStatus(exoFahrzeugMinenLaser, false)); assertz(spielStatus:spielStatus(exoFahrzeugMinenLaser, true))),
    (Frachter = off -> assertz(spielStatus:spielStatus(frachterVorhanden, false)); assertz(spielStatus:spielStatus(frachterVorhanden, true))),
    (Spaere = off -> assertz(spielStatus:spielStatus(sphaereRufbar, false)); assertz(spielStatus:spielStatus(sphaereRufbar, true))),
	assertz(spielStatus:spielStatus(konfiguriert, true)),
	forall(spielStatus:planeten(_, System, Planet, _), sammlung:vorgefertigeLoesungenErstellen(System, Planet)),
    server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('No mans sky trainer: Vorraussetzungen Materialsammlung')],
	TermerizedBody = [
		\['<header>'],
		h3(align(center),'gespeichert!'),
		\['</header>'],
		\['<formSpace>'], 
		p(\['<a href="/" > Funktionsauswahl </a>']),
		\['</formSpace>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).
	
	