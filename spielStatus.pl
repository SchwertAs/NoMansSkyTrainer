:- module(spielStatus, [planeten/4, systeme/3, spielStatus/2, 
          systemAusstattung/2, sprache/1, sternFarbe/1]).

:- dynamic(spielStatus/2).
:- dynamic(systeme/3).
:- dynamic(planeten/4).
:- dynamic(systemAusstattung/2).
:- dynamic(sprache/1).

/* Spielkonditionen */
/* Sammelmöglichkeiten */
spielStatusInit :-  
	initSpielStatus,
	initSysteme,
	initPlaneten,
	initSystemAusstattung,
	abolish(sprache/1), assertz(sprache(en)).

initSpielStatus :-
	abolish(spielStatus/2)
	,assertz(spielStatus(minenLaser, true))
	,assertz(spielStatus(verbesserterMinenLaser, false))
	,assertz(spielStatus(terrainFormer, false))
	,assertz(spielStatus(waffeVorhanden, false))
	,assertz(spielStatus(solarStrahl, false))
	,assertz(spielStatus(gemuetsStrahl, false))
	,assertz(spielStatus(anzugRaffinerie, false))
	,assertz(spielStatus(raumSchiffIstFlott, false))
	,assertz(spielStatus(exoFahrzeugMinenLaser, false))
	,assertz(spielStatus(frachterVorhanden, false))
	,assertz(spielStatus(sphaereRufbar, false))
	,assertz(spielStatus(konfiguriert, false))
	.

initSysteme :-
	abolish(systeme/3)
	,assertz(systeme(0, 'System', 'gelb')).
	
sternFarbe('gelb').
sternFarbe('rot').
sternFarbe('gruen').
sternFarbe('blau').
	
moeglicheSprache(de).
moeglicheSprache(en).

initPlaneten :-
	abolish(planeten/4)
	/* Bezeichnung und Atmospherentyp */
	/* System, Planet, oneOf(planetSammelEigenschaftenDefaults:planetenTyp(Typ)) */
	,assertz(planeten(0, 'System', 'MeinPlanet', giftiger)).
	
initSystemAusstattung :-
	/* nur defaults Aktueller Ort kommt aus Eingabemaske */
	abolish(systemAusstattung/2)
	/* ort(<ort>, <Reisezeit von Hauptbasis in 1/100 sec>) */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortAnomalie], 8500)) /* aus Questfortschritt fix */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortAtmosphaerenAnlage], 536)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortAussenPosten], 11336)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortBasisTerminus], 430)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortBergbauEinheit], 257)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortForschungsTerminal], 470)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortFrachter], 5100)) /* fix: von Basis bis Brücke Frachter */ 
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortGrosseRaffinerie], 2400)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortHandelsStation], 18000)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortHandelsTerminal], 1107)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortHauptBasis], 0)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortKleineRaffinerie], 1171)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortMittlereRaffinerie], 1135)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortNahrungsProzessor], 1100)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortPlantage], 620)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortRaumStation], 2914)) /* zwansgseingabe aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortSauerStoffVerarbeiter], 536)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortSpieler], 0))
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortWald], 1500)) /* fix */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortWasser], 10660)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortWeltRaum], 2300)) /* fix */
	.
	
copyDefaultIfEmpty(System, Planet) :-
	findall(Entfernung, systemAusstattung([System, Planet, _], Entfernung), Entfernungen),
	((Entfernungen = [],
	  forall((questOrt(Ort, vonAnfangAn),
	          systemAusstattung(['System', 'MeinPlanet', Ort], Entfernung)),
	          assertz(systemAusstattung([System, Planet, Ort], Entfernung))));
	  true
	).

/* ------------------------- PlanetenAusstattung durch Quest erworben ----------------------------- */
questOrt(ortWald, vonAnfangAn).
questOrt(ortRaumStation, vonAnfangAn).
questOrt(ortSpieler, vonAnfangAn).

/* ------------------------- Rezepte durch Quest erworben ----------------------------- */
/* Rezeptstoff, Event, Questname */
/* herstellen */
questRezept(raumSchiffStartTreibStoffRezept, vonAnfangAn, erwachen).
questRezept(warpZelleRezept, vonAnfangAn, erwachen).
questRezept(ionenAkkuRezept, vonAnfangAn, erwachen).
questRezept(lebensErhaltungsGelRezept, vonAnfangAn, erwachen).
questRezept(diWasserStoffGeleeRezept, vonAnfangAn, erwachen).
questRezept(metallPlattenRezept, vonAnfangAn, erwachen).
questRezept(kohlenStoffNanoRohrRezept, vonAnfangAn, erwachen).
questRezept(projektilMunitionRezept, vonAnfangAn, erwachen).
questRezept(kreaturenKugelnRezept, vonAnfangAn, erwachen).

/* installieren Anzug */
questRezept(sauerStoffWiederVerwerterCRezept, vonAnfangAn, erwachen).

/* installieren Multiwerkzeug */
questRezept(scannerRezept, vonAnfangAn, erwachen).
questRezept(minenLaserRezept, vonAnfangAn, erwachen).
questRezept(analyseVisierRezept, vonAnfangAn, erwachen).
questRezept(blitzWerferRezept, vonAnfangAn, erwachen).

/* installieren Raumschiff */
questRezept(impulsAntriebRezept, vonAnfangAn, erwachen).
questRezept(startSchubDueseRezept, vonAnfangAn, erwachen).
questRezept(raketenWerferRezept, vonAnfangAn, erwachen).
questRezept(deflektorSchildRezept, vonAnfangAn, erwachen).
questRezept(photonenKanoneRezept, vonAnfangAn, erwachen).

/* bauen */
questRezept(tragbareRaffinerieRezept, vonAnfangAn, erwachen).

/* chronologisch 
questRezept(fusionsAntriebRezept, nachRoamerBau, erwachen).
questRezept(humboldtAntriebRezept, nachNautilusBau, erwachen).

questRezept(basisComputer, signalUntersuchen, erwachen).
questRezept(terrainManipulator, signalUntersuchen, erwachen).
questRezept(konstruktionsForschungsStation, basisDatenComputerAktualisieren, erwachen).
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
questRezept(geoDesit, fabrikWiederEinschalten, zweiteFabrik). */


