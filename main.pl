:- module(main, []).

startServer :-
	spielStatus:spielStatusInit,
	sammlung:sammelbarInit,
	datenBankAnbindung:datenVonDbHolen, 
	server:server(8000),
	debug(myTrace),
	format('Zum Server beenden Taste drücken!', []),
	get_single_char(_),
	datenBankAnbindung:datenInDbSpeichern.


produktMit(Stoff, Komponenten, Anzahl, Produkt, Wert) :-
	rezept:rezept(_, Komponenten, [Anzahl, Produkt], _),
	stoff:stoff(_, Produkt, EinzelWert), 
	Wert is EinzelWert * Anzahl, 
	memberchk([_, Stoff], Komponenten).

/* TESTS */
testOptimierteSammlung :-
	spielStatus:spielStatusInit,
	sammlung:sammelbarInit, 
	stoff:stoff(_, Stoff, _, _),
	optimierungsZiel(OptZiel),
	optimierteLoesung(OptZiel, 1, Stoff),
	fail.

testStoffNichtSammelbar(Stoff) :-
	spielStatus:spielStatusInit,
	sammlung:sammelbarInit, 
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
	stoff:testAll.
