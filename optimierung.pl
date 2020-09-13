:- module(optimierung, [optimierungsStrategie/9, optimierungsZiel/1]).

optimierungsZiel(minimaleSammlung).
optimierungsZiel(minimaleZeit).
/* optimierungsZiel(moeglichstLagernd). */
optimierungsZiel(minimaleKosten).

optimierungsStrategie(minimaleSammlung, Stoff, SammelSet, Vorgaenge, SammelZahl, WertSammlung, BeschaffungsZeit, EinkaufsKosten, Erloes) :-
	findall(EineZahlSammlung, (suchAlgorithmus:loesung(Stoff, _, _, EineZahlSammlung, _, _, _, _), EineZahlSammlung > 0), GesamtZahlListe),
	min_member(SammelZahl, GesamtZahlListe),
	/* bei gleicher Zahl nötiger Stoffe, ist Zeit entscheidend */
	findall(EineBeschaffungsZeit, suchAlgorithmus:loesung(Stoff, _, _, SammelZahl, _, EineBeschaffungsZeit, _, _), ZeitSammlungListe),
	min_member(BeschaffungsZeit, ZeitSammlungListe),
	suchAlgorithmus:loesung(Stoff, Vorgaenge, SammelSet, SammelZahl, WertSammlung, BeschaffungsZeit, EinkaufsKosten, Erloes),
	!. /* nach einem ist Schluss */

optimierungsStrategie(minimaleZeit, Stoff, SammelSet, Vorgaenge, SammelZahl, WertSammlung, BeschaffungsZeit, EinkaufsKosten, Erloes) :-
	findall(EineZeitSammlung, suchAlgorithmus:loesung(Stoff, _, _, _, _, EineZeitSammlung, _, _), ZeitSammlungListe),
	min_member(BeschaffungsZeit, ZeitSammlungListe),
	suchAlgorithmus:loesung(Stoff, Vorgaenge, SammelSet, SammelZahl, WertSammlung, BeschaffungsZeit, EinkaufsKosten, Erloes),
	!. /* nach einem ist Schluss */

optimierungsStrategie(minimaleKosten, Stoff, SammelSet, Vorgaenge, SammelZahl, WertSammlung, BeschaffungsZeit, EinkaufsKosten, Erloes) :-
	findall(EinPreis, suchAlgorithmus:loesung(Stoff, _, _, _, _, _, EinPreis, _), PreisListe),
	min_member(EinkaufsKosten, PreisListe),
	suchAlgorithmus:loesung(Stoff, Vorgaenge, SammelSet, SammelZahl, WertSammlung, BeschaffungsZeit, EinkaufsKosten, Erloes),
	!. /* nach einem ist Schluss */

