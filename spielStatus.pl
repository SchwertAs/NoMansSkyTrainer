:- module(spielStatus, [spielStatus/2]).

/* Spielkonditionen */
/* multiwerkzeug */
spielStatus(minenLaser, true).
spielStatus(verbesserterMinenLaser, true).
spielStatus(terrainFormer, true).

/* Basis*/
spielStatus(torWarpVerfügbar, false).
spielStatus(anbau, false).
spielStatus(tragbareRaffinerie, false).
spielStatus(mittlereRaffinerie, false).
spielStatus(grosseRaffinerie, true).

/* raumschiff */
spielStatus(raumSchiffIstFlott, true).
spielStatus(hyperAntriebGelb, true).
spielStatus(hyperAntriebRot, false).
spielStatus(hyperAntriebGruen, false).
spielStatus(hyperAntriebBlau, false).

spielStatus(autoIstFlott, true).

spielStatus(frachterVorhanden, true).

/* Spieler Präferenzen */
spielStatus(kampfWille, true).


