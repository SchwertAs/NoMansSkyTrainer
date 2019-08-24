:- module(sammeln, [sammelbar/3, sammelAktion/1, wandelAktion/1, fertigeLoesung/8]).

:- dynamic(sammelbar/3).
:- dynamic(fertigeLoesung/8).

/* mögliche Sammleaktionen */
sammelAktion(minenLaserNutzen).
sammelAktion(verbessertenMinenLaserNutzen).
sammelAktion(pfluecken).
sammelAktion(terrainFormerNutzen).
sammelAktion(erkaempfen).
sammelAktion(ernten).
sammelAktion(raumSchuerfen).
sammelAktion(vorfertigen).

/* mögliche Stoffwandelaktionen */
wandelAktion(bauen).
wandelAktion(herstellen).
wandelAktion(kochen).
wandelAktion(raffinieren).

/* Pflanzen ohne Gerät wild ernten */
pfluecken(natrium, 20).
pfluecken(sauerStoff, 20).
pfluecken(natrium, 20).
pfluecken(pilzSchimmel, 20).

/* mit Minenlaser auf Planet */
minenLaserNutzen(ammoniak, 7).
minenLaserNutzen(diWasserStoff, 4).
minenLaserNutzen(ferritStaub, 3).
minenLaserNutzen(kobalt, 4).
minenLaserNutzen(kohlenStoff, 2).
minenLaserNutzen(natrium, 7).
minenLaserNutzen(sauerStoff, 9).
minenLaserNutzen(kuerbisKnolle, 5).
minenLaserNutzen(pilzSchimmel, 1).
minenLaserNutzen(stickStoff, 9).

/* mit Terrainformer gewinnbar */
terrainFormerNutzen(wiederhergestellteTechnologie, 300).
terrainFormerNutzen(kupfer, 3).
terrainFormerNutzen(natrium, 6).
terrainFormerNutzen(ammoniak, 3).

/* verbesserter Minenlaser */
verbessertenMinenLaserNutzen(reinesFerrit, 3).
verbessertenMinenLaserNutzen(salz, 29).

/* bei Zerstörung von Wächtern */
erkaempfen(pugneum, 12000).

/* Agrar */
ernten(frostKristall, 20).
ernten(gammaWurzel, 20).
ernten(pilzSchimmel, 20).
ernten(coprit, 20).
ernten(kaktusFleisch, 20).
ernten(sternenKnolle, 20).
ernten(mordit, 20).
ernten(solanium, 20).
ernten(gravitinoBall, 20).

/* Meteoritenfelder */
raumSchuerfen(tritium, 2).
raumSchuerfen(gold, 75).
raumSchuerfen(silber, 16).
raumSchuerfen(platin, 20).

/* Vorfertigen */
vorfertigen(antiMaterie).
vorfertigen(antiMaterieGehaeuse).
vorfertigen(aronium).
vorfertigen(glas).
vorfertigen(grantine).
vorfertigen(herox).
vorfertigen(instabilesGel).
vorfertigen(instabilesNatrium).
vorfertigen(kohlenStoffKristall).
vorfertigen(lemmium).
vorfertigen(organischerKatalysator).
vorfertigen(magnoGold).
vorfertigen(saeure).
vorfertigen(seltenesMetallElement).
vorfertigen(stickStoffSalz).
vorfertigen(strassenKoeterBronze).
vorfertigen(superOxidKristall).
vorfertigen(tetraKobalt).
vorfertigen(thermischesKondensat).
vorfertigen(chlorGitter).
vorfertigen(frostKristall).
vorfertigen(gammaWurzel).


sammelbarInit :-
	\+sammelbarInitFlach,
	\+sammelbarVorfertigen.
	
sammelbarInitFlach :-
	abolish(sammelbar/3),
	ausgangsStoff:stoff(Stoff, _),
	findall(EineHauptZeit, sammelArt(Stoff, _, EineHauptZeit), HauptZeiten),
	min_member( MinimaleHauptZeit, HauptZeiten),
	\+HauptZeiten = [],
	sammelArt(Stoff, Operation, MinimaleHauptZeit),
	assertz(sammelbar(Stoff, Operation, MinimaleHauptZeit)),
	fail.
	
sammelbarVorfertigen :-
	abolish(fertigeLoesung/8),
	vorfertigen(Stoff),
	Operation = vorfertigen,
	\+suchAlgorithmus:baue(1, Stoff),
	findall(GesamtZahlSammlung, (suchAlgorithmus:loesung(Stoff, _, _, GesamtZahlSammlung, _, _, _, _), GesamtZahlSammlung > 0), GesamtZahlListe),
	min_member(MinimalSammelZahl, GesamtZahlListe),
	findall(ZeitSammlung, suchAlgorithmus:loesung(Stoff, _, _, MinimalSammelZahl, _, ZeitSammlung, _, _), ZeitSammlungListe),
	min_member(MinimalZeit, ZeitSammlungListe),
	suchAlgorithmus:loesung(Stoff, Vorgaenge, SammelSet, MinimalSammelZahl, GesamtWertSammlung, MinimalZeit, GesamtAufwand, Erloes),
	assertz(sammelbar(Stoff, Operation, MinimalZeit)),
	assertz(fertigeLoesung(Stoff, Vorgaenge, SammelSet, MinimalSammelZahl, GesamtWertSammlung, MinimalZeit, GesamtAufwand, Erloes)),
	fail.

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = minenLaserNutzen,
	spielStatus:spielStatus(minenLaser, true),
	minenLaserNutzen(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = verbessertenMinenLaserNutzen,
	spielStatus:spielStatus(verbesserterMinenLaser, true),
	verbessertenMinenLaserNutzen(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = terrainFormerNutzen,
	spielStatus:spielStatus(terrainFormer, true),
	terrainFormerNutzen(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = pfluecken,
	pfluecken(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = raumSchuerfen,
	spielStatus:spielStatus(raumSchiffIstFlott, true),
	raumSchuerfen(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = ernten,
	spielStatus:spielStatus(anbau, true),
	ernten(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = erkaempfen,
	spielStatus:spielStatus(kampfWille, true),
	erkaempfen(Stoff, HauptZeit).







