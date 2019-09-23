:- module(arbeitsVorbereitung, [bildeAvZeiten/7]).

/* ReiseZeit ist Zeit bis vor Ort des Stoffwechsels
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

bildeAvZeiten(Vorgaenge, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, Operation, _, [StueckZahl, Stoff]],
	sammlung:sammlung(Operation, Stoff, HauptZeit0, NebenZeit0, RuestZeit0),
	Operation \= kaufen,
	HauptZeit1 is HauptZeit + (StueckZahl * HauptZeit0), 
	NebenZeit1 is NebenZeit + ((StueckZahl - 1) * NebenZeit0),
	RuestZeit1 is RuestZeit + RuestZeit0,
	bildeAvZeiten(Rest, HauptZeit1, HauptZeitDanach, NebenZeit1, NebenZeitDanach, RuestZeit1, RuestZeitDanach),
	!.

/* kaufen Rüstzeit nur für ersten Kaufvorgang */
bildeAvZeiten(Vorgaenge, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, Operation, _, [_, Stoff]],
	sammlung:sammlung(Operation, Stoff, HauptZeit0, NebenZeit0, RuestZeit0),
	Operation = kaufen,
	HauptZeit1 is HauptZeit + HauptZeit0, 
	NebenZeit1 is NebenZeit + NebenZeit0,
	/* beim Ersten Kauf Terminal öffnenn -> Rüstzeit */
	((RuestZeit = 0, RuestZeit1 is RuestZeit + RuestZeit0);
	 (RuestZeit \= 0, RuestZeit1 = RuestZeit)
	),
	bildeAvZeiten(Rest, HauptZeit1, HauptZeitDanach, NebenZeit1, NebenZeitDanach, RuestZeit1, RuestZeitDanach),
	!.

/* nicht sammelbar */
bildeAvZeiten(Vorgaenge, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach) :-
	Vorgaenge = [_|Rest],
	bildeAvZeiten(Rest, HauptZeit, HauptZeitDanach, NebenZeit, NebenZeitDanach, RuestZeit, RuestZeitDanach),
	!.
