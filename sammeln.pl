:- module(sammeln, [sammelbar/3, nichtSammelbar/1, sammelAktion/1]).

/* Spieler Präferenzen */
kampfWille(true).

/* mögliche Sammleaktionen */
sammelAktion(minenLaserNutzen).
sammelAktion(verbessertenMinenLaserNutzen).
sammelAktion(pfluecken).
sammelAktion(terrainFormerNutzen).
sammelAktion(erkaempfen).
sammelAktion(ernten).
sammelAktion(raumSchuerfen).


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

sammelbar(Stoff, Operation, HauptZeit) :-
	Operation = terrainFormerNutzen,
	spielStatus:spielStatus(terrainFormer, true),
	terrainFormerNutzen(Stoff, HauptZeit).
	
sammelbar(Stoff, Operation, HauptZeit) :-  
	Operation = verbessertenMinenLaserNutzen,
	spielStatus:spielStatus(verbesserterMinenLaser, true),
	verbessertenMinenLaserNutzen(Stoff, HauptZeit).
	
sammelbar(Stoff, Operation, HauptZeit) :-  
	Operation = minenLaserNutzen,
	spielStatus:spielStatus(minenLaser, true),
	minenLaserNutzen(Stoff, HauptZeit).

sammelbar(Stoff, Operation, HauptZeit) :- 
	Operation = raumSchuerfen,
	spielStatus:spielStatus(raumSchiffIstFlott, true),
	raumSchuerfen(Stoff, HauptZeit).

sammelbar(Stoff, Operation, HauptZeit) :-  
	Operation = erkaempfen,
	kampfWille(true),
	erkaempfen(Stoff, HauptZeit).

sammelbar(Stoff, Operation, HauptZeit) :-  
	Operation = pfluecken,
	pfluecken(Stoff, HauptZeit).
		
sammelbar(Stoff, Operation, HauptZeit) :-  
	Operation = ernten,
	spielStatus:spielStatus(anbau, true),
	ernten(Stoff, HauptZeit).

nichtSammelbar(Stoff) :-
	reaktionsStoff(Stoff,_),
	\+terrainFormerNutzen(Stoff, _),
	\+verbessertenMinenLaserNutzen(Stoff, _), 
	\+minenLaserNutzen(Stoff, _), 
	\+raumSchuerfen(Stoff, _),
	\+erkaempfen(Stoff, _).
	
