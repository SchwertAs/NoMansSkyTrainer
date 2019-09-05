:- module(statistik, [bildeSammelSet/3, bildeGesamtZahl/3, bildeGesamtWert/3, bildeGesamtHauptZeitAufwand/3, bildeGesamtAufwaende/3]).

bildeSammelSet(Vorgaenge, SammelSet, NextSammelSet) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, [Operation, _], _, [_, _]],
	\+sammeln:sammelAktion(Operation, _),
	bildeSammelSet(Rest, SammelSet, NextSammelSet),
	!.

bildeSammelSet(Vorgaenge, SammelSet, NextSammelSet) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, [Operation, _], _, [Anz1, Stoff1]],
	sammeln:sammelAktion(Operation, _),
	get_dict(Stoff1, SammelSet, Vorgang1),
	Vorgang1 = [_, Anz0],
	Anz2 is Anz0 + Anz1,
	Vorgang = [Operation, Anz2],
	put_dict(Stoff1, SammelSet, Vorgang, NextSammelSet0),
	bildeSammelSet(Rest, NextSammelSet0, NextSammelSet),
	!.

bildeSammelSet(Vorgaenge, SammelSet, NextSammelSet) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, [Operation, _], _, [Anz1, Stoff1]],
	sammeln:sammelAktion(Operation, _),
	\+get_dict(Stoff1, SammelSet, _),
	Vorgang = [Operation, Anz1],
	put_dict([Stoff1:Vorgang], SammelSet, NextSammelSet0),
	bildeSammelSet(Rest, NextSammelSet0, NextSammelSet),
	!.

bildeSammelSet(Vorgaenge, SammelSet, NextSammelSet) :-
	Vorgaenge = [],
	SammelSet = NextSammelSet.

bildeGesamtZahl(SammelSet, Bisher, GesamtZahl) :-
	SammelSet = 'SammelStueckliste'{},
	!,
	Bisher = GesamtZahl.

bildeGesamtZahl(SammelSet, Bisher, GesamtZahl) :-
	get_dict(Stoff, SammelSet, Value),
	\+ausgangsStoff:bauRezept(Stoff),
	Value = [_, Anz],
	BisherNeu is Bisher + Anz,
	del_dict(Stoff, SammelSet, _, NextSammelSet),
	bildeGesamtZahl(NextSammelSet, BisherNeu, GesamtZahl)
	,!.
	
bildeGesamtZahl(SammelSet, Bisher, GesamtZahl) :-
	get_dict(Stoff, SammelSet, _),
	ausgangsStoff:bauRezept(Stoff),
	BisherNeu = Bisher,
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
	Value = [_, Anz],
	BisherNeu is Bisher + Anz * Wert,
	del_dict(Stoff, SammelSet, _, NextSammelSet),
	bildeGesamtWert(NextSammelSet, BisherNeu, GesamtWert)
	,!.

bildeGesamtHauptZeitAufwand(Vorgaenge, Aufwand, AufwandDanach) :-
	Vorgaenge = [],
	AufwandDanach = Aufwand.

bildeGesamtHauptZeitAufwand(Vorgaenge, Aufwand, AufwandDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [Anzahl, [_, SammelZeit], _, _],
	Aufwand0 is Aufwand + (Anzahl * SammelZeit),
	bildeGesamtHauptZeitAufwand(Rest, Aufwand0, AufwandDanach),
	!.

bildeGesamtAufwaende(Vorgaenge, Aufwand, AufwandDanach) :-
	Vorgaenge = [],
	AufwandDanach = Aufwand
	,!.

bildeGesamtAufwaende(Vorgaenge, Aufwand, AufwandDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, [Terminal, _], _, _],
	\+kaufen:terminal(_, _, Terminal),
	bildeGesamtAufwaende(Rest, Aufwand, AufwandDanach),
	!.

bildeGesamtAufwaende(Vorgaenge, Aufwand, AufwandDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [Anzahl, [Terminal, _], _, [_, Stoff]],
	kaufen:terminal(_, _, Terminal),
	kaufen:kaufbar(Terminal, Stoff, Preis),
	Aufwand0 is Aufwand + (Anzahl * Preis),
	bildeGesamtAufwaende(Rest, Aufwand0, AufwandDanach),
	!.

