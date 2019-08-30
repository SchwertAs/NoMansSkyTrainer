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

spielStatus(tierHaltung, true).

/* Spieler Präferenzen */
spielStatus(kampfWille, true).

/* ------------------------- Rezepte für Wertvolle Dinge ----------------------------- */
rezeptBekannt(saeure).
rezeptBekannt(schmierMittel).
rezeptBekannt(thermischesKondensat).
rezeptBekannt(tragbarerReaktor).
rezeptBekannt(instabilesGel).
rezeptBekannt(glas).
rezeptBekannt(polyFaser).
rezeptBekannt(angereicherterKohlenStoff).
rezeptBekannt(stickStoffSalz).
rezeptBekannt(aronium).
rezeptBekannt(quantumProzessor).
rezeptBekannt(kryogenKammer).
rezeptBekannt(fluessigSprengStoff).
rezeptBekannt(lebendesGlas).
rezeptBekannt(hitzeKondensator).
rezeptBekannt(schaltPlatte).
rezeptBekannt(organischerKatalysator).
rezeptBekannt(halbLeiter).
rezeptBekannt(heissesEis).
rezeptBekannt(strassenKoeterBronze).
rezeptBekannt(herox).
rezeptBekannt(lemmium).
rezeptBekannt(magnoGold).
rezeptBekannt(grantine).
rezeptBekannt(fusionsZuender).
rezeptBekannt(staseGeraet).
rezeptBekannt(fusionsBeschleuniger).
rezeptBekannt(supraLeiter).
rezeptBekannt(kryoPumpe).
rezeptBekannt(iridesit).
rezeptBekannt(geoDesit).
rezeptBekannt(kryoPumpe).

/* ------------------------- Rezepte für Komponenten und Geräte  --------------------- */
rezeptBekannt(lebensErhaltungsGel).
rezeptBekannt(diWasserStoffGelee).
rezeptBekannt(ionenAkku).
rezeptBekannt(warpZelle).
rezeptBekannt(kohlenStoffKristall).
rezeptBekannt(seltenesMetallElement).
rezeptBekannt(tetraKobalt).
rezeptBekannt(chlorGitter).
rezeptBekannt(instabilesNatrium).
rezeptBekannt(superOxidKristall).
rezeptBekannt(raumSchiffStartTreibStoff).
rezeptBekannt(fortschrittlicherIonenAkku).
rezeptBekannt(atlasPassV1).
rezeptBekannt(kobaltSpiegel).
rezeptBekannt(salzRefaktor).
rezeptBekannt(natriumDiode).
rezeptBekannt(sauerStoffFilter).
rezeptBekannt(sauerStoffKapsel).
rezeptBekannt(hydrothermaleTreibStoffZelle).
rezeptBekannt(instabilesPlasma).
rezeptBekannt(sternenSchildBatterie).
rezeptBekannt(atlasPassV2).
rezeptBekannt(warpHyperKern).
rezeptBekannt(atlasPassV3).

/* ------------------------- Sonstige Rezepte ---------------------------------------- */
rezeptBekannt(hermetischesSiegel).
rezeptBekannt(kohlenStoffNanoRohr).
rezeptBekannt(metallPlatten).
rezeptBekannt(projektilMunition).
rezeptBekannt(antiMaterie).
rezeptBekannt(antiMaterieGehaeuse).
rezeptBekannt(kreaturenKugeln).

/* ------------------------- Frachterrezepte ----------------------------------------- */
rezeptBekannt(fregattenTreibStoff50to).
rezeptBekannt(fregattenTreibStoff100to).
rezeptBekannt(fregattenTreibStoff200to).

/* ------------------------- Fregattenrezepte ---------------------------------------- */
rezeptBekannt(treibStoffOxidant).
rezeptBekannt(gedankenKontrollGeraet).
rezeptBekannt(holografischerAnalysator).
rezeptBekannt(sprengDrohnen).
rezeptBekannt(mineralKompressor).

