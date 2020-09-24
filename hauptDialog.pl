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
	Versteckt8 = false,
	textResources:getText(txtFunktionsAuswahl, TxtFunktionsAuswahl),
	textResources:getText(txtLinkZurMaske, TxtLinkZurMaske),
	textResources:getText(txtErklaerung, TxtErklaerung),
	textResources:getText(txtStelleSpracheEin, TxtStelleSpracheEin),
	textResources:getText(txtSpracheEinstellen, TxtSpracheEinstellen),
	textResources:getText(txtVorraussetzungenSammeln, TxtVorraussetzungenSammeln),
	textResources:getText(txtWelcheMittelStoffeBekommen, TxtWelcheMittelStoffeBekommen),
	textResources:getText(txtBekannteRezepteEingeben, TxtBekannteRezepteEingeben),
	textResources:getText(txtGibRezepteSpielstand, TxtGibRezepteSpielstand),
	textResources:getText(txtSternenSystemeEingeben, TxtSternenSystemeEingeben),
	textResources:getText(txtEntdeckteErfassen, TxtEntdeckteErfassen),
	textResources:getText(txtHimmelsKoerperEingeben, TxtHimmelsKoerperEingeben),
	textResources:getText(txtPlanetMondeEingeben, TxtPlanetMondeEingeben),
	textResources:getText(txtEigenschaftenHimmelsKoerperEingeben, TxtEigenschaftenHimmelsKoerperEingeben),
	textResources:getText(txtAusstattungEingeben, TxtAusstattungEingeben),
	textResources:getText(txtSammelDetailsEingeben, TxtSammelDetailsEingeben),
	textResources:getText(txtSammelbareResourcenEingeben, TxtSammelbareResourcenEingeben),
	textResources:getText(txtOptimiertesVorgehenErhalten, TxtOptimiertesVorgehenErhalten),
	textResources:getText(txtOptimierteVorgehensweiseErwerbBekommen, TxtOptimierteVorgehensweiseErwerbBekommen),
	textResources:getText(txtLinksZeitweiseInaktiv, TxtLinksZeitweiseInaktiv),
	TermerizedBody = [
	\['<header>'],
    h1([align(center)], \[TxtFunktionsAuswahl]),
    \['</header>'],
	\['<formSpace>'],
    form([action('/systemNamen'), method('post'), autocomplete("on")], 
       	 [div(class('table'),
       	      [div(class('tr'), 
       	           [div(class('th'), \[TxtLinkZurMaske]), 
       	            div(class('th'), \[TxtErklaerung])
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt8, '/sprachUmschaltungAuswahl', TxtSpracheEinstellen)),
       	            div(class('td'), label(TxtStelleSpracheEin))
       	           ]),
        	   div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt6, '/spielStatusDialog', TxtVorraussetzungenSammeln)),
       	            div(class('td'), label(TxtWelcheMittelStoffeBekommen))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt5, '/rezeptBekanntDialogStoffKlasseAuswahl', TxtBekannteRezepteEingeben)), 
       	            div(class('td'), label(TxtGibRezepteSpielstand))
       	           ]),
       	       div(class('tr'), 
       	           [div(class('td'), \baueRef(Versteckt1, '/systemNamenDialog', TxtSternenSystemeEingeben)), 
       	            div(class('td'), label(TxtEntdeckteErfassen))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt2, '/planetMondNameSystemAuswahlDialog', TxtHimmelsKoerperEingeben)), 
       	            div(class('td'), label(TxtPlanetMondeEingeben))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt3, '/planetenEigenschaftenDialogSystemAuswahl', TxtEigenschaftenHimmelsKoerperEingeben)), 
       	            div(class('td'), label(TxtAusstattungEingeben))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt4, '/planetSammelEigenschaftenDialogSystemAuswahl', TxtSammelDetailsEingeben)), 
       	            div(class('td'), label(TxtSammelbareResourcenEingeben))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt7, '/stoffErlangenDialogSystemAusWahl', TxtOptimiertesVorgehenErhalten)),
       	            div(class('td'), label(TxtOptimierteVorgehensweiseErwerbBekommen))
       	           ])
       	      ]),
       	      p(TxtLinksZeitweiseInaktiv)
		       ]),
	\['</formSpace>']
	             ],       
server:holeCssAlsStyle(StyleString),
textResources:getText(txtNoMansSkyTrainerFunktionsAuswahl, TxtNoMansSkyTrainerFunktionsAuswahl),
TermerizedHead = [\[StyleString], title(TxtNoMansSkyTrainerFunktionsAuswahl)],
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