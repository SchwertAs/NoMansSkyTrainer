:- module(sammlung, [sammlung/5, sammelbar/2, fertigeLoesung/3]).

:- dynamic(sammelbar/2).
:- dynamic(fertigeLoesung/3).

/* bekannte Rezepte TODO: Dynamisch machen, wenn Projektierungsmaske */
/* sammlung(<SammelAktion>, <Stoff>, <Hauptzeit>, <Nebenzeit>, <Rüstzeit>) */
sammlung(bekannt, saeureRezept, 0, 0, 0).
sammlung(bekannt, schmierMittelRezept, 0, 0, 0).
sammlung(bekannt, thermischesKondensatRezept, 0, 0, 0).
sammlung(bekannt, tragbarerReaktorRezept, 0, 0, 0).
sammlung(bekannt, instabilesGelRezept, 0, 0, 0).
sammlung(bekannt, glasRezept, 0, 0, 0).
sammlung(bekannt, polyFaserRezept, 0, 0, 0).
sammlung(bekannt, angereicherterKohlenStoffRezept, 0, 0, 0).
sammlung(bekannt, stickStoffSalzRezept, 0, 0, 0).
sammlung(bekannt, aroniumRezept, 0, 0, 0).
sammlung(bekannt, quantumProzessorRezept, 0, 0, 0).
sammlung(bekannt, kryogenKammerRezept, 0, 0, 0).
sammlung(bekannt, fluessigSprengStoffRezept, 0, 0, 0).
sammlung(bekannt, lebendesGlasRezept, 0, 0, 0).
sammlung(bekannt, hitzeKondensatorRezept, 0, 0, 0).
sammlung(bekannt, schaltPlatteRezept, 0, 0, 0).
sammlung(bekannt, organischerKatalysatorRezept, 0, 0, 0).
sammlung(bekannt, halbLeiterRezept, 0, 0, 0).
sammlung(bekannt, heissesEisRezept, 0, 0, 0).
sammlung(bekannt, strassenKoeterBronzeRezept, 0, 0, 0).
sammlung(bekannt, heroxRezept, 0, 0, 0).
sammlung(bekannt, lemmiumRezept, 0, 0, 0).
sammlung(bekannt, magnoGoldRezept, 0, 0, 0).
sammlung(bekannt, grantineRezept, 0, 0, 0).
sammlung(bekannt, fusionsZuenderRezept, 0, 0, 0).
sammlung(bekannt, staseGeraetRezept, 0, 0, 0).
sammlung(bekannt, fusionsBeschleunigerRezept, 0, 0, 0).
sammlung(bekannt, supraLeiterRezept, 0, 0, 0).
sammlung(bekannt, kryoPumpeRezept, 0, 0, 0).
sammlung(bekannt, iridesitRezept, 0, 0, 0).
sammlung(bekannt, geoDesitRezept, 0, 0, 0).

/* ------------------------- Rezepte für Komponenten und Geräte  --------------------- */
sammlung(bekannt, lebensErhaltungsGelRezept, 0, 0, 0).
sammlung(bekannt, diWasserStoffGeleeRezept, 0, 0, 0).
sammlung(bekannt, ionenAkkuRezept, 0, 0, 0).
sammlung(bekannt, warpZelleRezept, 0, 0, 0).
sammlung(bekannt, kohlenStoffKristallRezept, 0, 0, 0).
sammlung(bekannt, seltenesMetallElementRezept, 0, 0, 0).
sammlung(bekannt, tetraKobaltRezept, 0, 0, 0).
sammlung(bekannt, chlorGitterRezept, 0, 0, 0).
sammlung(bekannt, instabilesNatriumRezept, 0, 0, 0).
sammlung(bekannt, superOxidKristallRezept, 0, 0, 0).
sammlung(bekannt, raumSchiffStartTreibStoffRezept, 0, 0, 0).
sammlung(bekannt, fortschrittlicherIonenAkkuRezept, 0, 0, 0).
sammlung(bekannt, atlasPassV1Rezept, 0, 0, 0).
sammlung(bekannt, kobaltSpiegelRezept, 0, 0, 0).
sammlung(bekannt, salzRefaktorRezept, 0, 0, 0).
sammlung(bekannt, natriumDiodeRezept, 0, 0, 0).
sammlung(bekannt, sauerStoffFilterRezept, 0, 0, 0).
sammlung(bekannt, sauerStoffKapselRezept, 0, 0, 0).
sammlung(bekannt, hydrothermaleTreibStoffZelleRezept, 0, 0, 0).
sammlung(bekannt, instabilesPlasmaRezept, 0, 0, 0).
sammlung(bekannt, sternenSchildBatterieRezept, 0, 0, 0).
sammlung(bekannt, atlasPassV2Rezept, 0, 0, 0).
sammlung(bekannt, warpHyperKernRezept, 0, 0, 0).
sammlung(bekannt, atlasPassV3Rezept, 0, 0, 0).

/* ------------------------- Sonstige Rezepte ---------------------------------------- */
sammlung(bekannt, hermetischesSiegelRezept, 0, 0, 0).
sammlung(bekannt, kohlenStoffNanoRohrRezept, 0, 0, 0).
sammlung(bekannt, metallPlattenRezept, 0, 0, 0).
sammlung(bekannt, projektilMunitionRezept, 0, 0, 0).
sammlung(bekannt, antiMaterieRezept, 0, 0, 0).
sammlung(bekannt, antiMaterieGehaeuseRezept, 0, 0, 0).
sammlung(bekannt, mikroProzessorRezept, 0, 0, 0).
sammlung(bekannt, kreaturenKugelnRezept, 0, 0, 0).

/* ------------------------- Frachterrezepte ----------------------------------------- */
sammlung(bekannt, fregattenTreibStoff50toRezept, 0, 0, 0).
sammlung(bekannt, fregattenTreibStoff100toRezept, 0, 0, 0).
sammlung(bekannt, fregattenTreibStoff200toRezept, 0, 0, 0).

/* ------------------------- Fregattenrezepte ---------------------------------------- */
sammlung(bekannt, treibStoffOxidantRezept, 0, 0, 0).
sammlung(bekannt, gedankenKontrollGeraetRezept, 0, 0, 0).
sammlung(bekannt, holografischerAnalysatorRezept, 0, 0, 0).
sammlung(bekannt, sprengDrohnenRezept, 0, 0, 0).
sammlung(bekannt, mineralKompressorRezept, 0, 0, 0).

/* =====================  Questrezepte -------------------------------------------- */
sammlung(bekannt, gefangeneNanodeRezept, 0, 0, 0).
sammlung(bekannt, umhuellterSchattenRezept, 0, 0, 0).
sammlung(bekannt, nooSphaerischKugelRezept, 0, 0, 0).
sammlung(bekannt, dunkleMaterieRezept, 0, 0, 0).
sammlung(bekannt, endeDerDaemmerungRezept, 0, 0, 0).
sammlung(bekannt, photischerJadeRezept, 0, 0, 0).
sammlung(bekannt, zustandsPhaseRezept, 0, 0, 0).
sammlung(bekannt, novaeRegeneratRezept, 0, 0, 0).
sammlung(bekannt, modifizierteQuantenRezept, 0, 0, 0).
sammlung(bekannt, herzDerSonneRezept, 0, 0, 0).
sammlung(bekannt, sternenSamenRezept, 0, 0, 0).
sammlung(bekannt, seelenEngineRezept, 0, 0, 0).
sammlung(bekannt, gedankenBogenRezept, 0, 0, 0).

/* %%%%%%%%%%%%%%%%%%%%%  Anzugmodule erforschbar %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
sammlung(bekannt, lebensErhaltungRezept, 0, 0, 0).
sammlung(bekannt, gefahrGutSchutzHandschuhRezept, 0, 0, 0).
sammlung(bekannt, gefahrenSchutzRezept, 0, 0, 0).
sammlung(bekannt, sauerStoffWiederVerwerterCRezept, 0, 0, 0).
sammlung(bekannt, jetPackRezept, 0, 0, 0).
sammlung(bekannt, einfacherUeberSetzerBRezept, 0, 0, 0).
sammlung(bekannt, kuehlMittelNetzwerkCRezept, 0, 0, 0).
sammlung(bekannt, waermeSchichtCRezept, 0, 0, 0).
sammlung(bekannt, toxinDaempferCRezept, 0, 0, 0).
sammlung(bekannt, strahlungsDeflektorCRezept, 0, 0, 0).
sammlung(bekannt, belueftungsMembranBRezept, 0, 0, 0).
sammlung(bekannt, schildGitterBRezept, 0, 0, 0).
sammlung(bekannt, sauerStoffUmleiterARezept, 0, 0, 0).
sammlung(bekannt, neuralStimulatorBRezept, 0, 0, 0).
sammlung(bekannt, raketenStiefelARezept, 0, 0, 0).
sammlung(bekannt, effizienteWasserDuesenARezept, 0, 0, 0).
sammlung(bekannt, verbesserterUebersetzerARezept, 0, 0, 0).
sammlung(bekannt, perfektionierterUebersetzerSRezept, 0, 0, 0).

/* %%%%%%%%%%%%%%%%%%%%%  Fahrzeugmodule %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
sammlung(bekannt, fusionsAntriebRezept, 0, 0, 0).
sammlung(bekannt, humboldtAntriebRezept, 0, 0, 0).
sammlung(bekannt, exoFahrzeugSignalBoosterRezept, 0, 0, 0).
sammlung(bekannt, exoFahrzeugBeschleunigungsModulRezept, 0, 0, 0).
sammlung(bekannt, exoFahrzeugMinenLaserRezept, 0, 0, 0).
sammlung(bekannt, osmotischerGeneratorCRezept, 0, 0, 0).
sammlung(bekannt, hochleistungsSonarRezept, 0, 0, 0).
sammlung(bekannt, tethysStrahlRezept, 0, 0, 0).
sammlung(bekannt, nautilonKanoneRezept, 0, 0, 0).
sammlung(bekannt, exoFahrzeugSignalBoosterUpgradeSigmaBRezept, 0, 0, 0).
sammlung(bekannt, exoFahrzeugMinenLaserUpgradeSigmaARezept, 0, 0, 0).
sammlung(bekannt, exoFahrzeugBordKanoneRezept, 0, 0, 0).
sammlung(bekannt, exoFahrzeugSignalBoosterUpgradeTauARezept, 0, 0, 0).

/* %%%%%%%%%%%%%%%%%%%%%  Raumschiff-Module %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
sammlung(bekannt, impulsAntriebRezept, 0, 0, 0).
sammlung(bekannt, teleportEmpfaengerRezept, 0, 0, 0).
sammlung(bekannt, hyperAntriebRezept, 0, 0, 0).
sammlung(bekannt, startSchubDueseRezept, 0, 0, 0).
sammlung(bekannt, deflektorSchildRezept, 0, 0, 0).
sammlung(bekannt, photonenKanoneRezept, 0, 0, 0).
sammlung(bekannt, konfliktScannerRezept, 0, 0, 0).
sammlung(bekannt, wirtschaftsScannerRezept, 0, 0, 0).
sammlung(bekannt, cadmiumAntriebBRezept, 0, 0, 0).
sammlung(bekannt, effizienteDuesenBRezept, 0, 0, 0).
sammlung(bekannt, ablativePanzerungCRezept, 0, 0, 0).
sammlung(bekannt, nichtlineareOptikCRezept, 0, 0, 0).
sammlung(bekannt, raketenWerferRezept, 0, 0, 0).
sammlung(bekannt, phasenStrahlerRezept, 0, 0, 0).
sammlung(bekannt, positronenWerferRezept, 0, 0, 0).
sammlung(bekannt, infraMesserBeschleunigerRezept, 0, 0, 0).
sammlung(bekannt, zyklotronBallisteRezept, 0, 0, 0).
sammlung(bekannt, emerilAntriebARezept, 0, 0, 0).
sammlung(bekannt, startSystemLadeGeraetSRezept, 0, 0, 0).
sammlung(bekannt, grosseRaketenRohreBRezept, 0, 0, 0).
sammlung(bekannt, fourierBegrenzerBRezept, 0, 0, 0).
sammlung(bekannt, fragmentSuperAufladerBRezept, 0, 0, 0).
sammlung(bekannt, nichtlineareOptikBRezept, 0, 0, 0).
sammlung(bekannt, dysonPumpeBRezept, 0, 0, 0).
sammlung(bekannt, indiumAntriebSRezept, 0, 0, 0).

/* %%%%%%%%%%%%%%%%%%%%%  Frachter-Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
sammlung(bekannt, frachterWarpReaktorSigmaCRezept, 0, 0, 0).
sammlung(bekannt, frachterWarpReaktorTauBRezept, 0, 0, 0).
sammlung(bekannt, frachterWarpReaktorThetaARezept, 0, 0, 0).

/* %%%%%%%%%%%%%%%%%%%%%  Multiwerkzeug-Module %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
sammlung(bekannt, analyseVisierRezept, 0, 0, 0).
sammlung(bekannt, scannerRezept, 0, 0, 0).
sammlung(bekannt, terrainManipulatorRezept, 0, 0, 0).
sammlung(bekannt, minenLaserRezept, 0, 0, 0).
sammlung(bekannt, blitzWerferRezept, 0, 0, 0).
sammlung(bekannt, eigenesKraftFeldRezept, 0, 0, 0).
sammlung(bekannt, fortgeschrittenerMinenLaserARezept, 0, 0, 0).
sammlung(bekannt, wellenFormWiederVerwerterBRezept, 0, 0, 0).
sammlung(bekannt, laufIonisatorCRezept, 0, 0, 0).
sammlung(bekannt, plasmaWerferRezept, 0, 0, 0).
sammlung(bekannt, glutSpeerRezept, 0, 0, 0).
sammlung(bekannt, streuBlasterRezept, 0, 0, 0).
sammlung(bekannt, impulsWerferRezept, 0, 0, 0).
sammlung(bekannt, kampfVisierRezept, 0, 0, 0).
sammlung(bekannt, optischerBohrerSRezept, 0, 0, 0).
sammlung(bekannt, untersuchungsGeraetARezept, 0, 0, 0).
sammlung(bekannt, geologieKanoneRezept, 0, 0, 0).
sammlung(bekannt, masseBeschleunigerCRezept, 0, 0, 0).
sammlung(bekannt, geschossSchmiererCRezept, 0, 0, 0).
sammlung(bekannt, verstaerkteKartuschenCRezept, 0, 0, 0).

/* %%%%%%%%%%%%%%%%%%%%%  Siedlung-Bau-Rezepte nicht erforschbar %%%%%%%%%%%%%%%%%%%%% */
/* =====================  allgemein ================================================== */
sammlung(bekannt, basisBergungsKapselRezept, 0, 0, 0).
sammlung(bekannt, kommunikationsStationRezept, 0, 0, 0).
sammlung(bekannt, autonomeBergBauEinheitRezept, 0, 0, 0).
sammlung(bekannt, atmosphaerenVerarbeitungsAnlageRezept, 0, 0, 0).
sammlung(bekannt, nachrichtenModulRezept, 0, 0, 0).

/* =====================  tragbar ==================================================== */
sammlung(bekannt, basisComputerRezept, 0, 0, 0).
sammlung(bekannt, konstruktionsForschungsStationRezept, 0, 0, 0).
sammlung(bekannt, tragbareRaffinerieRezept, 0, 0, 0).
sammlung(bekannt, speicherPunktRezept, 0, 0, 0).

/* =====================  Lager ====================================================== */
sammlung(bekannt, verschlosseneKisteRezept, 0, 0, 0).

/* =====================  Terminals ================================================== */
sammlung(bekannt, konstruktionsTerminalRezept, 0, 0, 0).
sammlung(bekannt, exoFahrzeugTerminalRezept, 0, 0, 0).
sammlung(bekannt, waffenTerminalRezept, 0, 0, 0).
sammlung(bekannt, wissenschaftsTerminalRezept, 0, 0, 0).
sammlung(bekannt, landwirtschaftsTerminalRezept, 0, 0, 0).

/* =====================  Frachter =================================================== */
sammlung(bekannt, flottenKommandoRaumRezept, 0, 0, 0).
sammlung(bekannt, grosserFrachterRaumRezept, 0, 0, 0).
sammlung(bekannt, frachterKorridorRezept, 0, 0, 0).
sammlung(bekannt, gebogenerFrachterKorridorRezept, 0, 0, 0).
sammlung(bekannt, frachterKreuzungDreiFachRezept, 0, 0, 0).
sammlung(bekannt, frachterTreppeRezept, 0, 0, 0).
sammlung(bekannt, frachterKreuzungVierFachRezept, 0, 0, 0).

/* %%%%%%%%%%%%%%%%%%%%%  Siedlung-Bau-Rezepte erforschbar %%%%%%%%%%%%%%%%%%%%%%%%%%% */
/* =====================  gross vorgefertigt ========================================= */
sammlung(bekannt, zylindrischerRaumRezept, 0, 0, 0).
sammlung(bekannt, quadratischerRaumRezept, 0, 0, 0).
sammlung(bekannt, geraderKorridorRezept, 0, 0, 0).
sammlung(bekannt, tuerRezept, 0, 0, 0).
sammlung(bekannt, fundamentRezept, 0, 0, 0).
sammlung(bekannt, lFoermigerKorridorRezept, 0, 0, 0).
sammlung(bekannt, korridorMitGlasDachRezept, 0, 0, 0).
sammlung(bekannt, holoTuerRezept, 0, 0, 0).
sammlung(bekannt, zugangsRampeRezept, 0, 0, 0).
sammlung(bekannt, rollTorRezept, 0, 0, 0).
sammlung(bekannt, pflasterungVierFachRezept, 0, 0, 0).
sammlung(bekannt, viererFundamentStrebeRezept, 0, 0, 0).
sammlung(bekannt, fundamentStrebeRezept, 0, 0, 0).
sammlung(bekannt, zylindrischerRaumRahmenRezept, 0, 0, 0).
sammlung(bekannt, tFoermigerKorridorRezept, 0, 0, 0).
sammlung(bekannt, xFoermigerKorridorRezept, 0, 0, 0).
sammlung(bekannt, korridorFensterRezept, 0, 0, 0).
sammlung(bekannt, bioKuppelRaumRezept, 0, 0, 0).
sammlung(bekannt, gebogenerKorridorRezept, 0, 0, 0).
sammlung(bekannt, leiterRezept, 0, 0, 0).
sammlung(bekannt, pflasterungRezept, 0, 0, 0).
sammlung(bekannt, pflasterungPodestRezept, 0, 0, 0).
sammlung(bekannt, grossesGlasPaneelRezept, 0, 0, 0).
sammlung(bekannt, aussichtsKugelRezept, 0, 0, 0).

/* =====================  klein vorgefertigt ========================================= */
sammlung(bekannt, wuerfelFoermigerRaumRezept, 0, 0, 0).
sammlung(bekannt, wuerfelRaumFundamentStrebeRezept, 0, 0, 0).
sammlung(bekannt, gewoelbteWuerfelFoermigeWandRezept, 0, 0, 0).
sammlung(bekannt, wuerfelFoermigerGlasRaumRezept, 0, 0, 0).
sammlung(bekannt, wuerfelFoermigerRaumRahmenRezept, 0, 0, 0).
sammlung(bekannt, wuerfelFoermigerRaumBodenRezept, 0, 0, 0).
sammlung(bekannt, wuerfelRaumViererFundamentStrebeRezept, 0, 0, 0).
sammlung(bekannt, innenTreppenRezept, 0, 0, 0).
sammlung(bekannt, wuerfelFoermigeInnenWandRezept, 0, 0, 0).
sammlung(bekannt, wuerfelFoermigerDachAufsatzRezept, 0, 0, 0).
sammlung(bekannt, gewoelbtesWuerfelFoermigesDachRezept, 0, 0, 0).
sammlung(bekannt, wuerfelFoermigesFensterEckigRezept, 0, 0, 0).
sammlung(bekannt, wuerfelFoermigesFensterRundRezept, 0, 0, 0).
sammlung(bekannt, infraStrukturLeiterRezept, 0, 0, 0).
sammlung(bekannt, wuerfelFoermigeInnenTuerRezept, 0, 0, 0).

/* =====================  Technologiemodule ========================================== */
/* ---------------------  Konstruktionsforschungsstation ----------------------------- */
sammlung(bekannt, basisTelePorterModulRezept, 0, 0, 0).
sammlung(bekannt, bioTreibStoffReaktorRezept, 0, 0, 0).
sammlung(bekannt, speicherSignalRezept, 0, 0, 0).
sammlung(bekannt, gesundheitsStationRezept, 0, 0, 0).
sammlung(bekannt, signalBoosterRezept, 0, 0, 0).
sammlung(bekannt, batterieRezept, 0, 0, 0).
sammlung(bekannt, solarModulRezept, 0, 0, 0).
sammlung(bekannt, gefahrenSchutzEinheitRezept, 0, 0, 0).

/* ---------------------  Anomalie  -------------------------------------------------- */
sammlung(bekannt, naehrStoffProzessorRezept, 0, 0, 0).
sammlung(bekannt, lagerBehaelterRezept, 0, 0, 0).
sammlung(bekannt, aussehenModifikatorRezept, 0, 0, 0).
sammlung(bekannt, landeFeldRezept, 0, 0, 0).
sammlung(bekannt, nutzTierEinheitRezept, 0, 0, 0).
sammlung(bekannt, automatischerFuettererRezept, 0, 0, 0).
sammlung(bekannt, terminalDesGalaktischenMarktesRezept, 0, 0, 0).
sammlung(bekannt, kurzStreckenTelePorterRezept, 0, 0, 0).
sammlung(bekannt, mittlereRaffinerieRezept, 0, 0, 0).
sammlung(bekannt, grosseRaffinerieRezept, 0, 0, 0).
sammlung(bekannt, antiMaterieReaktorRezept, 0, 0, 0).

/* =====================  Transportmodule ============================================ */
sammlung(bekannt, roamerGeoBuchtRezept, 0, 0, 0).
sammlung(bekannt, nomadenGeoBuchtRezept, 0, 0, 0).
sammlung(bekannt, exoFahrzeugRufStationRezept, 0, 0, 0).
sammlung(bekannt, nautilonKammerRezept, 0, 0, 0).
sammlung(bekannt, pilgerGeoBuchtRezept, 0, 0, 0).
sammlung(bekannt, kolossGeoBuchtRezept, 0, 0, 0).
sammlung(bekannt, rennInitiatorRezept, 0, 0, 0).
sammlung(bekannt, rennHindernisRezept, 0, 0, 0).
sammlung(bekannt, rennKraftVerstaerkerRezept, 0, 0, 0).

/* =====================  Wasser ===================================================== */
sammlung(bekannt, tiefSeeKammerRezept, 0, 0, 0).
sammlung(bekannt, meeresUnterSchlupfRezept, 0, 0, 0).
sammlung(bekannt, glasTunnelRezept, 0, 0, 0).
sammlung(bekannt, quadratischeTiefSeeKammerRezept, 0, 0, 0).
sammlung(bekannt, wasserDichteTuerRezept, 0, 0, 0).
sammlung(bekannt, lFoermigerGlasTunnelRezept, 0, 0, 0).
sammlung(bekannt, vertikalerGlasTunnelRezept, 0, 0, 0).
sammlung(bekannt, mondTeichBodenRezept, 0, 0, 0).
sammlung(bekannt, tFoermigerGlasTunnelRezept, 0, 0, 0).
sammlung(bekannt, xFoermigerGlasTunnelRezept, 0, 0, 0).

/* =====================  Motiv Designs ============================================== */
sammlung(bekannt, motivStilisiertesRRezept, 0, 0, 0).
sammlung(bekannt, motivRundPipetteRezept, 0, 0, 0).
sammlung(bekannt, motivFaltungDuennDickRezept, 0, 0, 0).
sammlung(bekannt, motivZiegelSteineRezept, 0, 0, 0).
sammlung(bekannt, motivRadioAktivGrauRezept, 0, 0, 0).
sammlung(bekannt, motivGrabSteinRezept, 0, 0, 0).
sammlung(bekannt, motivHelloGamesRezept, 0, 0, 0).
sammlung(bekannt, motivBuegelRezept, 0, 0, 0).
sammlung(bekannt, motivNo1Rezept, 0, 0, 0).
sammlung(bekannt, motivNo2Rezept, 0, 0, 0).
sammlung(bekannt, motivNo3Rezept, 0, 0, 0).
sammlung(bekannt, motivNo4Rezept, 0, 0, 0).
sammlung(bekannt, motivNo5Rezept, 0, 0, 0).
sammlung(bekannt, motivNo6Rezept, 0, 0, 0).
sammlung(bekannt, motivNo7Rezept, 0, 0, 0).
sammlung(bekannt, motivNo8Rezept, 0, 0, 0).
sammlung(bekannt, motivNo9Rezept, 0, 0, 0).
sammlung(bekannt, motivSchildErstochenerVogelRezept, 0, 0, 0).
sammlung(bekannt, motivSchildGrünerMannRezept, 0, 0, 0).
sammlung(bekannt, motivSchildKorvaxRezept, 0, 0, 0).
sammlung(bekannt, motivFroschSackRezept, 0, 0, 0).
sammlung(bekannt, motivLaemmchenRezept, 0, 0, 0).

/* =====================  Dekorative Module 1 ======================================== */
sammlung(bekannt, wandBildSchirmRezept, 0, 0, 0).
sammlung(bekannt, wandVentilatorRezept, 0, 0, 0).
sammlung(bekannt, gruenerWandBildSchirmRezept, 0, 0, 0).
sammlung(bekannt, schubLadenSchrankRezept, 0, 0, 0).
sammlung(bekannt, wandEinheitRezept, 0, 0, 0).
sammlung(bekannt, lagerModulDekoRezept, 0, 0, 0).
sammlung(bekannt, deckenPaneelRezept, 0, 0, 0).
sammlung(bekannt, techBedienFeldRezept, 0, 0, 0).
sammlung(bekannt, serverRezept, 0, 0, 0).
sammlung(bekannt, kanisterRegalRezept, 0, 0, 0).
sammlung(bekannt, kleineKisteRezept, 0, 0, 0).
sammlung(bekannt, schliessFachRezept, 0, 0, 0).
sammlung(bekannt, flachesModulRezept, 0, 0, 0).
sammlung(bekannt, seitenModulRezept, 0, 0, 0).
sammlung(bekannt, regalModulRezept, 0, 0, 0).
sammlung(bekannt, roboterArmRezept, 0, 0, 0).
sammlung(bekannt, waffenRegalRezept, 0, 0, 0).
sammlung(bekannt, oszilloskopRezept, 0, 0, 0).
sammlung(bekannt, achtEckSchrankRezept, 0, 0, 0).
sammlung(bekannt, fassFoermigerFabrikatorRezept, 0, 0, 0).
sammlung(bekannt, hoherSchrankRezept, 0, 0, 0).
sammlung(bekannt, kistenFoermigerFabrikatorRezept, 0, 0, 0).

/* =====================  Dekorative Module 2 ======================================== */
sammlung(bekannt, stuhlRezept, 0, 0, 0).
sammlung(bekannt, flagge1Rezept, 0, 0, 0).
sammlung(bekannt, tischRezept, 0, 0, 0).
sammlung(bekannt, bettRezept, 0, 0, 0).
sammlung(bekannt, sofaRezept, 0, 0, 0).
sammlung(bekannt, flagge2Rezept, 0, 0, 0).
sammlung(bekannt, wandFlagge1Rezept, 0, 0, 0).
sammlung(bekannt, einfacherSchreibTischRezept, 0, 0, 0).
sammlung(bekannt, ergonomischesSofaRezept, 0, 0, 0).
sammlung(bekannt, eckSofaRezept, 0, 0, 0).
sammlung(bekannt, flagge3Rezept, 0, 0, 0).
sammlung(bekannt, flagge4Rezept, 0, 0, 0).
sammlung(bekannt, wandFlagge3Rezept, 0, 0, 0).
sammlung(bekannt, wandFlagge2Rezept, 0, 0, 0).
sammlung(bekannt, bodenMatteRezept, 0, 0, 0).
sammlung(bekannt, grosseMonitorStationRezept, 0, 0, 0).
sammlung(bekannt, gewoelbterTischRezept, 0, 0, 0).
sammlung(bekannt, monitorStationRezept, 0, 0, 0).
sammlung(bekannt, arbeitsPlatteRezept, 0, 0, 0).
sammlung(bekannt, leichterTischRezept, 0, 0, 0).

/* =====================  Beleuchtung ================================================ */
sammlung(bekannt, lichtHandLampeRezept, 0, 0, 0).
sammlung(bekannt, farbigeLeuchteRezept, 0, 0, 0).
sammlung(bekannt, lichtStehLampeEckigRezept, 0, 0, 0).
sammlung(bekannt, laborLampeRezept, 0, 0, 0).
sammlung(bekannt, farbigeLeuchteBlauRezept, 0, 0, 0).
sammlung(bekannt, farbigeLeuchteOrangeRezept, 0, 0, 0).
sammlung(bekannt, lichtStehLampeRundRezept, 0, 0, 0).
sammlung(bekannt, lichtStehLampeSchirmRezept, 0, 0, 0).
sammlung(bekannt, deckenLeuchteRezept, 0, 0, 0).
sammlung(bekannt, farbigeLeuchteGelbRezept, 0, 0, 0).
sammlung(bekannt, farbigeLeuchteGruenRezept, 0, 0, 0).
sammlung(bekannt, farbigeLeuchteRotRezept, 0, 0, 0).

/* =====================  Industriemodule ============================================ */
sammlung(bekannt, elektrischeVerkabelungRezept, 0, 0, 0).
sammlung(bekannt, treibStoffReaktorRezept, 0, 0, 0).
sammlung(bekannt, mineralienExtraktorRezept, 0, 0, 0).
sammlung(bekannt, wandSchalterRezept, 0, 0, 0).
sammlung(bekannt, gasExtraktorRezept, 0, 0, 0).
sammlung(bekannt, versorgungsDepotRezept, 0, 0, 0).
sammlung(bekannt, versorgungsRohrRezept, 0, 0, 0).
sammlung(bekannt, bodenSchalterRezept, 0, 0, 0).
sammlung(bekannt, annaeherungsSchalterRezept, 0, 0, 0).
sammlung(bekannt, schalterRezept, 0, 0, 0).
sammlung(bekannt, energieUmkehrerRezept, 0, 0, 0).
sammlung(bekannt, elektroMagnetischerGeneratorRezept, 0, 0, 0).

/* =====================  Landwirtschaftsmodule ====================================== */
sammlung(bekannt, hydroKulturTrogRezept, 0, 0, 0).
sammlung(bekannt, topfPflanzeRezept, 0, 0, 0).
sammlung(bekannt, grosserHydroKulturTrogRezept, 0, 0, 0).
sammlung(bekannt, pilzGeflechtRezept, 0, 0, 0).
sammlung(bekannt, frostWurzRezept, 0, 0, 0).
sammlung(bekannt, gammaGrasRezept, 0, 0, 0).
sammlung(bekannt, echinoKaktusRezept, 0, 0, 0).
sammlung(bekannt, sternenDornRezept, 0, 0, 0).
sammlung(bekannt, sonnenRebeRezept, 0, 0, 0).
sammlung(bekannt, floraBehaelterHochBeetRezept, 0, 0, 0).
sammlung(bekannt, floraBehaelterKastenRezept, 0, 0, 0).
sammlung(bekannt, floraBehaelterTubusRezept, 0, 0, 0).
sammlung(bekannt, giftIgelRezept, 0, 0, 0).
sammlung(bekannt, gravitinoWirtRezept, 0, 0, 0).
sammlung(bekannt, magenKrampfBlumeRezept, 0, 0, 0).
sammlung(bekannt, morditWurzelRezept, 0, 0, 0).
sammlung(bekannt, eiweissPerlenKugelRezept, 0, 0, 0).
sammlung(bekannt, nipNipRezept, 0, 0, 0).

/* =====================  Unterschlüpfe aus Holz (auch Konstruktionsforschungsstation) */
sammlung(bekannt, holzWandRezept, 0, 0, 0).
sammlung(bekannt, holzBodenPlatteRezept, 0, 0, 0).
sammlung(bekannt, duenneHolzWandRezept, 0, 0, 0).
sammlung(bekannt, holzTuerRahmenRezept, 0, 0, 0).
sammlung(bekannt, holzDachRezept, 0, 0, 0).
sammlung(bekannt, glasPlatteMitHolzRahmenRezept, 0, 0, 0).
sammlung(bekannt, holzRampeRezept, 0, 0, 0).
sammlung(bekannt, kleineHolzPlatteRezept, 0, 0, 0).
sammlung(bekannt, schraegeHolzPlatteRezept, 0, 0, 0).
sammlung(bekannt, kleineHolzWandRezept, 0, 0, 0).
sammlung(bekannt, holzFensterRezept, 0, 0, 0).
sammlung(bekannt, holzTuerRezept, 0, 0, 0).
sammlung(bekannt, elektrischeHolzTuerRezept, 0, 0, 0).
sammlung(bekannt, holzDachPlatteRezept, 0, 0, 0).
sammlung(bekannt, holzDachEckStueckRezept, 0, 0, 0).
sammlung(bekannt, holzBogenRezept, 0, 0, 0).
sammlung(bekannt, halbeHolzRampeRezept, 0, 0, 0).
sammlung(bekannt, kurzeHolzWandRezept, 0, 0, 0).
sammlung(bekannt, holzFassadeRezept, 0, 0, 0).
sammlung(bekannt, kleineHolzTuerRezept, 0, 0, 0).
sammlung(bekannt, grosseElektrischeHolzTuerRezept, 0, 0, 0).
sammlung(bekannt, dachInnenEckteilAusHolzRezept, 0, 0, 0).
sammlung(bekannt, halberHolzBogenRezept, 0, 0, 0).

/* =====================  Unterschlüpfe aus Metall (Konstruktionsforschungsstation) == */
sammlung(bekannt, metallWandRezept, 0, 0, 0).
sammlung(bekannt, metallBodenPlatteRezept, 0, 0, 0).
sammlung(bekannt, duenneMetallWandRezept, 0, 0, 0).
sammlung(bekannt, metallTuerRahmenRezept, 0, 0, 0).
sammlung(bekannt, metallDachRezept, 0, 0, 0).
sammlung(bekannt, glasPlatteMitMetallRahmenRezept, 0, 0, 0).
sammlung(bekannt, metallRampeRezept, 0, 0, 0).
sammlung(bekannt, kleineMetallPlatteRezept, 0, 0, 0).
sammlung(bekannt, schraegeMetallPlatteRezept, 0, 0, 0).
sammlung(bekannt, kleineMetallWandRezept, 0, 0, 0).
sammlung(bekannt, metallFensterRezept, 0, 0, 0).
sammlung(bekannt, metallTuerRezept, 0, 0, 0).
sammlung(bekannt, elektrischeMetallTuerRezept, 0, 0, 0).
sammlung(bekannt, metallDachPlatteRezept, 0, 0, 0).
sammlung(bekannt, metallDachEckStueckRezept, 0, 0, 0).
sammlung(bekannt, metallBogenRezept, 0, 0, 0).
sammlung(bekannt, halbeMetallRampeRezept, 0, 0, 0).
sammlung(bekannt, kurzeMetallWandRezept, 0, 0, 0).
sammlung(bekannt, metallFassadeRezept, 0, 0, 0).
sammlung(bekannt, kleineMetallTuerRezept, 0, 0, 0).
sammlung(bekannt, grosseElektrischeMetallTuerRezept, 0, 0, 0).
sammlung(bekannt, dachInnenEckteilAusMetallRezept, 0, 0, 0).
sammlung(bekannt, halberMetallBogenRezept, 0, 0, 0).

/* =====================  Unterschlüpfe aus Beton (Konstruktionsforschungsstation) === */
sammlung(bekannt, betonWandRezept, 0, 0, 0).
sammlung(bekannt, betonBodenPlatteRezept, 0, 0, 0).
sammlung(bekannt, duenneBetonWandRezept, 0, 0, 0).
sammlung(bekannt, betonTuerRahmenRezept, 0, 0, 0).
sammlung(bekannt, betonDachRezept, 0, 0, 0).
sammlung(bekannt, glasPlatteMitBetonRahmenRezept, 0, 0, 0).
sammlung(bekannt, betonRampeRezept, 0, 0, 0).
sammlung(bekannt, kleineBetonBodenPlatteRezept, 0, 0, 0).
sammlung(bekannt, schraegeBetonPlatteRezept, 0, 0, 0).
sammlung(bekannt, kleineBetonWandRezept, 0, 0, 0).
sammlung(bekannt, betonFensterRezept, 0, 0, 0).
sammlung(bekannt, betonTuerRezept, 0, 0, 0).
sammlung(bekannt, elektrischeBetonTuerRezept, 0, 0, 0).
sammlung(bekannt, betonDachPlatteRezept, 0, 0, 0).
sammlung(bekannt, betonDachEckStueckRezept, 0, 0, 0).
sammlung(bekannt, betonBogenRezept, 0, 0, 0).
sammlung(bekannt, halbeBetonRampeRezept, 0, 0, 0).
sammlung(bekannt, kurzeBetonWandRezept, 0, 0, 0).
sammlung(bekannt, betonFassadeRezept, 0, 0, 0).
sammlung(bekannt, kleineBetonTuerRezept, 0, 0, 0).
sammlung(bekannt, grosseElektrischeBetonTuerRezept, 0, 0, 0).
sammlung(bekannt, dachInnenEckteilAusBetonRezept, 0, 0, 0).
sammlung(bekannt, halberBetonBogenRezept, 0, 0, 0).

/* =====================  Primitive Formen =========================================== */
sammlung(bekannt, grosserKeilRezept, 0, 0, 0).
sammlung(bekannt, kleinerKeilRezept, 0, 0, 0).
sammlung(bekannt, rohrRezept, 0, 0, 0).
sammlung(bekannt, pyramideRezept, 0, 0, 0).
sammlung(bekannt, gebogenesRohrRezept, 0, 0, 0).
sammlung(bekannt, stabilerWuerfelRezept, 0, 0, 0).
sammlung(bekannt, zylinderRezept, 0, 0, 0).
sammlung(bekannt, wuerfelRezept, 0, 0, 0).
sammlung(bekannt, kugelRezept, 0, 0, 0).

/* Stoffe ohne Gerät zu Fuss wild ernten 
sammlung(pfluecken, eiweissPerle, 300, 339, 0).
sammlung(pfluecken, gravitinoBall, 150, 339, 0).
sammlung(pfluecken, sturmKristall, 150, 150, 0).
sammlung(pfluecken, beutelGift, 150, 150, 0).
*/

sammlung(pfluecken, natrium, 8, 10, 0). 
sammlung(pfluecken, sauerStoff, 8, 9, 0).


/* variieren nach Planetentyp kürzere Zeiten bei geeigneterem Habitat */
/* TODO Planetentyp-Einfluss auf Stückzahl pro Gebinde abbilden 
sammlung(pfluecken, jadeErbsen, 22, 22, 0).
sammlung(pfluecken, suessWurzel, 23, 23, 0).
sammlung(pfluecken, fleischigeWurzeln, 18, 18, 0).
sammlung(pfluecken, aloeFleisch, 22, 22, 0).
sammlung(pfluecken, feuerBeere, 15, 15, 0).
sammlung(pfluecken, grahBeere, 19, 19, 0).
sammlung(pfluecken, gefroreneKnollen, 38, 17, 0).
sammlung(pfluecken, hexaBeere, 15, 15, 0).
*/

sammlung(pfluecken, heptaPloidWeizen, 14, 14, 0).
sammlung(pfluecken, impulsBohnen, 25, 27, 0).

/* Anreise mit Raumschiff zu natürlichem Vorkommen auf Planet 
sammlung(pfluecken, kaktusFleisch, 2, 13, 0).
sammlung(pfluecken, pilzSchimmel, 10, 10, 0).
sammlung(pfluecken, solanium, 4, 29, 0).
sammlung(pfluecken, gammaWurzel, 5, 4, 0).
sammlung(pfluecken, frostKristall, 4, 4, 0).
*/

sammlung(pfluecken, sternenKnolle, 8, 12, 0).

/*------------ noch offen ------------- */
sammlung(pfluecken, korvaxKonvergenzWuerfel, 20, 20, 0).
sammlung(pfluecken, nipNipKnospen, 20, 20, 0).


/* nutzbare anomalieen (Deko) 
sammlung(pfluecken, defekterSeparator, 150, 150, 0).
sammlung(pfluecken, lichtBruch, 150, 150, 0).
*/

/* mit Minenlaser auf Planet 
sammlung(minenLaserNutzen, radon, 87, 7, 0).
sammlung(minenLaserNutzen, stickStoff, 9, 9, 0).
sammlung(minenLaserNutzen, schwefelin, 0, 0, 0). 
sammlung(minenLaserNutzen, ammoniak, 7, 7, 150).
sammlung(minenLaserNutzen, pilzSchimmel, 1, 1, 150).
*/
sammlung(minenLaserNutzen, diWasserStoff, 4, 4, 150).
sammlung(minenLaserNutzen, ferritStaub, 3, 3, 150).
sammlung(minenLaserNutzen, kobalt, 4, 4, 150).
sammlung(minenLaserNutzen, kohlenStoff, 2, 2, 150).
sammlung(minenLaserNutzen, kuerbisKnolle, 5, 5, 150).
sammlung(minenLaserNutzen, sauerStoff, 9, 9, 150).

/* exofahrzeug minenlaser nutzen */
sammlung(exoFahrzeugMinenLaserNutzen, sauerStoff, 9, 9, 150).

/* nur sekundärelement 
sammlung(minenLaserNutzen, sternenKnolle, 44, 44, 150).
sammlung(minenLaserNutzen, gammaWurzel, 83, 50, 150).
sammlung(minenLaserNutzen, natrium, 7, 7, 150).
sammlung(minenLaserNutzen, paraffinium, 221, 30, 150).
*/

/* mit Terrainformer abbauen 
sammlung(terrainFormerNutzen, ammoniak, 3, 0, 300). 
sammlung(terrainFormerNutzen, aktiviertesCadmium, 15, 0, 300).
sammlung(terrainFormerNutzen, aktiviertesEmeril, 8, 0, 300).
sammlung(terrainFormerNutzen, aktiviertesIndium, 46, 0, 300).
sammlung(terrainFormerNutzen, aktiviertesKupfer, 20, 0, 300).
sammlung(terrainFormerNutzen, cadmium, 24, 0, 300).	
sammlung(terrainFormerNutzen, emeril, 24, 0, 300).
sammlung(terrainFormerNutzen, indium, 20, 0, 300).
sammlung(terrainFormerNutzen, natrium, 6, 0, 300).
*/
sammlung(terrainFormerNutzen, kupfer, 3, 0, 300).
sammlung(terrainFormerNutzen, silikatPulver, 6, 0, 300).

/* mit Terrainformer ausgraben */
sammlung(terrainFormerNutzen, schmutzigeKnochenFragmente, 300, 0, 300).
sammlung(terrainFormerNutzen, geborgeneDaten, 300, 0, 300).

/* verbesserter Minenlaser */
sammlung(verbessertenMinenLaserNutzen, verdichteterKohlenStoff, 12, 0, 150).
sammlung(verbessertenMinenLaserNutzen, reinesFerrit, 3, 0, 150).
sammlung(verbessertenMinenLaserNutzen, paraffinium, 3, 0, 150).
sammlung(verbessertenMinenLaserNutzen, mordit, 3, 0, 150).

/* Jagd (mit Glutspeer, ein Schuss = tot, Aufladen ist Nebenzeit) */
sammlung(jagen, beinFleisch, 20, 400, 300).
sammlung(jagen, diploStuecke, 20, 400, 300).
sammlung(jagen, fleischigeStuecke, 20, 400, 300).
sammlung(jagen, fleischigeFluegel, 200, 400, 300).
sammlung(jagen, innereienBeutel, 20, 400, 300).
sammlung(jagen, katzenLeber, 20, 400, 300).
sammlung(jagen, mordit, 20, 400, 300).
sammlung(jagen, protoWurst, 20, 400, 300).
sammlung(jagen, rohesSteak, 20, 400, 300).
sammlung(jagen, salzigeFischFilets, 20, 400, 300).
sammlung(jagen, schreiterWurst, 20, 400, 300).
sammlung(jagen, schuppigesFleisch, 20, 400, 300).

/* bei Zerstörung von Wesen */
sammlung(erkaempfen, pugneum, 12000, 0, 300).      /* von Wächter */
sammlung(erkaempfen, larvenKern, 9000, 0, 300).       /*  von flüsterndes Ei */
sammlung(erkaempfen, kampfLaeuferGehirn, 50000, 0, 300).     /* von Kampfläufer */
sammlung(erkaempfen, unholdRogen, 12000, 0, 300).     /* von ??? */

/* Meteoritenfelder */
sammlung(raumSchuerfen, tritium, 2, 0, 63).
sammlung(raumSchuerfen, gold, 75, 0, 63).
sammlung(raumSchuerfen, silber, 16, 0, 63).
sammlung(raumSchuerfen, platin, 20, 0, 63).

/* kaufen */
sammlung(kaufen, kabelBaum, 150, 1310, 2460).
sammlung(kaufen, salz, 150, 1310, 1000).
sammlung(kaufen, restSubstanz, 150, 1310, 1000).
sammlung(kaufen, ionenAkku, 150, 1310, 1000).
sammlung(kaufen, ferritStaub, 150, 1310, 1000).
sammlung(kaufen, sauerStoff, 150, 1310, 1000).
sammlung(kaufen, kobalt, 150, 1310, 1000).
sammlung(kaufen, natrium, 150, 1310, 1000).
sammlung(kaufen, kobaltSpiegel, 150, 1310, 1000).
sammlung(kaufen, diWasserStoffGelee, 150, 1310, 1000).
sammlung(kaufen, navigationsDaten, 150, 1310, 1000).
sammlung(kaufen, metallPlatten, 150, 1310, 1000).
sammlung(kaufen, raumSchiffStartTreibStoff, 150, 1310, 1000).
sammlung(kaufen, mikroProzessor, 150, 1310, 1000).
sammlung(kaufen, kobaltSpiegel, 150, 1310, 1000).
sammlung(kaufen, diWasserStoffGelee, 150, 1310, 1000).
sammlung(kaufen, metallPlatten, 150, 1310, 1000).
sammlung(kaufen, raumSchiffStartTreibStoff, 150, 1310, 1000).
sammlung(kaufen, mikroProzessor, 150, 1310, 1000).
sammlung(kaufen, sauerStoffKapsel, 150, 1310, 1000).
sammlung(kaufen, pyrit, 150, 1310, 1000).
sammlung(kaufen, reinesFerrit, 150, 1310, 1000).
sammlung(kaufen, pugneum, 150, 1310, 1000).

/* Aus Anbau */
sammlung(ernten, frostKristall, 20, 0, 0).
sammlung(ernten, eiweissPerle, 20, 0, 0).
sammlung(ernten, gammaWurzel, 20, 0, 0).
sammlung(ernten, gravitinoBall, 20, 0, 0).
sammlung(ernten, pilzSchimmel, 20, 0, 0).
sammlung(ernten, faecium, 20, 0, 0).
sammlung(ernten, kaktusFleisch, 20, 0, 0).
sammlung(ernten, sternenKnolle, 20, 0, 0).
sammlung(ernten, mordit, 20, 0, 0).
sammlung(ernten, solanium, 20, 0, 0).

/* aus Tierhaltung */
sammlung(vonTierErhalten, faecium, 20, 0, 0).
sammlung(vonTierErhalten, frischeMilch, 20, 0, 0).
sammlung(vonTierErhalten, holzApfel, 20, 0, 0).
sammlung(vonTierErhalten, klebrigerHonig, 20, 0, 0).
sammlung(vonTierErhalten, leopardenFrucht, 20, 0, 0).
sammlung(vonTierErhalten, regisFett, 20, 0, 0).
sammlung(vonTierErhalten, wildeMilch, 20, 0, 0).
sammlung(vonTierErhalten, riesenEi, 20, 0, 0).
sammlung(vonTierErhalten, kreaturenEi, 20, 0, 0).
sammlung(vonTierErhalten, grosseEier, 20, 0, 0).
sammlung(vonTierErhalten, warmeProtoMilch, 20, 0, 0).

/* Stoff ohne Gerät unter Wasser ernten */
sammlung(ertauchen, kristallSulfid, 150, 634, 0).
sammlung(ertauchen, kelpBeutel, 18, 32, 0).
sammlung(ertauchen, zytoPhosphat, 20, 0, 0).

/* Stoff unter Wasser mit Waffe erbeuten */
sammlung(unterWasserErkaempfen, lebendePerle, 150, 680, 0).     /* von gepanzerte Muschel */
sammlung(unterWasserErkaempfen, hypnotischesAuge, 4500, 0, 0). /* von abyssal horror */

/* Stoff mit Athmosphärenanlage gewinnen */
sammlung(ausAtmosphaerenAnlageFuerSauerStoffGewinnen, sauerStoff, 254, 0, 1262).
sammlung(ausAtmosphaerenAnlageFuerStickStoffGewinnen, stickStoff, 13500, 0, 1262).


/* Vorfertigen Rohstoffe */
vorfertigen(diWasserStoff).
vorfertigen(sauerStoff).
vorfertigen(kupfer).
vorfertigen(pugneum).
vorfertigen(deuterium).
vorfertigen(aktiviertesCadmium).
vorfertigen(aktiviertesEmeril).
vorfertigen(aktiviertesIndium).
vorfertigen(aktiviertesKupfer).
vorfertigen(cadmium).
vorfertigen(emeril).
vorfertigen(gammaWurzel).
vorfertigen(natrium).
vorfertigen(kobalt).
vorfertigen(kuerbisKnolle).
vorfertigen(natriumNitrat).
vorfertigen(chlor).
vorfertigen(ferritStaub).
vorfertigen(chromatischesMetall).
vorfertigen(ammoniak).
vorfertigen(kaktusFleisch).
vorfertigen(kohlenStoff).
vorfertigen(faecium).


/* Basis */
vorfertigen(paraffinium).
vorfertigen(dioxit). 
vorfertigen(salz).
vorfertigen(phosphor).
vorfertigen(schwefelin).
vorfertigen(radon).
vorfertigen(uran).
vorfertigen(frostKristall).

/* mittlere agglomeration*/
vorfertigen(antiMaterie).
vorfertigen(antiMaterieGehaeuse).
vorfertigen(glas).
vorfertigen(grantine).
vorfertigen(herox).
vorfertigen(instabilesGel).
vorfertigen(instabilesNatrium).
vorfertigen(kohlenStoffKristall).
vorfertigen(saeure).
vorfertigen(seltenesMetallElement).
vorfertigen(stickStoffSalz).
vorfertigen(superOxidKristall).
vorfertigen(tetraKobalt).
vorfertigen(angereicherterKohlenStoff).

vorfertigen(aronium).
vorfertigen(lemmium).
vorfertigen(magnoGold).
vorfertigen(strassenKoeterBronze).
vorfertigen(chlorGitter).

vorfertigen(thermischesKondensat).
vorfertigen(organischerKatalysator).

/* kochen */
vorfertigen(geraeuchertesFleisch).
vorfertigen(geheimnisVollerFleischEintopf).

vorfertigen(immerBrennendeMarmelade).
vorfertigen(schlaengelndeMarmelade).
vorfertigen(kaktusGelee).

vorfertigen(geschlageneButter).
vorfertigen(protoButter).
vorfertigen(verfeinertesMehl).

vorfertigen(klebrigerPudding).
vorfertigen(monstroeserPudding).
vorfertigen(salzigerPudding).

vorfertigen(protoTeig).
vorfertigen(heulenderTeig).
vorfertigen(kuchenTeig).
vorfertigen(dickerSuesserTeig).
vorfertigen(extraFluffigerTeig).
vorfertigen(windenderAufgewuehlterTeig).
vorfertigen(tortenBoden).

vorfertigen(delikatessBaiser).
vorfertigen(klobigerDonut).
vorfertigen(wuerzigerKaese).
vorfertigen(synthetischerHonig).																		
vorfertigen(knusperKaramell).


sammelbarInit :-
	\+sammelbarInitFlach,
	\+sammelbarVorfertigen.
	
sammelbarInitFlach :-
	abolish(sammelbar/2),
	stoff:stoff(_, Stoff, _),
	sammlung(Operation, Stoff, _, _, _),
	sammelAktion:pruefeOperationVorraussetzung(Operation),
	assertz(sammelbar(Stoff, Operation)),
	fail.
	
sammelbarVorfertigen :-
	abolish(fertigeLoesung/3),
	vorfertigen(Stoff),
	\+generiereFertigeLoesungen(Stoff),
	fail.
	
generiereFertigeLoesungen(Stoff) :-
	optimierung:optimierungsZiel(Strategie),
	\+suchAlgorithmus:baueFuerVorfertigung(Strategie, 1, Stoff),
	optimierung:optimierungsStrategie(Strategie, Stoff, _, Vorgaenge, _, _, _, _, _),
	assertz(fertigeLoesung(Strategie, Stoff, Vorgaenge)),
	retractall(sammelbar(Stoff, _)),
	assertz(sammelbar(Stoff, vorfertigen)),
	fail.

