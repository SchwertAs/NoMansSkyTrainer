:- module(logistik, [logistikOptimierungReisen/2]).

/* Minimalversion ohne Funktion als Platzhalter */
logistikOptimierungReisen(Vorgaenge, OptimierteVorgaenge) :-
	/* gleiche Vorgänge, die mehrfach vorkommen, zu einer mit erhöhter Stückzahl machen bei gleicher Reihenfolge */
	/* summarischer Satz ist an Position des ersten Auftretens des Vorganges */
	include(isSammlung, Vorgaenge, Sammlungen),
	group(Sammlungen, [], SammlungenGruppiert),
	include(isBekannt, Vorgaenge, Bekannte),
	append(SammlungenGruppiert, Bekannte, OptimierteVorgaenge0),
	include(isWandlung, Vorgaenge, Wandlungen),
	group(Wandlungen, [], WandlungenGruppiert),
	append(OptimierteVorgaenge0, WandlungenGruppiert, OptimierteVorgaenge).

isWandlung(Vorgang) :-
	Vorgang = [_, [Operation, _], _, [_, _]],
	rezept:wandelAktion(Operation, _).

isSammlung(Vorgang) :-
	Vorgang = [_, [Operation, _], _, [_, _]],
	Operation \= bekannt,
	sammeln:sammelAktion(Operation, _).

isBekannt(Vorgang) :-
	Vorgang = [_, [Operation, _], _, [_, _]],
	Operation = bekannt.
	
group(Vorgaenge, BisherGruppiert, Gruppiert) :-
	Vorgaenge = [],
	BisherGruppiert = Gruppiert.
	 
group(Vorgaenge, BisherGruppiert, Gruppiert) :-
	length(Vorgaenge, Len),
	Len > 1,
	Vorgaenge = [SuchVorgang | _],
	SuchVorgang =  [_, [SuchOperation, _], _, [_, SuchProdukt]],
	between(2, Len, VergleichsVorgangNo),
	nth1(VergleichsVorgangNo, Vorgaenge, VergleichsVorgang),
	VergleichsVorgang =  [_, [VergleichsOperation, _], _, [_, VergleichsProdukt]],
	SuchOperation = VergleichsOperation,
	SuchProdukt = VergleichsProdukt,
	extrahiereKomponenten(SuchVorgang, SuchStoffListe), 
	extrahiereKomponenten(VergleichsVorgang, VergleichsStoffListe),
	same_length(SuchStoffListe, VergleichsStoffListe),
	gleicheElementeEnthalten(SuchStoffListe, VergleichsStoffListe),
	addiereVorgangsWerte(SuchVorgang, VergleichsVorgang, SummenVorgang),
	selectchk(SuchVorgang, Vorgaenge, VorgaengeDanach0),
	selectchk(VergleichsVorgang, VorgaengeDanach0, VorgaengeDanach1),
	append([SummenVorgang], VorgaengeDanach1, VorgaengeDanach),
	group(VorgaengeDanach, BisherGruppiert, Gruppiert),
	!.

group(Vorgaenge, BisherGruppiert, Gruppiert) :-
	Vorgaenge = [SuchVorgang | _],
	selectchk(SuchVorgang, Vorgaenge, VorgaengeDanach),
	append(BisherGruppiert, [SuchVorgang], BisherGruppiertDanach),
	group(VorgaengeDanach, BisherGruppiertDanach, Gruppiert),
	!.
	
gleicheElementeEnthalten(SuchStoffListe, VergleichsStoffListe) :-
	permutation(SuchStoffListe, VergleichsStoffListe).

	
extrahiereKomponenten(EinVorgang, KomponentenStoffListe) :-
	EinVorgang = [_, [_, _], Komponenten, [_, _]],
	maplist(nth1(2), Komponenten, KomponentenStoffListe).

addiereVorgangsWerte(SuchVorgang, VergleichsVorgang, SummenVorgang) :-
	SuchVorgang = [Anzahl1,[Operation, RaffinierZeit], Komponenten, [ProduktZahl1, Produkt]],
	VergleichsVorgang = [Anzahl2,[Operation, RaffinierZeit], Komponenten, [ProduktZahl2,_]],
	SummenAnzahl is Anzahl1 + Anzahl2,
	SummenProduktZahl is ProduktZahl1 + ProduktZahl2,
	SummenVorgang = [SummenAnzahl,[Operation, RaffinierZeit], Komponenten, [SummenProduktZahl, Produkt]].
	
	