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
	sammlung:vorgefertigeLoesungenErstellen,
	!,
	stoff:stoff(StoffArt, Stoff, _),
	StoffArt \= pass,
	StoffArt \= stoerung,	
	StoffArt \= handelsWare,	
	StoffArt \= kuriositaet,	
	StoffArt \= artefakt,	
	optimierung:optimierungsZiel(OptimierungsZiel),
	\+suchTest(Stoff, OptimierungsZiel),
	format('~k mit ~k not ok~n', [Stoff, OptimierungsZiel]),
	fail.

suchTest(Stoff, _) :-
	sammlung:sammlung(_, _, _, _, Stoff, _, _, _).
	
suchTest(Stoff, OptimierungsZiel) :-
	\+suchAlgorithmus:baue('System', 'MeinPlanet', OptimierungsZiel, 1, Stoff),
	optimierung:optimierungsStrategie(OptimierungsZiel, Stoff, _SammelSet, _Vorgaenge, _MinimalSammelZahl, _GesamtWertSammlung, _MinimalZeit, _HandelswertSammlung, _Erloes)
	.

	
testAll :-
	rezept:testAll(_, _, _, _, _, _),
	stoff:testAll,
	testOptimierteSammlung.
	
	
