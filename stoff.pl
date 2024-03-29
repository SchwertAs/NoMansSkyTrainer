:- module(stoff, [stoff/3, doppelteInStoff/0]).
/* stoff(<stoffKlasse>, <name<, <GrundPreisInUnits>) */

/* =============================== Rohstoffe ============================ */
/* sammeln, raffinieren, kaufen, verkaufen */
stoff(rohStoff, aktiviertesCadmium, 450).
stoff(rohStoff, aktiviertesEmeril, 696).
stoff(rohStoff, aktiviertesIndium, 949).
stoff(rohStoff, aktiviertesKupfer, 245).
stoff(rohStoff, ammoniak, 62).
stoff(rohStoff, basalt, 62).
stoff(rohStoff, cadmium, 234).
stoff(rohStoff, chlor, 602).
stoff(rohStoff, deuterium, 34).
stoff(rohStoff, dioxit, 62).
stoff(rohStoff, diWasserStoff, 34).
stoff(rohStoff, emeril, 348).
stoff(rohStoff, ferritStaub, 14).
stoff(rohStoff, gold, 202).
stoff(rohStoff, hadalKern, 92625).
stoff(rohStoff, indium, 464).
stoff(rohStoff, ionisiertesKobalt, 401).
stoff(rohStoff, kobalt, 198).
stoff(rohStoff, kupfer, 121).
stoff(rohStoff, lebenderSchleim, 20).
stoff(rohStoff, magnetisiertesFerrit, 82).
stoff(rohStoff, natrium, 41).
stoff(rohStoff, natriumNitrat, 82).
stoff(rohStoff, paraffinium, 62).
stoff(rohStoff, phosphor, 62).
stoff(rohStoff, platin, 303).
stoff(rohStoff, pugneum, 138).
stoff(rohStoff, pyrit, 62).
stoff(rohStoff, radon, 20).
stoff(rohStoff, reinesFerrit, 28).
stoff(rohStoff, restSubstanz, 20).
stoff(rohStoff, sauerStoff, 34).
stoff(rohStoff, schwefelin, 20).
stoff(rohStoff, silber, 101).
stoff(rohStoff, silikatPulver, 2).
stoff(rohStoff, stickStoff, 20).
stoff(rohStoff, tritium, 6).
stoff(rohStoff, unkontrollierbarerSchimmel, 20).
stoff(rohStoff, uran, 248).
stoff(rohStoff, verrostetesMetall, 20).
stoff(rohStoff, zaeheFluessigkeiten, 20).
stoff(rohStoff, zytoPhosphat, 201).
stoff(rohStoff, tritiumHyperCluster, 3280).
stoff(rohStoff, geodeLand, 3280).
stoff(rohStoff, geodeHoehle, 3280).
stoff(rohStoff, kampfLaeuferGehirn, 35000).
stoff(rohStoff, lebendePerle, 4798).
stoff(rohStoff, goldKlumpen, 3280).
stoff(rohStoff, sturmKristall, 129150).
stoff(rohStoff, kristallSulfid, 7410).
stoff(rohStoff, kristallFragment, 3280).

stoff(rohStoff, beutelGift, 11685).
stoff(rohStoff, eiweissPerle, 9025).
stoff(rohStoff, gravitinoBall, 12445).
stoff(rohStoff, nipNipKnospen, 17776).

stoff(rohStoff, fluessigSonne, 16). /* sch�rfen mit SonnenStrahl */
stoff(rohStoff, hexit, 654). /* Belohnung Gildenauftr�ge */
stoff(rohStoff, lebendesWasser, 16). /* von Kind des Helios bekommen */
stoff(rohStoff, fragmentierteQualia, 16). /* mit Gem�tstrahl erjagen */
stoff(rohStoff, leuchtendesMineral, 3280). /* in schwebendem Kristall */

stoff(rohStoff, nanitHaufen, -1).

/* stoff(rohStoff, queckSilber, -1). */

stoff(verbrauch, navigationsDaten, 1000).
stoff(verbrauch, absprungKapselKoordinaten, 85000).
stoff(verbrauch, protokollEntschluesselungsCode, 1500).
stoff(verbrauch, geborgeneDaten, 50000).
stoff(verbrauch, fabrikUeberschreibungsEinheit, 50000).
stoff(verbrauch, geborgenesFregattenModul, 95000).
stoff(verbrauch, frachtSchott, 95000).
stoff(verbrauch, lagerErweiterung, 95000).
stoff(verbrauch, multiWerkzeugErweiterungsPlatz, 95000).
stoff(verbrauch, verteidigungsBeleg, 10000).
stoff(verbrauch, reparaturSet, 12000).
stoff(verbrauch, anomalieDetektor, 3280).
stoff(verbrauch, notfallUebertragungsEmpfaenger, 3280).

/* =============================== hergestellte Produkte ================ */
/* herstellen mit Fabrikrezept oder Questrezept, verkaufen */
stoff(komponente, lebensErhaltungsGel, 200).
stoff(komponente, diWasserStoffGelee, 200).
stoff(komponente, ionenAkku, 200).
stoff(komponente, mikroProzessor, 2000).
stoff(komponente, hermetischesSiegel, 800).
stoff(komponente, metallPlatten, 800).
stoff(komponente, solarSpiegel, 6150).
stoff(komponente, hydraulischeVerkabelung, 3600).
stoff(komponente, quantenComputer, 4200).
stoff(komponente, aminoKammer, 12300).
stoff(komponente, magnetischerResonator, 6150).
stoff(komponente, antiMaterie, 5233).
stoff(komponente, antiMaterieGehaeuse, 6500).
stoff(komponente, vierfachServo, 20000).
stoff(komponente, kabelBaum, 50000).
stoff(komponente, sauerStoffKapsel, 350).
stoff(komponente, raumSchiffStartTreibStoff, 450).

stoff(produkt, angereicherterKohlenStoff, 50000).
stoff(produkt, aronium, 25000).
stoff(produkt, chlorGitter, 6150).
stoff(produkt, fluessigSprengStoff, 800500).
stoff(produkt, fortschrittlicherIonenAkku, 500).
stoff(produkt, fregattenTreibStoff100to, 40000).
stoff(produkt, fregattenTreibStoff200to, 80000).
stoff(produkt, fregattenTreibStoff50to, 20000).
stoff(produkt, fusionsBeschleuniger, 7500000).
stoff(produkt, fusionsZuender, 15600000).
stoff(produkt, geoDesit, 150000).
stoff(produkt, glas, 13000).
stoff(produkt, grantine, 25000).
stoff(produkt, halbLeiter, 320000).
stoff(produkt, heissesEis, 320000).
stoff(produkt, herox, 25000).
stoff(produkt, hitzeKondensator, 50000).
stoff(produkt, hydrothermaleTreibStoffZelle, 7200).
stoff(produkt, instabilesGel, 50000).
stoff(produkt, instabilesNatrium, 12300).
stoff(produkt, instabilesPlasma, 5750).
stoff(produkt, iridesit, 150000).
stoff(produkt, kohlenStoffKristall, 3600).
stoff(produkt, kryogenKammer, 3800000).
stoff(produkt, kryoPumpe, 4500000).
stoff(produkt, lebendesGlas, 566000).
stoff(produkt, lemmium, 25000).
stoff(produkt, magnoGold, 25000).
stoff(produkt, organischerKatalysator, 320000).
stoff(produkt, polyFaser, 130000).
stoff(produkt, projektilMunition, 50).
stoff(produkt, quantumProzessor, 4400000).
stoff(produkt, saeure, 188000).
stoff(produkt, schaltPlatte, 916250).
stoff(produkt, schmierMittel, 110000).
stoff(produkt, seltenesMetallElement, 4200).
stoff(produkt, staseGeraet, 15600000).
stoff(produkt, sternenSchildBatterie, 500).
stoff(produkt, stickStoffSalz, 50000).
stoff(produkt, strassenKoeterBronze, 25000).
stoff(produkt, superOxidKristall, 5100).
stoff(produkt, supraLeiter, 1500000).
stoff(produkt, tetraKobalt, 6150).
stoff(produkt, thermischesKondensat, 50000).
stoff(produkt, tragbarerReaktor, 4200000).
stoff(produkt, warpZelle, 11733).
stoff(produkt, warpHyperKern, 46750).

stoff(produkt, herzDerSonne, 1000).
stoff(produkt, erinnerung, -1).
stoff(produkt, modifizierteQuanten, 1000).
stoff(produkt, novaeRegenerat, 1000).
stoff(produkt, zustandsPhase, 1000).
stoff(produkt, photischerJade, 1000).
stoff(produkt, endeDerDaemmerung, 1000).
stoff(produkt, dunkleMaterie, 1000).
stoff(produkt, nooSphaerischKugel, 1000).
stoff(produkt, umhuellterSchatten, 1000).
stoff(produkt, gefangeneNanode, 1000).
stoff(produkt, seelenEngine, 1000).
stoff(produkt, sternenSamen, 1000).

stoff(produkt, gedankenBogen, 1000).
stoff(produkt, pulsierenderKern, 1616).
stoff(produkt, bewusstseinsBruecke, 1616).
stoff(produkt, unmoeglicheMembran, 1616).
stoff(produkt, glasSamen, 1616).

stoff(biomechanischesKonstrukt, singularitaetsKern, 1616).
stoff(biomechanischesKonstrukt, verhaertetesGehaeuse, 1616).
stoff(biomechanischesKonstrukt, ausgewachsenerHerzKnotenPunkt, 1616).
stoff(biomechanischesKonstrukt, ausgewachsenerNervenStamm, 1616).
stoff(biomechanischesKonstrukt, seelenKammer, 1616).

stoff(pass, atlasPassV1, 0).
stoff(pass, atlasPassV2, 0).
stoff(pass, atlasPassV3, 0).
/* =============================== Ausruestung ========================== */
/* ------------------------------- Anzugmodule -------------------------- */
stoff(modul, belueftungsMembranB, 0).
stoff(modul, bewegungsModulA, 0).
stoff(modul, bewegungsModulB, 0).
stoff(modul, bewegungsModulC, 0).
stoff(modul, bewegungsModulS, 0).
stoff(modul, effizienteWasserDuesenA, 0).
stoff(modul, einfacherUeberSetzerB, 0).
stoff(modul, gefahrenSchutz, 0).
stoff(modul, gefahrGutSchutzHandschuh, 0).
stoff(modul, giftSchutzModulA, 0).
stoff(modul, giftSchutzModulB, 0).
stoff(modul, giftSchutzModulC, 0).
stoff(modul, giftSchutzModulS, 0).
stoff(modul, jetPack, 0).
stoff(modul, kuehlMittelNetzwerkC, 0).
stoff(modul, lebensErhaltung, 0).
stoff(modul, lebensErhaltungsModulA, 0).
stoff(modul, lebensErhaltungsModulB, 0).
stoff(modul, lebensErhaltungsModulC, 0).
stoff(modul, lebensErhaltungsModulS, 0).
stoff(modul, neuralStimulatorB, 0).
stoff(modul, perfektionierterUebersetzerS, 0).
stoff(modul, raketenStiefelA, 0).
stoff(modul, sauerStoffUmleiterA, 0).
stoff(modul, sauerStoffWiederVerwerterC, 0).
stoff(modul, schildModulA, 0).
stoff(modul, schildModulB, 0).
stoff(modul, schildModulC, 0).
stoff(modul, schildModulS, 0).
stoff(modul, schildGitterB, 0).
stoff(modul, strahlungsDeflektorC, 0).
stoff(modul, strahlungsSchutzModulA, 0).
stoff(modul, strahlungsSchutzModulB, 0).
stoff(modul, strahlungsSchutzModulC, 0).
stoff(modul, strahlungsSchutzModulS, 0).
stoff(modul, toxinDaempferC, 0).
stoff(modul, verbesserterUebersetzerA, 0).
stoff(modul, waermeSchichtC, 0).
stoff(modul, waermeSchutzModulA, 0).
stoff(modul, waermeSchutzModulB, 0).
stoff(modul, waermeSchutzModulC, 0).
stoff(modul, waermeSchutzModulS, 0).
stoff(modul, waermeSchutzModulKaelteA, 0).
stoff(modul, waermeSchutzModulKaelteB, 0).
stoff(modul, waermeSchutzModulKaelteC, 0).
stoff(modul, waermeSchutzModulKaelteS, 0).
stoff(modul, unterWasserSchutzModulA, 0).
stoff(modul, unterWasserSchutzModulB, 0).
stoff(modul, unterWasserSchutzModulC, 0).
stoff(modul, unterWasserSchutzModulS, 0).
stoff(modul, persoenlicheRaffinerie, 0).
stoff(modul, luftSchubAntriebS, 0).

/* ------------------------------- Raumschiffmodule --------------------- */
stoff(modul, ablativePanzerungC, 0).
stoff(modul, cadmiumAntriebB, 0).
stoff(modul, deflektorSchild, 0).
stoff(modul, dysonPumpeB, 0).
stoff(modul, effizienteDuesenB, 0).
stoff(modul, emerilAntriebA, 0).
stoff(modul, fourierBegrenzerB, 0).
stoff(modul, fragmentSuperAufladerB, 0).
stoff(modul, grosseRaketenRohreB, 0).
stoff(modul, hyperAntrieb, 0).
stoff(modul, hyperAntriebModulC, 0).
stoff(modul, impulsAntrieb, 0).
stoff(modul, impulsAntriebModulC, 0).
stoff(modul, impulsAntriebModulS, 0).
stoff(modul, infraMesserBeschleuniger, 0).
stoff(modul, infraMesserModulC, 0).
stoff(modul, infraMesserModulS, 0).
stoff(modul, indiumAntriebS, 0).
stoff(modul, konfliktScanner, 0).
stoff(modul, nichtlineareOptikB, 0).
stoff(modul, nichtlineareOptikC, 0).
stoff(modul, phasenStrahler, 0).
stoff(modul, phasenStrahlerModulC, 0).
stoff(modul, phasenStrahlerModulS, 0).
stoff(modul, photonenKanone, 0).
stoff(modul, photonenKanonenModulC, 0).
stoff(modul, photonenKanonenModulB, 0).
stoff(modul, photonenKanonenModulS, 0).
stoff(modul, positronenWerfer, 0).
stoff(modul, positronModulB, 0).
stoff(modul, positronModulC, 0).
stoff(modul, positronModulS, 0).
stoff(modul, raketenWerfer, 0).
stoff(modul, raumSchiffSchildModulB, 0).
stoff(modul, raumSchiffSchildModulC, 0).
stoff(modul, startSchubDuese, 0).
stoff(modul, startSystemLadeGeraetS, 0).
stoff(modul, teleportEmpfaenger, 0).
stoff(modul, wirtschaftsScanner, 0).
stoff(modul, zyklotronBalliste, 0).
stoff(modul, zyklotronModulB, 0).
stoff(modul, zyklotronModulC, 0).
stoff(modul, zyklotronModulS, 0).
stoff(modul, instabilitaetsAntriebA, 0).
stoff(modul, unterLichtVerstaerkerS, 0).
stoff(modul, notFallWarpEinheitA, 0).
stoff(modul, poloFigur, 0).
stoff(modul, nadaFigur, 0).
stoff(modul, atlasFigur, 0).
stoff(modul, artemisFigur, 0).
stoff(modul, apolloFigur, 0).
stoff(modul, nullFigur, 0).
stoff(modul, cadmiumRaumschiffSpur, 0).
stoff(modul, emerilRaumschiffSpur, 0).
stoff(modul, goldeneRaumschiffSpur, 0).


/* ------------------------------- Frachtermodule ----------------------- */
stoff(modul, warpKernResonator, 0).
stoff(modul, verstraerkterWarpSchildC, 0).
stoff(modul, chromatischerWarpSchildB, 0).
stoff(modul, temporalerWarpComputerA, 0).
stoff(modul, plasmaWarpInjektorB, 0).
stoff(modul, realitaetsEntwirrer, 0).
stoff(modul, materieStrahl, 0).

/* ------------------------------- Fregatten-Module ------------------ */
stoff(modul, gedankenKontrollGeraet, 0).
stoff(modul, holografischerAnalysator, 0).
stoff(modul, mineralKompressor, 0).
stoff(modul, sprengDrohnen, 0).
stoff(modul, treibStoffOxidant, 0).

/* ------------------------------- Multiwerkzeugmodule ------------------ */
stoff(modul, analyseVisier, 0).
stoff(modul, bergBauStrahlModulC, 0).
stoff(modul, blitzWerfer, 0).
stoff(modul, blitzWerferModulC, 0).
stoff(modul, blitzWerferModulA, 0).
stoff(modul, blitzWerferModulS, 0).
stoff(modul, eigenesKraftFeld, 0).
stoff(modul, fortgeschrittenerMinenLaserA, 0).
stoff(modul, geologieKanone, 0).
stoff(modul, geologieKanonenModulC, 0).
stoff(modul, geologieKanonenModulB, 0).
stoff(modul, geologieKanonenModulS, 0).
stoff(modul, geschossSchmiererC, 0).
stoff(modul, glutSpeer, 0).
stoff(modul, glutSpeerModulC, 0).
stoff(modul, glutSpeerModulA, 0).
stoff(modul, glutSpeerModulS, 0).
stoff(modul, impulsWerfer, 0).
stoff(modul, impulsWerferModulC, 0).
stoff(modul, impulsWerferModulB, 0).
stoff(modul, impulsWerferModulA, 0).
stoff(modul, kampfVisier, 0).
stoff(modul, laufIonisatorC, 0).
stoff(modul, masseBeschleunigerC, 0).
stoff(modul, minenLaser, 0).
stoff(modul, minenLaserModulC, 0).
stoff(modul, minenLaserModulS, 0).
stoff(modul, optischerBohrerS, 0).
stoff(modul, plasmaWerfer, 0).
stoff(modul, plasmaWerferModulC, 0).
stoff(modul, plasmaWerferModulB, 0).
stoff(modul, plasmaWerferModulS, 0).
stoff(modul, scanner, 0).
stoff(modul, scannerModulC, 0).
stoff(modul, scannerModulA, 0).
stoff(modul, scannerModulS, 0).
stoff(modul, streuBlaster, 0).
stoff(modul, streuBlasterModulC, 0).
stoff(modul, streuBlasterModulB, 0).
stoff(modul, terrainManipulator, 0).
stoff(modul, untersuchungsGeraetA, 0).
stoff(modul, verstaerkteKartuschenC, 0).
stoff(modul, wellenFormWiederVerwerterB, 0).
stoff(modul, solarStrahl, 0).
stoff(modul, gemuetsStrahl, 0).

stoff(modul, qResonator, 0).
stoff(modul, impulsWerferQuerschlaegerModul, 0).

/* ------------------------------- Exo-Fahrzeugmodule ------------------- */
/* immer vorhanden */
stoff(modul, driftAufhaengungA, 0).
stoff(modul, haftungsVerstaerkungsAufhaengungA, 0).
stoff(modul, rutschAufhaengungA, 0).

/* erforschbar */
stoff(modul, fusionsAntrieb, 0).
stoff(modul, humboldtAntrieb, 0).
stoff(modul, megaWattHeizung, 0).
stoff(modul, luftFilterEinheit, 0).
stoff(modul, neutronenAbschirmung, 0).
stoff(modul, thermalPuffer, 0).
stoff(modul, exoFahrzeugSignalBooster, 0).
stoff(modul, exoFahrzeugBeschleunigungsModul, 0).
stoff(modul, exoFahrzeugMinenLaser, 0).
stoff(modul, daidalosAntrieb, 0).
stoff(modul, hochleistungsSonar, 0).
stoff(modul, fortgeschrittenerSignalBoosterB, 0).
stoff(modul, ikarusTreibStoffSystem, 0).
stoff(modul, exoFahrzeugMinenLaserUpgradeSigmaA, 0).
stoff(modul, exoFahrzeugBordKanone, 0).
stoff(modul, umweltKontrollEinheit, 0).
stoff(modul, minotaurusRadarAnlage, 0).
stoff(modul, minotaurusLaser, 0).
stoff(modul, ariadnesFlamme, 0).
stoff(modul, minotaurusPraezisionsLaser, 0).
stoff(modul, minotaurusKanone, 0).
stoff(modul, minotaurusBohrer, 0).
stoff(modul, selbstSchmierendeServos, 0).

/* Kaufmodule */
stoff(modul, exoFahrzeugAntriebModulC, 0).
stoff(modul, exoFahrzeugAntriebModulS, 0).
stoff(modul, exoFahrzeugBoostModulB, 0).
stoff(modul, exoFahrzeugBoostModulC, 0).
stoff(modul, exoFahrzeugBoostModulS, 0).
stoff(modul, exoFahrzeugKanonenModulC, 0).
stoff(modul, exoFahrzeugKanonenModulB, 0).
stoff(modul, exoFahrzeugKanonenModulS, 0).
stoff(modul, exoFahrzeugLaserModulC, 0).
stoff(modul, exoFahrzeugLaserModulB, 0).
stoff(modul, exoFahrzeugLaserModulS, 0).
stoff(modul, exoFahrzeugSignalBoosterUpgradeTauA, 0).
stoff(modul, humboldtAntriebsModulC, 0).
stoff(modul, humboldtAntriebsModulS, 0).
stoff(modul, nautilonKanone, 0).
stoff(modul, nautilonKanonenModulA, 0).
stoff(modul, nautilonKanonenModulC, 0).
stoff(modul, osmotischerGeneratorC, 0).
stoff(modul, tethysStrahl, 0).

/* =============================== Baustoffe ============================ 
Technologie
	Allgemein
	Tragbar
	Lager
	Spezialisiert
		Exo Fahrzeug
		Terminals
		Landwirtschaft
	Strom&Industrie
		Industrie
		Energie
			Schalter
		Technologie
Strukturen
Dekoration
*/

/* ------------------------------- Technologie Allgemein ---------------- */
stoff(basisBauEndStoff, basisTelePorterModul, 0).
stoff(basisBauEndStoff, basisBergungsKapsel, 0).
stoff(basisBauEndStoff, terminalDesGalaktischenMarktes, 0).
stoff(basisBauEndStoff, gesundheitsStation, 0).
stoff(basisBauEndStoff, gefahrenSchutzEinheit, 0).
stoff(basisBauEndStoff, mittlereRaffinerie, 0).
stoff(basisBauEndStoff, grosseRaffinerie, 0).
stoff(basisBauEndStoff, aussehenModifikator, 0).
stoff(basisBauEndStoff, antiMaterieReaktor, 0).
stoff(basisBauEndStoff, sauerStoffVerarbeiter, 0).
stoff(basisBauEndStoff, nachrichtenModul, 0).
stoff(basisBauEndStoff, landeFeld, 0).

/* ------------------------------- Tragbare Technologie ----------------- */
stoff(basisBauEndStoff, tragbareRaffinerie, 0).
stoff(basisBauEndStoff, naehrStoffProzessor, 0).
stoff(basisBauEndStoff, basisComputer, 0).
stoff(basisBauEndStoff, konstruktionsForschungsStation, 0).
stoff(basisBauEndStoff, autonomeBergBauEinheit, 0).
stoff(basisBauEndStoff, atmosphaerenVerarbeitungsAnlage, 0).
stoff(basisBauEndStoff, signalBooster, 0).
stoff(basisBauEndStoff, speicherSignal, 0).
stoff(basisBauEndStoff, speicherPunkt, 0).
stoff(basisBauEndStoff, kommunikationsStation, 0).

/* ------------------------------- Lager --- ---------------------------- */
stoff(basisBauEndStoff, lagerBehaelter0, 0).
stoff(basisBauEndStoff, lagerBehaelter1, 0).
stoff(basisBauEndStoff, lagerBehaelter2, 0).
stoff(basisBauEndStoff, lagerBehaelter3, 0).
stoff(basisBauEndStoff, lagerBehaelter4, 0).
stoff(basisBauEndStoff, lagerBehaelter5, 0).
stoff(basisBauEndStoff, lagerBehaelter6, 0).
stoff(basisBauEndStoff, lagerBehaelter7, 0).
stoff(basisBauEndStoff, lagerBehaelter8, 0).
stoff(basisBauEndStoff, lagerBehaelter9, 0).
stoff(basisBauEndStoff, verschlosseneKiste, 0).
stoff(basisBauEndStoff, kleineKiste, 0).
stoff(basisBauEndStoff, fassFoermigerFabrikator, 0).
stoff(basisBauEndStoff, kistenFoermigerFabrikator, 0).

/* ------------------------------- Exo-Fahrzeug-Stationen --------------- */
stoff(basisBauEndStoff, roamerGeoBucht, 0).
stoff(basisBauEndStoff, kolossGeoBucht, 0).
stoff(basisBauEndStoff, minotaurusGeoBucht, 0).
stoff(basisBauEndStoff, rennInitiator, 0).
stoff(basisBauEndStoff, rennHindernis, 0).
stoff(basisBauEndStoff, rennKraftVerstaerker, 0).
stoff(basisBauEndStoff, nautilonKammer, 0).
stoff(basisBauEndStoff, exoFahrzeugRufStation, 0).
stoff(basisBauEndStoff, pilgerGeoBucht, 0).
stoff(basisBauEndStoff, nomadenGeoBucht, 0).

/* ------------------------------- Terminals ---------------------------- */
stoff(basisBauEndStoff, konstruktionsTerminal, 0).
stoff(basisBauEndStoff, exoFahrzeugTerminal, 0).
stoff(basisBauEndStoff, waffenTerminal, 0).
stoff(basisBauEndStoff, wissenschaftsTerminal, 0).
stoff(basisBauEndStoff, landwirtschaftsTerminal, 0).

/* ------------------------------- Landwirtschaftsmodule ---------------- */
stoff(basisBauEndStoff, hydroKulturTrog, 0).
stoff(basisBauEndStoff, grosserHydroKulturTrog, 0).
stoff(basisBauEndStoff, gammaGras, 0).
stoff(basisBauEndStoff, pilzGeflecht, 0).
stoff(basisBauEndStoff, frostWurz, 0).
stoff(basisBauEndStoff, giftIgel, 0).
stoff(basisBauEndStoff, sonnenRebe, 0).
stoff(basisBauEndStoff, magenKrampfBlume, 0).
stoff(basisBauEndStoff, gravitinoWirt, 0).
stoff(basisBauEndStoff, morditWurzel, 0).
stoff(basisBauEndStoff, echinoKaktus, 0).
stoff(basisBauEndStoff, sternenDorn, 0).
stoff(basisBauEndStoff, eiweissPerlenKugel, 0).
stoff(basisBauEndStoff, nipNip, 0).
stoff(basisBauEndStoff, stehenderPflanzenBehaelter, 0).
stoff(basisBauEndStoff, automatischerFuetterer, 0).
stoff(basisBauEndStoff, nutzTierEinheit, 0).
stoff(basisBauEndStoff, floraBehaelterHochBeet, 0).
stoff(basisBauEndStoff, floraBehaelterKasten, 0).
stoff(basisBauEndStoff, floraBehaelterTubus, 0).
stoff(basisBauEndStoff, topfPflanze, 0).

/* ------------------------------- Industriemodule ---------------------- */
stoff(basisBauEndStoff, mineralienExtraktor, 0).
stoff(basisBauEndStoff, gasExtraktor, 0).
stoff(basisBauEndStoff, versorgungsDepot, 0).
stoff(basisBauEndStoff, versorgungsRohr, 0).

/* ------------------------------- Energiemodule ------------------------ */
stoff(basisBauEndStoff, solarModul, 0).
stoff(basisBauEndStoff, bioTreibStoffReaktor, 0).
stoff(basisBauEndStoff, elektroMagnetischerGenerator, 0).
stoff(basisBauEndStoff, batterie, 0).
stoff(basisBauEndStoff, elektrischeTarneinheit, 0).

/* ------------------------------- Schalter ----------------------------- */
stoff(basisBauEndStoff, energieUmkehrer, 0).
stoff(basisBauEndStoff, automatischerSchalter, 0).
stoff(basisBauEndStoff, wandSchalter, 0).
stoff(basisBauEndStoff, annaeherungsSchalter, 0).
stoff(basisBauEndStoff, bodenSchalter, 0).
stoff(basisBauEndStoff, schalter, 0).

/* ------------------------------- Technologie module ------------------------ */
stoff(basisBauEndStoff, kurzStreckenTelePorter, 0).
stoff(basisBauEndStoff, kugelErzeuger, 0).
stoff(basisBauEndStoff, byteBeatGeraet, 0).
stoff(basisBauEndStoff, byteBeatSchaltung, 0).
stoff(basisBauEndStoff, geraeuschBox, 0).


/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Dekoration %%%%%%%%%%%%%%%%%%%%%%%%%%% */
/* =====================  Dekoration Motive  ======================================== */
stoff(basisBauEndStoff, motivStilisiertesR, 0).
stoff(basisBauEndStoff, motivBuegel, 0).
stoff(basisBauEndStoff, motivGrabStein, 0).
stoff(basisBauEndStoff, motivNo0, 0).
stoff(basisBauEndStoff, motivNo1, 0).
stoff(basisBauEndStoff, motivNo2, 0).
stoff(basisBauEndStoff, motivNo3, 0).
stoff(basisBauEndStoff, motivNo5, 0).
stoff(basisBauEndStoff, motivNo7, 0).
stoff(basisBauEndStoff, motivNo4, 0).
stoff(basisBauEndStoff, motivNo6, 0).
stoff(basisBauEndStoff, motivNo8, 0).
stoff(basisBauEndStoff, motivNo9, 0).
stoff(basisBauEndStoff, anomalieMotiv, 0).
stoff(basisBauEndStoff, galaktischerHubMotiv, 0).
stoff(basisBauEndStoff, zustimmendeHandbewegungMotiv, 0).
stoff(basisBauEndStoff, nadaMotiv, 0).
stoff(basisBauEndStoff, poloMotiv, 0).
stoff(basisBauEndStoff, apolloMotiv, 0).
stoff(basisBauEndStoff, artemisMotiv, 0).
stoff(basisBauEndStoff, nullMotiv, 0).
stoff(basisBauEndStoff, motivSchildErstochenerVogel, 0).
stoff(basisBauEndStoff, motivSchildGr�nerMann, 0).
stoff(basisBauEndStoff, motivSchildKorvax, 0).
stoff(basisBauEndStoff, motivFroschSack, 0).
stoff(basisBauEndStoff, motivLaemmchen, 0).
stoff(basisBauEndStoff, motivRundPipette, 0).
stoff(basisBauEndStoff, motivFaltungDuennDick, 0).
stoff(basisBauEndStoff, motivZiegelSteine, 0).
stoff(basisBauEndStoff, motivRadioAktivGrau, 0).

/* =====================  Dekoration Lichter ================================================ */
stoff(basisBauEndStoff, lichtHandLampe, 0).
stoff(basisBauEndStoff, laborLampe, 0).
stoff(basisBauEndStoff, leuchtBoden, 0).
stoff(basisBauEndStoff, lichtBox, 0).
stoff(basisBauEndStoff, blaueLeuchte, 0).
stoff(basisBauEndStoff, pinkeLeuchte, 0).
stoff(basisBauEndStoff, gelbeLeuchte, 0).
stoff(basisBauEndStoff, grueneLeuchte, 0).
stoff(basisBauEndStoff, roteLeuchte, 0).
stoff(basisBauEndStoff, weisseLeuchte, 0).
stoff(basisBauEndStoff, deckenLeuchte, 0).
stoff(basisBauEndStoff, lichtStehLampeEckig, 0).
stoff(basisBauEndStoff, lichtStehLampeRund, 0).
stoff(basisBauEndStoff, lichtStehLampeSchirm, 0).

/* =====================  Dekoration Blattwerk  ======================================== */
stoff(basisBauEndStoff, fruechteBaum, 0).
stoff(basisBauEndStoff, spindelBaum, 0).
stoff(basisBauEndStoff, immerGruenBaum, 0).
stoff(basisBauEndStoff, rankenFuesser, 0).
stoff(basisBauEndStoff, fleischFressenderStrauch, 0).
stoff(basisBauEndStoff, zwergPalme, 0).
stoff(basisBauEndStoff, kurioserMais, 0).
stoff(basisBauEndStoff, segelPalme, 0).
stoff(basisBauEndStoff, kugelBaum, 0).
stoff(basisBauEndStoff, steinGarten, 0).
stoff(basisBauEndStoff, windenderStrauch, 0).
stoff(basisBauEndStoff, regenSchirmBaum, 0).
stoff(basisBauEndStoff, umschlingenderBaum, 0).
stoff(basisBauEndStoff, blasenBildenderPilz, 0).
stoff(basisBauEndStoff, wachsameWoelbung, 0).
stoff(basisBauEndStoff, tentakelSpitze, 0).
stoff(basisBauEndStoff, robusterStrauch, 0).
stoff(basisBauEndStoff, gefrorenerPflanzenBehaelter, 0).
stoff(basisBauEndStoff, uraltesNadelGehoelz, 0).
stoff(basisBauEndStoff, meeresGestein, 0).
stoff(basisBauEndStoff, mineralBogen, 0).
stoff(basisBauEndStoff, edelSteinFels, 0).

/* =====================  Dekoration Innen  ======================================== */
stoff(basisBauEndStoff, kanisterRegal, 0).
stoff(basisBauEndStoff, eckSofa, 0).
stoff(basisBauEndStoff, ergonomischesSofa, 0).
stoff(basisBauEndStoff, sofa, 0).
stoff(basisBauEndStoff, einfacherSchreibTisch, 0).
stoff(basisBauEndStoff, leichterTisch, 0).
stoff(basisBauEndStoff, lagerModulDeko, 0).
stoff(basisBauEndStoff, flachesModul, 0).
stoff(basisBauEndStoff, regalModul, 0).
stoff(basisBauEndStoff, seitenModul, 0).
stoff(basisBauEndStoff, hoherSchrank, 0).
stoff(basisBauEndStoff, roboterBegleiter, 0).
stoff(basisBauEndStoff, expansionsWuerfelGeraet, 0).
stoff(basisBauEndStoff, kugelHologrammGeraet, 0).
stoff(basisBauEndStoff, taschenRealitaetsGenerator, 0).
stoff(basisBauEndStoff, gewoelbterTisch, 0).
stoff(basisBauEndStoff, waffenRegal, 0).
stoff(basisBauEndStoff, grosseMonitorStation, 0).
stoff(basisBauEndStoff, monitorStation, 0).
stoff(basisBauEndStoff, deckenPaneel, 0).
stoff(basisBauEndStoff, bodenMatte, 0).
stoff(basisBauEndStoff, server, 0).
stoff(basisBauEndStoff, schubLadenSchrank, 0).
stoff(basisBauEndStoff, wandFlagge1, 0).
stoff(basisBauEndStoff, wandFlagge2, 0).
stoff(basisBauEndStoff, wandFlagge3, 0).
stoff(basisBauEndStoff, schalenSitzStuhl, 0).
stoff(basisBauEndStoff, stuhlEckig, 0).
stoff(basisBauEndStoff, stuhlFriseur, 0).
stoff(basisBauEndStoff, tisch, 0).
stoff(basisBauEndStoff, tischSechsEckig, 0).
stoff(basisBauEndStoff, eckSchreibTisch, 0).
stoff(basisBauEndStoff, techBedienFeld, 0).
stoff(basisBauEndStoff, wandBildSchirm, 0).
stoff(basisBauEndStoff, wandVentilator, 0).
stoff(basisBauEndStoff, wandEinheit, 0).
stoff(basisBauEndStoff, bett, 0).
stoff(basisBauEndStoff, arbeitsPlatte, 0).
stoff(basisBauEndStoff, gruenerWandBildSchirm, 0).
stoff(basisBauEndStoff, oszilloskop, 0).
stoff(basisBauEndStoff, achtEckSchrank, 0).
stoff(basisBauEndStoff, roboterArm, 0).
stoff(basisBauEndStoff, schliessFach, 0).
stoff(basisBauEndStoff, crewSchliessFach, 0).
stoff(basisBauEndStoff, notFallHeizung, 0).
stoff(basisBauEndStoff, notFallBeleuchtung, 0).
stoff(basisBauEndStoff, lagerEinheit, 0).
stoff(basisBauEndStoff, strapazierfaehigesMoebelStueck, 0).
stoff(basisBauEndStoff, pflanzenKanister, 0).
stoff(basisBauEndStoff, probenBehaelter, 0).
stoff(basisBauEndStoff, grosseLagerEinheit, 0).
stoff(basisBauEndStoff, bergungsKiste, 0).
stoff(basisBauEndStoff, gesicherterAktenKoffer, 0).
stoff(basisBauEndStoff, crewTruhe, 0).
stoff(basisBauEndStoff, industrieWerkBank, 0).
stoff(basisBauEndStoff, industriePalette, 0).
stoff(basisBauEndStoff, industrieFass, 0).

/* =====================  Dekoration Verzierungen ======================================== */
stoff(basisBauEndStoff, krauseKoralle, 0).
stoff(basisBauEndStoff, wasserKristall, 0).
stoff(basisBauEndStoff, kronLeuchterBluete, 0).
stoff(basisBauEndStoff, kleinesAquarium, 0).
stoff(basisBauEndStoff, terrarium, 0). 
stoff(basisBauEndStoff, rohr, 0).
stoff(basisBauEndStoff, pyramide, 0).
stoff(basisBauEndStoff, grosserKeil, 0).
stoff(basisBauEndStoff, kleinerKeil, 0).
stoff(basisBauEndStoff, gebogenesRohr, 0).
stoff(basisBauEndStoff, flagge1, 0).
stoff(basisBauEndStoff, flagge2, 0).
stoff(basisBauEndStoff, flagge3, 0).
stoff(basisBauEndStoff, flagge4, 0).
stoff(basisBauEndStoff, kugel, 0).
stoff(basisBauEndStoff, wuerfel, 0).
stoff(basisBauEndStoff, zylinder, 0).
stoff(basisBauEndStoff, pflasterungPodest, 0).
stoff(basisBauEndStoff, bronzeneKreaturStatue, 0).
stoff(basisBauEndStoff, silberneKreaturStatue, 0).
stoff(basisBauEndStoff, goldeneKreaturStatue, 0).
stoff(basisBauEndStoff, bronzeneDiploStatue, 0).
stoff(basisBauEndStoff, silberneDiploStatue, 0).
stoff(basisBauEndStoff, goldeneDiploStatue, 0).
stoff(basisBauEndStoff, bronzeneGekStatue, 0).
stoff(basisBauEndStoff, silberneGekStatue, 0).
stoff(basisBauEndStoff, goldeneGekStatue, 0).
stoff(basisBauEndStoff, bronzeneJaegerStatue, 0).
stoff(basisBauEndStoff, silberneJaegerStatue, 0).
stoff(basisBauEndStoff, goldeneJaegerStatue, 0).
stoff(basisBauEndStoff, bronzeneKampfLaeuferStatue, 0).
stoff(basisBauEndStoff, silberneKampfLaeuferStatue, 0).
stoff(basisBauEndStoff, goldeneKampfLaeuferStatue, 0).
stoff(basisBauEndStoff, bronzeneAtlasStatue, 0).
stoff(basisBauEndStoff, silberneAtlasStatue, 0).
stoff(basisBauEndStoff, goldeneAtlasStatue, 0).
stoff(basisBauEndStoff, bronzeneAstronautenStatue, 0).
stoff(basisBauEndStoff, silberneAstronautenStatue, 0).
stoff(basisBauEndStoff, goldeneAstronautenStatue, 0).


/* nicht mehr bekannte Dekos */
stoff(basisBauEndStoff, lagerModul, 0).
stoff(basisBauEndStoff, motivHelloGames, 0).



/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Strukturen %%%%%%%%%%%%%%%%%%%%%%%%%%% */
/* =============================== Einfache Komponenten ================= */
/* ------------------------------- Holzkomponenten ---------------------- */
stoff(basisBauEndStoff, holzWand, 0).
stoff(basisBauEndStoff, holzBodenPlatte, 0).
stoff(basisBauEndStoff, duenneHolzWand, 0).
stoff(basisBauEndStoff, holzTuerRahmen, 0).
stoff(basisBauEndStoff, holzDach, 0).
stoff(basisBauEndStoff, glasPlatteMitHolzRahmen, 0).
stoff(basisBauEndStoff, holzRampe, 0).
stoff(basisBauEndStoff, kleineHolzPlatte, 0).
stoff(basisBauEndStoff, holzDreieck, 0).
stoff(basisBauEndStoff, schraegeHolzPlatte, 0).
stoff(basisBauEndStoff, kleineHolzWand, 0).
stoff(basisBauEndStoff, holzFenster, 0).
stoff(basisBauEndStoff, holzTuer, 0).
stoff(basisBauEndStoff, elektrischeHolzTuer, 0).
stoff(basisBauEndStoff, holzDachPlatte, 0).
stoff(basisBauEndStoff, holzDachEckStueck, 0).
stoff(basisBauEndStoff, holzBogen, 0).
stoff(basisBauEndStoff, halbeHolzRampe, 0).
stoff(basisBauEndStoff, kleinesHolzDreieck, 0).
stoff(basisBauEndStoff, kurzeHolzWand, 0).
stoff(basisBauEndStoff, holzFassade, 0).
stoff(basisBauEndStoff, kleineHolzTuer, 0).
stoff(basisBauEndStoff, dachInnenEckteilAusHolz, 0).
stoff(basisBauEndStoff, halberHolzBogen, 0).

/* ------------------------------- Metallkomponenten -------------------- */
stoff(basisBauEndStoff, metallWand, 0).
stoff(basisBauEndStoff, metallBodenPlatte, 0).
stoff(basisBauEndStoff, duenneMetallWand, 0).
stoff(basisBauEndStoff, metallTuerRahmen, 0).
stoff(basisBauEndStoff, metallDach, 0).
stoff(basisBauEndStoff, glasPlatteMitMetallRahmen, 0).
stoff(basisBauEndStoff, metallRampe, 0).
stoff(basisBauEndStoff, kleineMetallPlatte, 0).
stoff(basisBauEndStoff, metallDreieck, 0).
stoff(basisBauEndStoff, schraegeMetallPlatte, 0).
stoff(basisBauEndStoff, kleineMetallWand, 0).
stoff(basisBauEndStoff, metallFenster, 0).
stoff(basisBauEndStoff, metallTuer, 0).
stoff(basisBauEndStoff, elektrischeMetallTuer, 0).
stoff(basisBauEndStoff, metallDachPlatte, 0).
stoff(basisBauEndStoff, metallDachEckStueck, 0).
stoff(basisBauEndStoff, metallBogen, 0).
stoff(basisBauEndStoff, halbeMetallRampe, 0).
stoff(basisBauEndStoff, kleinesMetallDreieck, 0).
stoff(basisBauEndStoff, kurzeMetallWand, 0).
stoff(basisBauEndStoff, metallFassade, 0).
stoff(basisBauEndStoff, kleineMetallTuer, 0).
stoff(basisBauEndStoff, dachInnenEckteilAusMetall, 0).
stoff(basisBauEndStoff, halberMetallBogen, 0).

/* ------------------------------- Betonkomponenten --------------------- */
stoff(basisBauEndStoff, betonWand, 0).
stoff(basisBauEndStoff, betonBodenPlatte, 0).
stoff(basisBauEndStoff, duenneBetonWand, 0).
stoff(basisBauEndStoff, betonTuerRahmen, 0).
stoff(basisBauEndStoff, betonDach, 0).
stoff(basisBauEndStoff, glasPlatteMitBetonRahmen, 0).
stoff(basisBauEndStoff, betonRampe, 0).
stoff(basisBauEndStoff, kleineBetonBodenPlatte, 0).
stoff(basisBauEndStoff, betonDreieck, 0).
stoff(basisBauEndStoff, schraegeBetonPlatte, 0).
stoff(basisBauEndStoff, kleineBetonWand, 0).
stoff(basisBauEndStoff, betonFenster, 0).
stoff(basisBauEndStoff, betonTuer, 0).
stoff(basisBauEndStoff, elektrischeBetonTuer, 0).
stoff(basisBauEndStoff, betonDachPlatte, 0).
stoff(basisBauEndStoff, betonDachEckStueck, 0).
stoff(basisBauEndStoff, betonBogen, 0).
stoff(basisBauEndStoff, halbeBetonRampe, 0).
stoff(basisBauEndStoff, kleinesBetonDreieck, 0).
stoff(basisBauEndStoff, kurzeBetonWand, 0).
stoff(basisBauEndStoff, betonFassade, 0).
stoff(basisBauEndStoff, kleineBetonTuer, 0).
stoff(basisBauEndStoff, dachInnenEckteilAusBeton, 0).
stoff(basisBauEndStoff, halberBetonBogen, 0).

/* =====================  gross vorgefertigt ========================================= */
stoff(basisBauEndStoff, zylindrischerRaum, 0).
stoff(basisBauEndStoff, quadratischerRaum, 0).
stoff(basisBauEndStoff, geraderKorridor, 0).
stoff(basisBauEndStoff, tuer, 0).
stoff(basisBauEndStoff, fundament, 0).
stoff(basisBauEndStoff, lFoermigerKorridor, 0).
stoff(basisBauEndStoff, korridorMitGlasDach, 0).
stoff(basisBauEndStoff, holoTuer, 0).
stoff(basisBauEndStoff, zugangsRampe, 0).
stoff(basisBauEndStoff, viererFundamentStrebe, 0).
stoff(basisBauEndStoff, fundamentStrebe, 0).
stoff(basisBauEndStoff, zylindrischerRaumRahmen, 0).
stoff(basisBauEndStoff, tFoermigerKorridor, 0).
stoff(basisBauEndStoff, xFoermigerKorridor, 0).
stoff(basisBauEndStoff, korridorFenster, 0).
stoff(basisBauEndStoff, bioKuppelRaum, 0).
stoff(basisBauEndStoff, gebogenerKorridor, 0).
stoff(basisBauEndStoff, leiter, 0).
stoff(basisBauEndStoff, pflasterungVierFach, 0).
stoff(basisBauEndStoff, pflasterung, 0).
stoff(basisBauEndStoff, grossesGlasPaneel, 0).
stoff(basisBauEndStoff, aussichtsKugel, 0).

/* =====================  klein vorgefertigt ========================================= */
stoff(basisBauEndStoff, wuerfelFoermigerRaum, 0).
stoff(basisBauEndStoff, wuerfelRaumFundamentStrebe, 0).
stoff(basisBauEndStoff, gewoelbteWuerfelFoermigeWand, 0).
stoff(basisBauEndStoff, wuerfelFoermigerGlasRaum, 0).
stoff(basisBauEndStoff, wuerfelFoermigerRaumRahmen, 0).
stoff(basisBauEndStoff, wuerfelFoermigerRaumBoden, 0).
stoff(basisBauEndStoff, wuerfelRaumViererFundamentStrebe, 0).
stoff(basisBauEndStoff, innenTreppen, 0).
stoff(basisBauEndStoff, wuerfelFoermigeInnenWand, 0).
stoff(basisBauEndStoff, wuerfelFoermigerDachAufsatz, 0).
stoff(basisBauEndStoff, gewoelbtesWuerfelFoermigesDach, 0).
stoff(basisBauEndStoff, wuerfelFoermigesFensterEckig, 0).
stoff(basisBauEndStoff, wuerfelFoermigesFensterRund, 0).
stoff(basisBauEndStoff, infraStrukturLeiter, 0).
stoff(basisBauEndStoff, wuerfelFoermigeInnenTuer, 0).

/* =============================== Wasser-Konstruktion ================== */
stoff(basisBauEndStoff, tiefSeeKammer, 0).
stoff(basisBauEndStoff, meeresUnterSchlupf, 0).
stoff(basisBauEndStoff, glasTunnel, 0).
stoff(basisBauEndStoff, quadratischeTiefSeeKammer, 0).
stoff(basisBauEndStoff, wasserDichteTuer, 0).
stoff(basisBauEndStoff, lFoermigerGlasTunnel, 0).
stoff(basisBauEndStoff, vertikalerGlasTunnel, 0).
stoff(basisBauEndStoff, mondTeichBoden, 0).
stoff(basisBauEndStoff, tFoermigerGlasTunnel, 0).
stoff(basisBauEndStoff, xFoermigerGlasTunnel, 0).

/*
stoff(basisBauEndStoff, feuerWerkGruen, 0).
stoff(basisBauEndStoff, feuerWerkBlau, 0).
stoff(basisBauEndStoff, feuerWerkRot, 0).
stoff(basisBauEndStoff, galaktischerHubBanner, 0).
stoff(basisBauEndStoff, spezialistPoloBanner, 0).
stoff(basisBauEndStoff, priesterEntitaetNadaBanner, 0).
*/

/* =============================== Frachter ============================= */
stoff(basisBauEndStoff, flottenKommandoRaum, 0).
stoff(basisBauEndStoff, grosserFrachterRaum, 0).
stoff(basisBauEndStoff, frachterKorridor, 0).
stoff(basisBauEndStoff, gebogenerFrachterKorridor, 0).
stoff(basisBauEndStoff, frachterKreuzungDreiFach, 0).
stoff(basisBauEndStoff, frachterKreuzungVierFach, 0).


/* Eine Komponente */
stoff(basisBauEndStoff, frachterTreppe, 0).
stoff(basisBauEndStoff, stabilerWuerfel, 0).

/* nur kaufen und verkaufen */
stoff(handelsWare, zuckendesEi, 9600).
stoff(handelsWare, entschluesselteBenutzerDaten, 1000).
stoff(handelsWare, antiHaftKolben, 6000).
stoff(handelsWare, ausrangierteSchaltPlatte, 1000).
stoff(handelsWare, autonomePositionierungsEinheit, 30000).
stoff(handelsWare, bromSalz, 15000).
stoff(handelsWare, experimentelleEnergieFluessigkeit, 30000).
stoff(handelsWare, fuenfDimensionalerTorus, 30000).
stoff(handelsWare, funkenKanister, 1000).
stoff(handelsWare, fusionsKern, 150000).
stoff(handelsWare, gewaltigesMetallZahnRad, 1000).
stoff(handelsWare, holographischeKurbelWelle, 30000).
stoff(handelsWare, hochleistungsKompressor, 150000).
stoff(handelsWare, industrieBatterie, 6000).
stoff(handelsWare, instabilitaetsInjektor, 15000).
stoff(handelsWare, ionenKugel, 30000).
stoff(handelsWare, ionenKondensator, 15000).
stoff(handelsWare, kometenTroepfchen, 15000).
stoff(handelsWare, nanoRohrKiste, 1000).
stoff(handelsWare, neuralLeitung, 50000).
stoff(handelsWare, neutronenMikroskop, 6000).
stoff(handelsWare, nichtMehrDuftendePheromonFlasche, 1000). 
stoff(handelsWare, ohmschesGel, 15000).
stoff(handelsWare, optischesLoesungsMittel, 15000).
stoff(handelsWare, organischeRohre, 30000).
stoff(handelsWare, polyChromesZirkonium, 30000).
stoff(handelsWare, quantumBeschleuniger, 50000).
stoff(handelsWare, schmutz, 1000).
stoff(handelsWare, schweisserSeife, 6000).
stoff(handelsWare, sechsZackigerEntKoppler, 15000).
stoff(handelsWare, sichSelbstReparierendesHeridium, 6000).
stoff(handelsWare, sternenSeide, 6000).
stoff(handelsWare, supraleitendeFaser, 50000).
stoff(handelsWare, teleportKoordinatoren, 50000).
stoff(handelsWare, unraffiniertesPyritFett, 6000).
stoff(handelsWare, vergitterterBogenKristall, 50000).

stoff(handelsWare, raumSchiffKiVentile, 49607192).
stoff(handelsWare, nanoKabelSpule, 400000).
stoff(handelsWare, wiederVerwerterSchaltKreis, 600000).
stoff(handelsWare, verdichteteIndiumReste, 3000000).
stoff(handelsWare, subatomareRegler, 800000).
stoff(handelsWare, thermalModule, 100000).
stoff(handelsWare, handvollZahnRaeder, 10000).
stoff(handelsWare, kuehlMittelTank, 200000).
stoff(handelsWare, verstaerkteRohre, 50000).
stoff(handelsWare, ehemalsNuetzlicheFedern, 1000).

stoff(handelsWare, unmoeglicheSporen, 151488). 
stoff(handelsWare, sichWindendeSpulen, 3280). 

/* =============================== anormale Materialien ================= */

stoff(stoerung, blasenBallen, 1000).
stoff(stoerung, defekterSeparator, 1000).
stoff(stoerung, elektrischerWuerfel, 1000).
stoff(stoerung, kabelKapsel, 1000).
stoff(stoerung, kalziPilz, 1000).
stoff(stoerung, kappillarMuschel, 1000).
stoff(stoerung, klapperWirbleSaeule, 1000).
stoff(stoerung, lichtBruch, 1000).
stoff(stoerung, terbiumWachstum, 1000).
stoff(stoerung, verknoecherterStern, 1000).


/* =============================== Quecksilber Kauf ===================== */
/*
stoff(geste, totalVerbluefft, 0).
stoff(geste, ha, 0).
stoff(geste, erstaunen, 0).
stoff(geste, feiern, 0).
stoff(geste, abwesenderBlick, 0).
stoff(geste, heroischePose, 0).
stoff(geste, unglaeubigkeit, 0).
stoff(geste, keinProblem, 0).

stoff(kleidung, antiMaterieJetpackSpur, 0).
stoff(kleidung, regenBogenJetpackSpur, 0).
stoff(kleidung, roteJetpackSpur, 0).
stoff(kleidung, grueneJetpackSpur, 0).
stoff(kleidung, blaueJetpackSpur, 0).
stoff(kleidung, ariadneGesicht, 0).
stoff(kleidung, kronosGesicht, 0).
stoff(kleidung, persesGesicht, 0).
stoff(kleidung, heperosGesicht, 0).
stoff(kleidung, seleneGesicht, 0).
stoff(kleidung, tethysGesicht, 0).
stoff(kleidung, eosGesicht, 0).
stoff(kleidung, hyperionGesicht, 0).
stoff(kleidung, heliosGesicht, 0).
stoff(kleidung, aresGesicht, 0).
stoff(kleidung, merkurGesicht, 0).
stoff(kleidung, geminiGesicht, 0).
stoff(kleidung, gepanzerteSchulterPlatten, 0).
stoff(kleidung, gepanzerteBrustRuestung, 0).
stoff(kleidung, gepanzerteGamaschen, 0).
stoff(kleidung, gepanzerteExoHandschuhe, 0).
stoff(kleidung, gepanzerteStiefel, 0).
stoff(kleidung, erstGebrueteterKampfMaske, 0).
stoff(kleidung, augeDerKorvaxHelm, 0).
stoff(kleidung, lodernderOrbitHelm, 0).
stoff(kleidung, spaerlicherHorizontHelm, 0).
*/

/* ausgraben, pfl�cken, f�r Ansehen schenken, verkaufen */
stoff(kuriositaet, gekNip, 20625).
stoff(kuriositaet, gekRelikt, 23375).
stoff(kuriositaet, korvaxGehaeuse, 22000).
stoff(kuriositaet, vyKeenBildnis, 24750).
stoff(kuriositaet, vyKeenDolch, 11688).
stoff(kuriositaet, divergenzWuerfel, 3015).
stoff(kuriositaet, korvaxKonvergenzWuerfel, 13063).
stoff(kuriositaet, vykenTafel, 1250).
stoff(kuriositaet, hexKern, 32). /* bei der Jagd gefunden */ 

stoff(bauRezept, byteBeatGeraetRezept, 0).
stoff(bauRezept, saeureRezept, 0).
stoff(bauRezept, schmierMittelRezept, 0).
stoff(bauRezept, thermischesKondensatRezept, 0).
stoff(bauRezept, tragbarerReaktorRezept, 0).
stoff(bauRezept, instabilesGelRezept, 0).
stoff(bauRezept, glasRezept, 0).
stoff(bauRezept, polyFaserRezept, 0).
stoff(bauRezept, angereicherterKohlenStoffRezept, 0).
stoff(bauRezept, stickStoffSalzRezept, 0).
stoff(bauRezept, aroniumRezept, 0).
stoff(bauRezept, quantumProzessorRezept, 0).
stoff(bauRezept, kryogenKammerRezept, 0).
stoff(bauRezept, fluessigSprengStoffRezept, 0).
stoff(bauRezept, lebendesGlasRezept, 0).
stoff(bauRezept, hitzeKondensatorRezept, 0).
stoff(bauRezept, schaltPlatteRezept, 0).
stoff(bauRezept, organischerKatalysatorRezept, 0).
stoff(bauRezept, halbLeiterRezept, 0).
stoff(bauRezept, heissesEisRezept, 0).
stoff(bauRezept, strassenKoeterBronzeRezept, 0).
stoff(bauRezept, heroxRezept, 0).
stoff(bauRezept, lemmiumRezept, 0).
stoff(bauRezept, magnoGoldRezept, 0).
stoff(bauRezept, grantineRezept, 0).
stoff(bauRezept, fusionsZuenderRezept, 0).
stoff(bauRezept, staseGeraetRezept, 0).
stoff(bauRezept, fusionsBeschleunigerRezept, 0).
stoff(bauRezept, supraLeiterRezept, 0).
stoff(bauRezept, kryoPumpeRezept, 0).
stoff(bauRezept, iridesitRezept, 0).
stoff(bauRezept, geoDesitRezept, 0).
stoff(bauRezept, lebensErhaltungsGelRezept, 0).
stoff(bauRezept, diWasserStoffGeleeRezept, 0).
stoff(bauRezept, ionenAkkuRezept, 0).
stoff(bauRezept, warpZelleRezept, 0).
stoff(bauRezept, kohlenStoffKristallRezept, 0).
stoff(bauRezept, seltenesMetallElementRezept, 0).
stoff(bauRezept, tetraKobaltRezept, 0).
stoff(bauRezept, chlorGitterRezept, 0).
stoff(bauRezept, instabilesNatriumRezept, 0).
stoff(bauRezept, superOxidKristallRezept, 0).
stoff(bauRezept, raumSchiffStartTreibStoffRezept, 0).
stoff(bauRezept, fortschrittlicherIonenAkkuRezept, 0).
stoff(bauRezept, atlasPassV1Rezept, 0).
stoff(bauRezept, hydrothermaleTreibStoffZelleRezept, 0).
stoff(bauRezept, instabilesPlasmaRezept, 0).
stoff(bauRezept, sternenSchildBatterieRezept, 0).
stoff(bauRezept, atlasPassV2Rezept, 0).
stoff(bauRezept, warpHyperKernRezept, 0).
stoff(bauRezept, atlasPassV3Rezept, 0).
stoff(bauRezept, hermetischesSiegelRezept, 0).
stoff(bauRezept, kohlenStoffNanoRohrRezept, 0).
stoff(bauRezept, metallPlattenRezept, 0).
stoff(bauRezept, projektilMunitionRezept, 0).
stoff(bauRezept, antiMaterieRezept, 0).
stoff(bauRezept, antiMaterieGehaeuseRezept, 0).
stoff(bauRezept, mikroProzessorRezept, 0).
stoff(bauRezept, kreaturenKugelnRezept, 0).
stoff(bauRezept, fregattenTreibStoff50toRezept, 0).
stoff(bauRezept, fregattenTreibStoff100toRezept, 0).
stoff(bauRezept, fregattenTreibStoff200toRezept, 0).
stoff(bauRezept, treibStoffOxidantRezept, 0).
stoff(bauRezept, gedankenKontrollGeraetRezept, 0).
stoff(bauRezept, holografischerAnalysatorRezept, 0).
stoff(bauRezept, sprengDrohnenRezept, 0).
stoff(bauRezept, mineralKompressorRezept, 0).
stoff(bauRezept, warpKernResonatorRezept, 0).
stoff(bauRezept, verstraerkterWarpSchildCRezept, 0).
stoff(bauRezept, chromatischerWarpSchildBRezept, 0).
stoff(bauRezept, temporalerWarpComputerARezept, 0).
stoff(bauRezept, plasmaWarpInjektorBRezept, 0).
stoff(bauRezept, realitaetsEntwirrerRezept, 0).
stoff(bauRezept, materieStrahlRezept, 0).
stoff(bauRezept, gefangeneNanodeRezept, 0).
stoff(bauRezept, umhuellterSchattenRezept, 0).
stoff(bauRezept, nooSphaerischKugelRezept, 0).
stoff(bauRezept, dunkleMaterieRezept, 0).
stoff(bauRezept, endeDerDaemmerungRezept, 0).
stoff(bauRezept, photischerJadeRezept, 0).
stoff(bauRezept, zustandsPhaseRezept, 0).
stoff(bauRezept, novaeRegeneratRezept, 0).
stoff(bauRezept, modifizierteQuantenRezept, 0).
stoff(bauRezept, herzDerSonneRezept, 0).
stoff(bauRezept, erinnerungRezept, 0).
stoff(bauRezept, sternenSamenRezept, 0).
stoff(bauRezept, seelenEngineRezept, 0).
stoff(bauRezept, gedankenBogenRezept, 0).
stoff(bauRezept, bewusstseinsBrueckeRezept, 0).
stoff(bauRezept, pulsierenderKernRezept, 0).
stoff(bauRezept, unmoeglicheMembranRezept, 0).
stoff(bauRezept, glasSamenRezept, 0).

stoff(bauRezept, lebensErhaltungRezept, 0).
stoff(bauRezept, gefahrGutSchutzHandschuhRezept, 0).
stoff(bauRezept, gefahrenSchutzRezept, 0).
stoff(bauRezept, sauerStoffWiederVerwerterCRezept, 0).
stoff(bauRezept, jetPackRezept, 0).
stoff(bauRezept, einfacherUeberSetzerBRezept, 0).
stoff(bauRezept, kuehlMittelNetzwerkCRezept, 0).
stoff(bauRezept, waermeSchichtCRezept, 0).
stoff(bauRezept, toxinDaempferCRezept, 0).
stoff(bauRezept, strahlungsDeflektorCRezept, 0).
stoff(bauRezept, belueftungsMembranBRezept, 0).
stoff(bauRezept, schildGitterBRezept, 0).
stoff(bauRezept, sauerStoffUmleiterARezept, 0).
stoff(bauRezept, neuralStimulatorBRezept, 0).
stoff(bauRezept, raketenStiefelARezept, 0).
stoff(bauRezept, effizienteWasserDuesenARezept, 0).
stoff(bauRezept, verbesserterUebersetzerARezept, 0).
stoff(bauRezept, perfektionierterUebersetzerSRezept, 0).
stoff(bauRezept, persoenlicheRaffinerieRezept, 0).
stoff(bauRezept, luftSchubAntriebSRezept, 0).

stoff(bauRezept, fusionsAntriebRezept, 0).
stoff(bauRezept, humboldtAntriebRezept, 0).
stoff(bauRezept, megaWattHeizungRezept, 0).
stoff(bauRezept, luftFilterEinheitRezept, 0).
stoff(bauRezept, neutronenAbschirmungRezept, 0).
stoff(bauRezept, thermalPufferRezept, 0).
stoff(bauRezept, exoFahrzeugSignalBoosterRezept, 0).
stoff(bauRezept, exoFahrzeugBeschleunigungsModulRezept, 0).
stoff(bauRezept, exoFahrzeugMinenLaserRezept, 0).
stoff(bauRezept, daidalosAntriebRezept, 0).
stoff(bauRezept, hochleistungsSonarRezept, 0).
stoff(bauRezept, fortgeschrittenerSignalBoosterBRezept, 0).
stoff(bauRezept, ikarusTreibStoffSystemRezept, 0).
stoff(bauRezept, exoFahrzeugMinenLaserUpgradeSigmaARezept, 0).
stoff(bauRezept, exoFahrzeugBordKanoneRezept, 0).
stoff(bauRezept, umweltKontrollEinheitRezept, 0).
stoff(bauRezept, minotaurusRadarAnlageRezept, 0).
stoff(bauRezept, minotaurusLaserRezept, 0).
stoff(bauRezept, osmotischerGeneratorCRezept, 0).
stoff(bauRezept, tethysStrahlRezept, 0).
stoff(bauRezept, nautilonKanoneRezept, 0).
stoff(bauRezept, exoFahrzeugSignalBoosterUpgradeTauARezept, 0).
stoff(bauRezept, ariadnesFlammeRezept, 0).
stoff(bauRezept, minotaurusPraezisionsLaserRezept, 0).
stoff(bauRezept, minotaurusKanoneRezept, 0).
stoff(bauRezept, minotaurusBohrerRezept, 0).
stoff(bauRezept, selbstSchmierendeServosRezept, 0).
stoff(bauRezept, impulsAntriebRezept, 0).
stoff(bauRezept, teleportEmpfaengerRezept, 0).
stoff(bauRezept, hyperAntriebRezept, 0).
stoff(bauRezept, startSchubDueseRezept, 0).
stoff(bauRezept, deflektorSchildRezept, 0).
stoff(bauRezept, photonenKanoneRezept, 0).
stoff(bauRezept, konfliktScannerRezept, 0).
stoff(bauRezept, wirtschaftsScannerRezept, 0).
stoff(bauRezept, cadmiumAntriebBRezept, 0).
stoff(bauRezept, effizienteDuesenBRezept, 0).
stoff(bauRezept, ablativePanzerungCRezept, 0).
stoff(bauRezept, nichtlineareOptikCRezept, 0).
stoff(bauRezept, raketenWerferRezept, 0).
stoff(bauRezept, phasenStrahlerRezept, 0).
stoff(bauRezept, positronenWerferRezept, 0).
stoff(bauRezept, infraMesserBeschleunigerRezept, 0).
stoff(bauRezept, zyklotronBallisteRezept, 0).
stoff(bauRezept, emerilAntriebARezept, 0).
stoff(bauRezept, startSystemLadeGeraetSRezept, 0).
stoff(bauRezept, grosseRaketenRohreBRezept, 0).
stoff(bauRezept, fourierBegrenzerBRezept, 0).
stoff(bauRezept, fragmentSuperAufladerBRezept, 0).
stoff(bauRezept, nichtlineareOptikBRezept, 0).
stoff(bauRezept, dysonPumpeBRezept, 0).
stoff(bauRezept, indiumAntriebSRezept, 0).
stoff(bauRezept, analyseVisierRezept, 0).
stoff(bauRezept, scannerRezept, 0).
stoff(bauRezept, terrainManipulatorRezept, 0).
stoff(bauRezept, minenLaserRezept, 0).
stoff(bauRezept, blitzWerferRezept, 0).
stoff(bauRezept, eigenesKraftFeldRezept, 0).
stoff(bauRezept, fortgeschrittenerMinenLaserARezept, 0).
stoff(bauRezept, wellenFormWiederVerwerterBRezept, 0).
stoff(bauRezept, laufIonisatorCRezept, 0).
stoff(bauRezept, plasmaWerferRezept, 0).
stoff(bauRezept, glutSpeerRezept, 0).
stoff(bauRezept, streuBlasterRezept, 0).
stoff(bauRezept, impulsWerferRezept, 0).
stoff(bauRezept, kampfVisierRezept, 0).
stoff(bauRezept, optischerBohrerSRezept, 0).
stoff(bauRezept, untersuchungsGeraetARezept, 0).
stoff(bauRezept, geologieKanoneRezept, 0).
stoff(bauRezept, masseBeschleunigerCRezept, 0).
stoff(bauRezept, geschossSchmiererCRezept, 0).
stoff(bauRezept, verstaerkteKartuschenCRezept, 0).
stoff(bauRezept, instabilitaetsAntriebARezept, 0).
stoff(bauRezept, unterLichtVerstaerkerSRezept, 0).
stoff(bauRezept, notFallWarpEinheitARezept, 0).
stoff(bauRezept, solarStrahlRezept, 0).
stoff(bauRezept, gemuetsStrahlRezept, 0).

stoff(bauRezept, basisBergungsKapselRezept, 0).
stoff(bauRezept, kommunikationsStationRezept, 0).
stoff(bauRezept, autonomeBergBauEinheitRezept, 0).
stoff(bauRezept, atmosphaerenVerarbeitungsAnlageRezept, 0).
stoff(bauRezept, nachrichtenModulRezept, 0).
stoff(bauRezept, basisComputerRezept, 0).
stoff(bauRezept, konstruktionsForschungsStationRezept, 0).
stoff(bauRezept, tragbareRaffinerieRezept, 0).
stoff(bauRezept, speicherPunktRezept, 0).
stoff(bauRezept, verschlosseneKisteRezept, 0).
stoff(bauRezept, konstruktionsTerminalRezept, 0).
stoff(bauRezept, exoFahrzeugTerminalRezept, 0).
stoff(bauRezept, waffenTerminalRezept, 0).
stoff(bauRezept, wissenschaftsTerminalRezept, 0).
stoff(bauRezept, landwirtschaftsTerminalRezept, 0).
stoff(bauRezept, flottenKommandoRaumRezept, 0).
stoff(bauRezept, grosserFrachterRaumRezept, 0).
stoff(bauRezept, frachterKorridorRezept, 0).
stoff(bauRezept, gebogenerFrachterKorridorRezept, 0).
stoff(bauRezept, frachterKreuzungDreiFachRezept, 0).
stoff(bauRezept, frachterTreppeRezept, 0).
stoff(bauRezept, frachterKreuzungVierFachRezept, 0).
stoff(bauRezept, zylindrischerRaumRezept, 0).
stoff(bauRezept, quadratischerRaumRezept, 0).
stoff(bauRezept, geraderKorridorRezept, 0).
stoff(bauRezept, tuerRezept, 0).
stoff(bauRezept, fundamentRezept, 0).
stoff(bauRezept, lFoermigerKorridorRezept, 0).
stoff(bauRezept, korridorMitGlasDachRezept, 0).
stoff(bauRezept, holoTuerRezept, 0).
stoff(bauRezept, zugangsRampeRezept, 0).
stoff(bauRezept, pflasterungVierFachRezept, 0).
stoff(bauRezept, viererFundamentStrebeRezept, 0).
stoff(bauRezept, fundamentStrebeRezept, 0).
stoff(bauRezept, zylindrischerRaumRahmenRezept, 0).
stoff(bauRezept, tFoermigerKorridorRezept, 0).
stoff(bauRezept, xFoermigerKorridorRezept, 0).
stoff(bauRezept, korridorFensterRezept, 0).
stoff(bauRezept, bioKuppelRaumRezept, 0).
stoff(bauRezept, gebogenerKorridorRezept, 0).
stoff(bauRezept, leiterRezept, 0).
stoff(bauRezept, pflasterungRezept, 0).
stoff(bauRezept, pflasterungPodestRezept, 0).
stoff(bauRezept, grossesGlasPaneelRezept, 0).
stoff(bauRezept, aussichtsKugelRezept, 0).
stoff(bauRezept, wuerfelFoermigerRaumRezept, 0).
stoff(bauRezept, wuerfelRaumFundamentStrebeRezept, 0).
stoff(bauRezept, gewoelbteWuerfelFoermigeWandRezept, 0).
stoff(bauRezept, wuerfelFoermigerGlasRaumRezept, 0).
stoff(bauRezept, wuerfelFoermigerRaumRahmenRezept, 0).
stoff(bauRezept, wuerfelFoermigerRaumBodenRezept, 0).
stoff(bauRezept, wuerfelRaumViererFundamentStrebeRezept, 0).
stoff(bauRezept, innenTreppenRezept, 0).
stoff(bauRezept, wuerfelFoermigeInnenWandRezept, 0).
stoff(bauRezept, wuerfelFoermigerDachAufsatzRezept, 0).
stoff(bauRezept, gewoelbtesWuerfelFoermigesDachRezept, 0).
stoff(bauRezept, wuerfelFoermigesFensterEckigRezept, 0).
stoff(bauRezept, wuerfelFoermigesFensterRundRezept, 0).
stoff(bauRezept, infraStrukturLeiterRezept, 0).
stoff(bauRezept, wuerfelFoermigeInnenTuerRezept, 0).
stoff(bauRezept, basisTelePorterModulRezept, 0).
stoff(bauRezept, bioTreibStoffReaktorRezept, 0).
stoff(bauRezept, elektrischeTarneinheitRezept, 0).
stoff(bauRezept, speicherSignalRezept, 0).
stoff(bauRezept, gesundheitsStationRezept, 0).
stoff(bauRezept, signalBoosterRezept, 0).
stoff(bauRezept, gefahrenSchutzEinheitRezept, 0).
stoff(bauRezept, naehrStoffProzessorRezept, 0).
stoff(bauRezept, lagerBehaelter0Rezept, 0).
stoff(bauRezept, lagerBehaelter1Rezept, 0).
stoff(bauRezept, lagerBehaelter2Rezept, 0).
stoff(bauRezept, lagerBehaelter3Rezept, 0).
stoff(bauRezept, lagerBehaelter4Rezept, 0).
stoff(bauRezept, lagerBehaelter5Rezept, 0).
stoff(bauRezept, lagerBehaelter6Rezept, 0).
stoff(bauRezept, lagerBehaelter7Rezept, 0).
stoff(bauRezept, lagerBehaelter8Rezept, 0).
stoff(bauRezept, lagerBehaelter9Rezept, 0).
stoff(bauRezept, aussehenModifikatorRezept, 0).
stoff(bauRezept, landeFeldRezept, 0).
stoff(bauRezept, nutzTierEinheitRezept, 0).
stoff(bauRezept, automatischerFuettererRezept, 0).
stoff(bauRezept, terminalDesGalaktischenMarktesRezept, 0).
stoff(bauRezept, kurzStreckenTelePorterRezept, 0).
stoff(bauRezept, mittlereRaffinerieRezept, 0).
stoff(bauRezept, grosseRaffinerieRezept, 0).
stoff(bauRezept, antiMaterieReaktorRezept, 0).
stoff(bauRezept, roamerGeoBuchtRezept, 0).
stoff(bauRezept, nomadenGeoBuchtRezept, 0).
stoff(bauRezept, exoFahrzeugRufStationRezept, 0).
stoff(bauRezept, nautilonKammerRezept, 0).
stoff(bauRezept, pilgerGeoBuchtRezept, 0).
stoff(bauRezept, kolossGeoBuchtRezept, 0).
stoff(bauRezept, minotaurusGeoBuchtRezept, 0).
stoff(bauRezept, rennInitiatorRezept, 0).
stoff(bauRezept, rennHindernisRezept, 0).
stoff(bauRezept, rennKraftVerstaerkerRezept, 0).
stoff(bauRezept, tiefSeeKammerRezept, 0).
stoff(bauRezept, meeresUnterSchlupfRezept, 0).
stoff(bauRezept, glasTunnelRezept, 0).
stoff(bauRezept, quadratischeTiefSeeKammerRezept, 0).
stoff(bauRezept, wasserDichteTuerRezept, 0).
stoff(bauRezept, lFoermigerGlasTunnelRezept, 0).
stoff(bauRezept, vertikalerGlasTunnelRezept, 0).
stoff(bauRezept, mondTeichBodenRezept, 0).
stoff(bauRezept, tFoermigerGlasTunnelRezept, 0).
stoff(bauRezept, xFoermigerGlasTunnelRezept, 0).
stoff(bauRezept, motivStilisiertesRRezept, 0).
stoff(bauRezept, motivRundPipetteRezept, 0).
stoff(bauRezept, motivFaltungDuennDickRezept, 0).
stoff(bauRezept, motivZiegelSteineRezept, 0).
stoff(bauRezept, motivRadioAktivGrauRezept, 0).
stoff(bauRezept, motivGrabSteinRezept, 0).
stoff(bauRezept, motivHelloGamesRezept, 0).
stoff(bauRezept, motivBuegelRezept, 0).
stoff(bauRezept, motivNo0Rezept, 0).
stoff(bauRezept, motivNo1Rezept, 0).
stoff(bauRezept, motivNo2Rezept, 0).
stoff(bauRezept, motivNo3Rezept, 0).
stoff(bauRezept, motivNo4Rezept, 0).
stoff(bauRezept, motivNo5Rezept, 0).
stoff(bauRezept, motivNo6Rezept, 0).
stoff(bauRezept, motivNo7Rezept, 0).
stoff(bauRezept, motivNo8Rezept, 0).
stoff(bauRezept, motivNo9Rezept, 0).
stoff(bauRezept, motivSchildErstochenerVogelRezept, 0).
stoff(bauRezept, motivSchildGr�nerMannRezept, 0).
stoff(bauRezept, motivSchildKorvaxRezept, 0).
stoff(bauRezept, motivFroschSackRezept, 0).
stoff(bauRezept, motivLaemmchenRezept, 0).
stoff(bauRezept, wandBildSchirmRezept, 0).
stoff(bauRezept, wandVentilatorRezept, 0).
stoff(bauRezept, gruenerWandBildSchirmRezept, 0).
stoff(bauRezept, schubLadenSchrankRezept, 0).
stoff(bauRezept, wandEinheitRezept, 0).
stoff(bauRezept, lagerModulDekoRezept, 0).
stoff(bauRezept, deckenPaneelRezept, 0).
stoff(bauRezept, techBedienFeldRezept, 0).
stoff(bauRezept, serverRezept, 0).
stoff(bauRezept, kanisterRegalRezept, 0).
stoff(bauRezept, kleineKisteRezept, 0).
stoff(bauRezept, schliessFachRezept, 0).

stoff(bauRezept, crewSchliessFachRezept, 0).
stoff(bauRezept, notFallHeizungRezept, 0).
stoff(bauRezept, notFallBeleuchtungRezept, 0).
stoff(bauRezept, lagerEinheitRezept, 0).
stoff(bauRezept, strapazierfaehigesMoebelStueckRezept, 0).
stoff(bauRezept, pflanzenKanisterRezept, 0).
stoff(bauRezept, probenBehaelterRezept, 0).
stoff(bauRezept, grosseLagerEinheitRezept, 0).
stoff(bauRezept, bergungsKisteRezept, 0).
stoff(bauRezept, gesicherterAktenKofferRezept, 0).
stoff(bauRezept, crewTruheRezept, 0).
stoff(bauRezept, industrieWerkBankRezept, 0).
stoff(bauRezept, industriePaletteRezept, 0).
stoff(bauRezept, industrieFassRezept, 0).

stoff(bauRezept, flachesModulRezept, 0).
stoff(bauRezept, seitenModulRezept, 0).
stoff(bauRezept, regalModulRezept, 0).
stoff(bauRezept, roboterArmRezept, 0).
stoff(bauRezept, waffenRegalRezept, 0).
stoff(bauRezept, oszilloskopRezept, 0).
stoff(bauRezept, achtEckSchrankRezept, 0).
stoff(bauRezept, fassFoermigerFabrikatorRezept, 0).
stoff(bauRezept, hoherSchrankRezept, 0).
stoff(bauRezept, kistenFoermigerFabrikatorRezept, 0).
stoff(bauRezept, schalenSitzStuhlRezept, 0).
stoff(bauRezept, stuhlFriseurRezept, 0).
stoff(bauRezept, stuhlEckigRezept, 0).
stoff(bauRezept, flagge1Rezept, 0).
stoff(bauRezept, tischRezept, 0).
stoff(bauRezept, tischSechsEckigRezept, 0).
stoff(bauRezept, bettRezept, 0).
stoff(bauRezept, sofaRezept, 0).
stoff(bauRezept, flagge2Rezept, 0).
stoff(bauRezept, wandFlagge1Rezept, 0).
stoff(bauRezept, einfacherSchreibTischRezept, 0).
stoff(bauRezept, ergonomischesSofaRezept, 0).
stoff(bauRezept, eckSofaRezept, 0).
stoff(bauRezept, flagge3Rezept, 0).
stoff(bauRezept, flagge4Rezept, 0).
stoff(bauRezept, wandFlagge3Rezept, 0).
stoff(bauRezept, wandFlagge2Rezept, 0).
stoff(bauRezept, bodenMatteRezept, 0).
stoff(bauRezept, grosseMonitorStationRezept, 0).
stoff(bauRezept, gewoelbterTischRezept, 0).
stoff(bauRezept, monitorStationRezept, 0).
stoff(bauRezept, arbeitsPlatteRezept, 0).
stoff(bauRezept, eckSchreibTischRezept, 0).
stoff(bauRezept, lichtHandLampeRezept, 0).
stoff(bauRezept, weisseLeuchteRezept, 0).
stoff(bauRezept, lichtStehLampeEckigRezept, 0).
stoff(bauRezept, laborLampeRezept, 0).
stoff(bauRezept, blaueLeuchteRezept, 0).
stoff(bauRezept, pinkeLeuchteRezept, 0).
stoff(bauRezept, lichtStehLampeRundRezept, 0).
stoff(bauRezept, lichtStehLampeSchirmRezept, 0).
stoff(bauRezept, deckenLeuchteRezept, 0).
stoff(bauRezept, gelbeLeuchteRezept, 0).
stoff(bauRezept, grueneLeuchteRezept, 0).
stoff(bauRezept, roteLeuchteRezept, 0).
stoff(bauRezept, byteBeatSchaltungRezept, 0).
stoff(bauRezept, mineralienExtraktorRezept, 0).
stoff(bauRezept, wandSchalterRezept, 0).
stoff(bauRezept, solarModulRezept, 0).
stoff(bauRezept, batterieRezept, 0).
stoff(bauRezept, gasExtraktorRezept, 0).
stoff(bauRezept, versorgungsDepotRezept, 0).
stoff(bauRezept, versorgungsRohrRezept, 0).
stoff(bauRezept, bodenSchalterRezept, 0).
stoff(bauRezept, annaeherungsSchalterRezept, 0).
stoff(bauRezept, schalterRezept, 0).
stoff(bauRezept, energieUmkehrerRezept, 0).
stoff(bauRezept, elektroMagnetischerGeneratorRezept, 0).
stoff(bauRezept, hydroKulturTrogRezept, 0).
stoff(bauRezept, topfPflanzeRezept, 0).
stoff(bauRezept, grosserHydroKulturTrogRezept, 0).
stoff(bauRezept, pilzGeflechtRezept, 0).
stoff(bauRezept, frostWurzRezept, 0).
stoff(bauRezept, gammaGrasRezept, 0).
stoff(bauRezept, echinoKaktusRezept, 0).
stoff(bauRezept, sternenDornRezept, 0).
stoff(bauRezept, sonnenRebeRezept, 0).
stoff(bauRezept, floraBehaelterHochBeetRezept, 0).
stoff(bauRezept, floraBehaelterKastenRezept, 0).
stoff(bauRezept, floraBehaelterTubusRezept, 0).
stoff(bauRezept, giftIgelRezept, 0).
stoff(bauRezept, gravitinoWirtRezept, 0).
stoff(bauRezept, magenKrampfBlumeRezept, 0).
stoff(bauRezept, morditWurzelRezept, 0).
stoff(bauRezept, eiweissPerlenKugelRezept, 0).
stoff(bauRezept, nipNipRezept, 0).
stoff(bauRezept, holzWandRezept, 0).
stoff(bauRezept, holzBodenPlatteRezept, 0).
stoff(bauRezept, duenneHolzWandRezept, 0).
stoff(bauRezept, holzTuerRahmenRezept, 0).
stoff(bauRezept, holzDachRezept, 0).
stoff(bauRezept, glasPlatteMitHolzRahmenRezept, 0).
stoff(bauRezept, holzRampeRezept, 0).
stoff(bauRezept, kleineHolzPlatteRezept, 0).
stoff(bauRezept, schraegeHolzPlatteRezept, 0).
stoff(bauRezept, kleineHolzWandRezept, 0).
stoff(bauRezept, holzFensterRezept, 0).
stoff(bauRezept, holzTuerRezept, 0).
stoff(bauRezept, elektrischeHolzTuerRezept, 0).
stoff(bauRezept, holzDachPlatteRezept, 0).
stoff(bauRezept, holzDachEckStueckRezept, 0).
stoff(bauRezept, holzBogenRezept, 0).
stoff(bauRezept, halbeHolzRampeRezept, 0).
stoff(bauRezept, kurzeHolzWandRezept, 0).
stoff(bauRezept, holzFassadeRezept, 0).
stoff(bauRezept, kleineHolzTuerRezept, 0).
stoff(bauRezept, dachInnenEckteilAusHolzRezept, 0).
stoff(bauRezept, halberHolzBogenRezept, 0).
stoff(bauRezept, metallWandRezept, 0).
stoff(bauRezept, metallBodenPlatteRezept, 0).
stoff(bauRezept, duenneMetallWandRezept, 0).
stoff(bauRezept, metallTuerRahmenRezept, 0).
stoff(bauRezept, metallDachRezept, 0).
stoff(bauRezept, glasPlatteMitMetallRahmenRezept, 0).
stoff(bauRezept, metallRampeRezept, 0).
stoff(bauRezept, kleineMetallPlatteRezept, 0).
stoff(bauRezept, schraegeMetallPlatteRezept, 0).
stoff(bauRezept, kleineMetallWandRezept, 0).
stoff(bauRezept, metallFensterRezept, 0).
stoff(bauRezept, metallTuerRezept, 0).
stoff(bauRezept, elektrischeMetallTuerRezept, 0).
stoff(bauRezept, metallDachPlatteRezept, 0).
stoff(bauRezept, metallDachEckStueckRezept, 0).
stoff(bauRezept, metallBogenRezept, 0).
stoff(bauRezept, halbeMetallRampeRezept, 0).
stoff(bauRezept, kurzeMetallWandRezept, 0).
stoff(bauRezept, metallFassadeRezept, 0).
stoff(bauRezept, kleineMetallTuerRezept, 0).
stoff(bauRezept, dachInnenEckteilAusMetallRezept, 0).
stoff(bauRezept, halberMetallBogenRezept, 0).
stoff(bauRezept, betonWandRezept, 0).
stoff(bauRezept, betonBodenPlatteRezept, 0).
stoff(bauRezept, duenneBetonWandRezept, 0).
stoff(bauRezept, betonTuerRahmenRezept, 0).
stoff(bauRezept, betonDachRezept, 0).
stoff(bauRezept, glasPlatteMitBetonRahmenRezept, 0).
stoff(bauRezept, betonRampeRezept, 0).
stoff(bauRezept, kleineBetonBodenPlatteRezept, 0).
stoff(bauRezept, schraegeBetonPlatteRezept, 0).
stoff(bauRezept, kleineBetonWandRezept, 0).
stoff(bauRezept, betonFensterRezept, 0).
stoff(bauRezept, betonTuerRezept, 0).
stoff(bauRezept, elektrischeBetonTuerRezept, 0).
stoff(bauRezept, betonDachPlatteRezept, 0).
stoff(bauRezept, betonDachEckStueckRezept, 0).
stoff(bauRezept, betonBogenRezept, 0).
stoff(bauRezept, halbeBetonRampeRezept, 0).
stoff(bauRezept, kurzeBetonWandRezept, 0).
stoff(bauRezept, betonFassadeRezept, 0).
stoff(bauRezept, kleineBetonTuerRezept, 0).
stoff(bauRezept, dachInnenEckteilAusBetonRezept, 0).
stoff(bauRezept, halberBetonBogenRezept, 0).
stoff(bauRezept, grosserKeilRezept, 0).
stoff(bauRezept, kleinerKeilRezept, 0).
stoff(bauRezept, rohrRezept, 0).
stoff(bauRezept, pyramideRezept, 0).
stoff(bauRezept, gebogenesRohrRezept, 0).
stoff(bauRezept, stabilerWuerfelRezept, 0).
stoff(bauRezept, zylinderRezept, 0).
stoff(bauRezept, wuerfelRezept, 0).
stoff(bauRezept, kugelRezept, 0).
stoff(bauRezept, holzDreieckRezept, 0).
stoff(bauRezept, kleinesHolzDreieckRezept, 0).
stoff(bauRezept, metallDreieckRezept, 0).
stoff(bauRezept, kleinesMetallDreieckRezept, 0).
stoff(bauRezept, betonDreieckRezept, 0).
stoff(bauRezept, kleinesBetonDreieckRezept, 0).
stoff(bauRezept, lichtBoxRezept, 0).
stoff(bauRezept, geraeuschBoxRezept, 0).
stoff(bauRezept, kugelErzeugerRezept, 0).
stoff(bauRezept, automatischerSchalterRezept, 0).
stoff(bauRezept, stehenderPflanzenBehaelterRezept, 0).
stoff(bauRezept, sauerStoffVerarbeiterRezept, 0).
stoff(bauRezept, lagerModulRezept, 0).
stoff(bauRezept, leichterTischRezept, 0).

stoff(bauRezept, tentakelSpitzeRezept, 0).
stoff(bauRezept, wachsameWoelbungRezept, 0).
stoff(bauRezept, blasenBildenderPilzRezept, 0).
stoff(bauRezept, uraltesNadelGehoelzRezept, 0).
stoff(bauRezept, gefrorenerPflanzenBehaelterRezept, 0).
stoff(bauRezept, robusterStrauchRezept, 0).
stoff(bauRezept, mineralBogenRezept, 0).
stoff(bauRezept, edelSteinFelsRezept, 0).

stoff(bauRezept, meeresGesteinRezept, 0).
stoff(bauRezept, terrariumRezept, 0).
stoff(bauRezept, segelPalmeRezept, 0).
stoff(bauRezept, kugelBaumRezept, 0).
stoff(bauRezept, steinGartenRezept, 0).
stoff(bauRezept, taschenRealitaetsGeneratorRezept, 0).
stoff(bauRezept, krauseKoralleRezept, 0).
stoff(bauRezept, wasserKristallRezept, 0).
stoff(bauRezept, kronLeuchterBlueteRezept, 0).
stoff(bauRezept, kleinesAquariumRezept, 0).
stoff(bauRezept, bronzeneAtlasStatueRezept, 0).
stoff(bauRezept, silberneAtlasStatueRezept, 0).
stoff(bauRezept, goldeneAtlasStatueRezept, 0).
stoff(bauRezept, fleischFressenderStrauchRezept, 0).
stoff(bauRezept, zwergPalmeRezept, 0).
stoff(bauRezept, kurioserMaisRezept, 0).
stoff(bauRezept, bronzeneJaegerStatueRezept, 0).
stoff(bauRezept, silberneJaegerStatueRezept, 0).
stoff(bauRezept, goldeneJaegerStatueRezept, 0).
stoff(bauRezept, expansionsWuerfelGeraetRezept, 0).
stoff(bauRezept, roboterBegleiterRezept, 0).
stoff(bauRezept, kugelHologrammGeraetRezept, 0).
stoff(bauRezept, artemisMotivRezept, 0).
stoff(bauRezept, nullMotivRezept, 0).
stoff(bauRezept, fruechteBaumRezept, 0).
stoff(bauRezept, spindelBaumRezept, 0).
stoff(bauRezept, immerGruenBaumRezept, 0).
stoff(bauRezept, apolloMotivRezept, 0).
stoff(bauRezept, bronzeneDiploStatueRezept, 0).
stoff(bauRezept, silberneDiploStatueRezept, 0).
stoff(bauRezept, goldeneDiploStatueRezept, 0).
stoff(bauRezept, nadaMotivRezept, 0).
stoff(bauRezept, poloMotivRezept, 0).
stoff(bauRezept, bronzeneKampfLaeuferStatueRezept, 0).
stoff(bauRezept, silberneKampfLaeuferStatueRezept, 0).
stoff(bauRezept, goldeneKampfLaeuferStatueRezept, 0).
stoff(bauRezept, bronzeneGekStatueRezept, 0).
stoff(bauRezept, silberneGekStatueRezept, 0).
stoff(bauRezept, goldeneGekStatueRezept, 0).
stoff(bauRezept, anomalieMotivRezept, 0).
stoff(bauRezept, galaktischerHubMotivRezept, 0).
stoff(bauRezept, umschlingenderBaumRezept, 0).
stoff(bauRezept, regenSchirmBaumRezept, 0).
stoff(bauRezept, windenderStrauchRezept, 0).
stoff(bauRezept, nadaFigurRezept, 0).
stoff(bauRezept, poloFigurRezept, 0).
stoff(bauRezept, atlasFigurRezept, 0).
stoff(bauRezept, artemisFigurRezept, 0).
stoff(bauRezept, apolloFigurRezept, 0).
stoff(bauRezept, nullFigurRezept, 0).
stoff(bauRezept, zustimmendeHandbewegungMotivRezept, 0).
stoff(bauRezept, bronzeneKreaturStatueRezept, 0).
stoff(bauRezept, silberneKreaturStatueRezept, 0).
stoff(bauRezept, goldeneKreaturStatueRezept, 0).
stoff(bauRezept, bronzeneAstronautenStatueRezept, 0).
stoff(bauRezept, silberneAstronautenStatueRezept, 0).
stoff(bauRezept, goldeneAstronautenStatueRezept, 0).
stoff(bauRezept, leuchtBodenRezept, 0).
stoff(bauRezept, cadmiumRaumschiffSpurRezept, 0).
stoff(bauRezept, emerilRaumschiffSpurRezept, 0).
stoff(bauRezept, goldeneRaumschiffSpurRezept, 0).
stoff(bauRezept, rankenFuesserRezept, 0).

stoff(bauRezept, aminoKammerRezept, 0).
stoff(bauRezept, solarSpiegelRezept, 0).
stoff(bauRezept, magnetischerResonatorRezept, 0).
stoff(bauRezept, quantenComputerRezept, 0).
stoff(bauRezept, hydraulischeVerkabelungRezept, 0).
stoff(bauRezept, sauerStoffKapselRezept, 0).

stoff(rohUndKochStoff, chromatischesMetall, 245).
stoff(rohUndKochStoff, faecium, 30).
stoff(rohUndKochStoff, frostKristall, 12).
stoff(rohUndKochStoff, gammaWurzel, 16).
stoff(rohUndKochStoff, hypnotischesAuge, 57000).
stoff(rohUndKochStoff, kaktusFleisch, 28).
stoff(rohUndKochStoff, kelpBeutel, 41).
stoff(rohUndKochStoff, kohlenStoff, 12).
stoff(rohUndKochStoff, kuerbisKnolle, 41).
stoff(rohUndKochStoff, mordit, 40).
stoff(rohUndKochStoff, pilzSchimmel, 16).
stoff(rohUndKochStoff, salz, 299).
stoff(rohUndKochStoff, solanium, 70).
stoff(rohUndKochStoff, sternenKnolle, 32).
stoff(rohUndKochStoff, verdichteterKohlenStoff, 24).

stoff(produktUndKochStoff, kohlenStoffNanoRohr, 500).
stoff(produktUndKochStoff, kreaturenKugeln, 20).

stoff(kochStoff, abgruendigerEintopf, 90000).
stoff(kochStoff, alarmierendeTorte, 78000).
stoff(kochStoff, aloeFleisch, 800).
stoff(kochStoff, anormaleMarmelade, 5400).
stoff(kochStoff, anormaleTorte, 44000).
stoff(kochStoff, anormalerDonut, 70000).
stoff(kochStoff, apfelEisCreme, 56000).
stoff(kochStoff, apfelKuchenVerlorenerSeelen, 176900).
stoff(kochStoff, apfelKuriositaet, 78000).
stoff(kochStoff, balastStoffReichePastete, 40000).
stoff(kochStoff, beinFleisch, 1400).
stoff(kochStoff, beineImTeigMantel, 40000).
stoff(kochStoff, bitterSuesserKakao, 1800).
stoff(kochStoff, blutigesOrgan, 800).
stoff(kochStoff, brandKuchenDesGrauens, 176900).
stoff(kochStoff, bratOel, 30000).
stoff(kochStoff, brot, 5200).
stoff(kochStoff, brueterTorte, 160000).
stoff(kochStoff, cremigeSosse, 16000).
stoff(kochStoff, delikatessBaiser, 5400).
stoff(kochStoff, derMerkWuerdigsteKuchen, 79700).
stoff(kochStoff, derStellarator, 100000).
stoff(kochStoff, dickerFleischEintopf, 26000).
stoff(kochStoff, dickerSuesserTeig, 48000).
stoff(kochStoff, diploStuecke, 1400).
stoff(kochStoff, eisCreme, 48000).
stoff(kochStoff, eisSchreie, 90000).
stoff(kochStoff, engelsObstKuchen, 31300).
stoff(kochStoff, entfesselteMonstrositaet, 152200).
stoff(kochStoff, entfesseltesSahneHorn, 128000).
stoff(kochStoff, entsetzlicherMarmeladenSchwamm, 180700).
stoff(kochStoff, erfrischungsGetraenk, 1800).
stoff(kochStoff, ewigSiedenderKuchen, 64300).
stoff(kochStoff, ewigeEisCreme, 44000).
stoff(kochStoff, ewigerHonigKuchen, 80800).
stoff(kochStoff, ewigerKuchen, 67000).
stoff(kochStoff, ewigesMarmeladenBiskuit, 34100).
stoff(kochStoff, extraFluffigerTeig, 28000).
stoff(kochStoff, fasrigerEintopf, 6400).
stoff(kochStoff, fellKnaeuelGelee, 9000).
stoff(kochStoff, fellTorteInAspik, 54000).
stoff(kochStoff, festerFettKuchen, 54000).
stoff(kochStoff, feuerBeere, 800).
stoff(kochStoff, feuerWasser, 1800).
stoff(kochStoff, feurigeMarmeladenUeberraschung, 149400).
stoff(kochStoff, feurigesMarmeladenBiskuit, 31300).
stoff(kochStoff, fischPastete, 40000).
stoff(kochStoff, fleischFlocken, 800).
stoff(kochStoff, fleischMitGewurzKruste, 18800).
stoff(kochStoff, fleischigeFluegel, 1400).
stoff(kochStoff, fleischigeStuecke, 1000).
stoff(kochStoff, fleischigeWurzeln, 800).
stoff(kochStoff, fluechtigeSchokoTorte, 123700).
stoff(kochStoff, fluesterndesOmelett, 96000).
stoff(kochStoff, fluffigeKaramellFreude, 23600).
stoff(kochStoff, fluffigerRachenSpalter, 142900).
stoff(kochStoff, fragwuerdigerSuesserKuchen, 73600).
stoff(kochStoff, frischeMilch, 3200).
stoff(kochStoff, fruchtEisCreme, 44000).
stoff(kochStoff, fruchtigerPudding, 40000).
stoff(kochStoff, funkelnderHonigKuchen, 50100).
stoff(kochStoff, gebackeneEier, 2200).
stoff(kochStoff, gebaeck, 24000).
stoff(kochStoff, geduenstetesGemuese, 1800).
stoff(kochStoff, gefroreneKnollen, 800).
stoff(kochStoff, gefuellteOrgane, 18800).
stoff(kochStoff, geheimnisVolleFleischPastete, 40000).
stoff(kochStoff, geheimnisVollerFleischEintopf, 6400).
stoff(kochStoff, gemueseCremeSuppe, 26000).
stoff(kochStoff, gequaelterHonigKuchen, 125400).
stoff(kochStoff, geraeucherteFleischPastete, 42000).
stoff(kochStoff, geraeuchertesFleisch, 2200).
stoff(kochStoff, geschlageneButter, 7200).
stoff(kochStoff, geschmorteOrgane, 6400).
stoff(kochStoff, gestampfteWurzelPastete, 40000).
stoff(kochStoff, gesuessteButter, 26000).
stoff(kochStoff, gesuessteProtoButter, 32000).
stoff(kochStoff, gewuerzterApfelKuchen, 64300).
stoff(kochStoff, glasKoerner, 300).
stoff(kochStoff, glasKuchen, 179600).
stoff(kochStoff, grahBeere, 800).
stoff(kochStoff, grahmeLade, 3400).
stoff(kochStoff, grosseEier, 3200).
stoff(kochStoff, hackFleisch, 800).
stoff(kochStoff, halbFluessigerKaese, 24000).
stoff(kochStoff, heimgesuchtePastete, 52000).
stoff(kochStoff, heimgesuchteSchokoTraeume, 148000).
stoff(kochStoff, heisseSosse, 7200).
stoff(kochStoff, heptaploidWeizen, 800).
stoff(kochStoff, heulenderKaramellKuchen, 152300).
stoff(kochStoff, heulenderTeig, 120000).
stoff(kochStoff, hexaBeere, 1600).
stoff(kochStoff, holzApfel, 3200).
stoff(kochStoff, honigButter, 64000).
stoff(kochStoff, honigButterDonut, 105000).
stoff(kochStoff, honigDonut, 65000).
stoff(kochStoff, honigEisCreme, 56000).
stoff(kochStoff, honigEngelKuchen, 20900).
stoff(kochStoff, honigKuchenMitSalz, 92300).
stoff(kochStoff, honigTorte, 48000).
stoff(kochStoff, immerBrennendeMarmelade, 3400).
stoff(kochStoff, impulsBohnen, 800).
stoff(kochStoff, innereienBeutel, 1400).
stoff(kochStoff, interStellareKuriositaet, 92300).
stoff(kochStoff, interStellareTorte, 80200).
stoff(kochStoff, jadeErbsen, 800).
stoff(kochStoff, kaeseFleischEintopf, 36000).
stoff(kochStoff, kaeseGemuesePastete, 62000).
stoff(kochStoff, kaeseTorte, 62000).
stoff(kochStoff, kakaoDonut, 65000).
stoff(kochStoff, kakaoTorte, 54000).
stoff(kochStoff, kaktusGelee, 2400).
stoff(kochStoff, kaktusNektar, 300).
stoff(kochStoff, karamellDonut, 65000).
stoff(kochStoff, karamellEisCreme, 56000).
stoff(kochStoff, karamellKuriositaet, 64900).
stoff(kochStoff, karamellTorte, 62000).
stoff(kochStoff, karamellisierterAlbTraum, 128000).
stoff(kochStoff, katzenLeber, 1400).
stoff(kochStoff, kelpReis, 1200).
stoff(kochStoff, klebrigeButter, 32000).
stoff(kochStoff, klebrigeFruchtUeberraschung, 78000).
stoff(kochStoff, klebrigeProtoButter, 36000).
stoff(kochStoff, klebrigePuddingTorte, 97200).
stoff(kochStoff, klebrigerBrueller, 167200).
stoff(kochStoff, klebrigerHonig, 3200).
stoff(kochStoff, klebrigerKaramellKuchen, 64900).
stoff(kochStoff, klebrigerProtoDonut, 120000).
stoff(kochStoff, klebrigerPudding, 32000).
stoff(kochStoff, klebrigerSchokoladenKuchen, 60500).
stoff(kochStoff, klebrigesHonigKuechlein, 38400).
stoff(kochStoff, klebrigesMundFeuer, 78000).
stoff(kochStoff, klobigerDonut, 48000).
stoff(kochStoff, knusperKaramell, 5400).
stoff(kochStoff, koestlicherGemueseEintopf, 18800).
stoff(kochStoff, kreaturenEi, 1600).
stoff(kochStoff, kriechendesJuckHonigBiskuit, 7410).
stoff(kochStoff, kuchenDerSuende, 149400).
stoff(kochStoff, kuchenDerVerlorenen, 199200).
stoff(kochStoff, kuchenMitKaramellKruste, 52800).
stoff(kochStoff, kuchenTeig, 38000).
stoff(kochStoff, kuenstlicheWuermer, 800).
stoff(kochStoff, kuerbisFleisch, 1400).
stoff(kochStoff, larvenKern, 69875).
stoff(kochStoff, leopardenFrucht, 3200).
stoff(kochStoff, leuchtPastete, 40000).
stoff(kochStoff, marmeladenBiskuit, 35200).
stoff(kochStoff, marmeladenDonut, 70000).
stoff(kochStoff, marmeladenKuriositaet, 81900).
stoff(kochStoff, marmeladenSchleimer, 81900).
stoff(kochStoff, marmeladenTorte, 44000).
stoff(kochStoff, monstroeserDonut, 180000).
stoff(kochStoff, monstroeserHonigKuchen, 800).
stoff(kochStoff, monstroeserPudding, 100000).
stoff(kochStoff, omelett, 18000).
stoff(kochStoff, parasitenOmelett, 102000).
stoff(kochStoff, pikanteFleischBaellchen, 18800).
stoff(kochStoff, pilgerBeere, 300).
stoff(kochStoff, pilgerElixier, 800).
stoff(kochStoff, pilzTorte, 40000).
stoff(kochStoff, proteinReicherDonut, 65000).
stoff(kochStoff, protoButter, 9400).
stoff(kochStoff, protoButterMitHonig, 36000).
stoff(kochStoff, protoKaese, 12000).
stoff(kochStoff, protoKrapfen, 72000).
stoff(kochStoff, protoKuchenMitHonig, 62200).
stoff(kochStoff, protoOel, 48000).
stoff(kochStoff, protoOmelett, 24000).
stoff(kochStoff, protoSahne, 7200).
stoff(kochStoff, protoTeig, 48000).
stoff(kochStoff, protoWurst, 1400).
stoff(kochStoff, protoWurstPastete, 40000).
stoff(kochStoff, puddingDonut, 105000).
stoff(kochStoff, puddingKuriositaet, 97200).
stoff(kochStoff, puddingTorte, 78000).
stoff(kochStoff, rachenKleberMitHonig, 71500).
stoff(kochStoff, rahmOrganSuppe, 26000).
stoff(kochStoff, regisFett, 3200).
stoff(kochStoff, riesenEi, 3200).
stoff(kochStoff, rohesSteak, 1400).
stoff(kochStoff, sahne, 5400).
stoff(kochStoff, sahneBroetchen, 52800).
stoff(kochStoff, sahneHaeppchen, 62000).
stoff(kochStoff, sahneKuchenDesUntergangs, 152300).
stoff(kochStoff, sahneKuriositaet, 64900).
stoff(kochStoff, salzigeFischFilets, 1400).
stoff(kochStoff, salzigeKoestlichkeit, 80200).
stoff(kochStoff, salzigeUeberraschung, 92300).
stoff(kochStoff, salzigerDonut, 100000).
stoff(kochStoff, salzigerPudding, 28000).
stoff(kochStoff, salzigerRauReif, 36000).
stoff(kochStoff, sanfteStachelUeberraschung, 24800).
stoff(kochStoff, scharferGemueseEintopf, 18800).
stoff(kochStoff, schlaengelndeMarmelade, 9000).
stoff(kochStoff, schlaengelndeTorte, 54000).
stoff(kochStoff, schlaengelnderDonut, 70000).
stoff(kochStoff, schokoTraum, 19200).
stoff(kochStoff, schokoladenEisCreme, 44000).
stoff(kochStoff, schokoladenKuchen, 48400).
stoff(kochStoff, schokoladenKuriositaet, 60500).
stoff(kochStoff, schrecklicheklebrigeKoestlichkeit, 200000).
stoff(kochStoff, schrecklicherBrei, 90000).
stoff(kochStoff, schreiterWurst, 1400).
stoff(kochStoff, schuppigesFleisch, 1400).
stoff(kochStoff, sievertBohnen, 300).
stoff(kochStoff, silikonEi, 500).
stoff(kochStoff, softePuddingTorte, 94800).
stoff(kochStoff, solartillo, 300).
stoff(kochStoff, speiseRoehrenUeberraschung, 57800).
stoff(kochStoff, stacheligeKuriositaet, 71500).
stoff(kochStoff, stacheligeTorte, 40000).
stoff(kochStoff, sternenEisCreme, 36000).
stoff(kochStoff, sternenGeburtKoestlichkeit, 92300).
stoff(kochStoff, sternenPudding, 28000).
stoff(kochStoff, sternenPuddingTorte, 78000).
stoff(kochStoff, suessWurzel, 800).
stoff(kochStoff, suesseSahneTraeume, 64900).
stoff(kochStoff, superLeichterSahneKuchen, 23600).
stoff(kochStoff, synthetischerHonig, 3400).
stoff(kochStoff, teig, 3200).
stoff(kochStoff, toedlichKalteEisCreme, 128000).
stoff(kochStoff, tortenBoden, 30000).
stoff(kochStoff, traditionsKuchen, 68100).
stoff(kochStoff, ueppigeHonigTorte, 62200).
stoff(kochStoff, ungiftigerPilz, 300).
stoff(kochStoff, unholdRogen, 1400).
stoff(kochStoff, unloesbarerMarmeladenSturz, 80800).
stoff(kochStoff, verarbeiteterZucker, 1600).
stoff(kochStoff, verarbeitetesFleisch, 2100).
stoff(kochStoff, verfeinertesMehl, 1800).
stoff(kochStoff, vyEisCreme, 44000).
stoff(kochStoff, warmeProtoMilch, 3200).
stoff(kochStoff, wildeHefe, 600).
stoff(kochStoff, wildeMilch, 1600).
stoff(kochStoff, windenderAufgewuehlterTeig, 100000).
stoff(kochStoff, windendesMarmeladenKuechlein, 153300).
stoff(kochStoff, wohlSchmeckendeSosse, 7200).
stoff(kochStoff, wuergendesKuchenMonster, 170300).
stoff(kochStoff, wuerzigeOrganUeberraschung, 36000).
stoff(kochStoff, wuerzigerGemueseEintopf, 36000).
stoff(kochStoff, wuerzigerKaese, 9000).
stoff(kochStoff, wuerzigesEis, 44000).
stoff(kochStoff, wurzelSaft, 1800).
stoff(kochStoff, zaeheOrganPaste, 40000).

/* ------------------------------- Kochzutat ---------------------------- */

/* Testpr�dikate */
/*----------------------------------------------------------------*/
stoffInFunktionEingangsStoff(Stoff) :-
	rezept:rezept(_, [[_, Stoff]], _, _);
	rezept:rezept(_, [[_, Stoff], [_, _]], _, _);
	rezept:rezept(_, [[_, _], [_, Stoff]], _, _);
	rezept:rezept(_, [[_, Stoff], [_, _], [_, _]], _, _);
	rezept:rezept(_, [[_, _], [_, Stoff], [_, _]], _, _);
	rezept:rezept(_, [[_, _], [_, _], [_, Stoff]], _, _);
	rezept:rezept(_, [[_, Stoff], [_, _], [_, _], [_, _]], _, _);
	rezept:rezept(_, [[_, _], [_, Stoff], [_, _], [_, _]], _, _);
	rezept:rezept(_, [[_, _], [_, _], [_, Stoff], [_, _]], _, _);
	rezept:rezept(_, [[_, _], [_, _], [_, _], [_, Stoff]], _, _).

stoffInFunktionErgebnisStoff(Stoff) :-
	rezept:rezept(_, _,[_,Stoff], _).
	

fehlerInputStoffNichtDefiniert(Stoff) :-
	stoffInFunktionEingangsStoff(Stoff),
	\+stoff(_, Stoff, _),
	format('~nfalscher Eingangs-Stoff: ~k~n', Stoff).

fehlerOutputStoffNichtDefiniert(Stoff) :-
	stoffInFunktionErgebnisStoff(Stoff),
	\+stoff(_, Stoff, _),
	format('~nfalscher Produkt-Stoff: ~k~n', Stoff).

produktNichtBewertet(Stoff) :-
	stoff(StoffArt, Stoff, Wert),
	/* wenn kaufbar oder verkaufbar */
	StoffArt \= bauRezept,
	StoffArt \= basisBauEndStoff,
	StoffArt \= pass,
	StoffArt \= modul,
	Wert = 0,
	format('~nElement(e) ~k ist nicht bewertet~n', Stoff)
	.

stoffNichtVerwendet(Stoff) :-
	stoff(StoffArt, Stoff, _),
	StoffArt \= handelsWare,
	StoffArt \= pass,
	StoffArt \= basisBauEndStoff,
	StoffArt \= kuriositaet,
	StoffArt \= stoerung,
	\+stoffInFunktionErgebnisStoff(Stoff),
	\+stoffInFunktionEingangsStoff(Stoff),
	format('~nElement(e) ~k ist nicht verwendet~n', Stoff),
	fail.
	
doppelteInStoff :-
	findall(Stoff0, stoff(_, Stoff0, _), StoffListe),
	sort(StoffListe, Sorted),
	dubChk(StoffListe, Sorted, Doppelte),
	Doppelte \= [],
	format('~nElement(e) ~k ist/sind doppelt~n', [Doppelte]).

dubChk(List, SortedList, Doppelte) :-
	SortedList = [],
	Doppelte = List.
	
dubChk(List, SortedList, Doppelte) :-
	SortedList = [ Kopf | SortedRest ],
	selectchk(Kopf, List, RestList),
	dubChk(RestList, SortedRest, Doppelte). 

bauteilOhneRezept(Stoff) :-
	stoff(basisBauEndStoff, Stoff, _),
	atom_string(Stoff, StoffString),
	string_concat(StoffString, 'Rezept', RezeptString),
	atom_string(Rezept, RezeptString),
	\+stoff(bauRezept, Rezept, _),
	format('~nBauteil ~k hat kein Rezept~n', Stoff).

rezeptOhneBauteil(Rezept) :-
	stoff(bauRezept, Rezept, _),
	atom_string(Rezept, RezeptString),
	sub_string(RezeptString, 0, _, 6, StoffString), 
	atom_string(Stoff, StoffString),
	\+stoff(basisBauEndStoff, Stoff, _),
	\+stoff(biomechanischesKonstrukt, Stoff, _),
	\+stoff(komponente, Stoff, _),
	\+stoff(modul, Stoff, _),
	\+stoff(produktUndKochStoff, Stoff, _),
	\+stoff(pass, Stoff, _),
	\+stoff(verbrauch, Stoff, _),
	\+stoff(produkt, Stoff, _),
	format('~nRezept ~k hat keinen Stoff~n', Rezept).

testAll :-	
	format('Eingangsstoffe testen '),
	\+stoff:fehlerInputStoffNichtDefiniert(_),
	format('ok~n'),
	format('Ausgangsstoffe testen '),
	\+stoff:fehlerOutputStoffNichtDefiniert(_),
	format('ok~n'),
	format('Wertangaben testen '),
	\+stoff:produktNichtBewertet(_),
	format('ok~n'),
	format('Doppelte testen '),
	\+stoff:doppelteInStoff,
	format('ok~n'),
	format('Verwendung testen '),
	\+stoff:stoffNichtVerwendet(_),
	format('ok~n'),
	format('Rezepte vollst�ndig testen '),
	\+bauteilOhneRezept(_),
	format('ok~n'),
	format('Rezepte �berz�hlig testen '),
	\+rezeptOhneBauteil(_),
	format('ok~n').
	
	
