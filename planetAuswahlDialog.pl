:- module(planetAuswahlDialog, [systemAuswahlDialog/2, planetAuswahlDialog/3, fehlerBehandlung/0]).

:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

/* -----------------------------------  Systemauswahl ----------------------------------------------- */
systemAuswahlDialog(HeaderText, Action) :-
	findall(System, (spielStatus:systeme(_, System, _), System \= 'System'), Systeme),
	server:baueOptionsFeld('auswahlSystem', Systeme, 2, OptionList),
	TermerizedBody = [
		\['<header>'],
	    h1([align(center)], [HeaderText]),
	    \['</header>'],
		\['<formSpace>'],       
	    form([action(Action), method('post'), name('systemAuswahlForm')], 
	       	 [h3('Sternensystem'),
	       	  \eingabeTabelle(OptionList),
	       	  p(table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
			    	  [td([button([name("submit"), type("submit")], 'OK')]),
			    	   td([button([name("reset"), type("reset")], 'reset')])
			    	  ]))    
			 ]),
		\['</formSpace>']
		             ],       
	server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: System-Auswahl')],
	reply_html_page(TermerizedHead, TermerizedBody).

eingabeTabelle(OptionList) -->
	html(
   	  div(class('table20'),[
   	    div(class('tr'), [
   	  	    div(class('td'), [
   	  	  	label([for('auswahlSystem')],'System: '),
   	  	  	\OptionList
   	  	    ]) 
   	  	])
   	  ])).

/* -----------------------------------  Planetauswahl ----------------------------------------------- */
planetAuswahlDialog(HeaderText, Action, Request) :-
	member(method(post), Request), !,
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0])]),
	((AuswahlSystem = 'Bitte wählen', fehlerBehandlung); 
	(
	 findall(Planet, (spielStatus:planeten(_, AuswahlSystem, Planet, _), Planet \= 'MeinPlanet'), Planeten),
	 server:baueOptionsFeld('auswahlPlanet', Planeten, 2, OptionList),
	
	 TermerizedBody = [
	 \['<header>'],
     h1([align(center)], [HeaderText]),
     \['</header>'],
	 \['<formSpace>'],       
     form([action(Action), method('post'), name('planetAuswahlForm')], 
       	 [h3('Auswahl Himmelskörper'),
       	  \planetenAnzeige(AuswahlSystem, OptionList),
       	  p(table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
		    	  [td([button([name("submit"), type("submit")], 'OK')]),
		    	   td([button([name("reset"), type("reset")], 'reset')])
		    	  ]))    
		 ]),
	 \['</formSpace>']
		             ],       
	 server:holeCssAlsStyle(StyleString),
	 TermerizedHead = [\[StyleString], title('No mans Sky trainer: Planet-Auswahl')],
	 reply_html_page(TermerizedHead, TermerizedBody)
	)).

planetenAnzeige(AuswahlSystem, OptionList) -->
	html(
   	  div(class('table50'),[
   	    div(class('tr'), [
   	    	\divInputReadOnly('auswahlSystem', 'System: ', AuswahlSystem, 1),
   	  	    div(class('td'), [
   	  	  	label([for('planetenName')],'Planet: '),
   	  	  	\OptionList
   	  	    ]) 
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

fehlerBehandlung :-
   	server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Planeteneigenschaften Fehler')],
	TermerizedBody = [
		\['<redHeader>'],
		h3(align(center),'bitte eine Auswahl treffen!'),
		\['</redHeader>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).

  	  