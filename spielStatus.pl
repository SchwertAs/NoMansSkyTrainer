:- module(spielStatus, [spielStatus/2]).

/* Spielkonditionen */
/* multiwerkzeug */
spielStatus(minenLaser, true).
spielStatus(minenLaser, true).
spielStatus(verbesserterMinenLaser, true).
spielStatus(terrainFormer, true).

/* Basis*/
spielStatus(torWarpVerf�gbar, true).
spielStatus(anbau, false).
spielStatus(tragbareRaffinerie, true).
spielStatus(mittlereRaffinerie, true).
spielStatus(grosseRaffinerie, true).

/* raumschiff */
spielStatus(raumSchiffIstFlott, true).
spielStatus(hyperAntriebGelb, true).
spielStatus(hyperAntriebRot, false).
spielStatus(hyperAntriebGruen, false).



spielStatus(autoIstFlott, true).

spielStatus(frachterVorhanden, true).
