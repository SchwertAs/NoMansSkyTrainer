:- module(systemNamenDialog, [systemNamenDialog/1]).

:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).

:- http_handler('/systemNamenDialog', systemNamenDialog, []).
:- http_handler('/systemNamen', systemNamen, []).

systemNamenDialog(_Request) :-
	findall([FeldNo, System, Farbe], (spielStatus:systeme(FeldNo, System, Farbe), System \= 'System'), SystemList),
	ausgabe:partialList(SystemList, 1, 20, SystemList1),
	ausgabe:partialList(SystemList, 21, 40, SystemList2),
	ausgabe:partialList(SystemList, 41, 60, SystemList3),
	findall([FeldNo1], between(101, 120, FeldNo1), FeldNoList1),
	findall([FeldNo2], between(201, 220, FeldNo2), FeldNoList2),
	findall([FeldNo3], between(301, 320, FeldNo3), FeldNoList3),
	ausgabe:joinRecordsByRecordNo(FeldNoList1, SystemList1, 2, NumerierteRecordList1),
	ausgabe:joinRecordsByRecordNo(FeldNoList2, SystemList2, 2, NumerierteRecordList2),
	ausgabe:joinRecordsByRecordNo(FeldNoList3, SystemList3, 2, NumerierteRecordList3),
	
	TermerizedBody = [
		\['<header>'],
	    h1([align(center)], ['Eingabe der Sternensysteme']),
	    \['</header>'],
		\['<formSpace>'],       
	    form([action('/systemNamen'), method('post'), autocomplete("off")], 
	       	 [div(class('table'),
	       	      [div(class('tr'), 
	       	           [div(class('td'), \innereTabelle(NumerierteRecordList1)),
	       	            div(class('td'), \innereTabelle(NumerierteRecordList2)),
	       	            div(class('td'), \innereTabelle(NumerierteRecordList3))
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
	TermerizedHead = [\[StyleString], title('systemNamenDialog')],
	reply_html_page(TermerizedHead, TermerizedBody).

innereTabelle(NumerierteRecordList) -->
	html(
		[div(class('table'), 
			 [div(class('tr'), 
			      [div([class('th'), scope("col")], 'System-Name'),
			       div([class('th'), scope("col")], 'Farbe')
   	              ]),
   	           \innereEingabeZeile(NumerierteRecordList)
   	         ])
   	    ]).
	
innereEingabeZeile([]) -->
	[].

innereEingabeZeile([Record|Rest]) -->
	{
		Record = [FeldNo, System, Farbe],
		SpalteNo is floor(FeldNo / 100),
		findall([Farbe, Farbe0], member(Farbe0, ['gelb', 'rot', 'gruen']), Farben)
	},
	html([div(class('tr'), 
	          [div(class('td'), 
	               input([name('systemName' + FeldNo), type("text"), maxlength("40"), pattern("^(?!System$)\\S*$"), value(System)])
	              ),
			   div(class('td'), \baueOptionsFeld('farbe', FeldNo, SpalteNo, Farben))
   	          ])
   	     ]),
   	     innereEingabeZeile(Rest).   	   

baueOptionsFeld(FeldName, FeldNo, StartIndex, OptionsWerteListe) -->
	{
		Index is (FeldNo mod 100 - 1) * 3 + StartIndex,
		OptionsWerteListe = [[Wert,_]|_],
		((Wert = '', OptionText = option(selected, 'Bitte wählen')); (OptionText = option('Bitte wählen')))
	},
	html([select([name(FeldName + FeldNo), id(FeldName + FeldNo), class("Nachschlagen"), size("1"), maxlength(20), tabindex(Index)],
			     [
			      OptionText,
			      \baueOption(OptionsWerteListe)
   	        	 ])
	]).

baueOption([]) -->
	[].
 
baueOption([OptionTupel|Rest]) -->
	{
		OptionTupel = [Wert, Option],
		atom_string(Option, OptionText),
		((Wert = Option, OptionText0 = option(selected, OptionText)); (OptionText0 = option(OptionText)))
	},
	html([
		OptionText0
	]),
	baueOption(Rest).
	

systemNamen(Request) :-
	member(method(post), Request), !,
	systemNamenDialogParams:systemNamenDialogParamList(Request, VarValueList),
	GesamtZeilenZahl = 20,
	\+plausibleEingabe(VarValueList, GesamtZeilenZahl),
    ((nb_getval('ZeileNoFehler', ZeileNoFehler),
      nb_getval('SpalteNoFehler', SpalteNoFehler),
      ZeileNoFehler > 0,
      fehlerZeile(ZeileNoFehler, SpalteNoFehler)
	 );
	 (spielStatus:initSysteme,
	  \+ablegen(GesamtZeilenZahl, VarValueList),
      gespeichert
     )
	).

plausibleEingabe(VarValueList, GesamtZeilenZahl) :-
	nb_setval('ZeileNoFehler', 0),
	nb_setval('SpalteNoFehler', 0),
	between(1, 3, Spalte),
	between(1, GesamtZeilenZahl, Zeile),
	pickeZeile(GesamtZeilenZahl, Zeile, Spalte, VarValueList, System, Farbe),
	\+leereZeile(System, Farbe),
	\+gueltigeZeile(System, Farbe),
	nb_setval('ZeileNoFehler', Zeile),
	nb_setval('SpalteNoFehler', Spalte),
	!, fail.
	
pickeZeile(GesamtZeilenZahl, Zeile, Spalte, VarValueList, System, Farbe) :-
  	OffsetSystem is 2 * (Spalte - 1) * GesamtZeilenZahl + Zeile,
    OffsetFarbe is 2 * (Spalte - 1) * GesamtZeilenZahl + GesamtZeilenZahl + Zeile,
    nth1(OffsetSystem, VarValueList, System),
    nth1(OffsetFarbe, VarValueList, Farbe).

ablegen(GesamtZeilenZahl, VarValueList) :-
	between(1, 3, Spalte),
	between(1, GesamtZeilenZahl, Zeile),
	pickeZeile(GesamtZeilenZahl, Zeile, Spalte, VarValueList, System, Farbe),
	gueltigeZeile(System, Farbe),
	debug(myTrace, 'abspeichern: System=~k, Farbe=~k', [System, Farbe]),
	Feld is Spalte * 100 + Zeile,
	debug(myTrace, 'abspeichern: Feld=~k', [Feld]),
	assertz(spielStatus:systeme(Feld, System, Farbe)),
	fail.
	    
gespeichert :-
   	server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('systemNamenDialog')],
	TermerizedBody = [
		\['<header>'],
		h3(align(center),'gespeichert!'),
		\['</header>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).

fehlerZeile(Zeile, Spalte) :-
	server:holeCssAlsStyle(StyleString),
	string_concat('Die Zeile ', Zeile, FehlerMeldung0),
	string_concat(FehlerMeldung0, ' in Spalte ', FehlerMeldung1),
	string_concat(FehlerMeldung1, Spalte, FehlerMeldung2),
   	string_concat(FehlerMeldung2, ' ist unvollständig', FehlerMeldung),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Planeteneigenschaften Fehler')],
	TermerizedBody = [
		\['<redHeader>'],
		h3(align(center), FehlerMeldung),
		\['</redHeader>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).

gueltigeZeile(System, Farbe) :-
	System \= '''',
	Farbe \= 'Bitte wählen'.

leereZeile(System, Farbe) :-
	System = '''',
	Farbe = 'Bitte wählen'.

	