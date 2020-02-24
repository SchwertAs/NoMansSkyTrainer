:- module(reisen, [bildeReiseZeiten/2, fuegeReiseOperationenEin/4]).

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

bauenNurInFrachter(flottenKommandoRaum). /* Plausicheck bei Eingabemaske Stoff <-> Spielerort */
bauenNurInFrachter(grosserFrachterRaum).
bauenNurInFrachter(frachterKorridor).
bauenNurInFrachter(gebogenerFrachterKorridor).
bauenNurInFrachter(frachterKreuzungDreiFach).
bauenNurInFrachter(frachterKreuzungVierFach).
bauenNurInFrachter(frachterTreppe).


fuegeReiseOperationenEin(Vorgaenge, ReiseOrtBisher, VorgaengeBisher, VorgaengeDanach) :-
	/* ermittelt größte nötige Raffinerie für alle Vorgänge */
	/* dadurch wird nur eine Reise für Raffinieren benötigt */
	ermittleGroessteNoetigeRaffinerie(Vorgaenge, ortKleineRaffinerie, GroessteFuerAlleVorgaengeNoetigeRaffinerie),
	fuegeReiseOperationenEinSub(GroessteFuerAlleVorgaengeNoetigeRaffinerie, Vorgaenge, ReiseOrtBisher, VorgaengeBisher, VorgaengeDanach).

fuegeReiseOperationenEinSub(_, Vorgaenge, _, VorgaengeBisher, VorgaengeDanach) :-
	Vorgaenge = [],
	VorgaengeDanach = VorgaengeBisher,
	!.

fuegeReiseOperationenEinSub(Groesste, Vorgaenge, ReiseOrtBisher, VorgaengeBisher, VorgaengeDanach) :-
	Vorgaenge = [Vorgang | RestVorgaenge], 
	vorgangsOrt(Groesste, Vorgang, VorgangsOrt),
	vorgangAnfuegenWennVerschiedeneOrte([Vorgang], ReiseOrtBisher, VorgangsOrt, ErweiterterVorgang, ReiseOrtBisherDanach),
	append(VorgaengeBisher, ErweiterterVorgang, VorgaengeBisher1),
	fuegeReiseOperationenEinSub(Groesste, RestVorgaenge, ReiseOrtBisherDanach, VorgaengeBisher1, VorgaengeDanach),
	!.
		

ermittleGroessteNoetigeRaffinerie(Vorgaenge, GroessteBisherige, Groesste) :-
	Vorgaenge = [],
	Groesste = GroessteBisherige,
	!.

ermittleGroessteNoetigeRaffinerie(Vorgaenge, GroessteBisherige, Groesste) :-
	Vorgaenge = [Vorgang | RestVorgaenge], 
	vorgangsOrt(GroessteBisherige, Vorgang, VorgangsOrt),
	raffinerieOrtGroesser(GroessteBisherige, VorgangsOrt),
	ermittleGroessteNoetigeRaffinerie(RestVorgaenge, VorgangsOrt, Groesste),
	!.

ermittleGroessteNoetigeRaffinerie(Vorgaenge, GroessteBisherige, Groesste) :-
	Vorgaenge = [_ | RestVorgaenge], 
	ermittleGroessteNoetigeRaffinerie(RestVorgaenge, GroessteBisherige, Groesste),
	!.

raffinerieOrtGroesser(OrtBisher, OrtNeu) :-
	OrtBisher = ortKleineRaffinerie, 
	OrtNeu = ortMittlereRaffinerie.

raffinerieOrtGroesser(OrtBisher, OrtNeu) :-
	OrtBisher = ortKleineRaffinerie, 
	OrtNeu = ortGrosseRaffinerie.

raffinerieOrtGroesser(OrtBisher, OrtNeu) :-
	OrtBisher = ortMittlereRaffinerie, 
	OrtNeu = ortGrosseRaffinerie.

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


vorgangsOrtModifikationRaffinerieen(GroessteBisher, RaffinerieOrtNeu, ModOrt) :-
	(raffinerieOrtGroesser(GroessteBisher, RaffinerieOrtNeu)) -> ModOrt = RaffinerieOrtNeu; ModOrt = GroessteBisher.
	
bildeReiseZeiten(Vorgaenge, ReiseZeit) :-
	spielStatus:systemAusstattung([System, Planet, ortSpieler], Entfernung),
	ermittleGroessteNoetigeRaffinerie(Vorgaenge, ortKleineRaffinerie, Groesste),
	findall(VorgangsOrt1, (member(Vorgang, Vorgaenge), vorgangsOrt(Groesste, Vorgang, VorgangsOrt1)), VorgangsOrte1),
	findall(EinzelZeit, (member(VorgangsOrt2, VorgangsOrte1), reisen(VorgangsOrt2, EinzelZeit)), EinzelZeiten),
	sum_list(EinzelZeiten, ReiseZeit),
	retract(spielStatus:systemAusstattung([_, _, ortSpieler], _)),
	assertz(spielStatus:systemAusstattung([System, Planet, ortSpieler], Entfernung)).

vorgangsOrt(_, Vorgang, VorgangsOrt) :-
	Vorgang = [_, bauen, _, _],
	VorgangsOrt = ortSpieler,
	!.
		
vorgangsOrt(Groesste, Vorgang, VorgangsOrt) :-
	Vorgang = [_, raffinieren, Komponenten, _],
	length(Komponenten, AnzKomponenten),
	AnzKomponenten = 1,
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	(spielStatus:systemAusstattung([System, Planet, ortKleineRaffinerie], DistanzKleineRaffinerie); DistanzKleineRaffinerie = 99999999999),
	(spielStatus:systemAusstattung([System, Planet, ortMittlereRaffinerie], DistanzMittlereRaffinerie); DistanzMittlereRaffinerie = 99999999999),
	(spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], DistanzGrosseRaffinerie); DistanzGrosseRaffinerie = 99999999999),
	min_member(NaehesteRaffinerie, [[DistanzKleineRaffinerie, ortKleineRaffinerie], 
									[DistanzMittlereRaffinerie, ortMittlereRaffinerie], 
									[DistanzGrosseRaffinerie, ortGrosseRaffinerie]]),
	NaehesteRaffinerie = [Distanz, VorgangsOrt0],
	Distanz < 99999999999,
	vorgangsOrtModifikationRaffinerieen(Groesste, VorgangsOrt0, VorgangsOrt),
	!.
	
vorgangsOrt(Groesste, Vorgang, VorgangsOrt) :-
	Vorgang = [_, raffinieren, Komponenten, _],
	length(Komponenten, AnzKomponenten),
	AnzKomponenten = 2,
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	(spielStatus:systemAusstattung([System, Planet, ortMittlereRaffinerie], DistanzMittlereRaffinerie); DistanzMittlereRaffinerie = 99999999999),
	(spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], DistanzGrosseRaffinerie); DistanzGrosseRaffinerie = 99999999999),
	min_member(NaehesteRaffinerie, [[DistanzMittlereRaffinerie, ortMittlereRaffinerie], 
									[DistanzGrosseRaffinerie, ortGrosseRaffinerie]]),
	NaehesteRaffinerie = [Distanz, VorgangsOrt0],
	Distanz < 99999999999,
	vorgangsOrtModifikationRaffinerieen(Groesste, VorgangsOrt0, VorgangsOrt),
	!.
	
vorgangsOrt(_, Vorgang, VorgangsOrt) :-
	Vorgang = [_, raffinieren, Komponenten, _],
	length(Komponenten, AnzKomponenten),
	AnzKomponenten = 3,
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