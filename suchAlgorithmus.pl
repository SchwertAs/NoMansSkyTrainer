:- module(suchAlgorithmus, [baue/2]).

:- dynamic(loesung/8).

/* Subpr�dikate */
baue(Anzahl, Stoff) :-
	abolish(loesung/8),
	dict_create(SammelSet0, 'SammelStueckliste', []),
	assertz(loesung(none, [], SammelSet0, 0, 0, 0, 0, 0)),
	beschaffen(Anzahl, Stoff, [], [], VorgaengeMitVorfertigung),
	expandiereVorgaenge(VorgaengeMitVorfertigung, [], Vorgaenge),
	dict_create(SammelSet1, 'SammelStueckliste', []),
	statistik:bildeSammelSet(Vorgaenge, SammelSet1, SammelSet),
	statistik:bildeGesamtZahl(SammelSet, 0, GesamtZahl),
	statistik:bildeGesamtWert(SammelSet, 0, GesamtWertSammlung),
	statistik:bildeGesamtHauptZeitAufwand(Vorgaenge, 0, GesamtSammelZeitAufwand),
	reisen:bildeReiseZeiten(Vorgaenge, ReiseZeit),
	statistik:bildeGesamtAufwaende(Vorgaenge, 0, GesamtEinkaufsAufwand),
	GesamtZeitAufwand is GesamtSammelZeitAufwand + ReiseZeit,
	GesamtAufwand is GesamtEinkaufsAufwand,
	ausgangsStoff:stoff(Stoff, Wert),
	Erloes is Anzahl * Wert,
	assertz(loesung(Stoff, Vorgaenge, SammelSet, GesamtZahl, GesamtWertSammlung, GesamtZeitAufwand, GesamtAufwand, Erloes)),
	fail.

expandiereVorgaenge(Vorgaenge, VorgaengeExpandiertTmp, VorgaengeExpandiert) :-
	Vorgaenge = [],
	VorgaengeExpandiert = VorgaengeExpandiertTmp.
	
expandiereVorgaenge(Vorgaenge, VorgaengeExpandiertTmp, VorgaengeExpandiert) :-
	Vorgaenge = [Kopf|Rest], 
	Kopf \= [_, [vorfertigen, _], _, [_, _]],
	append(VorgaengeExpandiertTmp, [Kopf], VorgaengeExpandiertDanach),
	expandiereVorgaenge(Rest, VorgaengeExpandiertDanach, VorgaengeExpandiert).

expandiereVorgaenge(Vorgaenge, VorgaengeExpandiertTmp, VorgaengeExpandiert) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [_, [vorfertigen, _], _, [_, Stoff]],
	sammeln:fertigeLoesung(Stoff, VorgaengeDanach, _, _, _, _, _, _),
	expandiereVorgaenge(VorgaengeDanach, VorgaengeExpandiertTmp, VorgaengeExpandiert0),
	expandiereVorgaenge(Rest, VorgaengeExpandiert0, VorgaengeExpandiert).

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

/*----------------------------------------------------------------*/

beschaffen(Anzahl, Stoff, _, BisherigeVorgaenge, ListeVorgaenge) :-
	sammeln:sammelbar(Stoff, Operation, HauptZeit),
	!,
	append([[Anzahl, [Operation, HauptZeit], [], [Anzahl, Stoff]]], BisherigeVorgaenge, ListeVorgaenge).

beschaffen(Anzahl, Stoff, StoffPfad, BisherigeVorgaenge, ListeVorgaenge) :-
	length(StoffPfad, Len),
	Len < 5,
	rezept:rezept(Operation, Komponenten, [AnzahlRezeptErgebnis, Stoff], RaffinierZeit),
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
