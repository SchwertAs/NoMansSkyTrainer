:- module(reisen, [bildeReiseZeiten/4, fuegeReiseOperationenEin/4]).

:- dynamic(letzterOrt/3).

/* Die Berechnung erfolgt auf Basis eines Sternverkehrs immer über die Hauptbasis 
   Reisezeiten sind: Planetenziel ermitteln, Torziel anwählen, Tortransport, laufen zum Ziel, fahren zum Ziel,
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
transportArt(frachterWarp).

bauenNurInFrachter(flottenKommandoRaum). /* Plausicheck bei Eingabemaske Stoff <-> Spielerort */
bauenNurInFrachter(grosserFrachterRaum).
bauenNurInFrachter(frachterKorridor).
bauenNurInFrachter(gebogenerFrachterKorridor).
bauenNurInFrachter(frachterKreuzungDreiFach).
bauenNurInFrachter(frachterKreuzungVierFach).
bauenNurInFrachter(frachterTreppe).

bildeReiseZeiten(System, Planet, Vorgaenge, ReiseZeit) :-
	noetigeRaffinerieEingabefaecher(Vorgaenge, 0, NoetigeRaffinerieEingabeFaecher),
	ignore(retractall(letzterOrt(_, _, _))),
	assertz(letzterOrt(System, Planet, ortHauptBasis)),
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
	VorgangsOrt = ortSpieler,
	!.

vorgangsOrt(NoetigeRaffinerieEingabeFaecher, Vorgang, [System, Planet, VorgangsOrt]) :-
	Vorgang = [_, _, _, inEinfacherRaffinerieRaffinieren, _, _],
	NoetigeRaffinerieEingabeFaecher = 2,
	letzterOrt(System, Planet1, _Ort1),
	((spielStatus:systemAusstattung([System, Planet1, ortKleineRaffinerie], _), Planet = Planet1);
	  /* TODO nicht irgendeinen weiteren Planeten, sondern den nähesten nehmen */
	 (spielStatus:systemAusstattung([System, Planet2, ortKleineRaffinerie], _), Planet2 \= 'MeinPlanet', Planet = Planet2)
	),
	VorgangsOrt = ortKleineRaffinerie,
	!.

vorgangsOrt(NoetigeRaffinerieEingabeFaecher, Vorgang, [System, Planet, VorgangsOrt]) :-
	Vorgang = [_, _, _, raffinieren, _, _],
	NoetigeRaffinerieEingabeFaecher = 1,
	letzterOrt(System, Planet1, _Ort1),
	(((spielStatus:systemAusstattung([System, Planet1, ortMittlereRaffinerie], DistanzMittlereRaffinerie), Planet = Planet1); DistanzMittlereRaffinerie = 99999999999),
	 ((spielStatus:systemAusstattung([System, Planet1, ortGrosseRaffinerie], DistanzGrosseRaffinerie), Planet = Planet1); DistanzGrosseRaffinerie = 99999999999)
	 ;
 	 ((spielStatus:systemAusstattung([System, Planet2, ortMittlereRaffinerie], DistanzMittlereRaffinerie), Planet2 \= 'MeinPlanet', Planet = Planet2); DistanzMittlereRaffinerie = 99999999999),
	 ((spielStatus:systemAusstattung([System, Planet2, ortGrosseRaffinerie], DistanzGrosseRaffinerie), Planet2 \= 'MeinPlanet', Planet = Planet2); DistanzGrosseRaffinerie = 99999999999)
    ),
    
	min_member(NaehesteRaffinerie, [[DistanzMittlereRaffinerie, ortMittlereRaffinerie], 
									[DistanzGrosseRaffinerie, ortGrosseRaffinerie]]),
	NaehesteRaffinerie = [Distanz, VorgangsOrt0],
	Distanz < 99999999999,
	VorgangsOrt = VorgangsOrt0,
	!.

vorgangsOrt(NoetigeRaffinerieEingabeFaecher, Vorgang, [System, Planet, VorgangsOrt]) :-
	Vorgang = [_, _, _, raffinieren, _, _],
	NoetigeRaffinerieEingabeFaecher = 2,
	letzterOrt(System, Planet1, _Ort1),
	(((spielStatus:systemAusstattung([System, Planet1, ortMittlereRaffinerie], DistanzMittlereRaffinerie), Planet = Planet1); DistanzMittlereRaffinerie = 99999999999),
	 ((spielStatus:systemAusstattung([System, Planet1, ortGrosseRaffinerie], DistanzGrosseRaffinerie), Planet = Planet1); DistanzGrosseRaffinerie = 99999999999)
     ;
 	 ((spielStatus:systemAusstattung([System, Planet2, ortMittlereRaffinerie], DistanzMittlereRaffinerie), Planet2 \= 'MeinPlanet', Planet = Planet2); DistanzMittlereRaffinerie = 99999999999),
	 ((spielStatus:systemAusstattung([System, Planet2, ortGrosseRaffinerie], DistanzGrosseRaffinerie), Planet2 \= 'MeinPlanet', Planet = Planet2); DistanzGrosseRaffinerie = 99999999999)
    ),
	min_member(NaehesteRaffinerie, [[DistanzMittlereRaffinerie, ortMittlereRaffinerie], 
									[DistanzGrosseRaffinerie, ortGrosseRaffinerie]]),
	NaehesteRaffinerie = [Distanz, VorgangsOrt0],
	Distanz < 99999999999,
	VorgangsOrt = VorgangsOrt0,
	!.
	
vorgangsOrt(NoetigeRaffinerieEingabeFaecher, Vorgang, [System, Planet, VorgangsOrt]) :-
	Vorgang = [_, _, _, raffinieren, _, _],
	NoetigeRaffinerieEingabeFaecher = 3,
	letzterOrt(System, Planet1, _Ort1),
	((spielStatus:systemAusstattung([System, Planet1, ortGrosseRaffinerie], _), Planet = Planet1);
	 (spielStatus:systemAusstattung([System, Planet2, ortGrosseRaffinerie], _), Planet2 \= 'MeinPlanet', Planet = Planet2)
	),
	VorgangsOrt = ortGrosseRaffinerie,
	!.

vorgangsOrt(_, Vorgang, [System, Planet, VorgangsOrt]) :-
	Vorgang = [_, _, _, kaufen, _, _],
	letzterOrt(System, Planet1, _Ort1),
	((spielStatus:systemAusstattung([System, Planet1, ortHandelsTerminal], _), Planet = Planet1, VorgangsOrt = ortHandelsTerminal);
	 (spielStatus:systemAusstattung([System, Planet1, ortHandelsStation], _), Planet = Planet1, VorgangsOrt = ortHandelsStation);
	 (Planet = Planet1, VorgangsOrt = ortRaumStation)
	),
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
	VorgangsOrt = ortSpieler,
	Zeit = 0,  /* der Spieler muss nicht zu sich selbst reisen */
 	!.

/* Nullreise */
reisen([NachSystem, NachPlanet, NachOrtsTeil], Zeit) :-
	letzterOrt(VonSystem, VonPlanet, VonOrtsTeil),
	VonSystem = NachSystem,
	VonPlanet = NachPlanet, 
	VonOrtsTeil = NachOrtsTeil,
	Zeit = 0,  /* der Spieler muss nicht zum bereits eingenommenen Ort reisen */
 	!.

/* vorhaben auf gleichem Planeten; Reise zu Fuß / mit Raumschiff */
reisen([System, Planet, NachOrtsTeil], Zeit) :-
	letzterOrt(System, Planet, VonOrtsTeil),
	spielStatus:systemAusstattung([System, Planet, VonOrtsTeil], ZurBasisTransferZeit),
	spielStatus:systemAusstattung([System, Planet, NachOrtsTeil], ZumVorgangTransferZeit),
	retractall(letzterOrt(_, _, _)),
	assertz(letzterOrt(System, Planet, NachOrtsTeil)),
	Zeit is ZurBasisTransferZeit + ZumVorgangTransferZeit,
	!.

/* vorhaben auf gleichem Planeten; Reise mit Fahrzeug */
/* TODO Meilenstein Fahrzeuge */

/* vorhaben auf anderem Planeten in gleichem System; Reise mit Raumschiff über RaumStation und zu Fuß*/
reisen([NachSystem, NachPlanet, NachOrtsTeil], Zeit) :-
	letzterOrt(VonSystem, VonPlanet, VonOrtsTeil),
	NachSystem = VonSystem,
	spielStatus:systemAusstattung([VonSystem, VonPlanet, VonOrtsTeil], ZurBasisTransferZeit),
	spielStatus:systemAusstattung([VonSystem, VonPlanet, ortRaumStation], TransferZurRaumStation),
	spielStatus:systemAusstattung([NachSystem, NachPlanet, ortRaumStation], TransferVonRaumStation),
	spielStatus:systemAusstattung([NachSystem, NachPlanet, NachOrtsTeil], ZumVorgangTransferZeit),
	retractall(letzterOrt(_, _, _)),
	assertz(letzterOrt(NachSystem, NachPlanet, NachOrtsTeil)),
	Zeit is ZurBasisTransferZeit + TransferZurRaumStation + TransferVonRaumStation + ZumVorgangTransferZeit,
	!.

/* vorhaben auf anderem Planeten in gleicher Galaxie; Reise mit Raumschiff, BasisTerminus und zu Fuß */
reisen([System, Planet, VorgangsOrt], Zeit) :-
	letzterOrt(System1, Planet1, Ort),
	spielStatus:systemAusstattung([System1, Planet1, Ort], ZurBasisTransferZeit),
	spielStatus:systemAusstattung([System1, Planet1, ortRaumStation], ZumAbreiseTerminus),
	TransferZeit = 4800, /* Treppe hoch, Ziel aussuchen, Transfer */
	spielStatus:systemAusstattung([System, Planet, ortHauptBasis], ZurAnkunftsBasis),
	spielStatus:systemAusstattung([System, Planet, VorgangsOrt], ZumVorgangTransferZeit),
	retractall(letzterOrt(_, _, _)),
	assertz(letzterOrt(System, Planet, VorgangsOrt)),
	Zeit is ZurBasisTransferZeit + ZumAbreiseTerminus + TransferZeit + ZurAnkunftsBasis + ZumVorgangTransferZeit,
	!.


/* vorhaben auf anderem Planeten in gleicher Galaxie; Reise mit Basisterminus und zu Fuß */
reisen([System, Planet, VorgangsOrt], Zeit) :-
	letzterOrt(System1, Planet1, Ort),
	spielStatus:systemAusstattung([System1, Planet1, Ort], ZurBasisTransferZeit),
	spielStatus:systemAusstattung([System1, Planet1, ortBasisTerminus], ZumAbreiseTerminus),
	TransferZeit = 4500, 
	spielStatus:systemAusstattung([System, Planet, ortBasisTerminus], ZurAnkunftsBasis),
	spielStatus:systemAusstattung([System, Planet, VorgangsOrt], ZumVorgangTransferZeit),
	retractall(letzterOrt(_, _, _)),
	assertz(letzterOrt(System, Planet, VorgangsOrt)),
	Zeit is ZurBasisTransferZeit + ZumAbreiseTerminus + TransferZeit + ZurAnkunftsBasis + ZumVorgangTransferZeit,
	!.

/* vorhaben auf anderem Planeten in gleicher Galaxie; Reise mit Raumschiff Warp (ein Hop) */
reisen([System, Planet, VorgangsOrt], Zeit) :-
	spielStatus:spielStatus(raumSchiffIstFlott, true),
	letzterOrt(System1, Planet1, Ort),
	spielStatus:systemAusstattung([System1, Planet1, Ort], ZurBasisTransferZeit0),
	spielStatus:systemAusstattung([System1, Planet1, ortWeltRaum], ZumAbflugZeit),
	WarpTransferZeit = 4100, 
	spielStatus:systemAusstattung([System, Planet, ortRaumStation], ZurBasisTransferZeit1),
	spielStatus:systemAusstattung([System, Planet, VorgangsOrt], ZumVorgangTransferZeit),
	ignore(retractall(letzterOrt(_, _, _))),
	assertz(letzterOrt(System, Planet, VorgangsOrt)),
	Zeit is ZurBasisTransferZeit0 + ZurBasisTransferZeit1 + ZumAbflugZeit + WarpTransferZeit + ZumVorgangTransferZeit,
	!.

/* vorhaben auf anderem Planeten in gleicher Galaxie; Reise mit Frachter Warp (ein Hop) */
reisen([System, Planet, VorgangsOrt], Zeit) :-
	spielStatus:spielStatus(raumSchiffIstFlott, true),
	spielStatus:spielStatus(frachterVorhanden, true),
	letzterOrt(System1, Planet1, Ort),
	spielStatus:systemAusstattung([System1, Planet1, Ort], ZurBasisTransferZeit0),
	spielStatus:systemAusstattung([System1, Planet1, ortFrachter], ZumAbflugZeit),
	WarpTransferZeit = 3500, 
	spielStatus:systemAusstattung([System, Planet, ortFrachter], ZurBasisTransferZeit1),
	spielStatus:systemAusstattung([System, Planet, VorgangsOrt], ZumVorgangTransferZeit),
	retractall(letzterOrt(_, _, _)),
	assertz(letzterOrt(System, Planet, VorgangsOrt)),
	Zeit is ZurBasisTransferZeit0 + ZurBasisTransferZeit1 + ZumAbflugZeit + WarpTransferZeit + ZumVorgangTransferZeit,
	!.

/* kaufen mit flug gleicher Planet */
/* kaufen mit flug anderer Planet, gleiches System */
/* kaufen mit flug anderer Planet, anderes System, mit Teleport */
/* kaufen mit flug anderer Planet, anderes System, mit Warp */

/*

transferZeit(A, B) :-
	transferZeit(B, A).

flugZtransferZeiteit(ortHauptBasis, raumSchuerfen, 4500).

transferZeit(3880).
resourcenAnsammlungSuchen(800).
terminalOeffnen(980).
*/

/* ------------------------------------------------------------------------------------------------------ */
fuegeReiseOperationenEin(System, Planet, Vorgaenge, VorgaengeDanach) :-
	/* ermittelt größte nötige RaffinerieEingabefachzahl für alle Vorgänge */
	/* dadurch wird nur eine Reise für Raffinieren benötigt */
	noetigeRaffinerieEingabefaecher(Vorgaenge, 0, NoetigeFaecher),
	ReiseOrtBisher = [System, Planet, ortSpieler], 
	ignore(retractall(letzterOrt(_, _, _))),
	assertz(letzterOrt(System, Planet, ortHauptBasis)),
	fuegeReiseOperationenEinSub(NoetigeFaecher, Vorgaenge, ReiseOrtBisher, [], VorgaengeDanach).


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
	
/* keine Reise, weil gleicher Ort */
vorgangAnfuegenWennVerschiedeneOrte(VorgaengeBisher, ReiseOrtBisher, VorgangsOrt, VorgaengeBisher2, ReiseOrtBisherDanach) :-
    ReiseOrtBisher = VorgangsOrt,
	VorgaengeBisher2 = VorgaengeBisher,
	ReiseOrtBisherDanach = ReiseOrtBisher.

/* keine Reise weil Aktion überall moeglich */ 
vorgangAnfuegenWennVerschiedeneOrte(VorgaengeBisher, ReiseOrtBisher, VorgangsOrt, VorgaengeBisher2, ReiseOrtBisherDanach) :-
	VorgangsOrt = [_, _, VorgangsOrtsTeil], 
	VorgangsOrtsTeil = ortSpieler,
	VorgaengeBisher2 = VorgaengeBisher,
	ReiseOrtBisherDanach = ReiseOrtBisher.


/* Reise an anderen Ort */
vorgangAnfuegenWennVerschiedeneOrte(VorgaengeBisher, ReiseOrtBisher, VorgangsOrt, VorgaengeBisher2, ReiseOrtBisherDanach) :-
	ReiseOrtBisher = [System, Planet, _OrtsTeil],
	reisen(VorgangsOrt, ReiseZeit),
	append([[System, Planet, 1, reisen, [[1, ReiseOrtBisher], [1, VorgangsOrt]], [ReiseZeit, angekommen]]], VorgaengeBisher, VorgaengeBisher2),
	ReiseOrtBisherDanach = VorgangsOrt.

