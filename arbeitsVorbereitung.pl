:- module(arbeitsVorbereitung, [toDauer/6, toRuestHauptNebenZeit/7, bildeAvZeiten/9]).

/* ReiseZeit ist Zeit bis vor Ort des Stoffwechsels
   Hauptzeit ist Abbauzeit pro St�ck ohne Haufenwechsel
   Nebenzeiten sind: laufen zwischen den Haufen, Werkzeug ausrichten, Kaufobjekt suchen, Kaufzahl einstellen, Wild nachsetzen
   Ruestzeiten sind: beladen, entladen, Werkzeug ziehen, Kaufterminal �ffnen, Multiwerkzeugwechsel
*/
bildeAvZeiten(_, _, Vorgaenge, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach) :-
	Vorgaenge = [],
	HauptZeitDanach = HauptZeit,
	NebenZeitDanach = NebenZeit,
	RuestZeitDanach = RuestZeit,
	!.

bildeAvZeiten(System, Planet, Vorgaenge, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, Operation, _, [StueckZahl, Stoff]],
	sammlung:sammlung(_, System, Planet, Operation, Stoff, HauptZeit0, NebenZeit0, RuestZeit0),
	Operation \= kaufen,
	HauptZeit1 is HauptZeit + (StueckZahl * HauptZeit0), 
	NebenZeit1 is NebenZeit + ((StueckZahl - 1) * NebenZeit0),
	RuestZeit1 is RuestZeit + RuestZeit0,
	bildeAvZeiten(System, Planet, Rest, HauptZeit1, HauptZeitDanach, NebenZeit1, NebenZeitDanach, RuestZeit1, RuestZeitDanach),
	!.

/* kaufen R�stzeit nur f�r ersten Kaufvorgang */
bildeAvZeiten(System, Planet, Vorgaenge, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, Operation, _, [_, Stoff]],
	sammlung:sammlung(_, System, Planet, Operation, Stoff, HauptZeit0, NebenZeit0, RuestZeit0),
	Operation = kaufen,
	HauptZeit1 is HauptZeit + HauptZeit0, 
	NebenZeit1 is NebenZeit + NebenZeit0,
	/* beim Ersten Kauf Terminal �ffnenn -> R�stzeit */
	((RuestZeit = 0, RuestZeit1 is RuestZeit + RuestZeit0);
	 (RuestZeit \= 0, RuestZeit1 = RuestZeit)
	),
	bildeAvZeiten(System, Planet, Rest, HauptZeit1, HauptZeitDanach, NebenZeit1, NebenZeitDanach, RuestZeit1, RuestZeitDanach),
	!.

/* nicht sammelbar */
bildeAvZeiten(System, Planet, Vorgaenge, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach) :-
	Vorgaenge = [_|Rest],
	bildeAvZeiten(System, Planet, Rest, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach),
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
	