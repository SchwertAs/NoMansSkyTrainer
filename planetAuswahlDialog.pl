:- module(planetAuswahlDialog, [systemAuswahlDialog/2, planetAuswahlDialog/3]).

:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

/* -----------------------------------  Systemauswahl ----------------------------------------------- */
systemAuswahlDialog(HeaderText, Action) :-
	findall(System, (spielStatus:systeme(_, System, _), System \= 'System'), Systeme),
	server:baueOptionsFeld('auswahlSystem', Systeme, 2, OptionList),
	textResources:getText(txtSternensystem, TxtSternensystem),
	textResources:getText(txtOk, TxtOk),
	textResources:getText(txtReset, TxtReset),
	TermerizedBody = [
		\['<header>'],
	    h1([align(center)], [HeaderText]),
	    \['</header>'],
		\['<formSpace>'],       
	    form([action(Action), method('post'), name('systemAuswahlForm')], 
	       	 [h3(TxtSternensystem),
	       	  \eingabeTabelle(OptionList),
	       	  p(table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
			    	  [td([button([name("submit"), type("submit")], TxtOk)]),
			    	   td([button([name("reset"), type("reset")], TxtReset)])
			    	  ]))    
			 ]),
		\['</formSpace>']
		             ],       
	server:holeCssAlsStyle(StyleString),
	textResources:getText(txtNoMansSkyTrainerSystemAuswahl, TxtNoMansSkyTrainerSystemAuswahl),
	TermerizedHead = [\[StyleString], title(TxtNoMansSkyTrainerSystemAuswahl)],
	reply_html_page(TermerizedHead, TermerizedBody).

eingabeTabelle(OptionList) -->
	{	textResources:getText(txtSystemDp, TxtSystem)
	},
	html(
   	  div(class('table30'),[
   	    div(class('tr'), [
   	  	    div(class('td'), [
   	  	  	label([for('auswahlSystem')], TxtSystem),
   	  	  	\OptionList
   	  	    ]) 
   	  	])
   	  ])).

/* -----------------------------------  Planetauswahl ----------------------------------------------- */
planetAuswahlDialog(HeaderText, Action, Request) :-
	textResources:getText(txtBitteWaehlen, TxtBitteWaehlen),
	textResources:getText(txtAuswahlHimmelskoerper, TxtAuswahlHimmelskoerper),
	textResources:getText(txtOk, TxtOk),
	textResources:getText(txtReset, TxtReset),
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0])]),
	((AuswahlSystem = TxtBitteWaehlen, server:fehlerBehandlung); 
	(
	 findall(Planet, (spielStatus:planeten(_, AuswahlSystem, Planet, _), Planet \= 'MeinPlanet'), Planeten),
	 server:baueOptionsFeld('auswahlPlanet', Planeten, 2, OptionList),
	
	 TermerizedBody = [
	 \['<header>'],
     h1([align(center)], [HeaderText]),
     \['</header>'],
	 \['<formSpace>'],       
     form([action(Action), method('post'), name('planetAuswahlForm')], 
       	 [h3(TxtAuswahlHimmelskoerper),
       	  \planetenAnzeige(AuswahlSystem, OptionList),
       	  p(table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
		    	  [td([button([name("submit"), type("submit")], TxtOk)]),
		    	   td([button([name("reset"), type("reset")], TxtReset)])
		    	  ]))    
		 ]),
	 \['</formSpace>']
		             ],       
	 server:holeCssAlsStyle(StyleString),
	 textResources:getText(txtNoMansSkyTrainerHimmelskoerperEing, TxtNoMansSkyTrainerHimmelskoerperEing),
	 TermerizedHead = [\[StyleString], title(TxtNoMansSkyTrainerHimmelskoerperEing)],
	 reply_html_page(TermerizedHead, TermerizedBody)
	)).

planetenAnzeige(AuswahlSystem, OptionList) -->
	{ 	textResources:getText(txtSystemDp, TxtSystem),
		textResources:getText(txtPlanetDp, TxtPlanet)
	},
	html(
   	  div(class('table50'),[
   	    div(class('tr'), [
   	    	\divInputReadOnly('auswahlSystem', TxtSystem, AuswahlSystem, 1),
   	  	    div(class('td'), [
   	  	  	label([for('planetenName')], TxtPlanet),
   	  	  	\OptionList
   	  	    ]) 
   	  	])
   	  ])).
   	  
divInputReadOnly(Name, LabelText, Value, Index) -->
	html(
	div(class('td'), [
		label([ for(Name)],[LabelText]),
   	  	input([ class(text40Format),
   	  	        name(Name),
   	  	  		type('text'), 
   	  	  		size(20), 
   	  	  		maxlength(20),
   	  	  		value(Value),
   	  	  		tabindex(Index),
   	  	  		readonly(true)
   	  	  	  ])
   	  	])
	).
