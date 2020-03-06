:- module(logistik, [sammelVorgaengeZusammenfassen/2]).

/* Minimalversion ohne Funktion als Platzhalter */	
sammelVorgaengeZusammenfassen(Vorgaenge, OptimierteVorgaenge) :-
	/* gleiche Vorgänge, die mehrfach vorkommen, zu einer mit erhöhter Stückzahl machen bei gleicher Reihenfolge */
	/* summarischer Satz ist an Position des ersten Auftretens des Vorganges */
	include(isSammlung, Vorgaenge, Sammlungen),
	gruppierenUndSummieren(Sammlungen, [], SammlungenGruppiert),
	gruppiereSammelvorgaengeNachOrt(SammlungenGruppiert, SammlungenGruppiert1),
	include(isBekannt, Vorgaenge, Bekannte),
	append(SammlungenGruppiert1, Bekannte, OptimierteVorgaenge0),
	include(isWandlung, Vorgaenge, Wandlungen),
	gruppierenUndSummieren(Wandlungen, [], WandlungenGruppiert),
	append(OptimierteVorgaenge0, WandlungenGruppiert, OptimierteVorgaenge),
	!.

isSammlung(Vorgang) :-
	Vorgang = [_, _, _, Operation, _, [_, _]],
	Operation \= bekannt,
	sammelAktion:sammelAktion(Operation),
	!.

gruppiereSammelvorgaengeNachOrt(Vorgaenge, OptimierteVorgaenge) :-
	dict_create(DictOrtVorgaenge, 'OrtVorgaenge', []),
	inDictEinsortieren(DictOrtVorgaenge, Vorgaenge, DictGefuellt),
	findall(AKey, get_dict(AKey, DictGefuellt, _)	, Keys),
	ausDictSammeln(DictGefuellt, Keys, [], OptimierteVorgaenge),
	!.
		
inDictEinsortieren(DictOrtVorgaenge, Vorgaenge, DictGefuellt) :-
	Vorgaenge = [],
	DictOrtVorgaenge = DictGefuellt.
	
inDictEinsortieren(DictOrtVorgaenge, Vorgaenge, DictGefuellt) :-
	Vorgaenge = [Vorgang | RestVorgaenge],
	reisen:vorgangsOrt(_, Vorgang, [_, _, VorgangsOrt]),
	insertOrAppend(VorgangsOrt, [Vorgang], DictOrtVorgaenge, DictOrtVorgaenge1),
	inDictEinsortieren(DictOrtVorgaenge1, RestVorgaenge, DictGefuellt).
		
insertOrAppend(Key, Val, Dict, DictDanach) :-
	get_dict(Key, Dict, Val0),
	append(Val, Val0, Val1),
	put_dict(Key, Dict, Val1, DictDanach).
	
insertOrAppend(Key, Val, Dict, DictDanach) :-
	put_dict(Key, Dict, Val, DictDanach).
	
ausDictSammeln(_, Keys, OptimierteVorgaengeBisher, OptimierteVorgaenge) :-
	Keys = [],
	OptimierteVorgaengeBisher = OptimierteVorgaenge. 

ausDictSammeln(DictGefuellt, Keys, OptimierteVorgaengeBisher, OptimierteVorgaenge) :-
	Keys = [ Key | RestKeys ],
	get_dict(Key, DictGefuellt, OptimierteVorgaenge0),
	append(OptimierteVorgaengeBisher, OptimierteVorgaenge0, OptimierteVorgaenge1),
	ausDictSammeln(DictGefuellt, RestKeys, OptimierteVorgaenge1, OptimierteVorgaenge).
	

gruppierenUndSummieren(Vorgaenge, BisherGruppiert, Gruppiert) :-
	Vorgaenge = [],
	BisherGruppiert = Gruppiert,
	!.
	 
gruppierenUndSummieren(Vorgaenge, BisherGruppiert, Gruppiert) :-
	length(Vorgaenge, Len),
	Len > 1,
	Vorgaenge = [SuchVorgang | _],
	SuchVorgang = [_, _, _, SuchOperation, _, [_, SuchProdukt]],
	between(2, Len, VergleichsVorgangNo),
	nth1(VergleichsVorgangNo, Vorgaenge, VergleichsVorgang),
	VergleichsVorgang =  [_, _, _, VergleichsOperation, _, [_, VergleichsProdukt]],
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
	gruppierenUndSummieren(VorgaengeDanach, BisherGruppiert, Gruppiert),
	!.

gruppierenUndSummieren(Vorgaenge, BisherGruppiert, Gruppiert) :-
	Vorgaenge = [SuchVorgang | _],
	selectchk(SuchVorgang, Vorgaenge, VorgaengeDanach),
	append(BisherGruppiert, [SuchVorgang], BisherGruppiertDanach),
	gruppierenUndSummieren(VorgaengeDanach, BisherGruppiertDanach, Gruppiert),
	!.
	
gleicheElementeEnthalten(SuchStoffListe, VergleichsStoffListe) :-
	permutation(SuchStoffListe, VergleichsStoffListe).

	
extrahiereKomponenten(EinVorgang, KomponentenStoffListe) :-
	EinVorgang = [_, _, _, _, Komponenten, [_, _]],
	maplist(nth1(2), Komponenten, KomponentenStoffListe).

addiereVorgangsWerte(SuchVorgang, VergleichsVorgang, SummenVorgang) :-
	SuchVorgang = [_, _, Anzahl1, Operation, Komponenten, [ProduktZahl1, Produkt]],
	VergleichsVorgang = [Anzahl2, Operation, Komponenten, [ProduktZahl2,_]],
	SummenAnzahl is Anzahl1 + Anzahl2,
	SummenProduktZahl is ProduktZahl1 + ProduktZahl2,
	SummenVorgang = [SummenAnzahl, Operation, Komponenten, [SummenProduktZahl, Produkt]].
	
isBekannt(Vorgang) :-
	Vorgang = [_, _, _, Operation, _, [_, _]],
	Operation = bekannt,
	!.
	
isWandlung(Vorgang) :-
	Vorgang = [_, _, _, Operation, _, [_, _]],
	wandelAktion:wandelAktion(Operation, _),
	!.
	