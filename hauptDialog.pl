:- module(hauptDialog, [hauptDialog/1]).

:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/', hauptDialog, []).

hauptDialog(_Request) :-
	(spielStatus:spielStatus(konfiguriert, Konfiguriert); Konfiguriert = false),
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
	TermerizedBody = [
	\['<header>'],
    h1([align(center)], ['Funktionsauswahl']),
    \['</header>'],
	\['<formSpace>'],
    form([action('/systemNamen'), method('post'), autocomplete("on")], 
       	 [div(class('table'),
       	      [div(class('tr'), 
       	           [div(class('th'), 'Link zur Maske'), 
       	            div(class('th'), 'Erklärung')
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt6, '/spielStatusDialog', 'Voraussetzungen des Sammelns eingeben')),
       	            div(class('td'), label('Geben Sie ein mit welchen Mitteln Sie Stoffe bekommen können!'))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt5, '/rezeptBekanntDialogStoffKlasseAuswahl', 'Bekannte Rezepte eingeben')), 
       	            div(class('td'), label('Geben Sie bekannte Rezepte ihres Spielstandes ein!'))
       	           ]),
       	       div(class('tr'), 
       	           [div(class('td'), \baueRef(Versteckt1, '/systemNamenDialog', 'Sternensysteme eingeben')), 
       	            div(class('td'), label('Erfassen Sie alle entdeckten Sternensysteme ihres Spielstandes!'))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt2, '/planetMondNameSystemAuswahlDialog', 'Himmelskörper eingeben')), 
       	            div(class('td'), label('Geben Sie für ein Sternensystem Planeten und Monde ein!'))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt3, '/planetenEigenschaftenDialogSystemAuswahl', 'Eigenschaften eines Himmelskörpers eingeben')), 
       	            div(class('td'), label('Geben Sie die planetare Ausstattung eines Himmelskörpers wie Basen, Raffinerieen etc. ein! '))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt4, '/planetSammelEigenschaftenDialogSystemAuswahl', 'SammelDetails eines Himmelskörpers eingeben')), 
       	            div(class('td'), label('Geben Sie die sammelbaren Resourcen eines Himmelskörpers ein!'))
       	           ]),
       	       div(class('tr'),
       	           [div(class('td'), \baueRef(Versteckt7, '/stoffErlangenDialogSystemAusWahl', 'Optimiertes Vorgehen erhalten')),
       	            div(class('td'), label('Bekommen Sie eine optimierte Vorgehensweise, für den Erwerb eines bestimmten Stoffes!'))
       	           ])
       	      ]),
       	      p('Links können zeitweise inaktiv sein, wenn notwendige Daten fehlen. Diese können Sie mit Hilfe der Masken, deren Link hier aktiv ist, eingegeben. Falls Sie die Daten inzwischen eingegeben haben, laden Sie diese Seite erneut (F5 bei Firefox)!')
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