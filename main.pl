:- module(main, [optimierteLoesung/3]).

startServer :-
	spielStatus:spielStatusInit,
	sammlung:sammelbarInit, 
	server:server(8000),
	format('Zum Server beenden Taste drücken!', []),
	get_single_char(_).


optimierteLoesung(OptimierungsZiel, Anzahl, Stoff) :-  
	\+suchAlgorithmus:baue(OptimierungsZiel, Anzahl, Stoff),
	optimierung:optimierungsStrategie(OptimierungsZiel, Stoff, SammelSet, Vorgaenge, MinimalSammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes),
	ausgabe:printMinSammlungForm(SammelSet, Vorgaenge, MinimalSammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes).

produktMit(Stoff, Komponenten, Anzahl, Produkt, Wert) :-
	rezept:rezept(_, Komponenten, [Anzahl, Produkt], _),
	stoff:stoff(_, Produkt, EinzelWert), 
	Wert is EinzelWert * Anzahl, 
	memberchk([_, Stoff], Komponenten).

/* Declarationen */
/* 

*/
	
testMinimaleSammlung :-
	stoff:stoff(_, Stoff, _, _),
	minimaleSammlungLoesung(1, Stoff),
	fail.


testStoffNichtSammelbar(Stoff) :-
 	stoff:stoff(_, Stoff, _),
	\+sammlung:sammelbar(Stoff, _).
	
testRezepte(FehlOperation, FehlOpProdukt, 
			FehlKomponente,
			FehlProdukt,
			FertigungsZeitFehlStoff, FertigungsZeitFehlKomponenten) :-
	\+rezept:fehlerOperation(FehlOperation, FehlOpProdukt),
	format('Operationen ok~n'),
	\+rezept:komponenteIstKeinStoff(FehlKomponente),
	format('Komponenten ok~n'),
	\+rezept:produktIstKeinStoff(FehlProdukt),
	format('Produkte ok~n'),
	\+rezept:raffinerieRezeptHatKeineFertigungsZeit(FertigungsZeitFehlStoff,FertigungsZeitFehlKomponenten),
	format('Fertigungszeiten ok~n').
	
testStoff :-
	format('Eingangsstoffe testen '),
	\+stoff:fehlerInputStoffNichtDefiniert(_),
	format('ok~n'),
	format('Ausgangsstoffe testen '),
	\+stoff:fehlerOutputStoffNichtDefiniert(_),
	format('ok~n'),
	format('Wertangaben testen '),
	\+stoff:produktNichtBewertet(_),
	format('ok~n'),
	format('Doppelte testen '),
	\+stoff:doppelteInStoff,
	format('ok~n'),
	format('Verwendung testen~n'),
	\+stoff:stoffNichtVerwendet(_),
	format('ok~n').
	