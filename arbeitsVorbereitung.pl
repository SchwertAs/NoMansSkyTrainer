:- module(arbeitsVorbereitung, [toDauer/6, toRuestHauptNebenZeit/8, bildeAvZeiten/3]).

/* ReiseZeit ist Zeit bis vor Ort des Stoffwechsels / Sammelns
   Hauptzeit ist Abbauzeit pro St�ck ohne Haufenwechsel
   Nebenzeiten sind: laufen zwischen den Haufen, Werkzeug ausrichten, Kaufobjekt suchen, Kaufzahl einstellen, Wild nachsetzen
   Ruestzeiten sind: beladen, entladen, Werkzeug ziehen, Kaufterminal �ffnen, Multiwerkzeugwechsel
*/
bildeAvZeiten(Vorgaenge, Zeit, ZeitDanach) :-
	Vorgaenge = [],
	ZeitDanach = Zeit,
	!.

/* Sammelvorg�nge */
bildeAvZeiten(Vorgaenge, Zeit, ZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [System, Planet, _, Operation, _, [StueckZahl, Stoff]],
	sammlung:sammlung(_, System, Planet, Operation, Stoff, HauptZeit0, NebenZeit0, RuestZeit0),
	Operation \= kaufen,
	Zeit1 is Zeit + (StueckZahl * HauptZeit0), 
	Zeit2 is Zeit1 + ((StueckZahl - 1) * NebenZeit0),
	Zeit3 is Zeit2 + RuestZeit0,
	bildeAvZeiten(Rest, Zeit3, ZeitDanach),
	!.

/* kaufen */
bildeAvZeiten(Vorgaenge, Zeit, ZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [System, Planet, _, Operation, _, [_, Stoff]],
	sammlung:sammlung(_, System, Planet, Operation, Stoff, HauptZeit0, NebenZeit0, RuestZeit0),
	Operation = kaufen,
	Zeit1 is Zeit + HauptZeit0, 
	Zeit2 is Zeit1 + NebenZeit0,
	Zeit3 is Zeit2 + RuestZeit0,
	bildeAvZeiten(Rest, Zeit3, ZeitDanach),
	!.

/* Stoffwandlungen */
/* modul erwerben */
bildeAvZeiten(Vorgaenge, Zeit, ZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, _, _, Operation, _, [_, Stoff]],
	Operation = modulInRaumstationErwerben,
	rezept:rezept(Operation, _, [AnzahlGekauft, Stoff], ZeitProAusgabeStueck),
	/* Seite anw�hlen, klicken */
	Zeit1 is Zeit + AnzahlGekauft * ZeitProAusgabeStueck, 
	/* Terminal �ffnen -> R�stzeit ist H�ndler ansprechen, Dialog durchklicken, schlie�en */
	RuestZeit0 is 150 + 680  + 110,
	Zeit2 is Zeit1 + RuestZeit0,
	bildeAvZeiten(Rest, Zeit2, ZeitDanach),
	!.

/* raffinieren R�stzeit nur f�r eine Charge */
bildeAvZeiten(Vorgaenge, Zeit, ZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, _, _, Operation, _, [AnzahlRaffiniert, Stoff]],
	(Operation = raffinieren; Operation = inEinfacherRaffinerieRaffinieren; Operation = kochen),
	rezept:rezept(Operation, Komponenten, [_, Stoff], ZeitProAusgabeStueck),
	HauptZeit is AnzahlRaffiniert * ZeitProAusgabeStueck,
	Zeit1 is Zeit + HauptZeit, 
	/* Je mehr Komponenten desto mehr R�stzeit */
	length(Komponenten, KomponentenZahl),
	/* Raffinerie �ffnen, Komponenten aussuchen und plazieren, starten, Ausgabefach entleeren */
	RuestZeit is 290 + 620 * KomponentenZahl + 250 + 588,
	Zeit2 is Zeit1 + RuestZeit,
	bildeAvZeiten(Rest, Zeit2, ZeitDanach),
	!.

bildeAvZeiten(Vorgaenge, Zeit, ZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, _, _, Operation, _, [AnzahlRaffiniert, Stoff]],
	Operation = herstellen,
	rezept:rezept(Operation, _	, [_, Stoff], ZeitProAusgabeStueck),
	HauptZeit is AnzahlRaffiniert * ZeitProAusgabeStueck,
	Zeit1 is Zeit + HauptZeit, 
	/* einmalig zur�ckfahren, "mehr herstellen" ausf�hren */
	NebenZeit is 150 + AnzahlRaffiniert * 80,
	Zeit2 is Zeit1 + NebenZeit, 
	/* Je mehr Komponenten desto mehr R�stzeit */
	/* Inventar �ffnen, auf Seite navigieren (Durchschnittszeit), aussuchen, klicken, Inventar schlie�en	 */
	RuestZeit is 70 + 50 + 420 + 15 + 70, /* insgesamt */
	Zeit3 is Zeit2 + RuestZeit,
	bildeAvZeiten(Rest, Zeit3, ZeitDanach),
	!.

bildeAvZeiten(Vorgaenge, Zeit, ZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, _, _, Operation, _, [AnzahlRaffiniert, Stoff]],
	Operation = bauen,
	rezept:rezept(Operation, _, [_, Stoff], ZeitProAusgabeStueck),
	HauptZeit is AnzahlRaffiniert * ZeitProAusgabeStueck,
	Zeit1 is Zeit + HauptZeit, 
	/* Baumen� �ffnen, alle Ebenen zur�ck (alternative Esc Esc (115/100 sec) ist ungebr�uchlich) */
	RuestZeit is 50 + 250,
	Zeit2 is Zeit1 + RuestZeit,
	bildeAvZeiten(Rest, Zeit2, ZeitDanach),
	!.

/* nur das leeren der Anlagen wird betrachte, die Produktionszeit ist unabh�ngig */
bildeAvZeiten(Vorgaenge, Zeit, ZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, _, _, Operation, _, [AnzahlRaffiniert, Stoff]],
	(Operation = ausSauerStoffVearbeiterGewinnen; Operation = ausAtmosphaerenAnlageGewinnen),
	rezept:rezept(Operation, _, [_, Stoff], ZeitProAusgabeStueck),
	HauptZeit is AnzahlRaffiniert * ZeitProAusgabeStueck,
	Zeit1 is Zeit + HauptZeit, 
	/* Atmospherenanlage �ffnen, Treibstoff plazieren, Ausgabefach entleeren */
	RuestZeit is 290 + 620 + 588,
	Zeit2 is Zeit1 + RuestZeit,
	bildeAvZeiten(Rest, Zeit2, ZeitDanach),
	!.

/* Zeit zur Suche und Aufbruch der Fabrik nicht ber�cksichtigt */
bildeAvZeiten(Vorgaenge, Zeit, ZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, _, _, Operation, _, [AnzahlRaffiniert, Stoff]],
	(Operation = rezeptInAnomalieErwerben; 
	 Operation = rezeptInFabrikErwerben;
	 Operation = rezeptInAnomalieForschungsComputerErwerben	 
	),
	rezept:rezept(Operation, _, [_, Stoff], ZeitProAusgabeStueck),
	HauptZeit is AnzahlRaffiniert * ZeitProAusgabeStueck,
	Zeit1 is Zeit + HauptZeit, 
	/* H�ndler / Terminal ansprechen / �ffnen, Dialog durchklicken, schlie�en */
	RuestZeit is 150 + 680 + 110, 
	Zeit2 is Zeit1 + RuestZeit,
	bildeAvZeiten(Rest, Zeit2, ZeitDanach),
	!.


/* vorgang ohne AV Bewertung */
bildeAvZeiten(Vorgaenge, Zeit, ZeitDanach) :-
	Vorgaenge = [_|Rest],
	bildeAvZeiten(Rest, Zeit, ZeitDanach),
	!.

/* in der R�stzeit ist auch die Abr�stzeit drin */
methodeToRuestZeit(bekannt, 0).
methodeToRuestZeit(pfluecken, 0).
methodeToRuestZeit(minenLaserNutzen, 150).
methodeToRuestZeit(terrainFormerNutzen, 300).
methodeToRuestZeit(verbessertenMinenLaserNutzen, 150).
methodeToRuestZeit(exoFahrzeugMinenLaserNutzen, 150).
methodeToRuestZeit(jagen, 300).
methodeToRuestZeit(erkaempfen, 300).
methodeToRuestZeit(kaufen, 1000).
methodeToRuestZeit(ernten, 0).
methodeToRuestZeit(vonTierErhalten, 0).
methodeToRuestZeit(ertauchen, 150).
methodeToRuestZeit(unterWasserErkaempfen, 0).
methodeToRuestZeit(herausSchlagen, 150).
methodeToRuestZeit(raumSchuerfen, 63).

/* Zeit f�r den Wechsel zwischen zwei Gebinden des Stoffs */
methodeToNebenZeit(bekannt, 0).
methodeToNebenZeit(minenLaserNutzen, 40).
methodeToNebenZeit(herausSchlagen, 40).
methodeToNebenZeit(raumSchuerfen, 120).
methodeToNebenZeit(terrainFormerNutzen, 40).
methodeToNebenZeit(verbessertenMinenLaserNutzen, 40).
methodeToNebenZeit(jagen, 40).
methodeToNebenZeit(erkaempfen, 40).
methodeToNebenZeit(kaufen, 30).
methodeToNebenZeit(ernten, 80).
methodeToNebenZeit(vonTierErhalten, 40).
methodeToNebenZeit(ertauchen, 40).
methodeToNebenZeit(unterWasserErkaempfen, 40).

methodeToHauptZeit(pfluecken, 100).
methodeToHauptZeit(ernten, 100).
methodeToHauptZeit(vonTierErhalten, 100).
methodeToHauptZeit(unterWasserErkaempfen, 100).

/* aus Eingaben berechnen wenn m�glich */
toRuestHauptNebenZeit(_, _, Anzahl, Dauer, Gebinde, Haupt, Neben, Ruest) :-
	Gebinde > 1,
	AnzahlHauptZeiten is Gebinde,
	AnzahlNebenZeiten is Gebinde - 1,
	AnzahlRuestZeiten is 1,
	AnteileSumme is AnzahlHauptZeiten + AnzahlNebenZeiten + AnzahlRuestZeiten,
	DauerEinStueck is Dauer / Anzahl,
	Haupt is DauerEinStueck * AnteileSumme / AnzahlHauptZeiten,
	Neben is DauerEinStueck * AnteileSumme / AnzahlNebenZeiten,
	Ruest is DauerEinStueck * AnteileSumme / AnzahlRuestZeiten,
	!.
	
/* aus gemessenen Default Werten ermitteln */
toRuestHauptNebenZeit(Stoff, Methode, Anzahl, Dauer, _, Haupt, Neben, Ruest) :-
	sammlung:sammlung(0, 'System', 'MeinPlanet', Methode, Stoff, AnzahlHauptZeiten, AnzahlNebenZeiten, AnzahlRuestZeiten),
	AnteileSumme is AnzahlHauptZeiten + AnzahlNebenZeiten + AnzahlRuestZeiten,
	DauerEinStueck is Dauer / Anzahl,
	Haupt is DauerEinStueck * AnteileSumme / AnzahlHauptZeiten,
	Neben is DauerEinStueck * AnteileSumme / AnzahlNebenZeiten,
	Ruest is DauerEinStueck * AnteileSumme / AnzahlRuestZeiten,
	!.

toDauer(_, Anzahl, Ruest, Haupt, Neben, Dauer) :-
	Haupt0 is Haupt * Anzahl,
	Neben0 is Neben * Anzahl,
	Ruest0 is Ruest * Anzahl,
	Dauer is Haupt0 + Neben0 + Ruest0.
	