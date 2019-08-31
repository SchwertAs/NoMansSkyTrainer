:- module(spielStatus, [spielStatus/2]).

/* Spielkonditionen */
/* multiwerkzeug */
spielStatus(minenLaser, true).
spielStatus(verbesserterMinenLaser, true).
spielStatus(terrainFormer, true).

/* Landwirtschaft */
spielStatus(anbau, false).
spielStatus(tierHaltung, true).

/* Basis*/
spielStatus(torWarpVerfügbar, false).
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
spielStatus(sphaereRufbar, true).

/* Spieler Präferenzen */
spielStatus(kampfWille, true).

/* ------------------------- Rezepte für Wertvolle Dinge ----------------------------- */
/* Rezeptstoff, Event, Questname */
/* herstellen */
questRezept(raumSchiffStartTreibStoff, vonAnfangAn, erwachen).
questRezept(warpZelle, vonAnfangAn, erwachen).
questRezept(ionenAkku, vonAnfangAn, erwachen).
questRezept(lebensErhaltungsGel, vonAnfangAn, erwachen).
questRezept(diWasserStoffGelee, vonAnfangAn, erwachen).
questRezept(metallPlatten, vonAnfangAn, erwachen).
questRezept(kohlenStoffNanoRohr, vonAnfangAn, erwachen).
questRezept(projektilMunition, vonAnfangAn, erwachen).
questRezept(kreaturenKugeln, vonAnfangAn, erwachen).

/* installieren Anzug */
questRezept(scanner, vonAnfangAn, erwachen).
questRezept(minenLaser, vonAnfangAn, erwachen).
questRezept(analyseVisier, vonAnfangAn, erwachen).
questRezept(blitzWerfer, vonAnfangAn, erwachen).

/* installieren Raumschiff */
questRezept(impulsAntrieb, vonAnfangAn, erwachen).
questRezept(startSchubDuese, vonAnfangAn, erwachen).
questRezept(raketenWerfer, vonAnfangAn, erwachen).
questRezept(deflektorSchild, vonAnfangAn, erwachen).
questRezept(photonenKanone, vonAnfangAn, erwachen).

/* installieren Fahrzeuge */
questRezept(fusionsAntrieb, vonAnfangAn, erwachen).
questRezept(humboldtAntrieb, vonAnfangAn, erwachen).


/* bauen */
questRezept(tragbareRaffinerie, vonAnfangAn, erwachen).
questRezept(tiefSeeKammer, vonAnfangAn, erwachen).
questRezept(flagge2, vonAnfangAn, erwachen).
questRezept(metallWand, vonAnfangAn, erwachen).

/* chronologisch */
questRezept(basisComputer, signalUntersuchen, erwachen).
questRezept(konstruktionsForschungsStation, basisDatenComputerAktualisieren, erwachen).
questRezept(terrainManipulator, signalUntersuchen, erwachen).
questRezept(floraBehaelterTubus, basisComputerBenutzen, erwachen).
questRezept(holzWand, basisComputerBenutzen, erwachen).
questRezept(holzTuerRahmen, basisComputerBenutzen, erwachen).
questRezept(holzBodenPlatte, basisComputerBenutzen, erwachen).
questRezept(holzDach, basisComputerBenutzen, erwachen).
questRezept(flagge2, basisComputerBenutzen, erwachen).
questRezept(lichtStehLampeSchirm, basisComputerBenutzen, erwachen).
questRezept(hyperAntrieb, dieEntschluesseltenKoordinatenErreichen, erwachen).
questRezept(antiMaterieGehaeuse, antimaterieFinden, erwachen).
questRezept(antiMaterie, demAnomalenSignalFolgen, erwachen).
questRezept(fortgeschrittenerMinenLaserA, notSignalOeffnen, alleinInmittenDerSterne).
questRezept(hermetischesSiegel, notSignalOeffnen, dieWeltRaumAnomalie).
questRezept(teleportEmpfaenger, fabrikWiederEinschalten, ersteFabrik).
questRezept(geoDesit, fabrikWiederEinschalten, zweiteFabrik).


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

