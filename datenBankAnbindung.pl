:- module(datenBankAnbindung, []).
datenVonAccessHolen :-
	/* Dummyfunktion */
	format('Daten holen~n').
	 
datenNachAccessSpeichern :-
	odbc_connect('NoMansSkyDb', Connection, [open(once), alias(noMansSkyDb)]), 
	ignore(odbc_query(noMansSkyDb, 'Delete from spielStatus;')),
	
	ignore(odbc_query(noMansSkyDb, 'Delete from rezept;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from komponentenListe;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from wandelAktion;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from sammlung;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from sammelAktion;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from ort;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from sammelOrt;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from vorfertigen;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from stoff;')),
	ignore(odbc_query(noMansSkyDb, 'Delete from stoffKlasse;')),
	
	/* stoffKlasse */	
	odbc_prepare(noMansSkyDb, 'Insert into stoffKlasse(StoffKlasse, Wissen, Verkauf, Kauf) values (?,?,?,?);', [varchar(255), bit, bit, bit], Statement0),
	forall(stoffKlasse:stoffKlasse(StoffKlasse, Wissen, Verkauf, Kauf), 
	  (trueFalseToAccessBit(Wissen, WissenBit),
	   trueFalseToAccessBit(Verkauf, VerkaufBit),
	   trueFalseToAccessBit(Kauf, KaufBit), 
	   odbc_execute(Statement0, [StoffKlasse, WissenBit, VerkaufBit, KaufBit]))),
	odbc_close_statement(Statement0),
	odbc_free_statement(Statement0),

	/* stoff */
	odbc_prepare(noMansSkyDb, 'Insert into stoff (Stoff, Wert, StoffKlasse) values (?, ?, ?);', [varchar(255), integer, varchar(255)], Statement1),
	forall(stoff:stoff(StoffKlasse, Stoff, Wert), odbc_execute(Statement1, [Stoff, Wert, StoffKlasse])),
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

    /* sammlung */
	odbc_prepare(noMansSkyDb, 'Insert into sammlung(System, Planet, SammelAktion, Stoff, HauptZeit, NebenZeit, RuestZeit) values (?, ?, ?, ?, ?, ?, ?);', [varchar(255), varchar(255), varchar(255), varchar(255), integer, integer, integer], Statement4),
	forall(sammlung:sammlung(System, Planet, SammelAktion, Stoff, HauptZeit, NebenZeit), odbc_execute(Statement4, [System, Planet, SammelAktion, Stoff, HauptZeit, NebenZeit])),
	odbc_close_statement(Statement4),
	odbc_free_statement(Statement4),

    /* wandelAktion */
	odbc_prepare(noMansSkyDb, 'Insert into wandelAktion(WandelAktion) values (?);', [varchar(255)], Statement5),
	forall(wandelAktion:wandelAktion(WandelAktion, _), (odbc_execute(Statement5, [WandelAktion]))),
	odbc_close_statement(Statement5),
	odbc_free_statement(Statement5),

    /* rezept */
	odbc_prepare(noMansSkyDb, 'Insert into komponentenListe(KomponentenListe, Stoff, StueckZahl) values (?, ?, ?);', 
	  [varchar(255), varchar(255), integer], Statement6),
	odbc_prepare(noMansSkyDb, 'Insert into rezept(WandelAktion, KomponentenListe, ProduktStueckZahl, Produkt, Wandelzeit) values (?, ?, ?, ?, ?);', 
	  [varchar(255), varchar(255), integer, varchar(255), integer], Statement7),
	forall(rezept:rezept(WandelAktion, Komponenten, Produkt, Wandelzeit), 
	(Produkt = [ProduktStueckZahl, ProduktStoff],
	 maplist(nth1(2), Komponenten, KomponentenStoffe),
	 buildKomponentenId(WandelAktion, KomponentenStoffe, ProduktStoff, '', KomponentenListe), 
	 select(Komponente, Komponenten, _),
	 Komponente = [KomponentenStueckZahl, KomponentenStoff],
	 odbc_execute(Statement6, [KomponentenListe, KomponentenStoff, KomponentenStueckZahl]),
	 odbc_execute(Statement7, [WandelAktion, KomponentenListe, ProduktStueckZahl, ProduktStoff, Wandelzeit])
	)),

    /* vorfertigen */
	odbc_prepare(noMansSkyDb, 'Insert into vorfertigen(Stoff) values (?);', [varchar(255)], Statement8),
	forall(sammlung:vorfertigen(Stoff), (odbc_execute(Statement8, [Stoff]))),
	odbc_close_statement(Statement8),
	odbc_free_statement(Statement8),


	odbc_close_statement(Statement6),
	odbc_free_statement(Statement6),
	odbc_close_statement(Statement7),
	odbc_free_statement(Statement7),


    /* komponentenListe 
	odbc_prepare(noMansSkyDb, 'Insert into komponentenListe(KomponentenListe, Stoff, StueckZahl) values (?, ?);', [varchar(255), varchar(255)], Statement7),
	forall(buildKomponenten(KomponentenListe, Stoff), odbc_execute(Statement7, [KomponentenListe, Stoff])),
	odbc_close_statement(Statement7),
	odbc_free_statement(Statement7),
*/
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

		
	