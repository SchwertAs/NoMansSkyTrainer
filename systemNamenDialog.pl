:- module(systemNamenDialog, [systemNamenDialog/1]).

:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).

:- http_handler('/systemNamenDialog', systemNamenDialog, []).
:- http_handler('/systemNamen', systemNamen, []).

/* ----------------------  Eingabe Sternensysteme  --------------------------------------------*/
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
	    form([action('/systemNamen'), method('post')], 
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
	               input([name('systemName' + FeldNo), type("text"), maxlength("40"), pattern("^(?!System$).*$"), value(System)])
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
	

/* ----------------------  Antwort Formular ---------------------------------------------------*/
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
	 (\+ablegen(GesamtZeilenZahl, VarValueList),
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
	Feld is Spalte * 100 + Zeile,
	insUpdDel(Feld, System, Farbe),
	fail.

/* identisch */
insUpdDel(Feld, System, Farbe) :-
	spielStatus:systeme(Feld, System, Farbe),
	debug(myTrace, 'unverändert: Feld=~k System=~k Farbe=~k', [Feld, System, Farbe]),
	!.
	
/* move evtl. mit update farbe */
insUpdDel(FeldNeu, System, Farbe) :-
	spielStatus:systeme(FeldAlt, System, _),
	FeldNeu \= FeldAlt,
	System \= "",
	debug(myTrace, 'verschoben: FeldAlt=~k FeldNeu=~k System=~k', [FeldAlt, FeldNeu, System]),
	retractall(spielStatus:systeme(FeldAlt, System, _)),
	assertz(spielStatus:systeme(FeldNeu, System, Farbe)),
	!.
	
/* Attibuts-update */
insUpdDel(FeldNeu, System, FarbeNeu) :-
	spielStatus:systeme(FeldNeu, System, _),
	debug(myTrace, 'Attribut-Update: Feld=~k System=~k Farbe=~k', [FeldNeu, System, FarbeNeu]),
	retractall(spielStatus:systeme(FeldNeu, System, _)),
	assertz(spielStatus:systeme(FeldNeu, System, FarbeNeu)),
	!.

/* Schlüssel-update */
insUpdDel(FeldNeu, SystemNeu, FarbeNeu) :-
	spielStatus:systeme(FeldNeu, SystemAlt, _),
	SystemNeu \= "",
	SystemNeu \= SystemAlt,
	debug(myTrace, 'Schlüssel-Update: Feld=~k SystemAlt=~k SystemNeu=~k', [FeldNeu, SystemAlt, SystemNeu]),
	/* planet updaten */
	forall(spielStatus:planeten(RecNo0, SystemAlt, Planet0, AtmospherenTyp), 
	 assertz(spielStatus:planeten(RecNo0, SystemNeu, Planet0, AtmospherenTyp))
	),
	retractall(spielStatus:planeten(_, SystemAlt, _, _)),
	/* sammlung updaten */
	forall(sammlung:sammlung(RecNo1, SystemAlt, Planet1, Operation, Stoff, Haupt, Neben, Ruest),
	       assertz(sammlung:sammlung(RecNo1, SystemNeu, Planet1, Operation, Stoff, Haupt, Neben, Ruest))
	      ),
	retractall(sammlung:sammlung(_, SystemAlt, _, _, _, _, _, _)),
	/* systemausstattung updaten */
	forall(spielStatus:systemAusstattung([SystemAlt, Planet2, Ort], Entfernung),
		   assertz(spielStatus:systemAusstattung([SystemNeu, Planet2, Ort], Entfernung))
	      ),
	retractall(spielStatus:systemAusstattung([SystemAlt, _, _], _)),
	/*  */
	retractall(spielStatus:systeme(FeldNeu, SystemAlt, _)),
	assertz(spielStatus:systeme(FeldNeu, SystemNeu, FarbeNeu)),	
	!.

/* insert */
insUpdDel(FeldNeu, SystemNeu, FarbeNeu) :-
	\+spielStatus:systeme(FeldNeu, _, _),
	SystemNeu \= "",
	debug(myTrace, 'insert: Feld=~k SystemNeu=~k, FarbeNeu=~k', [FeldNeu, SystemNeu, FarbeNeu]),
	assertz(spielStatus:systeme(FeldNeu, SystemNeu, FarbeNeu)),
	!.

/* löschen cascade */
insUpdDel(FeldNeu, SystemNeu, _) :-
	spielStatus:systeme(FeldNeu, SystemOld, _),
	SystemNeu = "",
	debug(myTrace, 'delete: Feld=~k SystemAlt=~k', [FeldNeu, SystemOld]),
	retractall(sammlung:sammlung(_, SystemOld, _, _, _, _, _, _)),
	retractall(spielStatus:systemAusstattung([SystemOld, _, _], _)),
	retractall(spielStatus:planeten(_, SystemOld, _, _)),	
	retractall(spielStatus:systeme(_, SystemOld, _)),	
	!.
	
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
	System \= "",
	Farbe \= 'Bitte wählen'.

leereZeile(System, Farbe) :-
	System = "",
	Farbe = 'Bitte wählen'.

	