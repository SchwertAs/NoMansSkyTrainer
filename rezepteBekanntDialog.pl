:- module(rezepteBekanntDialog, []).

:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/rezeptBekanntDialogStoffKlasseAuswahl', rezeptBekanntDialogStoffKlasseAuswahl, []).
:- http_handler('/rezeptBekanntDialog', rezeptBekanntDialog, []).
:- http_handler('/rezeptBekannt', rezeptBekannt, []).

rezeptBekanntDialogStoffKlasseAuswahl(_Request) :-
	findall(Klasse, (stoffKlasse:stoffKlasse(Klasse, _, _, _, _),
	(Klasse = produkt; Klasse = modul; Klasse = komponente; Klasse = produktUndKochStoff)), Klassen),
	server:baueOptionsFeld('auswahlStoffKlasse', Klassen, 2, OptionList),
	TermerizedBody = [
		\['<header>'],
	    h1([align(center)], ['Stoffklassen-Auswahl']),
	    \['</header>'],
		\['<formSpace>'],       
	    form([action('/rezeptBekanntDialog'), method('post')], 
	       	 [\eingabeTabelle(OptionList),
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
   	  div(class('table30'),[
   	    div(class('tr'), [
   	  	    div(class('td'), [
   	  	  	label([for('auswahlStoffKlasse')],'StoffKlasse: '),
   	  	  	\OptionList
   	  	    ]) 
   	  	])
   	  ])).
	
rezeptBekanntDialog(Request) :-
	member(method(post), Request), !,
	http_parameters(Request, 
	[auswahlStoffKlasse(AuswahlStoffKlasse, [length > 0])
	]),
	debug(myTrace, 'AuswahlStoffKlasse=~k', AuswahlStoffKlasse),
	((AuswahlStoffKlasse = 'Bitte wählen', planetAuswahlDialog:fehlerBehandlung); 
	 rezeptBekanntAnzeigen(AuswahlStoffKlasse)
	).
	
rezeptVonStoffKlasse(AuswahlStoffKlasse, Rezept, Checked) :-
	  stoff:stoff(AuswahlStoffKlasse, Produkt, _),
	  rezept:rezept(WandelAktion, Komponenten, [_, Produkt], _),
	  WandelAktion \= raffinieren,
	  ausgabe:letzesListenElement(Komponenten, [_, Rezept]),
	  sammlung:sammlung(RecNo, 'System', 'MeinPlanet', bekannt, Rezept, _, _, _),
	  (RecNo = 0 *-> Checked = ''; Checked = ' checked').
	  
rezeptBekanntAnzeigen(AuswahlStoffKlasse) :-
	debug(myTrace, 'AuswahlStoffKlasse=~k', AuswahlStoffKlasse),
	findall([Rezept, Checked], rezeptVonStoffKlasse(AuswahlStoffKlasse, Rezept, Checked), RezeptListe),
	ausgabe:partialList(RezeptListe, 1, 21, RezeptListe1),
	ausgabe:partialList(RezeptListe, 22, 42, RezeptListe2),
	ausgabe:partialList(RezeptListe, 43, 63, RezeptListe3),
	ausgabe:partialList(RezeptListe, 64, 84, RezeptListe4),
	findall([FeldNo1], between(101, 121, FeldNo1), FeldNoList1),
	findall([FeldNo2], between(201, 221, FeldNo2), FeldNoList2),
	findall([FeldNo3], between(301, 321, FeldNo3), FeldNoList3),
	findall([FeldNo4], between(401, 421, FeldNo4), FeldNoList4),
	ausgabe:joinRecordsNumbering(FeldNoList1, RezeptListe1, 2, NumerierteRecordList1),
	ausgabe:joinRecordsNumbering(FeldNoList2, RezeptListe2, 2, NumerierteRecordList2),
	ausgabe:joinRecordsNumbering(FeldNoList3, RezeptListe3, 2, NumerierteRecordList3),
	ausgabe:joinRecordsNumbering(FeldNoList4, RezeptListe4, 2, NumerierteRecordList4),
	 
	TermerizedBody = [
		\['<header>'],
	    h1([align(center)], ['Eingabe bekannte Rezepte']),
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
			       [td([button([name("submit"), type("submit")], 'OK')]),
			    		td([button([name("reset"), type("reset")], 'reset')])
			    	   ])
			       ]),
		\['</formSpace>']
		             ],       
	server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('Eingabe bekannte Rezepte')],
	reply_html_page(TermerizedHead, TermerizedBody).

eingabeTabelleReadOnly(AuswahlStoffKlasse) -->
	html(
   	  div(class('table20'),[
   	    div(class('tr'), [
   	    	\divInputReadOnly('auswahlStoffKlasse', 'Stoffklasse: ', AuswahlStoffKlasse, 1)
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
		debug(myTrace, 'Feld=~k Stoff=~k Checked=~k', [FeldNo, Stoff, Checked])
	},
	html([div(class('tr'), 
	          [div(class('td'), 
	          	   [input([name('rezept' + FeldNo), type("checkbox"), Checked]),
	          	    label([for('rezept' + FeldNo)], Stoff)
	               ])
   	          ])
   	     ]),
   	     innereEingabeZeile(Rest).   	   

rezeptBekannt(Request) :-
	rezeptBekanntDialogParams:rezeptBekanntDialogParamList(Request, VarValueList),
	VarValueList =[AuswahlStoffKlasse|_], 
	GesamtZeilenZahl = 21,
	\+ablegen(AuswahlStoffKlasse, GesamtZeilenZahl, VarValueList),
    gespeichert.

ablegen(AuswahlStoffKlasse, GesamtZeilenZahl, VarValueList) :-
	findall(Rezept, rezeptVonStoffKlasse(AuswahlStoffKlasse, Rezept, _), RezeptListe),
	between(1, 4, Spalte),
	between(1, GesamtZeilenZahl, Zeile),
	pickeZeile(GesamtZeilenZahl, Zeile, Spalte, VarValueList, RezeptListe, Rezept, Checked),
	Feld is Spalte * 100 + Zeile,
	debug(myTrace, 'abspeichern: Rezept=~k Checked=~k Feld=~k', [Rezept, Checked, Feld]),
	((Checked = 'on', CheckNum = 1);
	 (Checked \= 'on', CheckNum = 0)
	),
	debug(myTrace, 'abspeichern: CheckNum=~k', [CheckNum]),
	retractall(sammlung:sammlung(_, 'System', 'MeinPlanet', bekannt, Rezept, _, _, _)),
	assertz(sammlung:sammlung(CheckNum, 'System', 'MeinPlanet', bekannt, Rezept, 0, 0, 0)),
	fail.

pickeZeile(GesamtZeilenZahl, Zeile, Spalte, VarValueList, RezeptListe, Rezept, Checked) :-
  	OffsetChecked is 1 + (Spalte - 1) * GesamtZeilenZahl + Zeile,
  	OffsetRezept is OffsetChecked - 1,
    nth1(OffsetChecked, VarValueList, Checked),
    nth1(OffsetRezept, RezeptListe, Rezept).

	    
gespeichert :-
   	server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('systemNamenDialog')],
	TermerizedBody = [
		\['<header>'],
		h3(align(center),'gespeichert!'),
		\['</header>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).
