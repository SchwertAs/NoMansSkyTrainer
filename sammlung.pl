:- module(sammlung, [sammlungInit/0, sammelbarReInit/2, sammlung/8, sammelbar/2, fertigeLoesung/3]).

:- dynamic(sammelbar/2).
:- dynamic(fertigeLoesung/3).
:- dynamic(sammlung/8).
	
/* sammlung(<RecordNo>, <System>, <Planet>, <SammelAktion>, <Stoff>, <Hauptzeit>, <Nebenzeit>, <R�stzeit>) */
sammlungInit :-
	abolish(sammlung/8)
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, saeureRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, schmierMittelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, thermischesKondensatRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, tragbarerReaktorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, instabilesGelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, glasRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, angereicherterKohlenStoffRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, polyFaserRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, stickStoffSalzRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, aroniumRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, quantumProzessorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kryogenKammerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, fluessigSprengStoffRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, lebendesGlasRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, hitzeKondensatorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, schaltPlatteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, organischerKatalysatorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, halbLeiterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, heissesEisRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, strassenKoeterBronzeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, heroxRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, lemmiumRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, magnoGoldRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, grantineRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, fusionsZuenderRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, staseGeraetRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, fusionsBeschleunigerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, supraLeiterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kryoPumpeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, iridesitRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, geoDesitRezept, 0, 0, 0))

/* ------------------------- Rezepte f�r Komponenten und Ger�te  --------------------- */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, lebensErhaltungsGelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, diWasserStoffGeleeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, ionenAkkuRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, warpZelleRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kohlenStoffKristallRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, seltenesMetallElementRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, tetraKobaltRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, chlorGitterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, instabilesNatriumRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, superOxidKristallRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, raumSchiffStartTreibStoffRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, fortschrittlicherIonenAkkuRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, atlasPassV1Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kobaltSpiegelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, salzRefaktorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, natriumDiodeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, sauerStoffFilterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, sauerStoffKapselRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, hydrothermaleTreibStoffZelleRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, instabilesPlasmaRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, sternenSchildBatterieRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, atlasPassV2Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, warpHyperKernRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, atlasPassV3Rezept, 0, 0, 0))

/* ------------------------- Sonstige Rezepte ---------------------------------------- */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, hermetischesSiegelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kohlenStoffNanoRohrRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, metallPlattenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, projektilMunitionRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, antiMaterieRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, antiMaterieGehaeuseRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, mikroProzessorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kreaturenKugelnRezept, 0, 0, 0))

/* ------------------------- Frachterrezepte ----------------------------------------- */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, fregattenTreibStoff50toRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, fregattenTreibStoff100toRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, fregattenTreibStoff200toRezept, 0, 0, 0))

/* ------------------------- Fregattenrezepte ---------------------------------------- */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, treibStoffOxidantRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, gedankenKontrollGeraetRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, holografischerAnalysatorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, sprengDrohnenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, mineralKompressorRezept, 0, 0, 0))

/* =====================  Questrezepte -------------------------------------------- */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, gefangeneNanodeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, umhuellterSchattenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, nooSphaerischKugelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, dunkleMaterieRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, endeDerDaemmerungRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, photischerJadeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, zustandsPhaseRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, novaeRegeneratRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, modifizierteQuantenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, herzDerSonneRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, sternenSamenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, seelenEngineRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, gedankenBogenRezept, 0, 0, 0))

/* %%%%%%%%%%%%%%%%%%%%%  Anzugmodule erforschbar %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, lebensErhaltungRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, gefahrGutSchutzHandschuhRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, gefahrenSchutzRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, sauerStoffWiederVerwerterCRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, jetPackRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, einfacherUeberSetzerBRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kuehlMittelNetzwerkCRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, waermeSchichtCRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, toxinDaempferCRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, strahlungsDeflektorCRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, belueftungsMembranBRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, schildGitterBRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, sauerStoffUmleiterARezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, neuralStimulatorBRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, raketenStiefelARezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, effizienteWasserDuesenARezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, verbesserterUebersetzerARezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, perfektionierterUebersetzerSRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, persoenlicheRaffinerieRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, luftSchubAntriebSRezept, 0, 0, 0))

/* %%%%%%%%%%%%%%%%%%%%%  Fahrzeugmodule %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, fusionsAntriebRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, humboldtAntriebRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, exoFahrzeugSignalBoosterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, exoFahrzeugBeschleunigungsModulRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, exoFahrzeugMinenLaserRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, osmotischerGeneratorCRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, hochleistungsSonarRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, tethysStrahlRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, nautilonKanoneRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, exoFahrzeugSignalBoosterUpgradeSigmaBRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, exoFahrzeugMinenLaserUpgradeSigmaARezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, exoFahrzeugBordKanoneRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, exoFahrzeugSignalBoosterUpgradeTauARezept, 0, 0, 0))

/* %%%%%%%%%%%%%%%%%%%%%  Raumschiff-Module %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, impulsAntriebRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, teleportEmpfaengerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, hyperAntriebRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, startSchubDueseRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, deflektorSchildRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, photonenKanoneRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, konfliktScannerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wirtschaftsScannerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, cadmiumAntriebBRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, effizienteDuesenBRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, ablativePanzerungCRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, nichtlineareOptikCRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, raketenWerferRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, phasenStrahlerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, positronenWerferRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, infraMesserBeschleunigerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, zyklotronBallisteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, emerilAntriebARezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, startSystemLadeGeraetSRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, grosseRaketenRohreBRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, fourierBegrenzerBRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, fragmentSuperAufladerBRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, nichtlineareOptikBRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, dysonPumpeBRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, indiumAntriebSRezept, 0, 0, 0))

/* %%%%%%%%%%%%%%%%%%%%%  Frachter-Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, frachterWarpReaktorSigmaCRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, frachterWarpReaktorTauBRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, frachterWarpReaktorThetaARezept, 0, 0, 0))

/* %%%%%%%%%%%%%%%%%%%%%  Multiwerkzeug-Module %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, analyseVisierRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, scannerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, terrainManipulatorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, minenLaserRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, blitzWerferRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, eigenesKraftFeldRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, fortgeschrittenerMinenLaserARezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wellenFormWiederVerwerterBRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, laufIonisatorCRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, plasmaWerferRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, glutSpeerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, streuBlasterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, impulsWerferRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kampfVisierRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, optischerBohrerSRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, untersuchungsGeraetARezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, geologieKanoneRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, masseBeschleunigerCRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, geschossSchmiererCRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, verstaerkteKartuschenCRezept, 0, 0, 0))

/* %%%%%%%%%%%%%%%%%%%%%  Siedlung-Bau-Rezepte nicht erforschbar %%%%%%%%%%%%%%%%%%%%% */
/* =====================  allgemein ================================================== */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, byteBeatGeraetRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, byteBeatKabelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, byteBeatSchaltungRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, teleportKabelRezept, 0, 0, 0))

	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, basisBergungsKapselRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kommunikationsStationRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, autonomeBergBauEinheitRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, atmosphaerenVerarbeitungsAnlageRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, nachrichtenModulRezept, 0, 0, 0))

/* =====================  tragbar ==================================================== */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, basisComputerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, konstruktionsForschungsStationRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, tragbareRaffinerieRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, speicherPunktRezept, 0, 0, 0))

/* =====================  Lager ====================================================== */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, verschlosseneKisteRezept, 0, 0, 0))

/* =====================  Terminals ================================================== */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, konstruktionsTerminalRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, exoFahrzeugTerminalRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, waffenTerminalRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wissenschaftsTerminalRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, landwirtschaftsTerminalRezept, 0, 0, 0))

/* =====================  Frachter =================================================== */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, flottenKommandoRaumRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, grosserFrachterRaumRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, frachterKorridorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, gebogenerFrachterKorridorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, frachterKreuzungDreiFachRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, frachterTreppeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, frachterKreuzungVierFachRezept, 0, 0, 0))

/* %%%%%%%%%%%%%%%%%%%%%  Siedlung-Bau-Rezepte erforschbar %%%%%%%%%%%%%%%%%%%%%%%%%%% */
/* =====================  gross vorgefertigt ========================================= */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, zylindrischerRaumRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, quadratischerRaumRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, geraderKorridorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, tuerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, fundamentRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, lFoermigerKorridorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, korridorMitGlasDachRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, holoTuerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, zugangsRampeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, rollTorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, pflasterungVierFachRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, viererFundamentStrebeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, fundamentStrebeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, zylindrischerRaumRahmenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, tFoermigerKorridorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, xFoermigerKorridorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, korridorFensterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, bioKuppelRaumRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, gebogenerKorridorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, leiterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, pflasterungRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, pflasterungPodestRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, grossesGlasPaneelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, aussichtsKugelRezept, 0, 0, 0))

/* =====================  klein vorgefertigt ========================================= */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wuerfelFoermigerRaumRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wuerfelRaumFundamentStrebeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, gewoelbteWuerfelFoermigeWandRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wuerfelFoermigerGlasRaumRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wuerfelFoermigerRaumRahmenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wuerfelFoermigerRaumBodenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wuerfelRaumViererFundamentStrebeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, innenTreppenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wuerfelFoermigeInnenWandRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wuerfelFoermigerDachAufsatzRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, gewoelbtesWuerfelFoermigesDachRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wuerfelFoermigesFensterEckigRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wuerfelFoermigesFensterRundRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, infraStrukturLeiterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wuerfelFoermigeInnenTuerRezept, 0, 0, 0))

/* =====================  Technologiemodule ========================================== */
/* ---------------------  Konstruktionsforschungsstation ----------------------------- */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, basisTelePorterModulRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, bioTreibStoffReaktorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, speicherSignalRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, gesundheitsStationRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, signalBoosterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, batterieRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, solarModulRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, gefahrenSchutzEinheitRezept, 0, 0, 0))

/* ---------------------  Anomalie  -------------------------------------------------- */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, naehrStoffProzessorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, lagerBehaelterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, aussehenModifikatorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, landeFeldRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, nutzTierEinheitRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, automatischerFuettererRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, terminalDesGalaktischenMarktesRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kurzStreckenTelePorterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, mittlereRaffinerieRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, grosseRaffinerieRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, antiMaterieReaktorRezept, 0, 0, 0))

/* =====================  Transportmodule ============================================ */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, roamerGeoBuchtRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, nomadenGeoBuchtRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, exoFahrzeugRufStationRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, nautilonKammerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, pilgerGeoBuchtRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kolossGeoBuchtRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, rennInitiatorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, rennHindernisRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, rennKraftVerstaerkerRezept, 0, 0, 0))

/* =====================  Wasser ===================================================== */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, tiefSeeKammerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, meeresUnterSchlupfRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, glasTunnelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, quadratischeTiefSeeKammerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wasserDichteTuerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, lFoermigerGlasTunnelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, vertikalerGlasTunnelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, mondTeichBodenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, tFoermigerGlasTunnelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, xFoermigerGlasTunnelRezept, 0, 0, 0))
	
/* =====================  Motiv Designs ============================================== */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivStilisiertesRRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivRundPipetteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivFaltungDuennDickRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivZiegelSteineRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivRadioAktivGrauRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivGrabSteinRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivHelloGamesRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivBuegelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivNo1Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivNo2Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivNo3Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivNo4Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivNo5Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivNo6Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivNo7Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivNo8Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivNo9Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivSchildErstochenerVogelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivSchildGr�nerMannRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivSchildKorvaxRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivFroschSackRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, motivLaemmchenRezept, 0, 0, 0))

/* =====================  Dekorative Module 1 ======================================== */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wandBildSchirmRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wandVentilatorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, gruenerWandBildSchirmRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, schubLadenSchrankRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wandEinheitRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, lagerModulDekoRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, deckenPaneelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, techBedienFeldRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, serverRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kanisterRegalRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kleineKisteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, schliessFachRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, flachesModulRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, seitenModulRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, regalModulRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, roboterArmRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, waffenRegalRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, oszilloskopRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, achtEckSchrankRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, fassFoermigerFabrikatorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, hoherSchrankRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kistenFoermigerFabrikatorRezept, 0, 0, 0))

/* =====================  Dekorative Module 2 ======================================== */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, stuhlRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, flagge1Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, tischRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, bettRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, sofaRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, flagge2Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wandFlagge1Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, einfacherSchreibTischRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, ergonomischesSofaRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, eckSofaRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, flagge3Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, flagge4Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wandFlagge3Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wandFlagge2Rezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, bodenMatteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, grosseMonitorStationRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, gewoelbterTischRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, monitorStationRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, arbeitsPlatteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, leichterTischRezept, 0, 0, 0))

/* =====================  Beleuchtung ================================================ */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, lichtHandLampeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, farbigeLeuchteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, lichtStehLampeEckigRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, laborLampeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, farbigeLeuchteBlauRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, farbigeLeuchteOrangeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, lichtStehLampeRundRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, lichtStehLampeSchirmRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, deckenLeuchteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, farbigeLeuchteGelbRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, farbigeLeuchteGruenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, farbigeLeuchteRotRezept, 0, 0, 0))

/* =====================  Industriemodule ============================================ */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, elektrischeVerkabelungRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, treibStoffReaktorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, mineralienExtraktorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wandSchalterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, gasExtraktorRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, versorgungsDepotRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, versorgungsRohrRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, bodenSchalterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, annaeherungsSchalterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, schalterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, energieUmkehrerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, elektroMagnetischerGeneratorRezept, 0, 0, 0))

/* =====================  Landwirtschaftsmodule ====================================== */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, hydroKulturTrogRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, topfPflanzeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, grosserHydroKulturTrogRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, pilzGeflechtRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, frostWurzRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, gammaGrasRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, echinoKaktusRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, sternenDornRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, sonnenRebeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, floraBehaelterHochBeetRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, floraBehaelterKastenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, floraBehaelterTubusRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, giftIgelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, gravitinoWirtRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, magenKrampfBlumeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, morditWurzelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, eiweissPerlenKugelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, nipNipRezept, 0, 0, 0))

/* =====================  Unterschl�pfe aus Holz (auch Konstruktionsforschungsstation) */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, holzWandRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, holzBodenPlatteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, duenneHolzWandRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, holzTuerRahmenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, holzDachRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, glasPlatteMitHolzRahmenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, holzRampeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kleineHolzPlatteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, schraegeHolzPlatteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kleineHolzWandRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, holzFensterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, holzTuerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, elektrischeHolzTuerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, holzDachPlatteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, holzDachEckStueckRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, holzBogenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, halbeHolzRampeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kurzeHolzWandRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, holzFassadeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kleineHolzTuerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, grosseElektrischeHolzTuerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, dachInnenEckteilAusHolzRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, halberHolzBogenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, holzDreieckRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kleinesHolzDreieckRezept, 0, 0, 0))

/* =====================  Unterschl�pfe aus Metall (Konstruktionsforschungsstation) == */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, metallWandRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, metallBodenPlatteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, duenneMetallWandRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, metallTuerRahmenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, metallDachRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, glasPlatteMitMetallRahmenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, metallRampeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kleineMetallPlatteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, schraegeMetallPlatteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kleineMetallWandRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, metallFensterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, metallTuerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, elektrischeMetallTuerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, metallDachPlatteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, metallDachEckStueckRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, metallBogenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, halbeMetallRampeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kurzeMetallWandRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, metallFassadeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kleineMetallTuerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, grosseElektrischeMetallTuerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, dachInnenEckteilAusMetallRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, halberMetallBogenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, metallDreieckRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kleinesMetallDreieckRezept, 0, 0, 0))

/* =====================  Unterschl�pfe aus Beton (Konstruktionsforschungsstation) === */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, betonWandRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, betonBodenPlatteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, duenneBetonWandRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, betonTuerRahmenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, betonDachRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, glasPlatteMitBetonRahmenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, betonRampeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kleineBetonBodenPlatteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, schraegeBetonPlatteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kleineBetonWandRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, betonFensterRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, betonTuerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, elektrischeBetonTuerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, betonDachPlatteRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, betonDachEckStueckRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, betonBogenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, halbeBetonRampeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kurzeBetonWandRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, betonFassadeRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kleineBetonTuerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, grosseElektrischeBetonTuerRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, dachInnenEckteilAusBetonRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, halberBetonBogenRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, betonDreieckRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kleinesBetonDreieckRezept, 0, 0, 0))

/* =====================  Primitive Formen =========================================== */
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, grosserKeilRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kleinerKeilRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, rohrRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, pyramideRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, gebogenesRohrRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, stabilerWuerfelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, zylinderRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, wuerfelRezept, 0, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, kugelRezept, 0, 0, 0))

/* Stoffe ohne Ger�t zu Fuss wild ernten */
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, eiweissPerle, 300, 339, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, gravitinoBall, 150, 339, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, sturmKristall, 150, 150, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, beutelGift, 150, 150, 0))


	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, natrium, 8, 10, 0)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, sauerStoff, 8, 9, 0))


/* variieren nach Planetentyp k�rzere Zeiten bei geeigneterem Habitat */
/* TODO Planetentyp-Einfluss auf St�ckzahl pro Gebinde abbilden */
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, jadeErbsen, 22, 22, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, suessWurzel, 23, 23, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, fleischigeWurzeln, 18, 18, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, aloeFleisch, 22, 22, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, feuerBeere, 15, 15, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, grahBeere, 19, 19, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, gefroreneKnollen, 38, 17, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, hexaBeere, 15, 15, 0))

	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, heptaPloidWeizen, 14, 14, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, impulsBohnen, 25, 27, 0))

/* Anreise mit Raumschiff zu nat�rlichem Vorkommen auf Planet */
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, kaktusFleisch, 2, 13, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, pilzSchimmel, 10, 10, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, solanium, 4, 29, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, gammaWurzel, 5, 4, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, frostKristall, 4, 4, 0))

	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, sternenKnolle, 8, 12, 0))

/*------------ noch offen ------------- */
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, korvaxKonvergenzWuerfel, 20, 20, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, nipNipKnospen, 20, 20, 0))

	/* nutzbare anomalieen (Deko) */
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, defekterSeparator, 150, 150, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, lichtBruch, 150, 150, 0))

	/* im Notfall Prim�r und Sekund�relement mit Q aus Planetenobjekten schlagen */
	,assertz(sammlung(0, 'System', 'MeinPlanet', herausSchlagen, kohlenStoff, 5, 5, 150))
	
	/* mit Minenlaser auf Planet */
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, radon, 87, 7, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, stickStoff, 9, 9, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, schwefelin, 87, 7, 150)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, ammoniak, 7, 7, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, pilzSchimmel, 1, 1, 150))

	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, diWasserStoff, 4, 4, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, ferritStaub, 3, 3, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, kobalt, 4, 4, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, kohlenStoff, 2, 2, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, kuerbisKnolle, 5, 5, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, sauerStoff, 9, 9, 150))

	/* exofahrzeug minenlaser nutzen */
	,assertz(sammlung(0, 'System', 'MeinPlanet', exoFahrzeugMinenLaserNutzen, sauerStoff, 9, 9, 150))

	/* nur sekund�relement */
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, sternenKnolle, 44, 44, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, gammaWurzel, 83, 50, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, natrium, 7, 7, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, paraffinium, 221, 30, 150))


	/* mit Terrainformer abbauen */
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, ammoniak, 3, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, aktiviertesCadmium, 15, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, aktiviertesEmeril, 8, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, aktiviertesIndium, 46, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, aktiviertesKupfer, 20, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, cadmium, 24, 0, 300))	
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, emeril, 24, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, indium, 20, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, natrium, 6, 0, 300))
	
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, kupfer, 3, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, silikatPulver, 6, 0, 300))
	
	/* mit Terrainformer ausgraben */
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, schmutzigeKnochenFragmente, 300, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, geborgeneDaten, 300, 0, 300))
	
	/* verbesserter Minenlaser */
	,assertz(sammlung(0, 'System', 'MeinPlanet', verbessertenMinenLaserNutzen, verdichteterKohlenStoff, 12, 0, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', verbessertenMinenLaserNutzen, reinesFerrit, 3, 0, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', verbessertenMinenLaserNutzen, paraffinium, 3, 0, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', verbessertenMinenLaserNutzen, mordit, 3, 0, 150))
	
	/* Jagd (mit Glutspeer, ein Schuss = tot, Aufladen ist Nebenzeit) */
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, beinFleisch, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, diploStuecke, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, fleischigeStuecke, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, fleischigeFluegel, 200, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, innereienBeutel, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, katzenLeber, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, mordit, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, protoWurst, 20, 400, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, rohesSteak, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, salzigeFischFilets, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, schreiterWurst, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, schuppigesFleisch, 20, 400, 300))
	
	/* bei Zerst�rung von Wesen */
	,assertz(sammlung(0, 'System', 'MeinPlanet', erkaempfen, pugneum, 12000, 0, 300))      /* von W�chter */
	,assertz(sammlung(0, 'System', 'MeinPlanet', erkaempfen, larvenKern, 9000, 0, 300))       /*  von fl�sterndes Ei */
	,assertz(sammlung(0, 'System', 'MeinPlanet', erkaempfen, kampfLaeuferGehirn, 50000, 0, 300))     /* von Kampfl�ufer */
	,assertz(sammlung(0, 'System', 'MeinPlanet', erkaempfen, unholdRogen, 12000, 0, 300))  /*   von ??? */
	
	/* Meteoritenfelder */
	,assertz(sammlung(0, 'System', 'MeinPlanet', raumSchuerfen, tritium, 2, 0, 63))
	,assertz(sammlung(0, 'System', 'MeinPlanet', raumSchuerfen, gold, 75, 0, 63))
	,assertz(sammlung(0, 'System', 'MeinPlanet', raumSchuerfen, silber, 16, 0, 63))
	,assertz(sammlung(0, 'System', 'MeinPlanet', raumSchuerfen, platin, 20, 0, 63))
	
	/* kaufen */
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, diWasserStoffGelee, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, ferritStaub, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, ionenAkku, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, kabelBaum, 150, 1310, 2460))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, raumSchiffStartTreibStoff, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, restSubstanz, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, kobalt, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, kobaltSpiegel, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, metallPlatten, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, mikroProzessor, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, natrium, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, navigationsDaten, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, pyrit, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, pugneum, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, reinesFerrit, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, salz, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, sauerStoff, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, sauerStoffKapsel, 150, 1310, 1000))
	

	/* Aus Anbau */
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, frostKristall, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, eiweissPerle, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, gammaWurzel, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, gravitinoBall, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, pilzSchimmel, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, faecium, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, kaktusFleisch, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, sternenKnolle, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, mordit, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, solanium, 20, 0, 0))
	
	/* aus Tierhaltung */
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, faecium, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, frischeMilch, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, holzApfel, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, klebrigerHonig, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, leopardenFrucht, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, regisFett, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, wildeMilch, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, riesenEi, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, kreaturenEi, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, grosseEier, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, warmeProtoMilch, 20, 0, 0))
	
	/* Stoff ohne Ger�t unter Wasser ernten */
	,assertz(sammlung(0, 'System', 'MeinPlanet', ertauchen, kristallSulfid, 150, 634, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ertauchen, kelpBeutel, 18, 32, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ertauchen, zytoPhosphat, 20, 0, 150))
	
	/* Stoff unter Wasser mit Waffe erbeuten */
	,assertz(sammlung(0, 'System', 'MeinPlanet', unterWasserErkaempfen, lebendePerle, 150, 680, 0))     /* von gepanzerte Muschel */
	,assertz(sammlung(0, 'System', 'MeinPlanet', unterWasserErkaempfen, hypnotischesAuge, 4500, 0, 0)) /* von abyssal horror */
	.

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


copyDefaultIfEmpty(System, Planet) :-
	findall(Stoff, sammlung(_, System, Planet, _, Stoff, _, _, _), Stoffe),
	((Stoffe = [],
	  forall((sammlung(RecNo, 'System', 'MeinPlanet', Operation, Stoff, Haupt, Neben, Ruest)),
	      assertz(sammlung(RecNo, System, Planet, Operation, Stoff, Haupt, Neben, Ruest))));
	  true
	).
	
sammelbarReInit(System, Planet) :-
	\+sammelbarInitFlach(System, Planet),
	\+sammelbarVorfertigen(System, Planet).
	
sammelbarInitFlach(System, Planet) :-
	retractall(sammelbar(_, _)),
	stoff:stoff(_, Stoff, _),
	(sammlung(_, System, Planet, Operation, Stoff, _, _, _);
	 /* raumSchuerfen geht auf jedem Planeten */
	 (Operation = raumSchuerfen, sammlung(_, 'System', 'MeinPlanet', Operation, Stoff, _, _, _));
	 /* rezepte sind auch �berall gleich bekannt */
	 (Operation = bekannt, sammlung(_, 'System', 'MeinPlanet', Operation, Stoff, _, _, _))
	),
	sammelAktion:pruefeOperationVorraussetzung(Operation),
	assertz(sammelbar(Stoff, Operation)),
	fail.
	
sammelbarVorfertigen(System, Planet) :-
	retractall(fertigeLoesung(_, _, _)),
	vorfertigen(Stoff),
	\+generiereFertigeLoesungen(System, Planet, Stoff),
	fail.
	
generiereFertigeLoesungen(System, Planet, Stoff) :-
	optimierung:optimierungsZiel(Strategie),
	\+suchAlgorithmus:baueFuerVorfertigung(System, Planet, Strategie, 1, Stoff),
	optimierung:optimierungsStrategie(Strategie, Stoff, _, Vorgaenge, _, _, _, _, _),
	assertz(fertigeLoesung(Strategie, Stoff, Vorgaenge)),
	fail.
