:- module(reisen, [bildeReiseZeiten/2, fuegeReiseOperationenEin/4]).

/* Die Berechnung erfolgt auf Basis eines Sternverkehrs immer über die Hauptbasis */

transportArt(exoFahrzeug).
transportArt(gateWarp).
transportArt(raumschiffBooster). 
transportArt(raumschiffImpuls).
transportArt(raumschiffWarp).
transportArt(laufen).

bauenNurInFrachter(flottenKommandoRaum). /* Plausicheck bei Eingabemaske Stoff <-> Spielerort */
bauenNurInFrachter(frachterKorridor).
bauenNurInFrachter(frachterKreuzungDreiFach).
bauenNurInFrachter(frachterKreuzungVierFach).
bauenNurInFrachter(frachterTreppe).
bauenNurInFrachter(frachterHyperAntrieb).
bauenNurInFrachter(frachterWarpReaktorSigmaC).
bauenNurInFrachter(frachterWarpReaktorTauB).
bauenNurInFrachter(frachterWarpReaktorThetaA).

ort(ortHauptBasis).
ort(ortWald). 
ort(ortBasisTerminus).
ort(ortWeltRaum).
ort(ortAnomalie).
ort(ortRaumStation). 
ort(ortWasser).
ort(ortAussenPosten).
ort(ortNahrungsProzessor).
ort(ortRaffinerie).
ort(ortHandelsTerminal).
ort(ortForschungsTerminal).
ort(ortFrachter).
ort(ortSpieler).
ort(ortBasis).

fuegeReiseOperationenEin(Vorgaenge, _, VorgaengeBisher, VorgaengeDanach) :-
	Vorgaenge = [],
	VorgaengeDanach = VorgaengeBisher,
	!.

fuegeReiseOperationenEin(Vorgaenge, ReiseOrtBisher, VorgaengeBisher, VorgaengeDanach) :-
	Vorgaenge = [Vorgang | RestVorgaenge],
	Vorgang = [_, [Operation1, _], _, _],
	Operation1 = reisen,
	fuegeReiseOperationenEin(RestVorgaenge, ReiseOrtBisher, VorgaengeBisher, VorgaengeDanach),
	!.

fuegeReiseOperationenEin(Vorgaenge, ReiseOrtBisher, VorgaengeBisher, VorgaengeDanach) :-
	Vorgaenge = [Vorgang | RestVorgaenge], 
	vorgangsOrt(Vorgang, VorgangsOrt),
	vorgangAnfuegenWennVerschiedeneOrte([Vorgang], ReiseOrtBisher, VorgangsOrt, ErweiterterVorgang),
	append(VorgaengeBisher, ErweiterterVorgang, VorgaengeBisher1),
	fuegeReiseOperationenEin(RestVorgaenge, VorgangsOrt, VorgaengeBisher1, VorgaengeDanach),
	!.
	
vorgangAnfuegenWennVerschiedeneOrte(VorgaengeBisher, ReiseOrtBisher, VorgangsOrt, VorgaengeBisher2) :-
	ReiseOrtBisher = VorgangsOrt,
	VorgaengeBisher2 = VorgaengeBisher.

vorgangAnfuegenWennVerschiedeneOrte(VorgaengeBisher, _, VorgangsOrt, VorgaengeBisher2) :-
	VorgangsOrt = ortSpieler,
	VorgaengeBisher2 = VorgaengeBisher.
	
vorgangAnfuegenWennVerschiedeneOrte(VorgaengeBisher, ReiseOrtBisher, VorgangsOrt, VorgaengeBisher2) :-
	ReiseOrtBisher \= VorgangsOrt, 
	append([[1, [reisen, 1], [[1, ReiseOrtBisher], [1, VorgangsOrt]], [1, angekommen]]], VorgaengeBisher, VorgaengeBisher2).
	
bildeReiseZeiten(Vorgaenge, ReiseZeit) :-
	spielStatus:vorhaben(System, Planet, _, _),
	spielStatus:systemAusstattung([System, Planet, ortSpieler], Entfernung),
	findall(VorgangsOrt1, (member(Vorgang, Vorgaenge), vorgangsOrt(Vorgang, VorgangsOrt1)), VorgangsOrte1),
	findall(EinzelZeit, (member(VorgangsOrt2, VorgangsOrte1), reisen(VorgangsOrt2, EinzelZeit)), EinzelZeiten),
	sum_list(EinzelZeiten, ReiseZeit),
	retract(spielStatus:systemAusstattung([_, _, ortSpieler], _)),
	assertz(spielStatus:systemAusstattung([System, Planet, ortSpieler], Entfernung)).

vorgangsOrt(Vorgang, VorgangsOrt) :-
	Vorgang = [_, [bauen, _], _, _],
	spielStatus:vorhaben(_, _, bauen, VorgangsOrt),
	!.
		
vorgangsOrt(Vorgang, VorgangsOrt) :-
	Vorgang = [_, [raffinieren, _], Komponenten, _],
	length(Komponenten, AnzKomponenten),
	AnzKomponenten = 1,
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	(spielStatus:systemAusstattung([System, Planet, ortKleineRaffinerie], DistanzKleineRaffinerie); DistanzKleineRaffinerie = 99999999999),
	(spielStatus:systemAusstattung([System, Planet, ortMittlereRaffinerie], DistanzMittlereRaffinerie); DistanzMittlereRaffinerie = 99999999999),
	(spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], DistanzGrosseRaffinerie); DistanzGrosseRaffinerie = 99999999999),
	min_member(NaehesteRaffinerie, [[DistanzKleineRaffinerie, ortKleineRaffinerie], 
									[DistanzMittlereRaffinerie, ortMittlereRaffinerie], 
									[DistanzGrosseRaffinerie, ortGrosseRaffinerie]]),
	NaehesteRaffinerie = [Distanz, VorgangsOrt],
	Distanz < 99999999999,
	!.
	
vorgangsOrt(Vorgang, VorgangsOrt) :-
	Vorgang = [_, [raffinieren, _], Komponenten, _],
	length(Komponenten, AnzKomponenten),
	AnzKomponenten = 2,
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	(spielStatus:systemAusstattung([System, Planet, ortMittlereRaffinerie], DistanzMittlereRaffinerie); DistanzMittlereRaffinerie = 99999999999),
	(spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], DistanzGrosseRaffinerie); DistanzGrosseRaffinerie = 99999999999),
	min_member(NaehesteRaffinerie, [[DistanzMittlereRaffinerie, ortMittlereRaffinerie], 
									[DistanzGrosseRaffinerie, ortGrosseRaffinerie]]),
	NaehesteRaffinerie = [Distanz, VorgangsOrt],
	Distanz < 99999999999,
	!.
	
vorgangsOrt(Vorgang, VorgangsOrt) :-
	Vorgang = [_, [raffinieren, _], Komponenten, _],
	length(Komponenten, AnzKomponenten),
	AnzKomponenten = 3,
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], _),
	VorgangsOrt = ortGrosseRaffinerie,
	!.

vorgangsOrt(Vorgang, VorgangsOrt) :-
	Vorgang = [_, [Operation1, _], _, _],
	sammeln:sammelAktion(Operation1, VorgangsOrt),
	!.

vorgangsOrt(Vorgang, VorgangsOrt) :-
	Vorgang = [_, [Operation1, _], _, _],
	rezept:wandelAktion(Operation1, VorgangsOrt),
	!.

 
reisen(VorgangsOrt, Zeit) :-
	VorgangsOrt = ortSpieler,
	Zeit = 0,  /* der Spieler muss nicht zu sich selbst reisen */
 	!.
 	
/* vorhaben auf gleichem Planeten */
reisen(VorgangsOrt, Zeit) :-
	spielStatus:systemAusstattung([System1, Planet1, ortSpieler], ZurBasisTransferZeit),
	spielStatus:systemAusstattung([System1, Planet1, VorgangsOrt], ZumVorgangTransferZeit),
	retract(spielStatus:systemAusstattung([System1, Planet1, ortSpieler], ZurBasisTransferZeit)),
	assertz(spielStatus:systemAusstattung([System1, Planet1, ortSpieler], ZumVorgangTransferZeit)),
	Zeit is ZurBasisTransferZeit + ZumVorgangTransferZeit.

/* vorhaben auf anderem Planeten */
/*
reisen(VorgangsOrt, Zeit) :-
	spielStatus:systemAusstattung([System1, Planet1, ortSpieler], ZurBasisTransferZeit),
	vorhaben(System2, Planet2, bauen, OrtBaustelle),
	System1 = System2,
	Planet1 \= Planet2,
	spielStatus:spielStatus(torWarpVerfügbar),
	spielStatus:systemAusstattung(System1, Planet2, ortRaumStation, TorWarpZeit1),
	spielStatus:systemAusstattung(System1, Planet2, VorgangsOrt, ZumZielTransferZeit),
	Zeit is ZurBasisTransferZeit + ZumZielTransferZeit + TorWarpZeit.

*/

/* kaufen mit Teleportreise Raumstation */	
/* kaufen mit flug gleicher Planet */
/* kaufen mit flug anderer Planet, gleiches System */
/* kaufen mit flug anderer Planet, anderes System, mit Teleport */
/* kaufen mit flug anderer Planet, anderes System, mit Warp */

/*
transferZeit(ortGate, 600).
transferZeit(ortBasis, raffinieren, 450).
transferZeit(ortBasis, ortImWald, 2500).
transferZeit(ortBasis, ortImWeltRaum, 1600).

transferZeit(A, B) :-
	transferZeit(B, A).

flugZtransferZeiteit(ortBasis, raumSchuerfen, 4500).

transferZeit(3880).
resourcenAnsammlungSuchen(800).
terminalOeffnen(980).
*/