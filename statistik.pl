:- module(statistik, [bildeSammelSet/3, bildeGesamtZahl/3, bildeGesamtWert/3, bildeGesamtHauptZeitAufwand/3, bildeGesamtAufwaende/3]).

bildeSammelSet(Vorgaenge, SammelSet, NextSammelSet) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, [Operation, _], _, [_, _]],
	\+sammeln:sammelAktion(Operation),
	bildeSammelSet(Rest, SammelSet, NextSammelSet).

bildeSammelSet(Vorgaenge, SammelSet, NextSammelSet) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, [Operation, _], _, [Anz1, Stoff1]],
	sammeln:sammelAktion(Operation),
	get_dict(Stoff1, SammelSet, Value),
	NextValue is Value + Anz1,
	put_dict(Stoff1, SammelSet, NextValue, NextSammelSet0),
	bildeSammelSet(Rest, NextSammelSet0, NextSammelSet).

bildeSammelSet(Vorgaenge, SammelSet, NextSammelSet) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, [Operation, _], _, [Anz1, Stoff1]],
	sammeln:sammelAktion(Operation),
	\+get_dict(Stoff1, SammelSet, _),
	put_dict([Stoff1:Anz1], SammelSet, NextSammelSet0),
	bildeSammelSet(Rest, NextSammelSet0, NextSammelSet).

bildeSammelSet(Vorgaenge, SammelSet, NextSammelSet) :-
	Vorgaenge = [],
	SammelSet = NextSammelSet.

bildeGesamtZahl(SammelSet, Bisher, GesamtZahl) :-
	SammelSet = 'SammelStueckliste'{},
	!,
	Bisher = GesamtZahl.

bildeGesamtZahl(SammelSet, Bisher, GesamtZahl) :-
	get_dict(Stoff, SammelSet, Value),
	BisherNeu is Bisher + Value,
	del_dict(Stoff, SammelSet, _, NextSammelSet),
	bildeGesamtZahl(NextSammelSet, BisherNeu, GesamtZahl)
	,!.

bildeGesamtWert(SammelSet, Bisher, GesamtWert) :-
	SammelSet = 'SammelStueckliste'{},
	!,
	Bisher = GesamtWert.

bildeGesamtWert(SammelSet, Bisher, GesamtWert) :-
	get_dict(Stoff, SammelSet, Value),
	ausgangsStoff:stoff(Stoff, Wert),
	BisherNeu is Bisher + Value * Wert,
	del_dict(Stoff, SammelSet, _, NextSammelSet),
	bildeGesamtWert(NextSammelSet, BisherNeu, GesamtWert)
	,!.

bildeGesamtHauptZeitAufwand(Vorgaenge, Aufwand, AufwandDanach) :-
	Vorgaenge = [],
	AufwandDanach = Aufwand.

bildeGesamtHauptZeitAufwand(Vorgaenge, Aufwand, AufwandDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [Anzahl, [_, SammelZeit], _, [_, _]],
	Aufwand0 is Aufwand + (Anzahl * SammelZeit),
	bildeGesamtHauptZeitAufwand(Rest, Aufwand0, AufwandDanach).

bildeGesamtAufwaende(Vorgaenge, Aufwand, AufwandDanach) :-
	Vorgaenge = [],
	AufwandDanach = Aufwand.

bildeGesamtAufwaende(Vorgaenge, Aufwand, AufwandDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, [Terminal, _], _, [_, _]],
	\+kaufen:terminal(_, _, Terminal),
	bildeGesamtAufwaende(Rest, Aufwand, AufwandDanach).

bildeGesamtAufwaende(Vorgaenge, Aufwand, AufwandDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [Anzahl, [Terminal, _], _, [_, Stoff]],
	kaufen:terminal(_, _, Terminal),
	kaufen:kaufbar(Terminal, Stoff, Preis),
	Aufwand0 is Aufwand + (Anzahl * Preis),
	bildeGesamtAufwaende(Rest, Aufwand0, AufwandDanach).

