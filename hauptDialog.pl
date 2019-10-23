:- module(hauptDialog, [hauptDialog/1]).

:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/', hauptDialog, []).

hauptDialog(_Request) :-
	findall(RecNo0, (spielStatus:systeme(RecNo0, _, _), RecNo0 > 0), Systeme),
	findall(RecNo1, (spielStatus:planeten(RecNo1, _, _), RecNo1 > 0), Planeten),
	((Systeme = [], Versteckt2=true, Versteckt3=true, Versteckt4=true, Versteckt7=true);
	 (Systeme \= [], Planeten = [], Versteckt2=false, Versteckt3=true, Versteckt4=true, Versteckt7=true);
	 (Systeme \= [], Planeten \= [], Versteckt2=false, Versteckt3=false, Versteckt4=false, Versteckt7=false)
	),
	Versteckt5 = false,
	Versteckt6 = false,
	TermerizedBody = [
	\['<header>'],
    h1([align(center)], ['Funktionsauswahl']),
    \['</header>'],
	\['<formSpace>'],
    form([action('/systemNamen'), method('post'), autocomplete("on")], 
       	 [div(class('table'),
       	      [div(class('tr'), 
       	           [div(class('th'), 'Link zur Maske'), 
       	            div(class('th'), 'Erkl�rung')
       	           ]),
       	       div(class('tr'), 
       	           [div(class('td'), \baueRef(false, '/systemNamenDialog', 'Sternensysteme eingeben')), 
       	            div(class('td'), label('Erfassen Sie alle entdeckten Sternensysteme ihres Spielstandes!'))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt2, '/planetMondNameSystemAuswahlDialog', 'Himmelsk�rper eingeben')), 
       	            div(class('td'), label('Geben Sie f�r ein Sternensystem Planeten und Monde ein!'))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt3, '/planetenEigenschaftenDialogSystemAuswahl', 'Eigenschaften eines Himmelsk�rpers eingeben')), 
       	            div(class('td'), label('Geben Sie die planetare Ausstattung eines Himmelsk�rpers wie Basen, Raffinerieen etc. ein! '))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt4, '/planetSammelEigenschaftenDialogSystemAuswahl', 'SammelDetails eines Himmelsk�rpers eingeben')), 
       	            div(class('td'), label('Geben Sie die sammelbaren Resourcen eines Himmelsk�rpers ein!'))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt5, '/rezeptBekanntDialogStoffKlasseAuswahl', 'Bekannte Rezepte eingeben')), 
       	            div(class('td'), label('Geben Sie bekannte Rezepte ihres Spielstandes ein!'))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt6, '/spielStatusDialog', 'Voraussetzungen des Sammelns eingeben')),
       	            div(class('td'), label('Geben Sie ein mit welchen Mitteln Sie Stoffe bekommen k�nnen!'))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt7, '/stoffErlangenDialogSystemAusWahl', 'Optimiertes Vorgehen erhalten')),
       	            div(class('td'), label('Bekommen Sie eine optimierte Vorgehensweise, f�r den Erwerb eines bestimmten Stofes!'))
       	           ])
       	      ]),
       	      p('Links k�nnen zeitweise inaktiv sein, wenn notwendige Daten fehlen. Diese k�nnen Sie mit Hilfe der Masken, deren Link hier aktiv ist, eingegeben. Falls Sie die Daten inzwischen eingegeben haben, laden Sie diese Seite erneut (F5 bei Firefox)!')
		       ]),
	\['</formSpace>']
	             ],       
server:holeCssAlsStyle(StyleString),
TermerizedHead = [\[StyleString], title('systemNamenDialog')],
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