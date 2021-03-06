:- module(main, [startServer/0, resetDatabase/1]).

startServer :-
	gebePersistenzDatenbankDateiName(PersistenzDatenbank),
	(\+exists_file(PersistenzDatenbank), resetDatabase(PersistenzDatenbank); true),
	datenBankAnbindung:datenVonDbHolen(PersistenzDatenbank), 
	server:server(8000),
	debug(myTrace),
	format('Zum Server beenden Taste dr�cken!', []),
	!,
	get_single_char(_),
	datenBankAnbindung:datenInDbSpeichern(PersistenzDatenbank).

gebePersistenzDatenbankDateiName(PersistenzDatenbank) :-
	working_directory(CWD, CWD),
	string_concat(CWD, 'persistenceDb.txt', PersistenzDatenbank),
	format('Persistenzdb: ~k', [PersistenzDatenbank]). 
	
	
resetDatabase(PersistenzDatenbank) :-
	spielStatus:spielStatusInit,
	sammlung:sammlungInit,
	datenBankAnbindung:datenInDbSpeichern(PersistenzDatenbank).
	
produktMit(Stoff, Komponenten, Anzahl, Produkt, Wert) :-
	rezept:rezept(_, Komponenten, [Anzahl, Produkt], _),
	stoff:stoff(_, Produkt, EinzelWert), 
	Wert is EinzelWert * Anzahl, 
	memberchk([_, Stoff], Komponenten).

/* TESTS */
testOptimierteSammlung :-
	spielStatus:spielStatusInit,
	sammlung:sammlungInit,
	vorfertigen:vorgefertigeLoesungenErstellen,
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
	
	
