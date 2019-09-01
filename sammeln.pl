:- module(sammeln, [sammelbar/3, sammelAktion/1, wandelAktion/1, fertigeLoesung/8]).

:- dynamic(sammelbar/3).
:- dynamic(fertigeLoesung/8).

/* mögliche Sammleaktionen */
sammelAktion(bekannt).
sammelAktion(pfluecken).
sammelAktion(minenLaserNutzen).
sammelAktion(verbessertenMinenLaserNutzen).
sammelAktion(terrainFormerNutzen).
sammelAktion(jagen).
sammelAktion(erkaempfen).
sammelAktion(raumSchuerfen).
sammelAktion(kaufen).
sammelAktion(rezeptInAussenPostenErwerben).
sammelAktion(rezeptAmForschungsComputerErwerben).
sammelAktion(rezeptInAnomalieErwerben).
sammelAktion(vonTierenErhalten).
sammelAktion(ernten).
sammelAktion(vorfertigen).

/* mögliche Stoffwandelaktionen */
wandelAktion(bauen).
wandelAktion(herstellen).
wandelAktion(installieren).
wandelAktion(kochen).
wandelAktion(raffinieren).
wandelAktion(rezeptInAussenPostenErwerben).
wandelAktion(rezeptAmForschungsComputerErwerben).
wandelAktion(rezeptInAnomalieErwerben).
wandelAktion(modulInRaumstationErwerben).

/* bekannte Rezepte TODO: Dynamisch machen, wenn Projektierungsmaske */
rezeptBekannt(saeureRezept).
rezeptBekannt(schmierMittelRezept).
rezeptBekannt(thermischesKondensatRezept).
rezeptBekannt(tragbarerReaktorRezept).
rezeptBekannt(instabilesGelRezept).
rezeptBekannt(glasRezept).
rezeptBekannt(polyFaserRezept).
rezeptBekannt(angereicherterKohlenStoffRezept).
rezeptBekannt(stickStoffSalzRezept).
rezeptBekannt(aroniumRezept).
rezeptBekannt(quantumProzessorRezept).
rezeptBekannt(kryogenKammerRezept).
rezeptBekannt(fluessigSprengStoffRezept).
rezeptBekannt(lebendesGlasRezept).
rezeptBekannt(hitzeKondensatorRezept).
rezeptBekannt(schaltPlatteRezept).
rezeptBekannt(organischerKatalysatorRezept).
rezeptBekannt(halbLeiterRezept).
rezeptBekannt(heissesEisRezept).
rezeptBekannt(strassenKoeterBronzeRezept).
rezeptBekannt(heroxRezept).
rezeptBekannt(lemmiumRezept).
rezeptBekannt(magnoGoldRezept).
rezeptBekannt(grantineRezept).
rezeptBekannt(fusionsZuenderRezept).
rezeptBekannt(staseGeraetRezept).
rezeptBekannt(fusionsBeschleunigerRezept).
rezeptBekannt(supraLeiterRezept).
rezeptBekannt(kryoPumpeRezept).
rezeptBekannt(iridesitRezept).
rezeptBekannt(geoDesitRezept).

/* ------------------------- Rezepte für Komponenten und Geräte  --------------------- */
rezeptBekannt(lebensErhaltungsGelRezept).
rezeptBekannt(diWasserStoffGeleeRezept).
rezeptBekannt(ionenAkkuRezept).
rezeptBekannt(warpZelleRezept).
rezeptBekannt(kohlenStoffKristallRezept).
rezeptBekannt(seltenesMetallElementRezept).
rezeptBekannt(tetraKobaltRezept).
rezeptBekannt(chlorGitterRezept).
rezeptBekannt(instabilesNatriumRezept).
rezeptBekannt(superOxidKristallRezept).
rezeptBekannt(raumSchiffStartTreibStoffRezept).
rezeptBekannt(fortschrittlicherIonenAkkuRezept).
rezeptBekannt(atlasPassV1Rezept).
rezeptBekannt(kobaltSpiegelRezept).
rezeptBekannt(salzRefaktorRezept).
rezeptBekannt(natriumDiodeRezept).
rezeptBekannt(sauerStoffFilterRezept).
rezeptBekannt(sauerStoffKapselRezept).
rezeptBekannt(hydrothermaleTreibStoffZelleRezept).
rezeptBekannt(instabilesPlasmaRezept).
rezeptBekannt(sternenSchildBatterieRezept).
rezeptBekannt(atlasPassV2Rezept).
rezeptBekannt(warpHyperKernRezept).
rezeptBekannt(atlasPassV3Rezept).

/* ------------------------- Sonstige Rezepte ---------------------------------------- */
rezeptBekannt(hermetischesSiegelRezept).
rezeptBekannt(kohlenStoffNanoRohrRezept).
rezeptBekannt(metallPlattenRezept).
rezeptBekannt(projektilMunitionRezept).
rezeptBekannt(antiMaterieRezept).
rezeptBekannt(antiMaterieGehaeuseRezept).
rezeptBekannt(mikroProzessorRezept).
rezeptBekannt(kreaturenKugelnRezept).

/* ------------------------- Frachterrezepte ----------------------------------------- */
rezeptBekannt(fregattenTreibStoff50toRezept).
rezeptBekannt(fregattenTreibStoff100toRezept).
rezeptBekannt(fregattenTreibStoff200toRezept).

/* ------------------------- Fregattenrezepte ---------------------------------------- */
rezeptBekannt(treibStoffOxidantRezept).
rezeptBekannt(gedankenKontrollGeraetRezept).
rezeptBekannt(holografischerAnalysatorRezept).
rezeptBekannt(sprengDrohnenRezept).
rezeptBekannt(mineralKompressorRezept).

/* =====================  Questrezepte -------------------------------------------- */
rezeptBekannt(gefangeneNanodeRezept).
rezeptBekannt(umhuellterSchattenRezept).
rezeptBekannt(nooSphaerischKugelRezept).
rezeptBekannt(dunkleMaterieRezept).
rezeptBekannt(endeDerDaemmerungRezept).
rezeptBekannt(photischerJadeRezept).
rezeptBekannt(zustandsPhaseRezept).
rezeptBekannt(novaeRegeneratRezept).
rezeptBekannt(modifizierteQuantenRezept).
rezeptBekannt(herzDerSonneRezept).
rezeptBekannt(sternenSamenRezept).
rezeptBekannt(seelenEngineRezept).
rezeptBekannt(gedankenBogenRezept).

/* %%%%%%%%%%%%%%%%%%%%%  Anzugmodule erforschbar %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
rezeptBekannt(lebensErhaltungRezept).
rezeptBekannt(gefahrGutSchutzHandschuhRezept).
rezeptBekannt(gefahrenSchutzRezept).
rezeptBekannt(sauerStoffWiederVerwerterCRezept).
rezeptBekannt(jetPackRezept).
rezeptBekannt(einfacherUeberSetzerBRezept).
rezeptBekannt(kuehlMittelNetzwerkCRezept).
rezeptBekannt(waermeSchichtCRezept).
rezeptBekannt(toxinDaempferCRezept).
rezeptBekannt(strahlungsDeflektorCRezept).
rezeptBekannt(belueftungsMembranBRezept).
rezeptBekannt(schildGitterBRezept).
rezeptBekannt(sauerStoffUmleiterARezept).
rezeptBekannt(neuralStimulatorBRezept).
rezeptBekannt(raketenStiefelARezept).
rezeptBekannt(effizienteWasserDuesenARezept).
rezeptBekannt(verbesserterUebersetzerARezept).
rezeptBekannt(perfektionierterUebersetzerSRezept).

/* %%%%%%%%%%%%%%%%%%%%%  Fahrzeugmodule %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
rezeptBekannt(fusionsAntriebRezept).
rezeptBekannt(humboldtAntriebRezept).
rezeptBekannt(exoFahrzeugSignalBoosterRezept).
rezeptBekannt(exoFahrzeugBeschleunigungsModulRezept).
rezeptBekannt(exoFahrzeugMinenLaserRezept).
rezeptBekannt(osmotischerGeneratorCRezept).
rezeptBekannt(hochleistungsSonarRezept).
rezeptBekannt(tethysStrahlRezept).
rezeptBekannt(nautilonKanoneRezept).
rezeptBekannt(exoFahrzeugSignalBoosterUpgradeSigmaBRezept).
rezeptBekannt(exoFahrzeugMinenLaserUpgradeSigmaARezept).
rezeptBekannt(exoFahrzeugBordKanoneRezept).
rezeptBekannt(exoFahrzeugSignalBoosterUpgradeTauARezept).

/* %%%%%%%%%%%%%%%%%%%%%  Raumschiff-Module %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
rezeptBekannt(impulsAntriebRezept).
rezeptBekannt(teleportEmpfaengerRezept).
rezeptBekannt(hyperAntriebRezept).
rezeptBekannt(startSchubDueseRezept).
rezeptBekannt(deflektorSchildRezept).
rezeptBekannt(photonenKanoneRezept).
rezeptBekannt(konfliktScannerRezept).
rezeptBekannt(wirtschaftsScannerRezept).
rezeptBekannt(cadmiumAntriebBRezept).
rezeptBekannt(effizienteDuesenBRezept).
rezeptBekannt(ablativePanzerungCRezept).
rezeptBekannt(nichtlineareOptikCRezept).
rezeptBekannt(raketenWerferRezept).
rezeptBekannt(phasenStrahlerRezept).
rezeptBekannt(positronenWerferRezept).
rezeptBekannt(infraMesserRezept).
rezeptBekannt(zyklotronBallisteRezept).
rezeptBekannt(emerilAntriebARezept).
rezeptBekannt(startSystemLadeGeraetSRezept).
rezeptBekannt(grosseRaketenRohreBRezept).
rezeptBekannt(fourierBegrenzerBRezept).
rezeptBekannt(fragmentSuperAufladerBRezept).
rezeptBekannt(nichtlineareOptikBRezept).
rezeptBekannt(dysonPumpeBRezept).
rezeptBekannt(indiumAntriebSRezept).

/* %%%%%%%%%%%%%%%%%%%%%  Frachter-Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
rezeptBekannt(frachterWarpReaktorSigmaCRezept).
rezeptBekannt(frachterWarpReaktorTauBRezept).
rezeptBekannt(frachterWarpReaktorThetaARezept).

/* %%%%%%%%%%%%%%%%%%%%%  Multiwerkzeug-Module %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
rezeptBekannt(analyseVisierRezept).
rezeptBekannt(scannerRezept).
rezeptBekannt(terrainManipulatorRezept).
rezeptBekannt(minenLaserRezept).
rezeptBekannt(blitzWerferRezept).
rezeptBekannt(eigenesKraftFeldRezept).
rezeptBekannt(fortgeschrittenerMinenLaserARezept).
rezeptBekannt(wellenFormWiederVerwerterBRezept).
rezeptBekannt(laufIonisatorCRezept).
rezeptBekannt(plasmaWerferRezept).
rezeptBekannt(glutSpeerRezept).
rezeptBekannt(streuBlasterRezept).
rezeptBekannt(impulsWerferRezept).
rezeptBekannt(kampfVisierRezept).
rezeptBekannt(optischerBohrerSRezept).
rezeptBekannt(untersuchungsGeraetARezept).
rezeptBekannt(geologieKanoneRezept).
rezeptBekannt(masseBeschleunigerCRezept).
rezeptBekannt(geschossSchmiererCRezept).
rezeptBekannt(verstaerkteKartuschenCRezept).

/* %%%%%%%%%%%%%%%%%%%%%  Siedlung-Bau-Rezepte nicht erforschbar %%%%%%%%%%%%%%%%%%%%% */
/* =====================  allgemein ================================================== */
rezeptBekannt(basisBergungsKapselRezept).
rezeptBekannt(kommunikationsStationRezept).
rezeptBekannt(autonomeBergBauEinheitRezept).
rezeptBekannt(atmosphaerenVerarbeitungsAnlageRezept).
rezeptBekannt(nachrichtenModulRezept).

/* =====================  tragbar ==================================================== */
rezeptBekannt(basisComputerRezept).
rezeptBekannt(konstruktionsForschungsStationRezept).
rezeptBekannt(tragbareRaffinerieRezept).
rezeptBekannt(speicherPunktRezept).

/* =====================  Lager ====================================================== */
rezeptBekannt(verschlosseneKisteRezept).

/* =====================  Terminals ================================================== */
rezeptBekannt(konstruktionsTerminalRezept).
rezeptBekannt(exoFahrzeugTerminalRezept).
rezeptBekannt(waffenTerminalRezept).
rezeptBekannt(wissenschaftsTerminalRezept).
rezeptBekannt(landwirtschaftsTerminalRezept).

/* =====================  Frachter =================================================== */
rezeptBekannt(flottenKommandoRaumRezept).
rezeptBekannt(grosserFrachtRaumRezept).
rezeptBekannt(frachterKorridorRezept).
rezeptBekannt(gebogenerFrachterKorridorRezept).
rezeptBekannt(frachterKreuzungDreiFachRezept).
rezeptBekannt(frachterTreppeRezept).
rezeptBekannt(frachterKreuzungVierFachRezept).

/* %%%%%%%%%%%%%%%%%%%%%  Siedlung-Bau-Rezepte erforschbar %%%%%%%%%%%%%%%%%%%%%%%%%%% */
/* =====================  gross vorgefertigt ========================================= */
rezeptBekannt(zylindrischerRaumRezept).
rezeptBekannt(quadratischerRaumRezept).
rezeptBekannt(geraderKorridorRezept).
rezeptBekannt(tuerRezept).
rezeptBekannt(fundamentRezept).
rezeptBekannt(lFoermigerKorridorRezept).
rezeptBekannt(korridorMitGlasDachRezept).
rezeptBekannt(holoTuerRezept).
rezeptBekannt(zugangsRampeRezept).
rezeptBekannt(rollTorRezept).
rezeptBekannt(pflasterungVierFachRezept).
rezeptBekannt(viererFundamentStrebeRezept).
rezeptBekannt(fundamentStrebeRezept).
rezeptBekannt(zylindrischerRaumRahmenRezept).
rezeptBekannt(tFoermigerKorridorRezept).
rezeptBekannt(xFoermigerKorridorRezept).
rezeptBekannt(korridorFensterRezept).
rezeptBekannt(bioKuppelRaumRezept).
rezeptBekannt(gebogenerKorridorRezept).
rezeptBekannt(leiterRezept).
rezeptBekannt(pflasterungRezept).
rezeptBekannt(pflasterungPodestRezept).
rezeptBekannt(grossesGlasPaneelRezept).
rezeptBekannt(aussichtsKugelRezept).

/* =====================  klein vorgefertigt ========================================= */
rezeptBekannt(wuerfelFoermigerRaumRezept).
rezeptBekannt(wuerfelRaumFundamentStrebeRezept).
rezeptBekannt(gewoelbteWuerfelFoermigeWandRezept).
rezeptBekannt(wuerfelFoermigerGlasRaumRezept).
rezeptBekannt(wuerfelFoermigerRaumRahmenRezept).
rezeptBekannt(wuerfelFoermigerRaumBodenRezept).
rezeptBekannt(wuerfelRaumViererFundamentStrebeRezept).
rezeptBekannt(innenTreppenRezept).
rezeptBekannt(wuerfelFoermigeInnenWandRezept).
rezeptBekannt(wuerfelFoermigerDachAufsatzRezept).
rezeptBekannt(gewoelbtesWuerfelFoermigesDachRezept).
rezeptBekannt(wuerfelFoermigesFensterEckigRezept).
rezeptBekannt(wuerfelFoermigesFensterRundRezept).
rezeptBekannt(infraStrukturLeiterRezept).
rezeptBekannt(wuerfelFoermigeInnenTuerRezept).

/* =====================  Technologiemodule ========================================== */
/* ---------------------  Konstruktionsforschungsstation ----------------------------- */
rezeptBekannt(basisTelePorterModulRezept).
rezeptBekannt(bioTreibStoffReaktorRezept).
rezeptBekannt(speicherSignalRezept).
rezeptBekannt(gesundheitsStationRezept).
rezeptBekannt(signalBoosterRezept).
rezeptBekannt(batterieRezept).
rezeptBekannt(solarModulRezept).
rezeptBekannt(gefahrenSchutzEinheitRezept).

/* ---------------------  Anomalie  -------------------------------------------------- */
rezeptBekannt(naehrStoffProzessorRezept).
rezeptBekannt(lagerBehaelterRezept).
rezeptBekannt(aussehenModifikatorRezept).
rezeptBekannt(landeFeldRezept).
rezeptBekannt(nutzTierEinheitRezept).
rezeptBekannt(automatischerFuettererRezept).
rezeptBekannt(terminalDesGalaktischenMarktesRezept).
rezeptBekannt(kurzStreckenTelePorterRezept).
rezeptBekannt(mittlereRaffinerieRezept).
rezeptBekannt(grosseRaffinerieRezept).
rezeptBekannt(antiMaterieReaktorRezept).

/* =====================  Transportmodule ============================================ */
rezeptBekannt(roamerGeoBuchtRezept).
rezeptBekannt(nomadenGeoBuchtRezept).
rezeptBekannt(exoFahrzeugRufStationRezept).
rezeptBekannt(nautilonKammerRezept).
rezeptBekannt(pilgerGeoBuchtRezept).
rezeptBekannt(kolossGeoBuchtRezept).
rezeptBekannt(rennInitiatorRezept).
rezeptBekannt(rennHindernisRezept).
rezeptBekannt(rennKraftVerstaerkerRezept).

/* =====================  Wasser ===================================================== */
rezeptBekannt(tiefSeeKammerRezept).
rezeptBekannt(meeresUnterSchlupfRezept).
rezeptBekannt(glasTunnelRezept).
rezeptBekannt(quadratischeTiefSeeKammerRezept).
rezeptBekannt(wasserDichteTuerRezept).
rezeptBekannt(lFoermigerGlasTunnelRezept).
rezeptBekannt(vertikalerGlasTunnelRezept).
rezeptBekannt(mondTeichBodenRezept).
rezeptBekannt(tFoermigerGlasTunnelRezept).
rezeptBekannt(xFoermigerGlasTunnelRezept).

/* =====================  Motiv Designs ============================================== */
rezeptBekannt(motivStilisiertesRRezept).
rezeptBekannt(motivRundPipetteRezept).
rezeptBekannt(motivFaltungDuennDickRezept).
rezeptBekannt(motivZiegelSteineRezept).
rezeptBekannt(motivRadioAktivGrauRezept).
rezeptBekannt(motivGrabSteinRezept).
rezeptBekannt(motivHelloGamesRezept).
rezeptBekannt(motivBuegelRezept).
rezeptBekannt(motivNo1Rezept).
rezeptBekannt(motivNo2Rezept).
rezeptBekannt(motivNo3Rezept).
rezeptBekannt(motivNo4Rezept).
rezeptBekannt(motivNo5Rezept).
rezeptBekannt(motivNo6Rezept).
rezeptBekannt(motivNo7Rezept).
rezeptBekannt(motivNo8Rezept).
rezeptBekannt(motivNo9Rezept).
rezeptBekannt(motivSchildErstochenerVogelRezept).
rezeptBekannt(motivSchildGrünerMannRezept).
rezeptBekannt(motivSchildKorvaxRezept).
rezeptBekannt(motivFroschSackRezept).
rezeptBekannt(motivLaemmchenRezept).

/* =====================  Dekorative Module 1 ======================================== */
rezeptBekannt(wandBildSchirmRezept).
rezeptBekannt(wandVentilatorRezept).
rezeptBekannt(gruenerWandBildSchirmRezept).
rezeptBekannt(schubLadenSchrankRezept).
rezeptBekannt(wandEinheitRezept).
rezeptBekannt(lagerModulDekoRezept).
rezeptBekannt(deckenPaneelRezept).
rezeptBekannt(techBedienFeldRezept).
rezeptBekannt(serverRezept).
rezeptBekannt(kanisterRegalRezept).
rezeptBekannt(kleineKisteRezept).
rezeptBekannt(schliessFachRezept).
rezeptBekannt(flachesModulRezept).
rezeptBekannt(seitenModulRezept).
rezeptBekannt(regalModulRezept).
rezeptBekannt(roboterArmRezept).
rezeptBekannt(waffenRegalRezept).
rezeptBekannt(oszilloskopRezept).
rezeptBekannt(achtEckSchrankRezept).
rezeptBekannt(fassFoermigerFabrikatorRezept).
rezeptBekannt(hoherSchrankRezept).
rezeptBekannt(kistenFoermigerFabrikatorRezept).

/* =====================  Dekorative Module 2 ======================================== */
rezeptBekannt(stuhlRezept).
rezeptBekannt(flagge1Rezept).
rezeptBekannt(tischRezept).
rezeptBekannt(bettRezept).
rezeptBekannt(sofaRezept).
rezeptBekannt(flagge2Rezept).
rezeptBekannt(wandFlagge1Rezept).
rezeptBekannt(einfacherSchreibTischRezept).
rezeptBekannt(ergonomischesSofaRezept).
rezeptBekannt(eckSofaRezept).
rezeptBekannt(flagge3Rezept).
rezeptBekannt(flagge4Rezept).
rezeptBekannt(wandFlagge3Rezept).
rezeptBekannt(wandFlagge2Rezept).
rezeptBekannt(bodenMatteRezept).
rezeptBekannt(grosseMonitorStationRezept).
rezeptBekannt(gewoelbterTischRezept).
rezeptBekannt(monitorStationRezept).
rezeptBekannt(arbeitsPlatteRezept).
rezeptBekannt(leichterTischRezept).

/* =====================  Beleuchtung ================================================ */
rezeptBekannt(lichtHandLampeRezept).
rezeptBekannt(farbigeLeuchteRezept).
rezeptBekannt(lichtStehLampeEckigRezept).
rezeptBekannt(laborLampeRezept).
rezeptBekannt(farbigeLeuchteBlauRezept).
rezeptBekannt(farbigeLeuchteOrangeRezept).
rezeptBekannt(lichtStehLampeRundRezept).
rezeptBekannt(lichtStehLampeSchirmRezept).
rezeptBekannt(deckenLeuchteRezept).
rezeptBekannt(farbigeLeuchteGelbRezept).
rezeptBekannt(farbigeLeuchteGruenRezept).
rezeptBekannt(farbigeLeuchteRotRezept).

/* =====================  Industriemodule ============================================ */
rezeptBekannt(elektrischeVerkabelungRezept).
rezeptBekannt(treibStoffReaktorRezept).
rezeptBekannt(mineralienExtraktorRezept).
rezeptBekannt(wandSchalterRezept).
rezeptBekannt(solarModulRezept).
rezeptBekannt(batterieRezept).
rezeptBekannt(gasExtraktorRezept).
rezeptBekannt(versorgungsDepotRezept).
rezeptBekannt(versorgungsRohrRezept).
rezeptBekannt(bodenSchalterRezept).
rezeptBekannt(annaeherungsSchalterRezept).
rezeptBekannt(schalterRezept).
rezeptBekannt(energieUmkehrerRezept).
rezeptBekannt(elektroMagnetischerGeneratorRezept).

/* =====================  Landwirtschaftsmodule ====================================== */
rezeptBekannt(hydroKulturTrogRezept).
rezeptBekannt(topfPflanzeRezept).
rezeptBekannt(grosserHydroKulturTrogRezept).
rezeptBekannt(pilzGeflechtRezept).
rezeptBekannt(frostWurzRezept).
rezeptBekannt(gammaGrasRezept).
rezeptBekannt(echinoKaktusRezept).
rezeptBekannt(sternenDornRezept).
rezeptBekannt(sonnenRebeRezept).
rezeptBekannt(floraBehaelterHochBeetRezept).
rezeptBekannt(floraBehaelterKastenRezept).
rezeptBekannt(floraBehaelterTubusRezept).
rezeptBekannt(giftIgelRezept).
rezeptBekannt(gravitinoWirtRezept).
rezeptBekannt(magenKrampfBlumeRezept).
rezeptBekannt(morditWurzelRezept).
rezeptBekannt(eiweissPerlenKugelRezept).
rezeptBekannt(nipNipRezept).

/* =====================  Unterschlüpfe aus Holz (auch Konstruktionsforschungsstation) */
rezeptBekannt(holzWandRezept).
rezeptBekannt(holzBodenPlatteRezept).
rezeptBekannt(duenneHolzWandRezept).
rezeptBekannt(holzTuerRahmenRezept).
rezeptBekannt(holzDachRezept).
rezeptBekannt(glasPlatteMitHolzRahmenRezept).
rezeptBekannt(holzRampeRezept).
rezeptBekannt(kleineHolzPlatteRezept).
rezeptBekannt(schraegeHolzPlatteRezept).
rezeptBekannt(kleineHolzWandRezept).
rezeptBekannt(holzFensterRezept).
rezeptBekannt(holzTuerRezept).
rezeptBekannt(elektrischeHolzTuerRezept).
rezeptBekannt(holzDachPlatteRezept).
rezeptBekannt(holzDachEckStueckRezept).
rezeptBekannt(holzBogenRezept).
rezeptBekannt(halbeHolzRampeRezept).
rezeptBekannt(kurzeHolzWandRezept).
rezeptBekannt(holzFassadeRezept).
rezeptBekannt(kleineHolzTuerRezept).
rezeptBekannt(grosseElektrischeHolzTuerRezept).
rezeptBekannt(dachInnenEckteilAusHolzRezept).
rezeptBekannt(halberHolzBogenRezept).

/* =====================  Unterschlüpfe aus Metall (Konstruktionsforschungsstation) == */
rezeptBekannt(metallWandRezept).
rezeptBekannt(metallBodenPlatteRezept).
rezeptBekannt(duenneMetallWandRezept).
rezeptBekannt(metallTuerRahmenRezept).
rezeptBekannt(metallDachRezept).
rezeptBekannt(glasPlatteMitMetallRahmenRezept).
rezeptBekannt(metallRampeRezept).
rezeptBekannt(kleineMetallPlatteRezept).
rezeptBekannt(schraegeMetallPlatteRezept).
rezeptBekannt(kleineMetallWandRezept).
rezeptBekannt(metallFensterRezept).
rezeptBekannt(metallTuerRezept).
rezeptBekannt(elektrischeMetallTuerRezept).
rezeptBekannt(metallDachPlatteRezept).
rezeptBekannt(metallDachEckStueckRezept).
rezeptBekannt(metallBogenRezept).
rezeptBekannt(halbeMetallRampeRezept).
rezeptBekannt(kurzeMetallWandRezept).
rezeptBekannt(metallFassadeRezept).
rezeptBekannt(kleineMetallTuerRezept).
rezeptBekannt(grosseElektrischeMetallTuerRezept).
rezeptBekannt(dachInnenEckteilAusMetallRezept).
rezeptBekannt(halberMetallBogenRezept).

/* =====================  Unterschlüpfe aus Beton (Konstruktionsforschungsstation) === */
rezeptBekannt(betonWandRezept).
rezeptBekannt(betonBodenPlatteRezept).
rezeptBekannt(duenneBetonWandRezept).
rezeptBekannt(betonTuerRahmenRezept).
rezeptBekannt(betonDachRezept).
rezeptBekannt(glasPlatteMitBetonRahmenRezept).
rezeptBekannt(betonRampeRezept).
rezeptBekannt(kleineBetonBodenPlatteRezept).
rezeptBekannt(schraegeBetonPlatteRezept).
rezeptBekannt(kleineBetonWandRezept).
rezeptBekannt(betonFensterRezept).
rezeptBekannt(betonTuerRezept).
rezeptBekannt(elektrischeBetonTuerRezept).
rezeptBekannt(betonDachPlatteRezept).
rezeptBekannt(betonDachEckStueckRezept).
rezeptBekannt(betonBogenRezept).
rezeptBekannt(halbeBetonRampeRezept).
rezeptBekannt(kurzeBetonWandRezept).
rezeptBekannt(betonFassadeRezept).
rezeptBekannt(kleineBetonTuerRezept).
rezeptBekannt(grosseElektrischeBetonTuerRezept).
rezeptBekannt(dachInnenEckteilAusBetonRezept).
rezeptBekannt(halberBetonBogenRezept).

/* =====================  Primitive Formen =========================================== */
rezeptBekannt(grosserKeilRezept).
rezeptBekannt(kleinerKeilRezept).
rezeptBekannt(rohrRezept).
rezeptBekannt(pyramideRezept).
rezeptBekannt(gebogenesRohrRezept).
rezeptBekannt(stabilerWuerfelRezept).
rezeptBekannt(zylinderRezept).
rezeptBekannt(wuerfelRezept).
rezeptBekannt(kugelRezept).

/* Pflanzen ohne Gerät wild ernten */
pfluecken(natrium, 20).
pfluecken(sauerStoff, 20).
pfluecken(pilzSchimmel, 20).
pfluecken(kristallSulfid, 20).
pfluecken(kelpBeutel, 20).
pfluecken(korvaxKonvergenzWuerfel, 20).
pfluecken(zytoPhosphat, 20).

/* seit Koch Update */
pfluecken(aloeFleisch, 20).
pfluecken(beutelGift, 20).
pfluecken(eiweissPerle, 20).
pfluecken(feuerBeere, 20).
pfluecken(fleischigeWurzeln, 20).
pfluecken(frostKristall, 20).
pfluecken(gammaWurzel, 20).
pfluecken(gefroreneKnollen, 20).
pfluecken(grahBeere, 20).
pfluecken(gravitinoBall, 20).
pfluecken(heptaPloidWeizen, 20).
pfluecken(hexaBeere, 20).
pfluecken(impulsBohnen, 20).
pfluecken(jadeErbsen, 20).
pfluecken(kaktusFleisch, 20).
pfluecken(nipNipKnospen, 20).
pfluecken(pilzSchimmel, 20).
pfluecken(solanium, 0).
pfluecken(sternenKnolle, 20).
pfluecken(sturmKristall, 20).
pfluecken(suessWurzel, 20).

/* nutzbare anomalieen (Deko) */
pfluecken(defekterSeparator).
pfluecken(lichtBruch).

/* mit Minenlaser auf Planet */
minenLaserNutzen(ammoniak, 7).
minenLaserNutzen(cadmium, 0).
minenLaserNutzen(deuterium, 0).
minenLaserNutzen(diWasserStoff, 4).
minenLaserNutzen(ferritStaub, 3).
minenLaserNutzen(gammaWurzel, 4).
minenLaserNutzen(geode, 0).
minenLaserNutzen(kelpBeutel, 20).
minenLaserNutzen(kristallFragment, 0).
minenLaserNutzen(kobalt, 4).
minenLaserNutzen(kohlenStoff, 2).
minenLaserNutzen(kuerbisKnolle, 5).
minenLaserNutzen(natrium, 7).
minenLaserNutzen(pilzSchimmel, 1).
minenLaserNutzen(sauerStoff, 9).
minenLaserNutzen(sternenKnolle, 0).
minenLaserNutzen(stickStoff, 9).
minenLaserNutzen(sturmKristall, 0).

/* mit Terrainformer abbauen */
terrainFormerNutzen(aktiviertesCadmium, 0).
terrainFormerNutzen(aktiviertesEmeril, 0).
terrainFormerNutzen(aktiviertesIndium, 0).
terrainFormerNutzen(aktiviertesKupfer, 0).
terrainFormerNutzen(ammoniak, 3).
terrainFormerNutzen(cadmium, 0).
terrainFormerNutzen(emeril, 0).
terrainFormerNutzen(indmium, 0).
terrainFormerNutzen(kupfer, 3).
terrainFormerNutzen(natrium, 6).
terrainFormerNutzen(silikatPulver, 6).

/* mit Terrainformer ausgraben */
terrainFormerNutzen(schmutzigeKnochenFragmente, 300).
terrainFormerNutzen(geborgeneDaten, 300).

/* verbesserter Minenlaser */
verbessertenMinenLaserNutzen(reinesFerrit, 3).
verbessertenMinenLaserNutzen(paraffinium, 3).
verbessertenMinenLaserNutzen(mordit, 3).

/* Jagd */
jagen(beinFleisch, 20).
jagen(diploStuecke, 20).
jagen(fleischigeStuecke, 20).
jagen(fleischigeFluegel, 20).
jagen(innereienBeutel, 20).
jagen(katzenLeber, 20).
jagen(mordit, 20).
jagen(protoWurst, 20).
jagen(rohesSteak, 20).
jagen(salzigeFischFilets, 20).
jagen(schreiterWurst, 20).
jagen(schuppigesFleisch, 20).

/* bei Zerstörung von Wesen */
erkaempfen(pugneum, 12000).      /* von Wächter */
erkaempfen(hypnotischesAuge, 0). /* von abyssal horror */
erkaempfen(larvenKern, 0).       /* von flüsterndes Ei */
erkaempfen(lebendePerle, 0).     /* von gepanzerte Muschel */
erkaempfen(kampfLaeuferGehirn, 0).     /* von gepanzerte Muschel */
erkaempfen(unholdRogen, 0).     /* von ??? */

/* Meteoritenfelder */
raumSchuerfen(tritium, 2).
raumSchuerfen(gold, 75).
raumSchuerfen(goldKlumpen, 0).
raumSchuerfen(tritiumHyperCluster, 0).
raumSchuerfen(silber, 16).
raumSchuerfen(platin, 20).

/* kaufen */
kaufen(kabelBaum, 0).
kaufen(restSubstanz, 0).

/* Aus Anbau */
ernten(frostKristall, 20).
ernten(eiweissPerle, 20).
ernten(gammaWurzel, 20).
ernten(gravitinoBall, 20).
ernten(pilzSchimmel, 20).
ernten(faecium, 20).
ernten(kaktusFleisch, 20).
ernten(sternenKnolle, 20).
ernten(mordit, 20).
ernten(solanium, 20).
ernten(gravitinoBall, 20).

/* aus Tierhaltung */
vonTierErhalten(faecium, 20).
vonTierErhalten(frischeMilch, 20).
vonTierErhalten(grosseEier, 20).
vonTierErhalten(holzApfel, 20).
vonTierErhalten(klebrigerHonig, 20).
vonTierErhalten(kreaturenEi, 20).
vonTierErhalten(leopardenFrucht, 20).
vonTierErhalten(regisFett, 20).
vonTierErhalten(riesenEi, 20).
vonTierErhalten(warmeProtoMilch, 20).
vonTierErhalten(wildeMilch, 20).


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
vorfertigen(organischerKatalysator).
vorfertigen(geheimnisVollerFleischEintopf).

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
	Operation = bekannt,
	rezeptBekannt(Stoff),
	HauptZeit = 0.

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = pfluecken,
	pfluecken(Stoff, HauptZeit).

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
	Operation = jagen,
	spielStatus:spielStatus(waffeVorhanden, true),
	jagen(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = erkaempfen,
	spielStatus:spielStatus(kampfWille, true),
	erkaempfen(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = raumSchuerfen,
	spielStatus:spielStatus(raumSchiffIstFlott, true),
	raumSchuerfen(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = kaufen,
	spielStatus:spielStatus(torWarpVerfügbar, true),
	kaufen(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = ernten,
	/* evtl hier noch status pflanzeReif einbauen */
	ernten(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = vonTierenErhalten,
	vonTierErhalten(Stoff, HauptZeit).



