:- module(arbeitsVorbereitung, [toDauer/6, toRuestHauptNebenZeit/7, bildeAvZeiten/7]).

/* ReiseZeit ist Zeit bis vor Ort des Stoffwechsels / Sammelns
   Hauptzeit ist Abbauzeit pro Stück ohne Haufenwechsel
   Nebenzeiten sind: laufen zwischen den Haufen, Werkzeug ausrichten, Kaufobjekt suchen, Kaufzahl einstellen, Wild nachsetzen
   Ruestzeiten sind: beladen, entladen, Werkzeug ziehen, Kaufterminal öffnen, Multiwerkzeugwechsel
*/
bildeAvZeiten(Vorgaenge, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach) :-
	Vorgaenge = [],
	HauptZeitDanach = HauptZeit,
	NebenZeitDanach = NebenZeit,
	RuestZeitDanach = RuestZeit,
	!.

/* Sammelvorgänge */
bildeAvZeiten(Vorgaenge, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [System, Planet, _, Operation, _, [StueckZahl, Stoff]],
	sammlung:sammlung(_, System, Planet, Operation, Stoff, HauptZeit0, NebenZeit0, RuestZeit0),
	Operation \= kaufen,
	HauptZeit1 is HauptZeit + (StueckZahl * HauptZeit0), 
	NebenZeit1 is NebenZeit + ((StueckZahl - 1) * NebenZeit0),
	RuestZeit1 is RuestZeit + RuestZeit0,
	bildeAvZeiten(Rest, HauptZeit1, HauptZeitDanach, NebenZeit1, NebenZeitDanach, RuestZeit1, RuestZeitDanach),
	!.

/* kaufen Rüstzeit nur für ersten Kaufvorgang */
bildeAvZeiten(Vorgaenge, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [System, Planet, _, Operation, _, [_, Stoff]],
	sammlung:sammlung(_, System, Planet, Operation, Stoff, HauptZeit0, NebenZeit0, RuestZeit0),
	Operation = kaufen,
	HauptZeit1 is HauptZeit + HauptZeit0, 
	NebenZeit1 is NebenZeit + NebenZeit0,
	/* beim Ersten Kauf Terminal öffnen -> Rüstzeit */
	((RuestZeit = 0, RuestZeit1 is RuestZeit + RuestZeit0);
	 (RuestZeit \= 0, RuestZeit1 = RuestZeit)
	),
	bildeAvZeiten(Rest, HauptZeit1, HauptZeitDanach, NebenZeit1, NebenZeitDanach, RuestZeit1, RuestZeitDanach),
	!.

/* Stoffwandlungen */
/* modul erwerben */
bildeAvZeiten(Vorgaenge, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, _, _, Operation, _, [_, Stoff]],
	Operation = modulInRaumstationErwerben,
	rezept:rezept(Operation, _, [AnzahlGekauft, Stoff], ZeitProAusgabeStueck),
	/* Seite anwählen, klicken */
	HauptZeit1 is HauptZeit + AnzahlGekauft * ZeitProAusgabeStueck, 
	NebenZeit0 is 0,
	NebenZeit1 is NebenZeit + NebenZeit0,
	/* beim Ersten Kauf Terminal öffnen -> Rüstzeit ist Händler ansprechen, Dialog durchklicken, schließen */
	RuestZeit0 is 150 + 680  + 110,
	((RuestZeit = 0, RuestZeit1 is RuestZeit + RuestZeit0);
	 (RuestZeit \= 0, RuestZeit1 = RuestZeit)
	),
	bildeAvZeiten(Rest, HauptZeit1, HauptZeitDanach, NebenZeit1, NebenZeitDanach, RuestZeit1, RuestZeitDanach),
	!.

/* raffinieren Rüstzeit nur für eine Charge */
bildeAvZeiten(Vorgaenge, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, _, _, Operation, _, [AnzahlRaffiniert, Stoff]],
	(Operation = raffinieren; Operation = kochen),
	rezept:rezept(Operation, Komponenten, [_, Stoff], ZeitProAusgabeStueck),
	HauptZeit0 is AnzahlRaffiniert * ZeitProAusgabeStueck,
	HauptZeit1 is HauptZeit + HauptZeit0, 
	NebenZeit0 is 0, /* chargenwechsel nicht berücksichtigt */
	NebenZeit1 is NebenZeit + NebenZeit0, 
	/* Je mehr Komponenten desto mehr Rüstzeit */
	length(Komponenten, KomponentenZahl),
	/* Raffinerie öffnen, Komponenten aussuchen und plazieren, starten, Ausgabefach entleeren */
	RuestZeit0 is 290 + 620 * KomponentenZahl + 250 + 588,
	RuestZeit1 is RuestZeit + RuestZeit0,
	bildeAvZeiten(Rest, HauptZeit1, HauptZeitDanach, NebenZeit1, NebenZeitDanach, RuestZeit1, RuestZeitDanach),
	!.

bildeAvZeiten(Vorgaenge, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, _, _, Operation, _, [AnzahlRaffiniert, Stoff]],
	Operation = herstellen,
	rezept:rezept(Operation, _	, [_, Stoff], ZeitProAusgabeStueck),
	HauptZeit0 is AnzahlRaffiniert * ZeitProAusgabeStueck,
	HauptZeit1 is HauptZeit + HauptZeit0, 
	/* einmalig zurückfahren, "mehr herstellen" ausführen */
	NebenZeit0 is 150 + AnzahlRaffiniert * 80,
	NebenZeit0 is 0, /* chargenwechsel nicht berücksichtigt */
	NebenZeit1 is NebenZeit + NebenZeit0, 
	/* Je mehr Komponenten desto mehr Rüstzeit */
	/* Inventar öffnen, auf Seite navigieren (Durchschnittszeit), aussuchen, klicken, Inventar schließen	 */
	RuestZeit0 is 70 + 50 + 420 + 15 + 70, /* insgesamt */
	RuestZeit1 is RuestZeit + RuestZeit0,
	bildeAvZeiten(Rest, HauptZeit1, HauptZeitDanach, NebenZeit1, NebenZeitDanach, RuestZeit1, RuestZeitDanach),
	!.

bildeAvZeiten(Vorgaenge, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, _, _, Operation, _, [AnzahlRaffiniert, Stoff]],
	Operation = bauen,
	rezept:rezept(Operation, _, [_, Stoff], ZeitProAusgabeStueck),
	HauptZeit0 is AnzahlRaffiniert * ZeitProAusgabeStueck,
	HauptZeit1 is HauptZeit + HauptZeit0, 
	NebenZeit0 is 0, 
	NebenZeit1 is NebenZeit + NebenZeit0, 
	/* Baumenü öffnen, alle Ebenen zurück (alternative Esc Esc (115/100 sec) ist ungebräuchlich) */
	RuestZeit0 is 50 + 250,
	RuestZeit1 is RuestZeit + RuestZeit0,
	bildeAvZeiten(Rest, HauptZeit1, HauptZeitDanach, NebenZeit1, NebenZeitDanach, RuestZeit1, RuestZeitDanach),
	!.

/* nur das leeren der Anlagen wird betrachte, die Produktionszeit ist unabhängig */
bildeAvZeiten(Vorgaenge, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, _, _, Operation, _, [AnzahlRaffiniert, Stoff]],
	(Operation = ausSauerStoffVearbeiterGewinnen; Operation = ausAtmosphaerenAnlageGewinnen),
	rezept:rezept(Operation, _, [_, Stoff], ZeitProAusgabeStueck),
	HauptZeit0 is AnzahlRaffiniert * ZeitProAusgabeStueck,
	HauptZeit1 is HauptZeit + HauptZeit0, 
	NebenZeit0 is 0, /* chargenwechsel nicht berücksichtigt */
	NebenZeit1 is NebenZeit + NebenZeit0, 
	/* Atmospherenanlage öffnen, Treibstoff plazieren, Ausgabefach entleeren */
	RuestZeit0 is 290 + 620 + 588,
	RuestZeit1 is RuestZeit + RuestZeit0,
	bildeAvZeiten(Rest, HauptZeit1, HauptZeitDanach, NebenZeit1, NebenZeitDanach, RuestZeit1, RuestZeitDanach),
	!.

/* Zeit zur Suche und Aufbruch der Fabrik nicht berücksichtigt */
bildeAvZeiten(Vorgaenge, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, _, _, Operation, _, [AnzahlRaffiniert, Stoff]],
	(Operation = rezeptInAnomalieErwerben; 
	 Operation = rezeptInFabrikErwerben;
	 Operation = rezeptInAnomalieForschungsComputerErwerben	 
	),
	rezept:rezept(Operation, _, [_, Stoff], ZeitProAusgabeStueck),
	HauptZeit0 is AnzahlRaffiniert * ZeitProAusgabeStueck,
	HauptZeit1 is HauptZeit + HauptZeit0, 
	NebenZeit0 is 0, /* chargenwechsel nicht berücksichtigt */
	NebenZeit1 is NebenZeit + NebenZeit0, 
	/* Händler / Terminal ansprechen / öffnen, Dialog durchklicken, schließen */
	RuestZeit0 is 150 + 680 + 110, 
	RuestZeit1 is RuestZeit + RuestZeit0,
	bildeAvZeiten(Rest, HauptZeit1, HauptZeitDanach, NebenZeit1, NebenZeitDanach, RuestZeit1, RuestZeitDanach),
	!.


/* vorgang ohne AV Bewertung */
bildeAvZeiten(Vorgaenge, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach) :-
	Vorgaenge = [_|Rest],
	bildeAvZeiten(Rest, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach),
	!.

/* in der Rüstzeit ist auch die Abrüstzeit drin */
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

/* Zeit für den Wechsel zwischen zwei Gebinden des Stoffs */
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

toRuestHauptNebenZeit(Methode, Anzahl, Dauer, Gebinde, Ruest, Haupt, Neben) :-
	assertion(sammelAktion:sammelAktion(Methode)),
	memberchk(Methode, [pfluecken, ernten, vonTierErhalten, unterWasserErkaempfen]),
	methodeToRuestZeit(Methode, Ruest0),
	methodeToHauptZeit(Methode, Haupt0),
	((Gebinde > 1, Neben0 is (Dauer - Ruest0 - (Gebinde * Haupt0)) / (Gebinde - 1));
	 Neben0 = 0
	),
	Haupt is Haupt0 / Anzahl,
	Neben is Neben0 / Anzahl,
	Ruest is Ruest0 / Anzahl,
	!.
	
toRuestHauptNebenZeit(Methode, Anzahl, Dauer, Gebinde, Ruest, Haupt, Neben) :-
	assertion(sammelAktion:sammelAktion(Methode)),
	methodeToRuestZeit(Methode, Ruest0),
	methodeToNebenZeit(Methode, Neben0),
	Haupt0 is (Dauer - Ruest0 - (Gebinde - 1) * Neben0) / Gebinde,
	Haupt is Haupt0 / Anzahl,
	Neben is Neben0 / Anzahl,
	Ruest is Ruest0 / Anzahl.

toDauer(_, Anzahl, Ruest, Haupt, Neben, Dauer) :-
	Haupt0 is Haupt * Anzahl,
	Neben0 is Neben * Anzahl,
	Ruest0 is Ruest * Anzahl,
	Dauer is Haupt0 + Neben0 + Ruest0.
	