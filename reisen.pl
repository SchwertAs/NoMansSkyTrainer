:- module(reisen, [bildeReiseZeiten/2, fuegeReiseOperationenEin/4]).

/* Die Berechnung erfolgt auf Basis eines Sternverkehrs immer �ber die Hauptbasis 
   Reisezeiten sind: Planetenziel ermitteln, Torziel anw�hlen, Tortransport, laufen zum Ziel, fahren zum Ziel,
                     einsteigen, aussteigen, fliegen, warpen, Karte ansehen
*/
transportArt(exoFahrzeug).
transportArt(torWarp).
transportArt(raumschiffBooster). 
transportArt(raumschiffImpuls).
transportArt(raumschiffWarp).
transportArt(laufen).
transportArt(schnellLaufen).
transportArt(raketenStiefelHopser).
transportArt(boosterHopser).

bauenNurInFrachter(flottenKommandoRaum). /* Plausicheck bei Eingabemaske Stoff <-> Spielerort */
bauenNurInFrachter(grosserFrachterRaum).
bauenNurInFrachter(frachterKorridor).
bauenNurInFrachter(gebogenerFrachterKorridor).
bauenNurInFrachter(frachterKreuzungDreiFach).
bauenNurInFrachter(frachterKreuzungVierFach).
bauenNurInFrachter(frachterTreppe).


fuegeReiseOperationenEin(Vorgaenge, ReiseOrtBisher, VorgaengeBisher, VorgaengeDanach) :-
	/* ermittelt gr��te n�tige RaffinerieEingabefachzahl f�r alle Vorg�nge */
	/* dadurch wird nur eine Reise f�r Raffinieren ben�tigt */
	noetigeRaffinerieEingabefaecher(Vorgaenge, 0, NoetigeFaecher),
	fuegeReiseOperationenEinSub(NoetigeFaecher, Vorgaenge, ReiseOrtBisher, VorgaengeBisher, VorgaengeDanach).

noetigeRaffinerieEingabefaecher(Vorgaenge, NoetigeFaecherBisher, NoetigeFaecher) :-
	Vorgaenge = [],
	NoetigeFaecherBisher = NoetigeFaecher,
	!.

noetigeRaffinerieEingabefaecher(Vorgaenge, NoetigeFaecherBisher, NoetigeFaecher) :-
	Vorgaenge = [Vorgang | RestVorgaenge], 
	Vorgang = [_, raffinieren, Komponenten, _],
	length(Komponenten, AnzKomponenten),
	((AnzKomponenten > NoetigeFaecherBisher, NoetigeFaecherBisher0 = AnzKomponenten); NoetigeFaecherBisher0 = NoetigeFaecherBisher),
	noetigeRaffinerieEingabefaecher(RestVorgaenge, NoetigeFaecherBisher0, NoetigeFaecher),
	!.
	
noetigeRaffinerieEingabefaecher(Vorgaenge, NoetigeFaecherBisher, NoetigeFaecher) :-
	Vorgaenge = [Vorgang | RestVorgaenge], 
	Vorgang = [_, inEinfacherRaffinerieRaffinieren, _, _],
	((2 > NoetigeFaecherBisher, NoetigeFaecherBisher0 = 2); NoetigeFaecherBisher0 = NoetigeFaecherBisher),
	noetigeRaffinerieEingabefaecher(RestVorgaenge, NoetigeFaecherBisher0, NoetigeFaecher),
	!.
	
noetigeRaffinerieEingabefaecher(Vorgaenge, NoetigeFaecherBisher, NoetigeFaecher) :-
	Vorgaenge = [_ | RestVorgaenge], 
	noetigeRaffinerieEingabefaecher(RestVorgaenge, NoetigeFaecherBisher, NoetigeFaecher),
	!.

fuegeReiseOperationenEinSub(_, Vorgaenge, _, VorgaengeBisher, VorgaengeDanach) :-
	Vorgaenge = [],
	VorgaengeDanach = VorgaengeBisher,
	!.
 
fuegeReiseOperationenEinSub(NoetigeRaffinerieEingabeFaecher, Vorgaenge, ReiseOrtBisher, VorgaengeBisher, VorgaengeDanach) :-
	Vorgaenge = [Vorgang | RestVorgaenge], 
	vorgangsOrt(NoetigeRaffinerieEingabeFaecher, Vorgang, VorgangsOrt),
	vorgangAnfuegenWennVerschiedeneOrte([Vorgang], ReiseOrtBisher, VorgangsOrt, ErweiterterVorgang, ReiseOrtBisherDanach),
	append(VorgaengeBisher, ErweiterterVorgang, VorgaengeBisher1),
	fuegeReiseOperationenEinSub(NoetigeRaffinerieEingabeFaecher, RestVorgaenge, ReiseOrtBisherDanach, VorgaengeBisher1, VorgaengeDanach),
	!.


vorgangsOrt(_, Vorgang, VorgangsOrt) :-
	Vorgang = [_, bauen, _, _],
	VorgangsOrt = ortSpieler,
	!.

vorgangsOrt(NoetigeRaffinerieEingabeFaecher, Vorgang, VorgangsOrt) :-
	Vorgang = [_, inEinfacherRaffinerieRaffinieren, _, _],
	NoetigeRaffinerieEingabeFaecher = 2,
	spielStatus:spielStatus(anzugRaffinerie, true),
	VorgangsOrt = ortSpieler,
	!.

vorgangsOrt(NoetigeRaffinerieEingabeFaecher, Vorgang, VorgangsOrt) :-
	Vorgang = [_, inEinfacherRaffinerieRaffinieren, _, _],
	NoetigeRaffinerieEingabeFaecher = 2,
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	spielStatus:systemAusstattung([System, Planet, ortKleineRaffinerie], _),
	VorgangsOrt = ortKleineRaffinerie,
	!.

vorgangsOrt(NoetigeRaffinerieEingabeFaecher, Vorgang, VorgangsOrt) :-
	Vorgang = [_, raffinieren, _, _],
	NoetigeRaffinerieEingabeFaecher = 1,
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	(spielStatus:systemAusstattung([System, Planet, ortMittlereRaffinerie], DistanzMittlereRaffinerie); DistanzMittlereRaffinerie = 99999999999),
	(spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], DistanzGrosseRaffinerie); DistanzGrosseRaffinerie = 99999999999),
	min_member(NaehesteRaffinerie, [[DistanzMittlereRaffinerie, ortMittlereRaffinerie], 
									[DistanzGrosseRaffinerie, ortGrosseRaffinerie]]),
	NaehesteRaffinerie = [Distanz, VorgangsOrt0],
	Distanz < 99999999999,
	VorgangsOrt = VorgangsOrt0,
	!.

vorgangsOrt(NoetigeRaffinerieEingabeFaecher, Vorgang, VorgangsOrt) :-
	Vorgang = [_, raffinieren, _, _],
	NoetigeRaffinerieEingabeFaecher = 2,
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	(spielStatus:systemAusstattung([System, Planet, ortMittlereRaffinerie], DistanzMittlereRaffinerie); DistanzMittlereRaffinerie = 99999999999),
	(spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], DistanzGrosseRaffinerie); DistanzGrosseRaffinerie = 99999999999),
	min_member(NaehesteRaffinerie, [[DistanzMittlereRaffinerie, ortMittlereRaffinerie], 
									[DistanzGrosseRaffinerie, ortGrosseRaffinerie]]),
	NaehesteRaffinerie = [Distanz, VorgangsOrt0],
	Distanz < 99999999999,
	VorgangsOrt = VorgangsOrt0,
	!.
	
vorgangsOrt(NoetigeRaffinerieEingabeFaecher, Vorgang, VorgangsOrt) :-
	Vorgang = [_, raffinieren, _, _],
	NoetigeRaffinerieEingabeFaecher = 3,
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], _),
	VorgangsOrt = ortGrosseRaffinerie,
	!.

vorgangsOrt(_, Vorgang, VorgangsOrt) :-
	Vorgang = [_, Operation, _, _],
	sammelAktion:sammelOrt(Operation, VorgangsOrt),
	!.

vorgangsOrt(_, Vorgang, VorgangsOrt) :-
	Vorgang = [_, Operation, _, _],
	wandelAktion:wandelAktion(Operation, VorgangsOrt),
	!.

vorgangAnfuegenWennVerschiedeneOrte(VorgaengeBisher, ReiseOrtBisher, VorgangsOrt, VorgaengeBisher2, ReiseOrtBisherDanach) :-
	ReiseOrtBisher = VorgangsOrt,
	VorgaengeBisher2 = VorgaengeBisher,
	ReiseOrtBisherDanach = ReiseOrtBisher.

vorgangAnfuegenWennVerschiedeneOrte(VorgaengeBisher, ReiseOrtBisher, VorgangsOrt, VorgaengeBisher2, ReiseOrtBisherDanach) :-
	VorgangsOrt = ortSpieler,
	VorgaengeBisher2 = VorgaengeBisher,
	ReiseOrtBisherDanach = ReiseOrtBisher.
	
vorgangAnfuegenWennVerschiedeneOrte(VorgaengeBisher, ReiseOrtBisher, VorgangsOrt, VorgaengeBisher2, ReiseOrtBisherDanach) :-
	append([[1, reisen, [[1, ReiseOrtBisher], [1, VorgangsOrt]], [1, angekommen]]], VorgaengeBisher, VorgaengeBisher2),
	ReiseOrtBisherDanach = VorgangsOrt.

bildeReiseZeiten(Vorgaenge, ReiseZeit) :-
	spielStatus:systemAusstattung([System, Planet, ortSpieler], Entfernung),
	noetigeRaffinerieEingabefaecher(Vorgaenge, 0, NoetigeRaffinerieEingabeFaecher),
	findall(VorgangsOrt1, (member(Vorgang, Vorgaenge), vorgangsOrt(NoetigeRaffinerieEingabeFaecher, Vorgang, VorgangsOrt1)), VorgangsOrte1),
	findall(EinzelZeit, (member(VorgangsOrt2, VorgangsOrte1), reisen(VorgangsOrt2, EinzelZeit)), EinzelZeiten),
	sum_list(EinzelZeiten, ReiseZeit),
	retract(spielStatus:systemAusstattung([_, _, ortSpieler], _)),
	assertz(spielStatus:systemAusstattung([System, Planet, ortSpieler], Entfernung)),
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