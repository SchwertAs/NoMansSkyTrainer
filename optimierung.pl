:- module(optimierung, [optimierungsStrategie/9]).

optimierungsStrategieLiteral(minimaleSammlung).
optimierungsStrategieLiteral(minimaleZeit).
optimierungsStrategieLiteral(moeglichstLagernd).
optimierungsStrategieLiteral(billig).

optimierungsStrategie(Strategie, Stoff, SammelSet, Vorgaenge, SammelZahl, WertSammlung, BeschaffungsZeit, HandelswertSammlung, Erloes) :-
	Strategie = minimaleSammlung,
	findall(EineZahlSammlung, (suchAlgorithmus:loesung(Stoff, _, _, EineZahlSammlung, _, _, _, _), EineZahlSammlung > 0), GesamtZahlListe),
	min_member(SammelZahl, GesamtZahlListe),
	/* bei gleicher Zahl n�tiger Stoffe, ist Zeit entscheidend */
	findall(EineBeschaffungsZeit, suchAlgorithmus:loesung(Stoff, _, _, SammelZahl, _, EineBeschaffungsZeit, _, _), ZeitSammlungListe),
	min_member(BeschaffungsZeit, ZeitSammlungListe),
	suchAlgorithmus:loesung(Stoff, Vorgaenge, SammelSet, SammelZahl, WertSammlung, BeschaffungsZeit, HandelswertSammlung, Erloes),
	!. /* nach einem ist Schluss */

optimierungsStrategie(Strategie, Stoff, SammelSet, Vorgaenge, SammelZahl, WertSammlung, BeschaffungsZeit, HandelswertSammlung, Erloes) :-
	Strategie = minimaleZeit,
	findall(EineZeitSammlung, suchAlgorithmus:loesung(Stoff, _, _, _, _, EineZeitSammlung, _, _), ZeitSammlungListe),
	min_member(BeschaffungsZeit, ZeitSammlungListe),
	suchAlgorithmus:loesung(Stoff, Vorgaenge, SammelSet, SammelZahl, WertSammlung, BeschaffungsZeit, HandelswertSammlung, Erloes),
	!. /* nach einem ist Schluss */

