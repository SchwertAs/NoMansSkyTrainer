:- module(spielStatus, [planeten/2, systeme/2, spielStatus/2, systemAusstattung/2]).

:- dynamic(spielStatus/2).
:- dynamic(systeme/2).
:- dynamic(planeten/2).
:- dynamic(systemAusstattung/2).

/* Spielkonditionen */
/* Sammelmöglichkeiten */
spielStatusInit :-  
	initSpielStatus,
	initSysteme,
	initPlaneten(_),
	initSystemAusstattung.

initSpielStatus :-
	abolish(spielStatus/2)
	,assertz(spielStatus(minenLaser, default))
	,assertz(spielStatus(verbesserterMinenLaser, default))
	,assertz(spielStatus(terrainFormer, default))
	,assertz(spielStatus(waffeVorhanden, default))
	,assertz(spielStatus(raumSchiffIstFlott, default))
	,assertz(spielStatus(exoFahrzeugMinenLaser, default))
	,assertz(spielStatus(frachterVorhanden, default))
	,assertz(spielStatus(sphaereRufbar, default))
	.

initSysteme :-
	abolish(systeme/2)
	,assertz(systeme('System', 'gelb')).
	
initPlaneten(System) :-
	ignore(retractall(planeten(System, _)))
	,(atom(System); assertz(planeten('System', 'MeinPlanet'))).

initSystemAusstattung :-
	/* nur defaults Aktueller Ort kommt aus Eingabemaske */
	abolish(systemAusstattung/2)
	/* ort(<ort>, <Reisezeit von Hauptbasis in 1/100 sec>) */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortHauptBasis], 0)) /* fix */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortWald], 1500)) /* fix */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortWeltRaum], 1431)) /* fix */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortAnomalie], 1444)) /* fix */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortRaumStation], 2914)) /* fix */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortAthmosphaerenAnlageSauerStoff], 536)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortAthmosphaerenAnlageStickStoff], 536)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortBasisTerminus], 430)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortWasser], 10660)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortAussenPosten], 11336)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortNahrungsProzessor], 1100)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortKleineRaffinerie], 1171)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortMittlereRaffinerie], 1135)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortGrosseRaffinerie], 2400)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortHandelsTerminal], 1107)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortForschungsTerminal], 470)) /* aus Maske */
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortFrachter], 2400)) 
	,assertz(systemAusstattung(['System', 'MeinPlanet', ortSpieler], 0)).


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


