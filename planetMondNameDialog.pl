:- module(planetMondNameDialog, [planetMondNameDialog/1, planetMondName/1]).

:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/planetMondNameSystemAuswahlDialog', planetMondNameSystemAuswahlDialog, []).
:- http_handler('/planetMondNameDialog', planetMondNameDialog, []).
:- http_handler('/planetMondName', planetMondName, []).

/* ----------------------  Auswahl System  ----------------------------------------------------*/
planetMondNameSystemAuswahlDialog(_Request) :-
	planetAuswahlDialog:systemAuswahlDialog(
		'Eigenschaften Sternensystem eingeben', 
		'/planetMondNameDialog').
		
/* ----------------------  Eingabe Himmelskörper  ---------------------------------------------*/
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

	
/* ----------------------  Antwort Formular ---------------------------------------------------*/
planetMondName(Request) :-
	member(method(post), Request), !,
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0]),
     planet1(Planet1, [default("")]),
     planet2(Planet2, [default("")]),
     planet3(Planet3, [default("")]),
     planet4(Planet4, [default("")]),
     planet5(Planet5, [default("")]),
     planet6(Planet6, [default("")]),
     planet7(Planet7, [default("")]),
     planet8(Planet8, [default("")])
    ]),
    insUpdDel(AuswahlSystem, Planet1, 1),
    insUpdDel(AuswahlSystem, Planet2, 2),
    insUpdDel(AuswahlSystem, Planet3, 3),
    insUpdDel(AuswahlSystem, Planet4, 4),
    insUpdDel(AuswahlSystem, Planet5, 5),
    insUpdDel(AuswahlSystem, Planet6, 6),
    insUpdDel(AuswahlSystem, Planet7, 7),
    insUpdDel(AuswahlSystem, Planet8, 8),
    
    server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Himmelskörper-Namen')],
	TermerizedBody = [
		\['<header>'],
		h3(align(center),'gespeichert!'),
		\['</header>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).


/* unverändert */
insUpdDel(System, PlanetNew, RecNo) :-
	spielStatus:planeten(RecNo, System, PlanetNew),
	debug(myTrace, 'unverändert: RecNo=~k System=~k Planet=~k', [RecNo, System, PlanetNew]),
	!.

/* in anderes Zeile verschoben */
insUpdDel(System, PlanetNew, RecNoNew) :-
	PlanetNew \= "",
	\+spielStatus:planeten(RecNoNew, System, PlanetNew),
	spielStatus:planeten(RecNoOld, System, PlanetNew),
	debug(myTrace, 'Zeile verschoben: RecNoOld=~k RecNoNew=~k System=~k Planet=~k', [RecNoOld, RecNoNew, System, PlanetNew]),
	retractall(spielStatus:planeten(RecNoOld, System, PlanetNew)),
	assertz(spielStatus:planeten(RecNoNew, System, PlanetNew)),
	!.

/* umbenannt */
insUpdDel(System, PlanetNew, RecNoNew) :-
	spielStatus:planeten(RecNoNew, System, PlanetOld),
	PlanetNew \= "",
	debug(myTrace, 'Schlüsselupdate: RecNoNew=~k System=~k Planet=~k', [RecNoNew, System, PlanetNew]),
	forall(sammlung:sammlung(RecNo, System, PlanetOld, Operation, Stoff, Haupt, Neben, Ruest),
	       assertz(sammlung:sammlung(RecNo, System, PlanetNew, Operation, Stoff, Haupt, Neben, Ruest))
	      ),
	retractall(sammlung:sammlung(_, System, PlanetOld, _, _, _, _, _)),
	forall(spielStatus:systemAusstattung([System, PlanetOld, Ort], Entfernung),
		   assertz(spielStatus:systemAusstattung([System, PlanetNew, Ort], Entfernung))
	      ),
	retractall(spielStatus:systemAusstattung([System, PlanetOld, _], _)),
	retractall(spielStatus:planeten(RecNoNew, System, PlanetOld)),
	assertz(spielStatus:planeten(RecNoNew, System, PlanetNew)),
	!.

/* insert */
insUpdDel(System, PlanetNew, RecNoNew) :-
	\+spielStatus:planeten(RecNoNew, _, _),
	PlanetNew \= "",
	debug(myTrace, 'insert: RecNoNew=~k System=~k Planet=~k', [RecNoNew, System, PlanetNew]),
	assertz(spielStatus:planeten(RecNoNew, System, PlanetNew)),
	sammlung:copyDefaultIfEmpty(System, PlanetNew),
	spielStatus:copyDefaultIfEmpty(System, PlanetNew),
	!.
	
/* löschen cascade */
insUpdDel(System, PlanetNew, RecNoNew) :-
	spielStatus:planeten(RecNoNew, System, PlanetOld),
	PlanetNew = "",
	debug(myTrace, 'löschen: RecNoNew=~k System=~k PlanetOld=~k', [RecNoNew, System, PlanetOld]),
	retractall(sammlung:sammlung(_, System, PlanetOld, _, _, _, _, _)),
	retractall(spielStatus:systemAusstattung([System, PlanetOld, _], _)),
	retractall(spielStatus:planeten(RecNoNew, System, _)),
	!.

insUpdDel(_, PlanetNew, _) :-
	PlanetNew = "",
	!.