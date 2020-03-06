:- module(reisen, [bildeReiseZeiten/2, fuegeReiseOperationenEin/2]).

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

bildeReiseZeiten(Vorgaenge, ReiseZeit) :-
	noetigeRaffinerieEingabefaecher(Vorgaenge, 0, NoetigeRaffinerieEingabeFaecher),
	Vorgang = [Kopf | _ ],
	Kopf = [System, Planet, _, _, _, _],
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	retractall(spielStatus:systemAusstattung([_, _, ortSimulationsSpieler], _)),
	assertz(spielStatus:systemAusstattung([System, Planet, ortSimulationsSpieler], 0)),
	findall(VorgangsOrt1, (member(Vorgang, Vorgaenge), vorgangsOrt(NoetigeRaffinerieEingabeFaecher, Vorgang, VorgangsOrt1)), VorgangsOrte1),
	findall(EinzelZeit, (member(VorgangsOrt2, VorgangsOrte1), reisen(VorgangsOrt2, EinzelZeit)), EinzelZeiten),
	sum_list(EinzelZeiten, ReiseZeit),
	!.
	

noetigeRaffinerieEingabefaecher(Vorgaenge, NoetigeFaecherBisher, NoetigeFaecher) :-
	Vorgaenge = [],
	NoetigeFaecherBisher = NoetigeFaecher,
	!.

noetigeRaffinerieEingabefaecher(Vorgaenge, NoetigeFaecherBisher, NoetigeFaecher) :-
	Vorgaenge = [Vorgang | RestVorgaenge], 
	Vorgang = [_, _, _, raffinieren, Komponenten, _],
	length(Komponenten, AnzKomponenten),
	((AnzKomponenten > NoetigeFaecherBisher, NoetigeFaecherBisher0 = AnzKomponenten); NoetigeFaecherBisher0 = NoetigeFaecherBisher),
	noetigeRaffinerieEingabefaecher(RestVorgaenge, NoetigeFaecherBisher0, NoetigeFaecher),
	!.
	
noetigeRaffinerieEingabefaecher(Vorgaenge, NoetigeFaecherBisher, NoetigeFaecher) :-
	Vorgaenge = [Vorgang | RestVorgaenge], 
	Vorgang = [_, _, _, inEinfacherRaffinerieRaffinieren, _, _],
	((2 > NoetigeFaecherBisher, NoetigeFaecherBisher0 = 2); NoetigeFaecherBisher0 = NoetigeFaecherBisher),
	noetigeRaffinerieEingabefaecher(RestVorgaenge, NoetigeFaecherBisher0, NoetigeFaecher),
	!.
	
noetigeRaffinerieEingabefaecher(Vorgaenge, NoetigeFaecherBisher, NoetigeFaecher) :-
	Vorgaenge = [_ | RestVorgaenge], 
	noetigeRaffinerieEingabefaecher(RestVorgaenge, NoetigeFaecherBisher, NoetigeFaecher),
	!.

/* Ort des Vorganges aus Vorgang bilden */
vorgangsOrt(NoetigeRaffinerieEingabeFaecher, Vorgang, [_System, _Planet, VorgangsOrt]) :-
	Vorgang = [_, _, _, inEinfacherRaffinerieRaffinieren, _, _],
	NoetigeRaffinerieEingabeFaecher = 2,
	spielStatus:spielStatus(anzugRaffinerie, true),
	VorgangsOrt = ortSimulationsSpieler,
	!.

vorgangsOrt(NoetigeRaffinerieEingabeFaecher, Vorgang, [System, Planet, VorgangsOrt]) :-
	Vorgang = [_, _, _, inEinfacherRaffinerieRaffinieren, _, _],
	NoetigeRaffinerieEingabeFaecher = 2,
	spielStatus:systemAusstattung([System, Planet, ortKleineRaffinerie], _),
	VorgangsOrt = ortKleineRaffinerie,
	!.

vorgangsOrt(NoetigeRaffinerieEingabeFaecher, Vorgang, [System, Planet, VorgangsOrt]) :-
	Vorgang = [_, _, _, raffinieren, _, _],
	NoetigeRaffinerieEingabeFaecher = 1,
	(spielStatus:systemAusstattung([System, Planet, ortMittlereRaffinerie], DistanzMittlereRaffinerie); DistanzMittlereRaffinerie = 99999999999),
	(spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], DistanzGrosseRaffinerie); DistanzGrosseRaffinerie = 99999999999),
	min_member(NaehesteRaffinerie, [[DistanzMittlereRaffinerie, ortMittlereRaffinerie], 
									[DistanzGrosseRaffinerie, ortGrosseRaffinerie]]),
	NaehesteRaffinerie = [Distanz, VorgangsOrt0],
	Distanz < 99999999999,
	VorgangsOrt = VorgangsOrt0,
	!.

vorgangsOrt(NoetigeRaffinerieEingabeFaecher, Vorgang, [System, Planet, VorgangsOrt]) :-
	Vorgang = [_, _, _, raffinieren, _, _],
	NoetigeRaffinerieEingabeFaecher = 2,
	(spielStatus:systemAusstattung([System, Planet, ortMittlereRaffinerie], DistanzMittlereRaffinerie); DistanzMittlereRaffinerie = 99999999999),
	(spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], DistanzGrosseRaffinerie); DistanzGrosseRaffinerie = 99999999999),
	min_member(NaehesteRaffinerie, [[DistanzMittlereRaffinerie, ortMittlereRaffinerie], 
									[DistanzGrosseRaffinerie, ortGrosseRaffinerie]]),
	NaehesteRaffinerie = [Distanz, VorgangsOrt0],
	Distanz < 99999999999,
	VorgangsOrt = VorgangsOrt0,
	!.
	
vorgangsOrt(NoetigeRaffinerieEingabeFaecher, Vorgang, [System, Planet, VorgangsOrt]) :-
	Vorgang = [_, _, _, raffinieren, _, _],
	NoetigeRaffinerieEingabeFaecher = 3,
	spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], _),
	VorgangsOrt = ortGrosseRaffinerie,
	!.

vorgangsOrt(_, Vorgang, [System, Planet, VorgangsOrt]) :-
	Vorgang = [System, Planet, _, Operation, _, _],
	sammelAktion:sammelOrt(Operation, VorgangsOrt),
	!.

vorgangsOrt(_, Vorgang, [System, Planet, VorgangsOrt]) :-
	Vorgang = [System, Planet, _, Operation, _, _],
	wandelAktion:wandelAktion(Operation, VorgangsOrt),
	!.

reisen([_System, _Planet, VorgangsOrt], Zeit) :-
	VorgangsOrt = ortSimulationsSpieler,
	Zeit = 0,  /* der Spieler muss nicht zu sich selbst reisen */
 	!.
 	
/* vorhaben auf gleichem Planeten; Reise zu Fu� / mit Raumschiff (so wie Eingabe in Planeteneigenschaften eben gemeint war) */
reisen([System, Planet, VorgangsOrt], Zeit) :-
	spielStatus:systemAusstattung([System1, Planet1, ortSimulationsSpieler], ZurBasisTransferZeit),
	System = System1,
	Planet = Planet1,
	spielStatus:systemAusstattung([System, Planet, VorgangsOrt], ZumVorgangTransferZeit),
	/* Spieler bewegen */
	retractall(spielStatus:systemAusstattung([_, _, ortSimulationsSpieler], _)),
	assertz(spielStatus:systemAusstattung([System, Planet, ortSimulationsSpieler], ZumVorgangTransferZeit)),
	Zeit is ZurBasisTransferZeit + ZumVorgangTransferZeit.

/* vorhaben auf gleichem Planeten; Reise mit Fahrzeug */
/* TODO Meilenstein Fahrzeuge */

/* vorhaben auf anderem Planeten in gleichem System; Reise mit Raumschiff �ber RaumStation und zu Fu�*/
reisen([System, Planet, VorgangsOrt], Zeit) :-
	spielStatus:spielStatus(raumSchiffIstFlott),
	spielStatus:systemAusstattung([System1, Planet1, ortSimulationsSpieler], ZurBasisTransferZeit),
	System = System1,
	spielStatus:systemAusstattung([System1, Planet1, ortRaumStation], TransferZurRaumStation),
	spielStatus:systemAusstattung([System, Planet, ortRaumStation], TransferVonRaumStation),
	spielStatus:systemAusstattung([System, Planet, VorgangsOrt], ZumVorgangTransferZeit),
	/* Spieler bewegen */
	retractall(spielStatus:systemAusstattung([_, _, ortSimulationsSpieler], _)),
	assertz(spielStatus:systemAusstattung([System, Planet, ortSimulationsSpieler], ZumVorgangTransferZeit)),
	Zeit is ZurBasisTransferZeit + TransferZurRaumStation + TransferVonRaumStation + ZumVorgangTransferZeit.

/* vorhaben auf anderem Planeten in gleicher Galaxie; Reise mit Raumschiff, BasisTerminus und zu Fu� */
reisen([System, Planet, VorgangsOrt], Zeit) :-
	spielStatus:systemAusstattung([System1, Planet1, ortSimulationsSpieler], ZurBasisTransferZeit),
	spielStatus:systemAusstattung([System1, Planet1, ortRaumStation], ZumAbreiseTerminus),
	TransferZeit = 4800, /* Treppe hoch, Ziel aussuchen, Transfer */
	spielStatus:systemAusstattung([System, Planet, ortHauptBasis], ZurAnkunftsBasis),
	spielStatus:systemAusstattung([System, Planet, VorgangsOrt], ZumVorgangTransferZeit),
	/* Spieler bewegen */
	retractall(spielStatus:systemAusstattung([_, _, ortSimulationsSpieler], _)),
	assertz(spielStatus:systemAusstattung([System, Planet, ortSimulationsSpieler], ZumVorgangTransferZeit)),
	Zeit is ZurBasisTransferZeit + ZumAbreiseTerminus + TransferZeit + ZurAnkunftsBasis + ZumVorgangTransferZeit.


/* vorhaben auf anderem Planeten in gleicher Galaxie; Reise mit Basisterminus und zu Fu� */
reisen([System, Planet, VorgangsOrt], Zeit) :-
	spielStatus:systemAusstattung([System1, Planet1, ortSimulationsSpieler], ZurBasisTransferZeit),
	spielStatus:systemAusstattung([System1, Planet1, ortBasisTerminus], ZumAbreiseTerminus),
	TransferZeit = 4500, 
	spielStatus:systemAusstattung([System, Planet, ortBasisTerminus], ZurAnkunftsBasis),
	spielStatus:systemAusstattung([System, Planet, VorgangsOrt], ZumVorgangTransferZeit),
	/* Spieler bewegen */
	retractall(spielStatus:systemAusstattung([_, _, ortSimulationsSpieler], _)),
	assertz(spielStatus:systemAusstattung([System, Planet, ortSimulationsSpieler], ZumVorgangTransferZeit)),
	Zeit is ZurBasisTransferZeit + ZumAbreiseTerminus + TransferZeit + ZurAnkunftsBasis + ZumVorgangTransferZeit.

/* vorhaben auf anderem Planeten in gleicher Galaxie; Reise mit Raumschiff Warp (ein Hop) */
reisen([System, Planet, VorgangsOrt], Zeit) :-
	spielStatus:spielStatus(raumSchiffIstFlott),
	spielStatus:systemAusstattung([System1, Planet1, ortSimulationsSpieler], ZurBasisTransferZeit),
	spielStatus:systemAusstattung([System1, Planet1, ortWeltRaum], ZumAbflugZeit),
	WarpTransferZeit = 4100, 
	spielStatus:systemAusstattung([System, Planet, ortRaumStation], ZurBasisTransferZeit),
	spielStatus:systemAusstattung([System, Planet, VorgangsOrt], ZumVorgangTransferZeit),
	/* Spieler bewegen */
	retractall(spielStatus:systemAusstattung([_, _, ortSimulationsSpieler], _)),
	assertz(spielStatus:systemAusstattung([System, Planet, ortSimulationsSpieler], ZumVorgangTransferZeit)),
	Zeit is ZurBasisTransferZeit + ZumAbflugZeit + WarpTransferZeit + ZumVorgangTransferZeit.

/* vorhaben auf anderem Planeten in gleicher Galaxie; Reise mit Frachter Warp (ein Hop) */
reisen([System, Planet, VorgangsOrt], Zeit) :-
	spielStatus:spielStatus(raumSchiffIstFlott),
	spielStatus:spielStatus(frachterVorhanden),
	spielStatus:systemAusstattung([System1, Planet1, ortSimulationsSpieler], ZurBasisTransferZeit),
	spielStatus:systemAusstattung([System1, Planet1, ortFrachter], ZumAbflugZeit),
	WarpTransferZeit = 3500, 
	spielStatus:systemAusstattung([System, Planet, ortFrachter], ZurBasisTransferZeit),
	spielStatus:systemAusstattung([System, Planet, VorgangsOrt], ZumVorgangTransferZeit),
	/* Spieler bewegen */
	retractall(spielStatus:systemAusstattung([_, _, ortSimulationsSpieler], _)),
	assertz(spielStatus:systemAusstattung([System, Planet, ortSimulationsSpieler], ZumVorgangTransferZeit)),
	Zeit is ZurBasisTransferZeit + ZumAbflugZeit + WarpTransferZeit + ZumVorgangTransferZeit.

/* kaufen mit flug gleicher Planet */
/* kaufen mit flug anderer Planet, gleiches System */
/* kaufen mit flug anderer Planet, anderes System, mit Teleport */
/* kaufen mit flug anderer Planet, anderes System, mit Warp */

/*

transferZeit(A, B) :-
	transferZeit(B, A).

flugZtransferZeiteit(ortBasis, raumSchuerfen, 4500).

transferZeit(3880).
resourcenAnsammlungSuchen(800).
terminalOeffnen(980).
*/

/* ------------------------------------------------------------------------------------------------------ */
fuegeReiseOperationenEin(Vorgaenge, VorgaengeDanach) :-
	/* ermittelt gr��te n�tige RaffinerieEingabefachzahl f�r alle Vorg�nge */
	/* dadurch wird nur eine Reise f�r Raffinieren ben�tigt */
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	retractall(spielStatus:systemAusstattung([_, _, ortSimulationsSpieler], _)),
	assertz(spielStatus:systemAusstattung([System, Planet, ortSimulationsSpieler], 0)),
	noetigeRaffinerieEingabefaecher(Vorgaenge, 0, NoetigeFaecher),
	fuegeReiseOperationenEinSub(NoetigeFaecher, Vorgaenge, [System, Planet, ortSpieler], [], VorgaengeDanach).


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

vorgangAnfuegenWennVerschiedeneOrte(VorgaengeBisher, [SystemBisher, PlanetBisher, ReiseOrtBisher], [System, Planet, VorgangsOrt], VorgaengeBisher2, ReiseOrtBisherDanach) :-
	ReiseOrtBisher = VorgangsOrt,
	SystemBisher = System,
	PlanetBisher = Planet,
	VorgaengeBisher2 = VorgaengeBisher,
	ReiseOrtBisherDanach = [System, Planet, ReiseOrtBisher].

vorgangAnfuegenWennVerschiedeneOrte(VorgaengeBisher, ReiseOrtBisher, [_, _, VorgangsOrt], VorgaengeBisher2, ReiseOrtBisherDanach) :-
	VorgangsOrt = ortSpieler,
	VorgaengeBisher2 = VorgaengeBisher,
	ReiseOrtBisherDanach = ReiseOrtBisher.
	
vorgangAnfuegenWennVerschiedeneOrte(VorgaengeBisher, ReiseOrtBisher, VorgangsOrt, VorgaengeBisher2, ReiseOrtBisherDanach) :-
	append([['', '', 1, reisen, [[1, ReiseOrtBisher], [1, VorgangsOrt]], [1, angekommen]]], VorgaengeBisher, VorgaengeBisher2),
	ReiseOrtBisherDanach = VorgangsOrt.

