:- module(rezepteBekanntDialog, []).

:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/rezeptBekanntDialogStoffKlasseAuswahl', rezeptBekanntDialogStoffKlasseAuswahl, []).
:- http_handler('/rezeptBekanntDialog', rezeptBekanntDialog, []).
:- http_handler('/rezeptBekannt', rezeptBekannt, []).

/* ------------------------------------------  Stoffklasse auswählen  --------------------------------------------------------- */
rezeptBekanntDialogStoffKlasseAuswahl(_Request) :-
	findall(TxtKlasse, (stoffKlasse:stoffKlasse(Klasse),
	(Klasse = produkt; Klasse = modul; Klasse = komponente; Klasse = produktUndKochStoff; Klasse = basisBauEndStoff),
	 textResources:getText(Klasse, TxtKlasse)), Klassen),
	server:baueOptionsFeld('auswahlStoffKlasse', Klassen, 2, OptionList),
	textResources:getText(txtBekannteRezepteEingeben, TxtBekannteRezepteEingeben),
	textResources:getText(txtStoffKlassenAuswahl, TxtStoffKlassenAuswahl),
	string_concat(TxtBekannteRezepteEingeben, ': ', Txt0),
	string_concat(Txt0, TxtStoffKlassenAuswahl, TxtHeader),
	textResources:getText(txtOk, TxtOk),
	textResources:getText(txtReset, TxtReset),
	TermerizedBody = [
		\['<header>'],
	    h1([align(center)], [TxtHeader]),
	    \['</header>'],
		\['<formSpace>'],       
	    form([action('/rezeptBekanntDialog'), method('post')], 
	       	 [\eingabeTabelle(OptionList),
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
	{ textResources:getText(txtStoffKlasse, TxtStoffKlasse)
	},
	html(
   	  div(class('table30'),[
   	    div(class('tr'), [
   	  	    div(class('td'), [
   	  	  	label([for('auswahlStoffKlasse')], TxtStoffKlasse),
   	  	  	\OptionList
   	  	    ]) 
   	  	])
   	  ])).
	
/* ------------------------------------------  Rezepte anzeigen  --------------------------------------------------------- */
rezeptBekanntDialog(Request) :-
	member(method(post), Request), !,
	http_parameters(Request, 
	[auswahlStoffKlasse(AuswahlStoffKlasse, [length > 0])
	]),
	textResources:getText(txtBitteWaehlen, BitteWaehlen),
	debug(myTrace, 'AuswahlStoffKlasse=~k', AuswahlStoffKlasse),
	((AuswahlStoffKlasse = BitteWaehlen, server:fehlerBehandlung); 
	 rezeptBekanntAnzeigen(AuswahlStoffKlasse)
	).
	
rezeptVonStoffKlasse(TxtAuswahlStoffKlasse, Rezept) :-
	/* rückübersetzung in atom Achtung! Texte müssen ein-eindeutig sein */
	textResources:getText(AuswahlStoffKlasse, TxtAuswahlStoffKlasse),
	stoff:stoff(AuswahlStoffKlasse, Produkt, _),
	rezept:rezept(WandelAktion, Komponenten, [_, Produkt], _),
	(WandelAktion = herstellen;
	 WandelAktion = installieren;
	 WandelAktion = bauen),
	ausgabe:letzesListenElement(Komponenten, Ende),
	Ende = [_, Rezept].
	  
rezeptSchonBekannt(Rezept, Checked) :-
	sammlung:sammlung(RecNo, 'System', 'MeinPlanet', bekannt, Rezept, _, _, _),
	((RecNo = 0, Checked = ''); (RecNo > 0, Checked = ' checked')).
	
felderProZeile(RezeptListe, Step) :-
	length(RezeptListe, RezeptListeLength),
	divmod(RezeptListeLength, 4, Quotient, Rest),
	((Rest = 0, Step = Quotient);
	  Step is Quotient + 1
    ).
	
rezeptBekanntAnzeigen(AuswahlStoffKlasse) :-
	debug(myTrace, 'AuswahlStoffKlasse=~k', AuswahlStoffKlasse),
	findall([Rezept, Checked], (rezeptVonStoffKlasse(AuswahlStoffKlasse, Rezept), rezeptSchonBekannt(Rezept, Checked)), RezeptListe0),
	sort(RezeptListe0, RezeptListe),
	felderProZeile(RezeptListe, Step),
	debug(myTrace, 'Step= ~k, Rezeptliste=~k', [Step, RezeptListe]),
    /* Start- und Endefeld- und Listenpositionsnummern berechnen */
	RezeptListe1Start is 1, 
	RezeptListe2Start is RezeptListe1Start + Step,
	RezeptListe3Start is RezeptListe2Start + Step,
	RezeptListe4Start is RezeptListe3Start + Step,
	RezeptListe1End is RezeptListe1Start + Step - 1,
	RezeptListe2End is RezeptListe2Start + Step - 1,
	RezeptListe3End is RezeptListe3Start + Step - 1,
	RezeptListe4End is RezeptListe4Start + Step - 1,
	ausgabe:partialList(RezeptListe, RezeptListe1Start, RezeptListe1End, RezeptListe1),
	ausgabe:partialList(RezeptListe, RezeptListe2Start, RezeptListe2End, RezeptListe2),
	ausgabe:partialList(RezeptListe, RezeptListe3Start, RezeptListe3End, RezeptListe3),
	ausgabe:partialList(RezeptListe, RezeptListe4Start, RezeptListe4End, RezeptListe4),
	FeldNoEnd1 is 100 + Step,
	FeldNoEnd2 is 200 + Step,
	FeldNoEnd3 is 300 + Step,
	FeldNoEnd4 is 400 + Step,
	findall([FeldNo1], between(101, FeldNoEnd1, FeldNo1), FeldNoList1),
	findall([FeldNo2], between(201, FeldNoEnd2, FeldNo2), FeldNoList2),
	findall([FeldNo3], between(301, FeldNoEnd3, FeldNo3), FeldNoList3),
	findall([FeldNo4], between(401, FeldNoEnd4, FeldNo4), FeldNoList4),
	ausgabe:joinRecordsNumbering(FeldNoList1, RezeptListe1, 2, NumerierteRecordList1),
	ausgabe:joinRecordsNumbering(FeldNoList2, RezeptListe2, 2, NumerierteRecordList2),
	ausgabe:joinRecordsNumbering(FeldNoList3, RezeptListe3, 2, NumerierteRecordList3),
	ausgabe:joinRecordsNumbering(FeldNoList4, RezeptListe4, 2, NumerierteRecordList4),

	textResources:getText(txtBekannteRezepteEingeben, TxtBekannteRezepteEingeben),
	textResources:getText(txtBekannteRezepte, TxtBekannteRezepte),
	string_concat(TxtBekannteRezepteEingeben, ': ', Txt0),
	string_concat(Txt0, TxtBekannteRezepte, TxtHeader),
	textResources:getText(txtOk, TxtOk),
	textResources:getText(txtReset, TxtReset),
	
	TermerizedBody = [
		\['<header>'],
	    h1([align(center)], [TxtHeader]),
	    \['</header>'],
		\['<formSpace>'],       
	    form([action('/rezeptBekannt'), method('post')], 
	       	 [\eingabeTabelleReadOnly(AuswahlStoffKlasse),
	       	 div(class('table'),
	       	      [div(class('tr'), 
	       	           [\innereTabelle(NumerierteRecordList1),
	       	            \innereTabelle(NumerierteRecordList2),
	       	            \innereTabelle(NumerierteRecordList3),
	       	            \innereTabelle(NumerierteRecordList4)
	       	           ])
	       	      ]),
			 table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
			       [td([button([name("submit"), type("submit")], TxtOk)]),
			    		td([button([name("reset"), type("reset")], TxtReset)])
			    	   ])
			       ]),
		\['</formSpace>']
		             ],       
	server:holeCssAlsStyle(StyleString),
	textResources:getText(txtNoMansSkyTrainerEingabeBekannteRezepte, TxtNoMansSkyTrainerEingabeBekannteRezepte),
	TermerizedHead = [\[StyleString], title(TxtNoMansSkyTrainerEingabeBekannteRezepte)],
	reply_html_page(TermerizedHead, TermerizedBody).

eingabeTabelleReadOnly(AuswahlStoffKlasse) -->
	html(
   	  div(class('table30'),[
   	    div(class('tr'), [
   	    	\divInputReadOnly('auswahlStoffKlasse', 'Stoffklasse: ', AuswahlStoffKlasse, 1)
   	  	])
   	  ])).

divInputReadOnly(Name, LabelText, Value, Index) -->
	html(
	div(class('td'), [
		label([ for(Name)],[LabelText]),
   	  	input([ name(Name),
   	  	  		class(text40Format),
   	  	  		type('text'), 
   	  	  		size(20), 
   	  	  		maxlength(20),
   	  	  		value(Value),
   	  	  		tabindex(Index),
   	  	  		readonly(true)
   	  	  	  ])
   	  	])
	).
	
innereTabelle([[_, '', '']|_]) -->
	[].
	
innereTabelle(NumerierteRecordList) -->
	{
		debug(myTrace, 'List=~k', [NumerierteRecordList])
	},
	html(
		[div(class('td'), 
		     [div(class('table'), 
			  [\innereEingabeZeile(NumerierteRecordList)
   	          ])
   	         ])
   	    ]).
	
innereEingabeZeile([]) -->
	[].

innereEingabeZeile([[_, '', _]|_]) -->
	[].

innereEingabeZeile([Record|Rest]) -->
	{
		Record = [FeldNo, Stoff, Checked],
		textResources:getText(Stoff, TxtStoff),
		debug(myTrace, 'Feld=~k Stoff=~k Checked=~k', [FeldNo, TxtStoff, Checked])
	},
	html([div(class('tr'), 
	          [div(class('td'), 
	          	   [input([name('rezept' + FeldNo), type("checkbox"), Checked]),
	          	    label([for('rezept' + FeldNo)], TxtStoff)
	               ])
   	          ])
   	     ]),
   	     innereEingabeZeile(Rest).   	   

/* ------------------------------------------  Daten ablegen  --------------------------------------------------------- */
rezeptBekannt(Request) :-
	rezeptBekanntDialogParams:rezeptBekanntDialogParamList(Request, VarValueList),
	VarValueList =[AuswahlStoffKlasse|_], 
	baueRezeptListe(AuswahlStoffKlasse, RezeptListe),
	\+ablegen(RezeptListe, VarValueList),
    server:gespeichert.

baueRezeptListe(AuswahlStoffKlasse, RezeptListe) :-
	findall(Rezept, (rezeptVonStoffKlasse(AuswahlStoffKlasse, Rezept), rezeptSchonBekannt(Rezept, _)), RezeptListe0),
	sort(RezeptListe0, RezeptListe).
	
ablegen(RezeptListe, VarValueList) :-
	debug(myTrace, 'abspeichern: VarValueList=~k', [VarValueList]),
	debug(myTrace, 'abspeichern: RezeptListe=~k', [RezeptListe]),
	felderProZeile(RezeptListe, Step),
	felderProZeile(VarValueList, ParamStep),
	debug(myTrace, 'abspeichern: ParamStep=~k Step=~k', [ParamStep, Step]),
	!,
	between(1, 4, Spalte),
	between(1, Step, Zeile),
	pickeZeile(ParamStep, Step, Zeile, Spalte, VarValueList, RezeptListe, Rezept, Checked),
	((Checked = 'on', CheckNum = 1);
	 (Checked \= 'on', CheckNum = 0)
	), 
	ignore(retractall(sammlung:sammlung(_, 'System', 'MeinPlanet', bekannt, Rezept, _, _, _))),
	assertz(sammlung:sammlung(CheckNum, 'System', 'MeinPlanet', bekannt, Rezept, 0, 0, 0)),
	CheckNum = 1,
	debug(myTrace, 'abspeichern: ~k ~k', [Rezept, CheckNum]),
	fail.

pickeZeile(ParamStep, Step, Zeile, Spalte, VarValueList, RezeptListe, Rezept, Checked) :-
  	OffsetRezept is (Spalte - 1 ) * Step + Zeile,
    nth1(OffsetRezept, RezeptListe, Rezept),
  	OffsetChecked is 1 + (Spalte - 1) * (ParamStep - 1) + Zeile,
    nth1(OffsetChecked, VarValueList, Checked).
