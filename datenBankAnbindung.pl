:- module(datenBankAnbindung, [datenInDbSpeichern/0, datenVonDbHolen/0, datenNachAccessSpeichern/0]).

:- use_module(library(persistency)).

:- persistent
	sammlungDb(recordNo:nonneg, system:atom, planet:atom, sammelAktion:atom, stoff:atom, hauptZeit:nonneg, nebenZeit:nonneg, ruestZeit:nonneg),
	spielStatusDb(status:atom, vorhanden:boolean),
	systemDb(recordNo:nonneg, system:atom, farbe:atom),
	planetDb(recordNo:nonneg, system:atom, planet:atom, atmospherenTyp:atom),
	systemAusstattungDb(ortsAngabe:list, entfernung:nonneg),
	fertigeLoesungDb(system:atom, planet:atom, strategie:atom, stoff:atom, vorgaenge:list).

datenInDbSpeichern :-
	db_attach('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/persistenceDb.txt', []),
	
	retractall_sammlungDb(_, _, _, _, _, _, _, _),
	retractall_spielStatusDb(_, _),
	retractall_systemDb(_, _, _),
	retractall_planetDb(_, _, _, _),
	retractall_systemAusstattungDb(_, _),
	retractall_fertigeLoesungDb(_, _, _, _, _),
	
	db_sync(gc(always)),
	
	forall(sammlung:sammlung(RecordNo2, System2, Planet1, SammelAktion2, Stoff1, Haupt, Neben, Ruest),
	       assert_sammlungDb(RecordNo2, System2, Planet1, SammelAktion2, Stoff1, Haupt, Neben, Ruest)),
	forall(spielStatus:spielStatus(Feature, Vorhanden), assert_spielStatusDb(Feature, Vorhanden)),
	forall(spielStatus:systeme(RecordNo, System, Farbe), assert_systemDb(RecordNo, System, Farbe)),
	forall(spielStatus:planeten(RecordNo1, System1, Planet, AtmospherenTyp), assert_planetDb(RecordNo1, System1, Planet, AtmospherenTyp)),
	forall(spielStatus:systemAusstattung(OrtsAngabe, Entfernung), assert_systemAusstattungDb(OrtsAngabe, Entfernung)),
	forall(sammlung:fertigeLoesung(System3, Planet3, Strategie3, Stoff3, Vorgaenge3), 
	       assert_fertigeLoesungDb(System3, Planet3, Strategie3, Stoff3, Vorgaenge3)),
	
	db_detach.

datenVonDbHolen :-
	db_attach('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/persistenceDb.txt', []),
	db_sync(update),

	ignore(retractall(sammlung:sammlung(_, _, _, _, _, _, _, _))),
	ignore(retractall(spielStatus:spielStatus(_, _))),
	ignore(retractall(spielStatus:systeme(_, _, _))),
	ignore(retractall(spielStatus:planeten(_, _, _, _))),
	ignore(retractall(spielStatus:systemAusstattung(_, _))),
	ignore(retractall(sammlung:fertigeLoesung(_, _, _, _, _))),

	forall(sammlungDb(RecordNo2, System1, Planet1, SammelAktion2, Stoff2, Haupt, Neben, Ruest),
	       assertz(sammlung:sammlung(RecordNo2, System1, Planet1, SammelAktion2, Stoff2, Haupt, Neben, Ruest))),
	forall(spielStatusDb(Feature, Vorhanden), assertz(spielStatus:spielStatus(Feature, Vorhanden))),
	forall(systemDb(RecordNo, SystemName, Farbe), assertz(spielStatus:systeme(RecordNo, SystemName, Farbe))),
	forall(planetDb(RecordNo1, System, Planet, AtmospherenTyp), assertz(spielStatus:planeten(RecordNo1, System, Planet, AtmospherenTyp))),
	forall(systemAusstattungDb(OrtsAngabe, Entfernung), assertz(spielStatus:systemAusstattung(OrtsAngabe, Entfernung))),
	forall(fertigeLoesungDb(System3, Planet3, Strategie3, Stoff3, Vorgaenge3), 
	       assertz(sammlung:fertigeLoesung(System3, Planet3, Strategie3, Stoff3, Vorgaenge3))),

	db_detach.	

datenNachAccessSpeichern :-
	odbc_connect('NoMansSkyDb', Connection, [open(once), alias(noMansSkyDb)]), 
	ignore(odbc_query(noMansSkyDb, 'Delete from spielStatus;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from rezept;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from rezeptKomponente;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from wandelAktion;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from sammlung;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from planet;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from system;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from sammelOrt;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from sammelAktion;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from ort;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from vorfertigen;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from stoff;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from stoffKlasse;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from vorgangKomponente;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from vorgang;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from fertigeLoesung;')),
	

	/* stoffKlasse */	
	odbc_prepare(noMansSkyDb, 'Insert into stoffKlasse(StoffKlasse, Wissen, Verkauf, Kauf, InInventarHerstellbar) values (?,?,?,?,?);',
	             [varchar(255), bit, bit, bit, bit], Statement0),
	forall(stoffKlasse:stoffKlasse(StoffKlasse, Wissen, Verkauf, Kauf, InInventarHerstellbar), 
	  (trueFalseToAccessBit(Wissen, WissenBit),
	   trueFalseToAccessBit(Verkauf, VerkaufBit),
	   trueFalseToAccessBit(Kauf, KaufBit),
	   trueFalseToAccessBit(InInventarHerstellbar, InInventarHerstellbarBit),
	   odbc_execute(Statement0, [StoffKlasse, WissenBit, VerkaufBit, KaufBit, InInventarHerstellbarBit]))),
	odbc_close_statement(Statement0),
	odbc_free_statement(Statement0),

	/* stoff */
	odbc_prepare(noMansSkyDb, 'Insert into stoff (Stoff, Wert, StoffKlasse) values (?, ?, ?);',
	             [varchar(255), integer, varchar(255)], Statement1),
	forall(stoff:stoff(StoffKlasse, Stoff, Wert), 
	  odbc_execute(Statement1, [Stoff, Wert, StoffKlasse])),
	odbc_close_statement(Statement1),
	odbc_free_statement(Statement1),

    /* ort */
	odbc_prepare(noMansSkyDb, 'Insert into ort (Ort) values (?);', [varchar(255)], Statement2),
	forall(ort:ort(Ort), odbc_execute(Statement2, [Ort])),
	odbc_close_statement(Statement2),
	odbc_free_statement(Statement2),

    /* sammelAktion */
	odbc_prepare(noMansSkyDb, 'Insert into sammelAktion (SammelAktion) values (?);', [varchar(255)], Statement3),
	forall(sammelAktion:sammelAktion(SammelAktion), odbc_execute(Statement3, [SammelAktion])),
	odbc_close_statement(Statement3),
	odbc_free_statement(Statement3),
		
    /* sammelOrt */
	odbc_prepare(noMansSkyDb, 'Insert into sammelOrt (SammelAktion, Ort) values (?, ?);', [varchar(255), varchar(255)], Statement8),
	forall(sammelAktion:sammelOrt(SammelAktion, Ort), odbc_execute(Statement8, [SammelAktion, Ort])),
	odbc_close_statement(Statement8),
	odbc_free_statement(Statement8),

	/* system */	
	odbc_prepare(noMansSkyDb, 'Insert into system(RecordNo, System, Farbe) values (?,?,?);', 
	             [integer, varchar(255), varchar(255)], Statement9),
	forall(spielStatus:systeme(RecordNo, SystemName, Farbe), 
	  odbc_execute(Statement9, [RecordNo, SystemName, Farbe])),
	odbc_close_statement(Statement9),
	odbc_free_statement(Statement9),
	
	/* planet */	
	odbc_prepare(noMansSkyDb, 'Insert into planet(RecordNo, System, Planet, PlanetenGruppe) values (?,?,?,?);', 
	             [integer, varchar(255), varchar(255), varchar(255)], Statement10),
	forall(spielStatus:planeten(RecordNo, System, Planet, PlanetenGruppe), 
	  odbc_execute(Statement10, [RecordNo, System, Planet, PlanetenGruppe])),
	odbc_close_statement(Statement10),
	odbc_free_statement(Statement10),
 
    /* sammlung */
	odbc_prepare(noMansSkyDb, 'Insert into sammlung(RecordNo, System, Planet, SammelAktion, Stoff, HauptZeit, NebenZeit, RuestZeit) values (?, ?, ?, ?, ?, ?, ?, ?);', 
	             [integer, varchar(255), varchar(255), varchar(255), varchar(255), integer, integer, integer], Statement4),
	forall(sammlung:sammlung(RecordNo, System, Planet, SammelAktion, Stoff, Haupt, Neben, Ruest), 
	  odbc_execute(Statement4, [RecordNo, System, Planet, SammelAktion, Stoff, Haupt, Neben, Ruest])),
	odbc_close_statement(Statement4),
	odbc_free_statement(Statement4),

    /* wandelAktion */
	odbc_prepare(noMansSkyDb, 'Insert into wandelAktion(WandelAktion, Ort) values (?, ?);', [varchar(255), varchar(255)], Statement5),
	forall(wandelAktion:wandelAktion(WandelAktion, Ort), (odbc_execute(Statement5, [WandelAktion, Ort]))),
	odbc_close_statement(Statement5),
	odbc_free_statement(Statement5),

    /* rezept */
	odbc_prepare(noMansSkyDb, 'Insert into rezeptKomponente(KomponentenListe, Stoff, StueckZahl) values (?, ?, ?);', 
	  [varchar(255), varchar(255), real], Statement6),
	odbc_prepare(noMansSkyDb, 'Insert into rezept(WandelAktion, KomponentenListe, ProduktStueckZahl, Produkt, Wandelzeit) values (?, ?, ?, ?, ?);', 
	  [varchar(255), varchar(255), integer, varchar(255), real], Statement7), 
	forall(rezept:rezept(WandelAktion, Komponenten, Produkt, Wandelzeit), 
	(Produkt = [ProduktStueckZahl, ProduktStoff],
	 maplist(nth1(2), Komponenten, KomponentenStoffe),
	 buildKomponentenId(WandelAktion, KomponentenStoffe, ProduktStoff, '', KomponentenListe), 
	 select(Komponente, Komponenten, _),
	 Komponente = [KomponentenStueckZahl, KomponentenStoff],
	 odbc_execute(Statement6, [KomponentenListe, KomponentenStoff, KomponentenStueckZahl]),
	 odbc_execute(Statement7, [WandelAktion, KomponentenListe, ProduktStueckZahl, ProduktStoff, Wandelzeit])
	)),
	odbc_close_statement(Statement6),
	odbc_free_statement(Statement6),
	odbc_close_statement(Statement7),
	odbc_free_statement(Statement7),

    /* vorfertigen */
	odbc_prepare(noMansSkyDb, 'Insert into vorfertigen(Stoff) values (?);', [varchar(255)], Statement11),
	forall(sammlung:vorfertigen(Stoff), (odbc_execute(Statement11, [Stoff]))),
	odbc_close_statement(Statement11),
	odbc_free_statement(Statement11),

    /* spielStatus */
	odbc_prepare(noMansSkyDb, 'Insert into spielStatus(Status, Vorhanden) values (?,?);', [varchar(255), bit], Statement12),
	forall(spielStatus:spielStatus(Status, Vorhanden), 
	 (trueFalseToAccessBit(Vorhanden, VorhandenBit), 
	  odbc_execute(Statement12, [Status, VorhandenBit]))),
	odbc_close_statement(Statement12),
	odbc_free_statement(Statement12),

    /* fertigeLoesung */
	odbc_prepare(noMansSkyDb, 'Insert into vorgangKomponente(FertigeLoesungId, VorgangId, Id, StueckZahl, Stoff) values (?, ?, ?, ?, ?);', 
	  [integer, integer, integer, real, varchar(255)], Statement13),
	odbc_prepare(noMansSkyDb, 'Insert into vorgang(FertigeLoesungId, Id, System, Planet, VorgangsWiederholungsZahl, Operation, ErgebnisStueckZahl, ErgebnisStoff) values (?, ?, ?, ?, ?, ?, ?, ?);', 
	  [integer, integer, varchar(255), varchar(255), integer, varchar(255), integer, varchar(255)], Statement14),
	odbc_prepare(noMansSkyDb, 'Insert into fertigeLoesung(Id, System, Planet, Strategie, Stoff) values (?, ?, ?, ?, ?);', 
	             [integer, varchar(255), varchar(255), varchar(255), varchar(255)], Statement15),
	findall([System3, Planet3, Strategie3, Stoff3, Vorgaenge3], sammlung:fertigeLoesung(System3, Planet3, Strategie3, Stoff3, Vorgaenge3), Loesungen),
	length(Loesungen, AnzLoesungen),
	forall(between(1, AnzLoesungen, LoesNummer),
	(nth1(LoesNummer, Loesungen, [System3, Planet3, Strategie3, Stoff3, Vorgaenge3]),
	 odbc_execute(Statement15, [LoesNummer, System3, Planet3, Strategie3, Stoff3]),
	 length(Vorgaenge3, AnzVorg),
	 forall(between(1, AnzVorg, VorgNummer),
	 (nth1(VorgNummer, Vorgaenge3, [System4, Planet4, VorgangsWiederholungsZahl, Operation, Komponenten, [ErgebnisStueckZahl, ErgebnisStoff]]),
	  odbc_execute(Statement14, [LoesNummer, VorgNummer, System4, Planet4, VorgangsWiederholungsZahl, Operation, ErgebnisStueckZahl, ErgebnisStoff]),
	  length(Komponenten, AnzKomp),	
	  forall(between(1, AnzKomp, KompNummer),
	  (nth1(KompNummer, Komponenten, [KomponentenStueckZahl, KomponentenStoff]),
	   odbc_execute(Statement13, [LoesNummer, VorgNummer, KompNummer, KomponentenStueckZahl, KomponentenStoff])
	  ))
	 ))
	)), 
	odbc_close_statement(Statement13),
	odbc_close_statement(Statement14),
	odbc_close_statement(Statement15),
	odbc_free_statement(Statement13),
	odbc_free_statement(Statement14),
	odbc_free_statement(Statement15),

	odbc_disconnect(Connection).

trueFalseToAccessBit(TrueFalse, AccessBit) :-
	TrueFalse = true,
	AccessBit = 1.
	
trueFalseToAccessBit(TrueFalse, AccessBit) :-
	TrueFalse = false,
	AccessBit = 0.

buildKomponentenId(Aktion, KomponentenStoffe, ProduktStoff, KomponentenIdBisher, KomponentenId) :-
	KomponentenStoffe = [],
	string_concat(KomponentenIdBisher, '__',KomponentenIdBisher1),
	atom_concat(Aktion, KomponentenIdBisher1, KomponentenIdBisher2), 
	atom_concat(KomponentenIdBisher2, ProduktStoff, KomponentenId).
		
buildKomponentenId(Aktion, KomponentenStoffe, ProduktStoff, KomponentenIdBisher, KomponentenId) :-
	selectchk(Komponente, KomponentenStoffe, KomponentenStoffeDanach),
	string_concat(KomponentenIdBisher, '_',KomponentenIdBisher1),
    atom_concat(KomponentenIdBisher1, Komponente, KomponentenIdDanach), 
	buildKomponentenId(Aktion, KomponentenStoffeDanach, ProduktStoff, KomponentenIdDanach, KomponentenId).

generiereKomponenten(KomponentenId, Stoff, StueckZahl) :-
	rezept:rezept(Aktion, Komponenten, Produkt, _),
	maplist(nth1(2), Komponenten, KomponentenStoffe),
	Produkt = [_, ProduktStoff],
	buildKomponentenId(Aktion, KomponentenStoffe, ProduktStoff, '', KomponentenId),
	select(Komponente, Komponenten, _),
	Komponente = [StueckZahl, Stoff].

		
	