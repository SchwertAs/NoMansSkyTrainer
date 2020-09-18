:- module(sprachUmschaltung, [sprachUmschaltungAuswahl/1]).

:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/sprachUmschaltungAuswahl', sprachUmschaltungAuswahl, []).
:- http_handler('/sprachUmschaltung', sprachUmschaltung, []).

/* -----------------------------------  Systemauswahl ----------------------------------------------- */
sprachUmschaltungAuswahl(_Request) :-
	findall(Sprache, spielStatus:moeglicheSprache(Sprache), Sprachen),
	server:baueOptionsFeld('auswahlSprache', Sprachen, 2, OptionList),
	debug(myTrace, 'OptionList=~k', OptionList),
	textResources:getText(txtSprache, TxtSprache),
	textResources:getText(txtSpracheEinstellen, TxtSpracheEinstellen),
	textResources:getText(txtSpracheAuswaehlen, TxtSpracheAuswaehlen),
	string_concat(TxtSpracheEinstellen, ': ', Txt0),
	string_concat(Txt0, TxtSpracheAuswaehlen, TxtHeader),
	
	textResources:getText(txtOk, TxtOk),
	textResources:getText(txtReset, TxtReset),
	TermerizedBody = [
		\['<header>'],
	    h1([align(center)], [TxtHeader]),
	    \['</header>'],
		\['<formSpace>'], 
	    form([action('/sprachUmschaltung'), method('post'), name('systemAuswahlForm')], 
	       	 [h3(TxtSprache),
	       	  \eingabeTabelle(OptionList),
	       	  p(table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
			    	  [td([button([name("submit"), type("submit")], TxtOk)]),
			    	   td([button([name("reset"), type("reset")], TxtReset)])
			    	  ]))    
			 ]),
		\['</formSpace>']
		             ],       
	server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: System-Auswahl')],
	reply_html_page(TermerizedHead, TermerizedBody).

eingabeTabelle(OptionList) -->
	{	textResources:getText(txtSpracheDp, TxtSpracheDp)
	},
	html(
   	  div(class('table30'),[
   	    div(class('tr'), [
   	  	    div(class('td'), [
   	  	  	label([for('auswahlSprache')], TxtSpracheDp),
   	  	  	\OptionList
   	  	    ]) 
   	  	])
   	  ])).

sprachUmschaltung(Request) :-
	member(method(post), Request), !,
	http_parameters(Request, 
	[auswahlSprache(AuswahlSprache, [length > 0])
	]),
	textResources:getText(txtBitteWaehlen, BitteWaehlen),
	debug(myTrace, 'AuswahlSprache=~k', AuswahlSprache),
	((AuswahlSprache = BitteWaehlen, planetAuswahlDialog:fehlerBehandlung);
	 (retractall(spielStatus:sprache(_)),
	  assertz(spielStatus:sprache(AuswahlSprache)),
	 gespeichert)
	).

gespeichert :-
   	server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('systemNamenDialog')],
	textResources:getText(txtFunktionsAuswahl, TxtFunktionsAuswahl),
	textResources:getText(txtGespeichert, TxtGespeichert),
	TermerizedBody = [
		\['<header>'],
		h1(align(center),TxtGespeichert),
		\['</header>'],
		\['<formSpace>'], 
		p(a(['href="/"'],[TxtFunktionsAuswahl])),
		\['</formSpace>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).
   