:- module(hauptDialog, [hauptDialog/1]).

:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/', hauptDialog, []).

hauptDialog(_Request) :-
	(spielStatus:spielStatus(konfiguriert, Konfiguriert)),
	findall(RecNo0, (spielStatus:systeme(RecNo0, _, _), RecNo0 > 0), Systeme),
	findall(RecNo1, (spielStatus:planeten(RecNo1, _, _, _), RecNo1 > 0), Planeten),
	((Konfiguriert = false, Versteckt1=true, Versteckt2=true, Versteckt3=true, Versteckt4=true, Versteckt7=true);
	 (Konfiguriert = true, Systeme = [], Versteckt1=false, Versteckt2=true, Versteckt3=true, Versteckt4=true, Versteckt7=true);
	 (Konfiguriert = true, Systeme \= [], Planeten = [], Versteckt1=false, Versteckt2=false, Versteckt3=true, Versteckt4=true, Versteckt7=true);
	 (Konfiguriert = true, Systeme \= [], Planeten \= [], Versteckt1=false, Versteckt2=false, Versteckt3=false, Versteckt4=false, Versteckt7=false)
	),
	Versteckt5 = false,
	Versteckt6 = false,
	debug(myTrace, 'Versteckt1=~k Versteckt2=~k Versteckt3=~k Versteckt4=~k Versteckt5=~k Versteckt6=~k Versteckt7=~k', [Versteckt1, Versteckt2, Versteckt3, Versteckt4, Versteckt5, Versteckt6, Versteckt7]),
	textResources:getText(funktionsAuswahl, FunktionsAuswahl),
	textResources:getText(linkZurMaske, LinkZurMaske),
	textResources:getText(erklaerung, Erklaerung),
	textResources:getText(vorraussetzungenSammeln, VorraussetzungenSammeln),
	textResources:getText(welcheMittelStoffeBekommen, WelcheMittelStoffeBekommen),
	textResources:getText(bekannteRezepteEingeben, BekannteRezepteEingeben),
	textResources:getText(gibRezepteSpielstand, GibRezepteSpielstand),
	textResources:getText(sternenSystemeEingeben, SternenSystemeEingeben),
	textResources:getText(entdeckteErfassen, EntdeckteErfassen),
	textResources:getText(himmelsKoerperEingeben, HimmelsKoerperEingeben),
	textResources:getText(planetMondeEingeben, PlanetMondeEingeben),
	textResources:getText(eigenschaftenHimmelsKoerperEingeben, EigenschaftenHimmelsKoerperEingeben),
	textResources:getText(ausstattungEingeben, AusstattungEingeben),
	textResources:getText(sammelDetailsEingeben, SammelDetailsEingeben),
	textResources:getText(sammelbareResourcenEingeben, SammelbareResourcenEingeben),
	textResources:getText(optimiertesVorgehenErhalten, OptimiertesVorgehenErhalten),
	textResources:getText(optimierteVorgehensweiseErwerbBekommen, OptimierteVorgehensweiseErwerbBekommen),
	textResources:getText(linksZeitweiseInaktiv, LinksZeitweiseInaktiv),
	TermerizedBody = [
	\['<header>'],
    h1([align(center)], \[FunktionsAuswahl]),
    \['</header>'],
	\['<formSpace>'],
    form([action('/systemNamen'), method('post'), autocomplete("on")], 
       	 [div(class('table'),
       	      [div(class('tr'), 
       	           [div(class('th'), \[LinkZurMaske]), 
       	            div(class('th'), \[Erklaerung])
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt6, '/spielStatusDialog', VorraussetzungenSammeln)),
       	            div(class('td'), label(WelcheMittelStoffeBekommen))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt5, '/rezeptBekanntDialogStoffKlasseAuswahl', BekannteRezepteEingeben)), 
       	            div(class('td'), label(GibRezepteSpielstand))
       	           ]),
       	       div(class('tr'), 
       	           [div(class('td'), \baueRef(Versteckt1, '/systemNamenDialog', SternenSystemeEingeben)), 
       	            div(class('td'), label(EntdeckteErfassen))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt2, '/planetMondNameSystemAuswahlDialog', HimmelsKoerperEingeben)), 
       	            div(class('td'), label(PlanetMondeEingeben))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt3, '/planetenEigenschaftenDialogSystemAuswahl', EigenschaftenHimmelsKoerperEingeben)), 
       	            div(class('td'), label(AusstattungEingeben))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt4, '/planetSammelEigenschaftenDialogSystemAuswahl', SammelDetailsEingeben)), 
       	            div(class('td'), label(SammelbareResourcenEingeben))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt7, '/stoffErlangenDialogSystemAusWahl', OptimiertesVorgehenErhalten)),
       	            div(class('td'), label(OptimierteVorgehensweiseErwerbBekommen))
       	           ])
       	      ]),
       	      p(LinksZeitweiseInaktiv)
		       ]),
	\['</formSpace>']
	             ],       
server:holeCssAlsStyle(StyleString),
TermerizedHead = [\[StyleString], title('hauptDialog')],
reply_html_page(TermerizedHead, TermerizedBody).

baueRef(Versteckt, Link, Text) -->
	{
		((Versteckt = true, string_concat('<a>', '', Ref1));
		 (Versteckt = false, string_concat('<a href="', Link, Ref0), string_concat(Ref0, '">', Ref1))
		),
		string_concat(Ref1, Text, Ref2),
		string_concat(Ref2, '</a>', Ref)
	},
	html([
		\[Ref]
	]).