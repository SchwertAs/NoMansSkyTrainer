:- module(suchAlgorithmus, [baue/2, baueFuerVorfertigung/2]).

:- dynamic(loesung/8).

baueFuerVorfertigung(Anzahl, Stoff) :-
	abolish(loesung/8),
	dict_create(SammelSet0, 'SammelStueckliste', []),
	assertz(loesung(none, [], SammelSet0, 0, 0, 0, 0, 0)),
	beschaffen(Anzahl, Stoff, [], [], Vorgaenge),
	dict_create(SammelSet1, 'SammelStueckliste', []),
	statistik:bildeSammelSet(Vorgaenge, SammelSet1, SammelSet),
	statistik:bildeGesamtZahl(SammelSet, 0, GesamtZahl),
	statistik:bildeGesamtWert(SammelSet, 0, GesamtWertSammlung),
	statistik:bildeGesamtHauptZeitAufwand(Vorgaenge, 0, GesamtSammelZeitAufwand),
	logistik:logistikOptimierungReisen(Vorgaenge, OptimierteVorgaenge),
	reisen:bildeReiseZeiten(OptimierteVorgaenge, ReiseZeit),
	arbeitsVorbereitung:bildeNebenZeiten(OptimierteVorgaenge, NebenZeit),
	statistik:bildeGesamtAufwaende(Vorgaenge, 0, GesamtEinkaufsAufwand),
	GesamtZeitAufwand is GesamtSammelZeitAufwand + NebenZeit + ReiseZeit, 
	GesamtAufwand is GesamtEinkaufsAufwand,
	stoff:stoff(_, Stoff, Wert),
	Erloes is Anzahl * Wert,
	assertz(loesung(Stoff, Vorgaenge, SammelSet, GesamtZahl, GesamtWertSammlung, GesamtZeitAufwand, GesamtAufwand, Erloes)),
	fail.

/* Subprädikate */
baue(Anzahl, Stoff) :-
	abolish(loesung/8),
	dict_create(SammelSet0, 'SammelStueckliste', []),
	assertz(loesung(none, [], SammelSet0, 0, 0, 0, 0, 0)),
	beschaffen(Anzahl, Stoff, [], [], Vorgaenge),
	dict_create(SammelSet1, 'SammelStueckliste', []),
	statistik:bildeSammelSet(Vorgaenge, SammelSet1, SammelSet),
	statistik:bildeGesamtZahl(SammelSet, 0, GesamtZahl),
	statistik:bildeGesamtWert(SammelSet, 0, GesamtWertSammlung),
	statistik:bildeGesamtHauptZeitAufwand(Vorgaenge, 0, GesamtSammelZeitAufwand),
	logistik:logistikOptimierungReisen(Vorgaenge, OptimierteVorgaenge),
	reisen:bildeReiseZeiten(OptimierteVorgaenge, ReiseZeit),
	arbeitsVorbereitung:bildeNebenZeiten(OptimierteVorgaenge, NebenZeit),
	statistik:bildeGesamtAufwaende(OptimierteVorgaenge, 0, GesamtEinkaufsAufwand),
	GesamtZeitAufwand is GesamtSammelZeitAufwand + NebenZeit + ReiseZeit, 
	GesamtAufwand is GesamtEinkaufsAufwand,
	stoff:stoff(_, Stoff, Wert),
	Erloes is Anzahl * Wert,
	reisen:fuegeReiseOperationenEin(OptimierteVorgaenge, ortSpieler, [], ErgaenzteVorgaenge),
	assertz(loesung(Stoff, ErgaenzteVorgaenge, SammelSet, GesamtZahl, GesamtWertSammlung, GesamtZeitAufwand, GesamtAufwand, Erloes)),
	fail.

expandiereVorgaenge(Vorgaenge, VorgaengeExpandiertTmp, VorgaengeExpandiert) :-
	Vorgaenge = [],
	VorgaengeExpandiert = VorgaengeExpandiertTmp,
	!.
	
expandiereVorgaenge(Vorgaenge, VorgaengeExpandiertTmp, VorgaengeExpandiert) :-
	Vorgaenge = [Kopf|Rest], 
	Kopf \= [_, [vorfertigen, _], _, [_, _]],
	append(VorgaengeExpandiertTmp, [Kopf], VorgaengeExpandiertDanach),
	expandiereVorgaenge(Rest, VorgaengeExpandiertDanach, VorgaengeExpandiert),
	!.

expandiereVorgaenge(Vorgaenge, VorgaengeExpandiertTmp, VorgaengeExpandiert) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [Anzahl, [vorfertigen, _], _, [_, Stoff]],
	sammlung:fertigeLoesung(Stoff, VorgaengeDanach0),
	multipliziereVorgangsWerte(VorgaengeDanach0, Anzahl, [], VorgaengeDanach1), 
	expandiereVorgaenge(VorgaengeDanach1, VorgaengeExpandiertTmp, VorgaengeExpandiert0),
	expandiereVorgaenge(Rest, VorgaengeExpandiert0, VorgaengeExpandiert),
	!.

multipliziereVorgangsWerte(Vorgaenge, _, VorgaengeMultipliziertBisher, VorgaengeMultipliziert) :-
	Vorgaenge = [],
	VorgaengeMultipliziertBisher = VorgaengeMultipliziert,
	!.

multipliziereVorgangsWerte(Vorgaenge, Faktor, VorgaengeMultipliziertBisher, VorgaengeMultipliziert) :-
	Vorgaenge = [Vorgang|RestVorgaenge],
	Vorgang = [AnzahlVorgang, Operation, Komponenten, [AnzahlProdukteVorgang, Stoff]],
	AnzahlVorgangMultipliziert is AnzahlVorgang * Faktor,
	AnzahlProdukteVorgangMultipliziert is AnzahlProdukteVorgang * Faktor,
	VorgangMultipliziert = [AnzahlVorgangMultipliziert, Operation, Komponenten, [AnzahlProdukteVorgangMultipliziert, Stoff]],
	append(VorgaengeMultipliziertBisher, [VorgangMultipliziert], VorgaengeMultipliziertBisher1),
	multipliziereVorgangsWerte(RestVorgaenge, Faktor, VorgaengeMultipliziertBisher1, VorgaengeMultipliziert).   

keinZirkel(Komponenten, StoffPfad, Stoff) :-
	Komponenten = [[_, Stoff1]],
	\+memberchk(Stoff1, StoffPfad),
	\+Stoff = Stoff1.

keinZirkel(Komponenten, StoffPfad, Stoff) :-
	Komponenten = [[_, Stoff1], [_, Stoff2]],
	\+memberchk(Stoff1, StoffPfad),
	\+memberchk(Stoff2, StoffPfad),
	\+Stoff = Stoff1,
	\+Stoff = Stoff2.

keinZirkel(Komponenten, StoffPfad, Stoff) :-
	Komponenten = [[_, Stoff1], [_, Stoff2], [_, Stoff3]],
	\+memberchk(Stoff1, StoffPfad),
	\+memberchk(Stoff2, StoffPfad),
	\+memberchk(Stoff3, StoffPfad),
	\+Stoff = Stoff1,
	\+Stoff = Stoff2,
	\+Stoff = Stoff3.

keinZirkel(Komponenten, StoffPfad, Stoff) :-
	Komponenten = [[_, Stoff1], [_, Stoff2], [_, Stoff3], [_, Stoff4]],
	\+memberchk(Stoff1, StoffPfad),
	\+memberchk(Stoff2, StoffPfad),
	\+memberchk(Stoff3, StoffPfad),
	\+memberchk(Stoff4, StoffPfad),
	\+Stoff = Stoff1,
	\+Stoff = Stoff2,
	\+Stoff = Stoff3,
	\+Stoff = Stoff4.

rezeptZulaessig(Operation, _) :-
	Operation \= raffinieren,
	!.
	
rezeptZulaessig(_, Komponenten) :-
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	(spielStatus:systemAusstattung([System, Planet, ortKleineRaffinerie], _); 
	 spielStatus:systemAusstattung([System, Planet, ortMittlereRaffinerie], _);
	 spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], _)
	),
	Komponenten = [[_, _]],
	!.
	
rezeptZulaessig(_, Komponenten) :-
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	(spielStatus:systemAusstattung([System, Planet, ortMittlereRaffinerie], _);
	 spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], _)
	),
	Komponenten = [[_, _], [_, _]],
	!.

rezeptZulaessig(_, Komponenten) :-
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], _),
	Komponenten = [[_, _], [_, _], [_, _]],
	!.

/*---------------------------------------------------------------*/

beschaffen(Anzahl, Stoff, _, BisherigeVorgaenge, Vorgaenge) :-
	sammlung:sammelbar(Stoff, Operation, HauptZeit),
	!,
	append([[Anzahl, [Operation, HauptZeit], [], [Anzahl, Stoff]]], BisherigeVorgaenge, VorgaengeMitVorfertigung),
	expandiereVorgaenge(VorgaengeMitVorfertigung, [], Vorgaenge). 

beschaffen(Anzahl, Stoff, StoffPfad, BisherigeVorgaenge, ListeVorgaenge) :-
	length(StoffPfad, Len),
	Len < 5,
	rezept:rezept(Operation, Komponenten, [AnzahlRezeptErgebnis, Stoff], RaffinierZeit),
	rezeptZulaessig(Operation, Komponenten),
	keinZirkel(Komponenten, StoffPfad, Stoff),
	divmod(Anzahl, AnzahlRezeptErgebnis, AnzahlDivision, Rest),
	(Rest > 0, AnzahlRaffinaden is AnzahlDivision + 1; Rest = 0, AnzahlRaffinaden is AnzahlDivision),
	AnzahlRaffiniert is AnzahlRaffinaden * AnzahlRezeptErgebnis,
	append([[AnzahlRaffinaden, [Operation, RaffinierZeit], Komponenten, [AnzahlRaffiniert, Stoff]]], BisherigeVorgaenge, ListeVorgaenge0),
	append([Stoff], StoffPfad, StoffPfadDanach),
	listeBeschaffen(AnzahlRaffinaden, Komponenten, StoffPfadDanach, ListeVorgaenge0, ListeVorgaenge).


listeBeschaffen(AnzahlRaffinaden, Komponenten, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge) :-
	Komponenten = [[Anz1, Komp1]],
	Anzahl1 is Anz1 * AnzahlRaffinaden,
	beschaffen(Anzahl1, Komp1, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge).

listeBeschaffen(AnzahlRaffinaden, Komponenten, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge) :-
	Komponenten = [[Anz1, Komp1], [Anz2, Komp2]],
	Anzahl1 is Anz1 * AnzahlRaffinaden,
	Anzahl2 is Anz2 * AnzahlRaffinaden,
	beschaffen(Anzahl1, Komp1, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge1),
	beschaffen(Anzahl2, Komp2, StoffPfad, ListeVorgaenge1, ListeVorgaenge).

listeBeschaffen(AnzahlRaffinaden, Komponenten, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge) :-
	Komponenten = [[Anz1, Komp1], [Anz2, Komp2], [Anz3, Komp3]],
	Anzahl1 is Anz1 * AnzahlRaffinaden,
	Anzahl2 is Anz2 * AnzahlRaffinaden,
	Anzahl3 is Anz3 * AnzahlRaffinaden,
	beschaffen(Anzahl1, Komp1, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge2),
	beschaffen(Anzahl2, Komp2, StoffPfad, ListeVorgaenge2, ListeVorgaenge3),
	beschaffen(Anzahl3, Komp3, StoffPfad, ListeVorgaenge3, ListeVorgaenge).

listeBeschaffen(AnzahlRaffinaden, Komponenten, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge) :-
	Komponenten = [[Anz1, Komp1], [Anz2, Komp2], [Anz3, Komp3], [Anz4, Komp4]],
	Anzahl1 is Anz1 * AnzahlRaffinaden,
	Anzahl2 is Anz2 * AnzahlRaffinaden,
	Anzahl3 is Anz3 * AnzahlRaffinaden,
	Anzahl4 is Anz4 * AnzahlRaffinaden,
	beschaffen(Anzahl1, Komp1, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge2),
	beschaffen(Anzahl2, Komp2, StoffPfad, ListeVorgaenge2, ListeVorgaenge3),
	beschaffen(Anzahl3, Komp3, StoffPfad, ListeVorgaenge3, ListeVorgaenge4),
	beschaffen(Anzahl4, Komp4, StoffPfad, ListeVorgaenge4, ListeVorgaenge).
	