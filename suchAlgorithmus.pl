:- module(suchAlgorithmus, [baue/5, baueFuerVorfertigung/5, ersterNichtBeschaffbarerStoff/3]).

:- dynamic(loesung/8).
:- dynamic(maxTiefe/1).
:- dynamic(ersterNichtBeschaffbarerStoff/3).
:- dynamic(ersterNichtBeschaffbarerStoffGesetzt/1).

/* ------------------------------------------------------------------------------------------------------------------------- */
baueFuerVorfertigung(System, Planet, Strategie, Anzahl, Stoff) :-
	abolish(loesung/8),
	abolish(maxTiefe/1),
	dict_create(SammelSet0, 'SammelStueckliste', []),
	assertz(loesung(none, [], SammelSet0, 0, 0, 0, 0, 0)),
	assertz(maxTiefe(4)),
	beschaffen(System, Planet, Strategie, Anzahl, Stoff, [], [], Vorgaenge),
	dict_create(SammelSet1, 'SammelStueckliste', []),
	statistik:bildeSammelSet(Vorgaenge, SammelSet1, SammelSet),
	statistik:bildeGesamtZahl(SammelSet, 0, GesamtZahl),
	statistik:bildeGesamtWert(SammelSet, 0, GesamtWertSammlung),
	logistik:sammelVorgaengeZusammenfassen(Vorgaenge, OptimierteVorgaenge),
	reisen:bildeReiseZeiten(OptimierteVorgaenge, GesamtReiseZeit),
	arbeitsVorbereitung:bildeAvZeiten(Vorgaenge, 0, GesamtVorgaengeZeit),
	statistik:bildeGesamtAufwaende(Vorgaenge, 0, GesamtEinkaufsAufwand),
	GesamtZeitAufwand is GesamtVorgaengeZeit + GesamtReiseZeit, 
	GesamtAufwand is GesamtEinkaufsAufwand,
	stoff:stoff(_, Stoff, Wert),
	Erloes is Anzahl * Wert,
	assertz(loesung(Stoff, Vorgaenge, SammelSet, GesamtZahl, GesamtWertSammlung, GesamtZeitAufwand, GesamtAufwand, Erloes)),
	fail.

baue(System, Planet, Strategie, Anzahl, Stoff) :-
	abolish(loesung/8),
	abolish(ersterNichtBeschaffbarerStoff/3),
	abolish(maxTiefe/1),
	dict_create(SammelSet0, 'SammelStueckliste', []),
	assertz(loesung(none, [], SammelSet0, 0, 0, 0, 0, 0)),
	assertz(ersterNichtBeschaffbarerStoff(Strategie, none, [])),
	assertz(maxTiefe(99)),
	beschaffen(System, Planet, Strategie, Anzahl, Stoff, [], [], Vorgaenge),
	dict_create(SammelSet1, 'SammelStueckliste', []),
	statistik:bildeSammelSet(Vorgaenge, SammelSet1, SammelSet),
	statistik:bildeGesamtZahl(SammelSet, 0, GesamtZahl),
	statistik:bildeGesamtWert(SammelSet, 0, GesamtWertSammlung),
	logistik:sammelVorgaengeZusammenfassen(Vorgaenge, OptimierteVorgaenge),
	reisen:bildeReiseZeiten(OptimierteVorgaenge, GesamtReiseZeit),
	arbeitsVorbereitung:bildeAvZeiten(Vorgaenge, 0, GesamtVorgaengeZeit),
	statistik:bildeGesamtAufwaende(OptimierteVorgaenge, 0, GesamtEinkaufsAufwand),
	GesamtZeitAufwand is GesamtVorgaengeZeit + GesamtReiseZeit, 
	GesamtAufwand is GesamtEinkaufsAufwand,
	stoff:stoff(_, Stoff, Wert),
	Erloes is Anzahl * Wert,
	reisen:fuegeReiseOperationenEin(OptimierteVorgaenge, ErgaenzteVorgaenge),
	assertz(loesung(Stoff, ErgaenzteVorgaenge, SammelSet, GesamtZahl, GesamtWertSammlung, GesamtZeitAufwand, GesamtAufwand, Erloes)),
	fail.

/* ------------------------------------------------------------------------------------------------------------------------- */
/* Subprädikate */
/* vorgefertigte einbauen */
beschaffen(System, Planet, Strategie, Anzahl, Stoff, _, BisherigeVorgaenge, Vorgaenge) :-
	sammlung:fertigeLoesung(System, Planet, Strategie, Stoff, _),
	!,
	append([[System, Planet, Anzahl, vorfertigen, [], [Anzahl, Stoff]]], BisherigeVorgaenge, VorgaengeMitVorfertigung),
	expandiereVorgaenge(System, Planet, Strategie, VorgaengeMitVorfertigung, [], Vorgaenge),
	!. 

/* sammelbares einbauen (sammeln auf eigenem Planeten hat immer Vorrang (cut)) */
beschaffen(System, Planet, _, Anzahl, Stoff, _, BisherigeVorgaenge, Vorgaenge) :-
	sammlung:sammlung(_, System, Planet, Operation, Stoff, _, _, _),
	sammelAktion:pruefeSammelAktionVorraussetzung(System, Planet, Operation),
	append([[System, Planet, Anzahl, Operation, [], [Anzahl, Stoff]]], BisherigeVorgaenge, Vorgaenge),
	!.

beschaffen(System, _, _, Anzahl, Stoff, _, BisherigeVorgaenge, Vorgaenge) :-
	sammlung:sammlung(_, System, Planet, Operation, Stoff, _, _, _),
	System \= 'System',
	Planet = 'MeinPlanet',
	sammelAktion:pruefeSammelAktionVorraussetzung(System, Planet, Operation),
	append([[System, Planet, Anzahl, Operation, [], [Anzahl, Stoff]]], BisherigeVorgaenge, Vorgaenge).

beschaffen(_, _, _, Anzahl, Stoff, _, BisherigeVorgaenge, Vorgaenge) :-
	sammlung:sammlung(_, System, Planet, Operation, Stoff, _, _, _),
	System \= 'System', 
	Planet \= 'MeinPlanet',
	sammelAktion:pruefeSammelAktionVorraussetzung(System, Planet, Operation),
	append([[System, Planet, Anzahl, Operation, [], [Anzahl, Stoff]]], BisherigeVorgaenge, Vorgaenge).

/* aus rezept erbauen */
beschaffen(System, Planet, Strategie, Anzahl, Stoff, StoffPfad, BisherigeVorgaenge, ListeVorgaenge) :-
	maxTiefe(MaxTiefe),
	length(StoffPfad, Len),
	Len =< MaxTiefe, 
	rezept:rezept(Operation, Komponenten, [AnzahlRezeptErgebnis, Stoff], _),
	rezeptZulaessig(System, Planet, Operation, Komponenten, Stoff),
	keinZirkel(Komponenten, StoffPfad, Stoff),
	divmod(Anzahl, AnzahlRezeptErgebnis, AnzahlDivision, Rest),
	(Rest > 0, AnzahlRaffinaden is AnzahlDivision + 1; Rest = 0, AnzahlRaffinaden is AnzahlDivision),
	AnzahlRaffiniert is AnzahlRaffinaden * AnzahlRezeptErgebnis,
	append([[System, Planet, AnzahlRaffinaden, Operation, Komponenten, [AnzahlRaffiniert, Stoff]]], BisherigeVorgaenge, ListeVorgaenge0),
	append([Stoff], StoffPfad, StoffPfadDanach),
	abolish(ersterNichtBeschaffbarerStoffGesetzt/1),	
	assertz(ersterNichtBeschaffbarerStoffGesetzt(false)),	
	listeBeschaffen(System, Planet, Strategie, AnzahlRaffinaden, Komponenten, StoffPfadDanach, ListeVorgaenge0, ListeVorgaenge).

/* ------------------------------------------------------------------------------------------------------------------------- */
/* aus vorgefertigter Lösung wieder einzelschritte machen */
expandiereVorgaenge(_, _, _Strategie, Vorgaenge, VorgaengeExpandiertTmp, VorgaengeExpandiert) :-
	Vorgaenge = [],
	VorgaengeExpandiert = VorgaengeExpandiertTmp,
	!.
	
expandiereVorgaenge(System, Planet, Strategie, Vorgaenge, VorgaengeExpandiertTmp, VorgaengeExpandiert) :-
	Vorgaenge = [Kopf|Rest], 
	Kopf \= [_, _, _, vorfertigen, _, [_, _]],
	append(VorgaengeExpandiertTmp, [Kopf], VorgaengeExpandiertDanach),
	expandiereVorgaenge(System, Planet, Strategie, Rest, VorgaengeExpandiertDanach, VorgaengeExpandiert),
	!.

expandiereVorgaenge(_System, _Planet, Strategie, Vorgaenge, VorgaengeExpandiertTmp, VorgaengeExpandiert) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [System, Planet, Anzahl, vorfertigen, _, [_, Stoff]],
	sammlung:fertigeLoesung(System, Planet, Strategie, Stoff, VorgaengeDanach0),
	ermittleNoetigenRezeptMultiplikator(VorgaengeDanach0, Anzahl, Faktor),
	multipliziereVorgangsWerte(VorgaengeDanach0, Faktor, [], VorgaengeDanach1), 
	expandiereVorgaenge(System, Planet, Strategie, VorgaengeDanach1, VorgaengeExpandiertTmp, VorgaengeExpandiert0),
	expandiereVorgaenge(System, Planet, Strategie, Rest, VorgaengeExpandiert0, VorgaengeExpandiert),
	!.

/* ------------------------------------------------------------------------------------------------------------------------- */
ermittleNoetigenRezeptMultiplikator(Vorgaenge, Anzahl, Faktor) :-
	Vorgaenge = [ Vorgang | []],
	Vorgang = [_, _, _, _, _, [AnzahlProdukteVorgang, _]],
	Faktor is ceiling(Anzahl / AnzahlProdukteVorgang).

ermittleNoetigenRezeptMultiplikator(Vorgaenge, Anzahl, Faktor) :-
	Vorgaenge = [ _ | Rest],
	ermittleNoetigenRezeptMultiplikator(Rest, Anzahl, Faktor).

/* ------------------------------------------------------------------------------------------------------------------------- */
multipliziereVorgangsWerte(Vorgaenge, _, VorgaengeMultipliziertBisher, VorgaengeMultipliziert) :-
	Vorgaenge = [],
	VorgaengeMultipliziertBisher = VorgaengeMultipliziert,
	!.

multipliziereVorgangsWerte(Vorgaenge, Faktor, VorgaengeMultipliziertBisher, VorgaengeMultipliziert) :-
	Vorgaenge = [Vorgang|RestVorgaenge],
	Vorgang = [System, Planet, AnzahlVorgang, Operation, Komponenten, [AnzahlProdukteVorgang, Stoff]],
	AnzahlVorgangMultipliziert is AnzahlVorgang * Faktor,
	AnzahlProdukteVorgangMultipliziert is AnzahlProdukteVorgang * Faktor,
	VorgangMultipliziert = [System, Planet, AnzahlVorgangMultipliziert, Operation, Komponenten, [AnzahlProdukteVorgangMultipliziert, Stoff]],
	append(VorgaengeMultipliziertBisher, [VorgangMultipliziert], VorgaengeMultipliziertBisher1),
	multipliziereVorgangsWerte(RestVorgaenge, Faktor, VorgaengeMultipliziertBisher1, VorgaengeMultipliziert).   

/* ------------------------------------------------------------------------------------------------------------------------- */
rezeptZulaessig(_, _, Operation, _, _) :-
	memberchk(Operation, [herstellen, installieren, rezeptInFabrikErwerben]),
	!.

rezeptZulaessig(System, Planet, bauen, _, _) :-
	spielStatus:systemAusstattung([System, Planet, ortHauptBasis], _),
	!.

rezeptZulaessig(_, _, inEinfacherRaffinerieRaffinieren, Komponenten, _) :-
	Komponenten = [[_, _], [_, _]],
	spielStatus:spielStatus(anzugRaffinerie, true),
	!.

rezeptZulaessig(System, Planet, inEinfacherRaffinerieRaffinieren, Komponenten, _) :-
	Komponenten = [[_, _], [_, _]],
	spielStatus:systemAusstattung([System, Planet, ortKleineRaffinerie], _), 
	!.
	
rezeptZulaessig(System, Planet, raffinieren, Komponenten, _) :-
	Komponenten = [[_, _]],
	(spielStatus:systemAusstattung([System, Planet, ortMittlereRaffinerie], _);
	 spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], _)
	),
	!.
	
rezeptZulaessig(System, Planet, raffinieren, Komponenten, _) :-
	Komponenten = [[_, _], [_, _]],
	(spielStatus:systemAusstattung([System, Planet, ortMittlereRaffinerie], _);
	 spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], _)
	),
	!.

rezeptZulaessig(System, Planet, raffinieren, Komponenten, _) :-
	Komponenten = [[_, _], [_, _], [_, _]],
	spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], _),
	!.

rezeptZulaessig(System, Planet, ausSauerStoffVearbeiterGewinnen, Komponenten, _) :-
	Komponenten = [[_, _]],
	spielStatus:systemAusstattung([System, Planet, ortSauerStoffVearbeiter], _),
	!.

rezeptZulaessig(System, Planet, ausAtmosphaerenAnlageGewinnen, Komponenten, Stoff) :-
	Komponenten = [[_, _]],
	/* es muss eine Atmospherenanlage auf dem Planeten geben */
	spielStatus:systemAusstattung([System, Planet, ortAtmosphaerenAnlage], _),
	spielStatus:planeten(_, System, Planet, AtmospherenArt),
	Stoff = AtmospherenArt,
	!.

rezeptZulaessig(System, Planet, kochen, _, _) :-
	spielStatus:systemAusstattung([System, Planet, ortNahrungsProzessor], _),
	!.

rezeptZulaessig(System, Planet, rezeptInAussenPostenErwerben, Komponenten, _) :-
	Komponenten = [[_, _]],
	spielStatus:systemAusstattung([System, Planet, ortAussenPosten], _),
	!.
	
rezeptZulaessig(System, Planet, rezeptAmForschungsComputerErwerben, Komponenten, _) :-
	Komponenten = [[_, _]],
	spielStatus:systemAusstattung([System, Planet, ortForschungsTerminal], _),
	!.

rezeptZulaessig(_, _, WandlungsArt, Komponenten, _) :-
	(WandlungsArt = rezeptInAnomalieErwerben; 
	 WandlungsArt = rezeptInAnomalieForschungsComputerErwerben;
	 WandlungsArt = modulInRaumstationErwerben
	),
	Komponenten = [[_, _]],
	spielStatus:spielStatus(sphaereRufbar, true),
	!.

rezeptZulaessig(_, _, WandlungsArt, Komponenten, _) :-
	WandlungsArt = rezeptInFrachterErwerben, /* Fregattenmodule */
	Komponenten = [[_, _]],
	spielStatus:spielStatus(frachterVorhanden, true),
	!.

/* ------------------------------------------------------------------------------------------------------------------------- */
keinZirkel(Komponenten, StoffPfad, Stoff) :-
	Komponenten = [[_, Stoff1]],
	\+memberchk(Stoff1, StoffPfad),
	\+Stoff = Stoff1,
	!.

keinZirkel(Komponenten, StoffPfad, Stoff) :-
	Komponenten = [[_, Stoff1], [_, Stoff2]],
	\+memberchk(Stoff1, StoffPfad),
	\+memberchk(Stoff2, StoffPfad),
	\+Stoff = Stoff1,
	\+Stoff = Stoff2,
	!.

keinZirkel(Komponenten, StoffPfad, Stoff) :-
	Komponenten = [[_, Stoff1], [_, Stoff2], [_, Stoff3]],
	\+memberchk(Stoff1, StoffPfad),
	\+memberchk(Stoff2, StoffPfad),
	\+memberchk(Stoff3, StoffPfad),
	\+Stoff = Stoff1,
	\+Stoff = Stoff2,
	\+Stoff = Stoff3,
	!.

keinZirkel(Komponenten, StoffPfad, Stoff) :-
	Komponenten = [[_, Stoff1], [_, Stoff2], [_, Stoff3], [_, Stoff4]],
	\+memberchk(Stoff1, StoffPfad),
	\+memberchk(Stoff2, StoffPfad),
	\+memberchk(Stoff3, StoffPfad),
	\+memberchk(Stoff4, StoffPfad),
	\+Stoff = Stoff1,
	\+Stoff = Stoff2,
	\+Stoff = Stoff3,
	\+Stoff = Stoff4,
	!.
	
baueBegruendung(Strategie, Komp, ListeBisherigerVorgaenge) :-
	ersterNichtBeschaffbarerStoffGesetzt(false),
	retract(ersterNichtBeschaffbarerStoffGesetzt(false)),
	assertz(ersterNichtBeschaffbarerStoffGesetzt(true)),	
	assertz(ersterNichtBeschaffbarerStoff(Strategie, Komp, ListeBisherigerVorgaenge)),
	fail.
	
/*---------------------------------------------------------------*/
listeBeschaffen(System, Planet, Strategie, AnzahlRaffinaden, Komponenten, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge) :-
	Komponenten = [[Anz1, Komp1]],
	Anzahl1 is Anz1 * AnzahlRaffinaden,
	ceiling(Anzahl1, Anzahl1GanzZahlig),
	(beschaffen(System, Planet, Strategie, Anzahl1GanzZahlig, Komp1, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge);
	 baueBegruendung(Strategie, Komp1, ListeBisherigerVorgaenge)
	).

listeBeschaffen(System, Planet, Strategie, AnzahlRaffinaden, Komponenten, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge) :-
	Komponenten = [[Anz1, Komp1], [Anz2, Komp2]],
	Anzahl1 is Anz1 * AnzahlRaffinaden,
	Anzahl2 is Anz2 * AnzahlRaffinaden,
	ceiling(Anzahl1, Anzahl1GanzZahlig),
	ceiling(Anzahl2, Anzahl2GanzZahlig),
	(beschaffen(System, Planet, Strategie, Anzahl1GanzZahlig, Komp1, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge1);
	 baueBegruendung(Strategie, Komp1, ListeBisherigerVorgaenge)
	),
	(beschaffen(System, Planet, Strategie, Anzahl2GanzZahlig, Komp2, StoffPfad, ListeVorgaenge1, ListeVorgaenge);
	 baueBegruendung(Strategie, Komp2, ListeBisherigerVorgaenge)
	).

listeBeschaffen(System, Planet, Strategie, AnzahlRaffinaden, Komponenten, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge) :-
	Komponenten = [[Anz1, Komp1], [Anz2, Komp2], [Anz3, Komp3]],
	Anzahl1 is Anz1 * AnzahlRaffinaden,
	Anzahl2 is Anz2 * AnzahlRaffinaden,
	Anzahl3 is Anz3 * AnzahlRaffinaden,
	ceiling(Anzahl1, Anzahl1GanzZahlig),
	ceiling(Anzahl2, Anzahl2GanzZahlig),
	ceiling(Anzahl3, Anzahl3GanzZahlig),
	(beschaffen(System, Planet, Strategie, Anzahl1GanzZahlig, Komp1, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge2);
	 baueBegruendung(Strategie, Komp1, ListeBisherigerVorgaenge)
	),
	(beschaffen(System, Planet, Strategie, Anzahl2GanzZahlig, Komp2, StoffPfad, ListeVorgaenge2, ListeVorgaenge3);
	 baueBegruendung(Strategie, Komp2, ListeBisherigerVorgaenge)
	),
	(beschaffen(System, Planet, Strategie, Anzahl3GanzZahlig, Komp3, StoffPfad, ListeVorgaenge3, ListeVorgaenge);
	 baueBegruendung(Strategie, Komp3, ListeBisherigerVorgaenge)
	).

listeBeschaffen(System, Planet, Strategie, AnzahlRaffinaden, Komponenten, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge) :-
	Komponenten = [[Anz1, Komp1], [Anz2, Komp2], [Anz3, Komp3], [Anz4, Komp4]],
	Anzahl1 is Anz1 * AnzahlRaffinaden,
	Anzahl2 is Anz2 * AnzahlRaffinaden,
	Anzahl3 is Anz3 * AnzahlRaffinaden,
	Anzahl4 is Anz4 * AnzahlRaffinaden,
	ceiling(Anzahl1, Anzahl1GanzZahlig),
	ceiling(Anzahl2, Anzahl2GanzZahlig),
	ceiling(Anzahl3, Anzahl3GanzZahlig),
	ceiling(Anzahl4, Anzahl4GanzZahlig),
	(beschaffen(System, Planet, Strategie, Anzahl1GanzZahlig, Komp1, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge2);
	 baueBegruendung(Strategie, Komp1, ListeBisherigerVorgaenge)
	),
	(beschaffen(System, Planet, Strategie, Anzahl2GanzZahlig, Komp2, StoffPfad, ListeVorgaenge2, ListeVorgaenge3);
	 baueBegruendung(Strategie, Komp2, ListeBisherigerVorgaenge)
	),
	(beschaffen(System, Planet, Strategie, Anzahl3GanzZahlig, Komp3, StoffPfad, ListeVorgaenge3, ListeVorgaenge4);
	 baueBegruendung(Strategie, Komp3, ListeBisherigerVorgaenge)
	),
	(beschaffen(System, Planet, Strategie, Anzahl4GanzZahlig, Komp4, StoffPfad, ListeVorgaenge4, ListeVorgaenge);
	 baueBegruendung(Strategie, Komp4, ListeBisherigerVorgaenge)
	).
	
