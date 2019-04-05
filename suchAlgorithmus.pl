:- module(suchAlgorithmus, [baue/3]).

:- dynamic(loesung/8).

lohn(1). /* Units per 1/100 sec */
	
/* Subprädikate */
baue(Anzahl, Stoff, Wert) :-
	abolish(loesung/8),
	dict_create(SammelSet0, 'SammelStueckliste', []), 
	assertz(loesung(none, [], SammelSet0, 0, 0, 0, 0, 0)),
	beschaffen(Anzahl, Stoff, [], [], Vorgaenge),
	dict_create(SammelSet1, 'SammelStueckliste', []), 
	statistik:bildeSammelSet(Vorgaenge, SammelSet1, SammelSet),
	statistik:bildeGesamtZahl(SammelSet, 0, GesamtZahl), 
	statistik:bildeGesamtWert(SammelSet, 0, GesamtWertSammlung),
	statistik:bildeGesamtHauptZeitAufwand(Vorgaenge, 0, GesamtSammelZeitAufwand),
	reisen:bildeReiseZeiten(Vorgaenge, ReiseZeit),
	statistik:bildeGesamtAufwaende(Vorgaenge, 0, GesamtEinkaufsAufwand),
	GesamtZeitAufwand is GesamtSammelZeitAufwand + ReiseZeit,
	lohn(Lohn),
	GesamtAufwand is GesamtEinkaufsAufwand + GesamtZeitAufwand * Lohn,
	Erloes is Anzahl * Wert,
	assertz(loesung(Stoff, Vorgaenge, SammelSet, GesamtZahl, GesamtWertSammlung, GesamtZeitAufwand, GesamtAufwand, Erloes)),
	fail.

/*----------------------------------------------------------------*/
sammelKosten(Stoff, Kosten) :-
	sammeln:sammelbar(Stoff, _, HauptZeit),
	lohn(Lohn),
	Kosten is HauptZeit * Lohn.

kaufKosten(Stoff, Kosten) :-
	findall(Preis, kaufen:kaufbar(_, Stoff, Preis), PreisListe),
	min_member(Kosten, PreisListe).
	
kaufenOderSammeln(Anzahl, Stoff, Operation, HauptZeit) :-
	kaufKosten(Stoff, Kosten2),
	kaufen:kaufbar(Operation, Stoff, Kosten2),
	kaufen:kaufen(Anzahl, Stoff, Operation, HauptZeit).
	
kaufenOderSammeln(_, Stoff, Operation, HauptZeit) :-
	sammeln:sammelbar(Stoff, Operation, HauptZeit).
	
beschaffen(Anzahl, Stoff, _, BisherigeVorgaenge, ListeVorgaenge) :-
	kaufenOderSammeln(Anzahl, Stoff, Operation, HauptZeit),
	append([[Anzahl, [Operation, HauptZeit], [], [Anzahl, Stoff]]], BisherigeVorgaenge, ListeVorgaenge).

beschaffen(Anzahl, Stoff, StoffPfad, BisherigeVorgaenge, ListeVorgaenge) :-
	\+memberchk(Stoff, StoffPfad),
	length(StoffPfad, Len),
	Len < 3,
	rezept:rezept(Operation, Komponenten, [AnzahlRezeptErgebnis, Stoff], RaffinierZeit),
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
