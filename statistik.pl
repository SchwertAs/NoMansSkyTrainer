:- module(statistik, [bildeSammelSet/3, bildeGesamtZahl/3, bildeGesamtWert/3, bildeGesamtAufwaende/3]).

bildeSammelSet(Vorgaenge, SammelSet, NextSammelSet) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, Operation, _, [_, _]],
	\+sammelAktion:sammelAktion(Operation, _),
	bildeSammelSet(Rest, SammelSet, NextSammelSet),
	!.

bildeSammelSet(Vorgaenge, SammelSet, NextSammelSet) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, Operation, _, [Anz1, Stoff1]],
	sammelAktion:sammelAktion(Operation, _),
	get_dict(Stoff1, SammelSet, Vorgang1),
	Vorgang1 = [_, Anz0],
	Anz2 is Anz0 + Anz1,
	Vorgang = [Operation, Anz2],
	put_dict(Stoff1, SammelSet, Vorgang, NextSammelSet0),
	bildeSammelSet(Rest, NextSammelSet0, NextSammelSet),
	!.

bildeSammelSet(Vorgaenge, SammelSet, NextSammelSet) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, Operation, _, [Anz1, Stoff1]],
	sammelAktion:sammelAktion(Operation, _),
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
	\+stoff:stoff(bauRezept, Stoff, _),
	Value = [_, Anz],
	BisherNeu is Bisher + Anz,
	del_dict(Stoff, SammelSet, _, NextSammelSet),
	bildeGesamtZahl(NextSammelSet, BisherNeu, GesamtZahl)
	,!.
	
bildeGesamtZahl(SammelSet, Bisher, GesamtZahl) :-
	get_dict(Stoff, SammelSet, _),
	stoff:stoff(bauRezept, Stoff, _),
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
	stoff:stoff(_, Stoff, Wert),
	Value = [_, Anz],
	BisherNeu is Bisher + Anz * Wert,
	del_dict(Stoff, SammelSet, _, NextSammelSet),
	bildeGesamtWert(NextSammelSet, BisherNeu, GesamtWert)
	,!.

bildeGesamtAufwaende(Vorgaenge, Aufwand, AufwandDanach) :-
	Vorgaenge = [],
	AufwandDanach = Aufwand
	,!.

bildeGesamtAufwaende(Vorgaenge, Aufwand, AufwandDanach) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, kaufen, _, [ Anzahl, Stoff]],
	stoff:stoff(_, Stoff, Wert),
	Aufwand0 is Aufwand + (Anzahl * Wert),
	bildeGesamtAufwaende(Rest, Aufwand0, AufwandDanach),
	!.

bildeGesamtAufwaende(Vorgaenge, Aufwand, AufwandDanach) :-
	Vorgaenge = [_ | Rest],
	bildeGesamtAufwaende(Rest, Aufwand, AufwandDanach),
	!.

