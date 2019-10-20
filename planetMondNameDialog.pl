:- module(planetMondNameDialog, [planetMondNameDialog/1, planetMondName/1]).

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
	findall([FeldNo1], between(1, 8, FeldNo1), FeldNoList),
	findall([RecordNo, HimmelsKoerper], spielStatus:planeten(RecordNo, AuswahlSystem, HimmelsKoerper), HimmelsKoerperListe),
	ausgabe:joinRecordsByRecordNo(FeldNoList, HimmelsKoerperListe, 1, NumerierteRecordList),
	TermerizedBody = [
		\['<header>'],
	    h1([align(center)], ['Sternensystem: Namen der Himmelskörper eingeben']),
	    \['</header>'] ,
		\['<formSpace>'],       
	    form([action('/planetMondName'), method('post'), name('systemEigenschaftenForm')], 
	       	 [h3('Sternensystem'),
       	  	  \eingabeTabelleReadOnly(AuswahlSystem),
	       	  h3('Planeten und Monde'),
	       	  div(class('table20'),
	       	        [div(class('tr'), 
	       	             [div([class('th'), scope("col")], 'Name') 
	       	             ]),
	       	         \innereEingabeZeile(NumerierteRecordList)
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
	
innereEingabeZeile([]) -->
	[].

innereEingabeZeile([Record|Rest]) -->
	{
		Record = [FeldNo, Planet]
	},
	html([div(class('tr'), 
	          [div(class('td'), 
	               input([name('planet' + FeldNo), type("text"), maxlength("40"), value(Planet)])
	              )
   	          ])
   	     ]),
   	     innereEingabeZeile(Rest).   	   

	
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
	spielStatus:reInitPlaneten(AuswahlSystem),
    (Planet1 = ''; assertz(spielStatus:planeten(1, AuswahlSystem, Planet1))),
    (Planet2 = ''; assertz(spielStatus:planeten(2, AuswahlSystem, Planet2))),
    (Planet3 = ''; assertz(spielStatus:planeten(3, AuswahlSystem, Planet3))),
    (Planet4 = ''; assertz(spielStatus:planeten(4, AuswahlSystem, Planet4))),
    (Planet5 = ''; assertz(spielStatus:planeten(5, AuswahlSystem, Planet5))),
    (Planet6 = ''; assertz(spielStatus:planeten(6, AuswahlSystem, Planet6))),
    (Planet7 = ''; assertz(spielStatus:planeten(7, AuswahlSystem, Planet7))),
    (Planet8 = ''; assertz(spielStatus:planeten(8, AuswahlSystem, Planet8))),
    server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Himmelskörper-Namen')],
	TermerizedBody = [
		\['<header>'],
		h3(align(center),'gespeichert!'),
		\['</header>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).
      