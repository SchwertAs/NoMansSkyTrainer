:- module(main, [startServer/0, resetDatabase/0]).

startServer :-
	datenBankAnbindung:datenVonDbHolen, 
	server:server(8000),
	debug(myTrace),
	format('Zum Server beenden Taste drücken!', []),
	get_single_char(_),
	datenBankAnbindung:datenInDbSpeichern.

resetDatabase :-
	spielStatus:spielStatusInit,
	sammlung:sammlungInit,
	datenBankAnbindung:datenInDbSpeichern.
	
produktMit(Stoff, Komponenten, Anzahl, Produkt, Wert) :-
	rezept:rezept(_, Komponenten, [Anzahl, Produkt], _),
	stoff:stoff(_, Produkt, EinzelWert), 
	Wert is EinzelWert * Anzahl, 
	memberchk([_, Stoff], Komponenten).

/* TESTS */
testOptimierteSammlung :-
	spielStatus:spielStatusInit,
	sammlung:sammlungInit,
	sammlung:sammelbarReInit('System', 'MeinPlanet'),
	!,
	stoff:stoff(_, Stoff, _),
	optimierung:optimierungsZiel(OptimierungsZiel),
	\+suchTest(Stoff, OptimierungsZiel),
	format('~k mit ~k not ok~n', [Stoff, OptimierungsZiel]),
	fail.

suchTest(Stoff, OptimierungsZiel) :-
	\+suchAlgorithmus:baue('System', 'MeinPlanet', OptimierungsZiel, 1, Stoff),
	optimierung:optimierungsStrategie(OptimierungsZiel, Stoff, _SammelSet, _Vorgaenge, _MinimalSammelZahl, _GesamtWertSammlung, _MinimalZeit, _HandelswertSammlung, _Erloes)
	.

suchTest(Stoff, _) :-
	sammlung:sammelbar(Stoff, _).
	
testStoffNichtSammelbar(Stoff) :-
	spielStatus:spielStatusInit,
	sammlung:sammlungInit, 
 	stoff:stoff(_, Stoff, _),
	\+sammlung:sammelbar(Stoff, _).

testAll :-
	testRezepte(_, _, _, _, _, _),
	testStoff.
	
testRezepte(FehlOperation, FehlOpProdukt, 
			FehlKomponente,
			FehlProdukt,
			FertigungsZeitFehlStoff, FertigungsZeitFehlKomponenten) :-
	format('testRezepte Start~n'),
	\+rezept:integritaetWandelAktion(FehlOperation, FehlOpProdukt),
	format('Operationen ok~n'),
	\+rezept:komponenteIstKeinStoff(FehlKomponente),
	format('Komponenten ok~n'),
	\+rezept:produktIstKeinStoff(FehlProdukt),
	format('Produkte ok~n'),
	\+rezept:rezeptDoppelt(FehlOperation, FehlKomponente, FehlProdukt),
	format('keine Doppelten ok~n'),
	\+rezept:gleicheZutaten(FehlKomponente),
	format('keine gleichen Zutaten ok~n'),
	\+rezept:raffinerieRezeptHatKeineFertigungsZeit(FertigungsZeitFehlStoff,FertigungsZeitFehlKomponenten),
	format('Fertigungszeiten ok~n').
	
testStoff :-
	stoff:testAll.
