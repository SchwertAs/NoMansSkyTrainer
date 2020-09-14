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
	abolish(sprache/1), assertz(sprache(de)).

initSpielStatus :-
	abolish(spielStatus/2)
	,assertz(spielStatus(minenLaser, true))
	,assertz(spielStatus(verbesserterMinenLaser, true))
	,assertz(spielStatus(terrainFormer, true))
	,assertz(spielStatus(waffeVorhanden, true))
	,assertz(spielStatus(solarStrahl, true))
	,assertz(spielStatus(gemuetsStrahl, true))
	,assertz(spielStatus(raumSchiffIstFlott, true))
	,assertz(spielStatus(exoFahrzeugMinenLaser, true))
	,assertz(spielStatus(frachterVorhanden, true))
	,assertz(spielStatus(sphaereRufbar, true))
	,assertz(spielStatus(konfiguriert, false))
	.

initSysteme :-
	abolish(systeme/3)
	,assertz(systeme(0, 'System', 'gelb')).

sternFarbe('gelb').
sternFarbe('rot').
sternFarbe('gruen').
sternFarbe('blau').
	
initPlaneten :-
	abolish(planeten/4)
	/* Bezeichnung und Atmospherentyp */
	/* System, Planet, oneOf(planetSammelEigenschaftenDefaults:planetenTyp(Typ)) */
	,assertz(planeten(0, 'System', 'MeinPlanet', giftiger)).
	
initSystemAusstattung :-
	/* nur defaults Aktueller Ort kommt aus Eingabemaske */
	abolish(systemAusstattung/2)
	/* ort(<ort>, <Reisezeit von Hauptbasis in 1/100 sec>) */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortAtmosphaerenAnlage], 536)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortBergbauEinheit], 257)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortSauerStoffVerarbeiter], 536)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortAussenPosten], 11336)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortBasisTerminus], 430)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortAnomalie], 1444)) /* fix weil sie gerufen werden kann */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortForschungsTerminal], 470)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortFrachter], 5100)) /* fix: von Basis bis Brücke Frachter */ 
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortGrosseRaffinerie], 2400)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortHandelsTerminal], 1107)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortHandelsStation], 18000)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortHauptBasis], 0)) /* fix */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortKleineRaffinerie], 1171)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortMittlereRaffinerie], 1135)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortNahrungsProzessor], 1100)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortPlantage], 620)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortRaumStation], 2914)) /* fix */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortSpieler], 0))
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortWald], 1500)) /* fix */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortWasser], 10660)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortWeltRaum], 1431)) /* fix */
	.
	
copyDefaultIfEmpty(System, Planet) :-
	findall(Entfernung, systemAusstattung([System, Planet, _], Entfernung), Entfernungen),
	((Entfernungen = [],
	  forall(systemAusstattung(['System', 'MeinPlanet', Ort], Entfernung),
	      assertz(systemAusstattung([System, Planet, Ort], Entfernung))));
	  true
	).

/* ------------------------- Rezepte für Wertvolle Dinge ----------------------------- */
/* Rezeptstoff, Event, Questname
-- herstellen 
questRezept(raumSchiffStartTreibStoff, vonAnfangAn, erwachen).
questRezept(warpZelle, vonAnfangAn, erwachen).
questRezept(ionenAkku, vonAnfangAn, erwachen).
questRezept(lebensErhaltungsGel, vonAnfangAn, erwachen).
questRezept(diWasserStoffGelee, vonAnfangAn, erwachen).
questRezept(metallPlatten, vonAnfangAn, erwachen).
questRezept(kohlenStoffNanoRohr, vonAnfangAn, erwachen).
questRezept(projektilMunition, vonAnfangAn, erwachen).
questRezept(kreaturenKugeln, vonAnfangAn, erwachen).

-- installieren Anzug 
questRezept(scanner, vonAnfangAn, erwachen).
questRezept(minenLaser, vonAnfangAn, erwachen).
questRezept(analyseVisier, vonAnfangAn, erwachen).
questRezept(blitzWerfer, vonAnfangAn, erwachen).

-- installieren Raumschiff 
questRezept(impulsAntrieb, vonAnfangAn, erwachen).
questRezept(startSchubDuese, vonAnfangAn, erwachen).
questRezept(raketenWerfer, vonAnfangAn, erwachen).
questRezept(deflektorSchild, vonAnfangAn, erwachen).
questRezept(photonenKanone, vonAnfangAn, erwachen).

-- installieren Fahrzeuge
questRezept(fusionsAntrieb, vonAnfangAn, erwachen).
questRezept(humboldtAntrieb, vonAnfangAn, erwachen).


-- bauen 
questRezept(tragbareRaffinerie, vonAnfangAn, erwachen).
questRezept(tiefSeeKammer, vonAnfangAn, erwachen).
questRezept(flagge2, vonAnfangAn, erwachen).
questRezept(metallWand, vonAnfangAn, erwachen).

-- chronologisch 
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
 */

