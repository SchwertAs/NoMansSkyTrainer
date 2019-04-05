:- module(main, [produktMit/5, schnellsteLoesung/2, billigsteLoesung/2, minimaleSammlungLoesung/2, bestesRezept/1]).
/* Declarationen */

/* Benutzerprädikate */
produktMit(Stoff, Komponenten, Anzahl, Produkt, Wert) :-
	rezept:rezept(_, Komponenten, [Anzahl, Produkt], _),
	stoff(Produkt, EinzelWert),
	Wert is EinzelWert * Anzahl,
	memberchk([_, Stoff], Komponenten).

raffinierRezepteFuer(Stoff, Komponenten, Anzahl) :-
	rezept:rezept(raffinieren, Komponenten, [Anzahl, Stoff], _).
	
schnellsteLoesung(Anzahl, Stoff) :- 
	ausgangsStoff:stoff(Stoff, Wert),
	\+suchAlgorithmus:baue(Anzahl, Stoff, Wert),
	findall(ZeitSammlung, suchAlgorithmus:loesung(Stoff, _, _, _, _, ZeitSammlung, _, _), ZeitSammlungListe),
	min_member(MinimalZeit, ZeitSammlungListe),
	suchAlgorithmus:loesung(Stoff, Vorgaenge, SammelSet, GesamtZahl, GesamtWertSammlung, MinimalZeit, GesamtKosten, Erloes),
	!,
	ausgabe:ausgabe(Vorgaenge),
	ausgabe:ausgabeSummen(SammelSet, GesamtZahl, GesamtWertSammlung, MinimalZeit, GesamtKosten, Erloes).

billigsteLoesung(Anzahl, Stoff) :- 
	ausgangsStoff:stoff(Stoff, Wert),
	\+suchAlgorithmus:baue(Anzahl, Stoff, Wert),
	findall(GesamtAufwand, suchAlgorithmus:loesung(Stoff, _, _, _, _, _, GesamtAufwand, _), GesamtAufwandListe),
	min_member(MinimalKosten, GesamtAufwandListe),
	suchAlgorithmus:loesung(Stoff, Vorgaenge, SammelSet, GesamtZahl, GesamtWertSammlung, GesamtZeitSammlung, MinimalKosten, Erloes),
	!,
	ausgabe:ausgabe(Vorgaenge),
	ausgabe:ausgabeSummen(SammelSet, GesamtZahl, GesamtWertSammlung, GesamtZeitSammlung, MinimalKosten, Erloes).
	
minimaleSammlungLoesung(Anzahl, Stoff) :-
	ausgangsStoff:stoff(Stoff, Wert),
	\+suchAlgorithmus:baue(Anzahl, Stoff, Wert),
	findall(GesamtZahlSammlung, (suchAlgorithmus:loesung(Stoff, _, _, GesamtZahlSammlung, _, _, _, _), GesamtZahlSammlung > 0), GesamtZahlListe),
	min_member(MinimalSammelZahl, GesamtZahlListe),
	suchAlgorithmus:loesung(Stoff, Vorgaenge, SammelSet, MinimalSammelZahl, GesamtWertSammlung, GesamtZeitSammlung, HandelswertSammlung, Erloes),
	ausgabe:ausgabe(Vorgaenge),
	ausgabe:ausgabeSummen(SammelSet, MinimalSammelZahl, GesamtWertSammlung, GesamtZeitSammlung, HandelswertSammlung, Erloes).
	
	
bestesRezept(Stoff) :-
	abolish(stoffBestLoesung/2),
	\+bestesRezeptSub(Stoff),
	findall(Gewinn, stoffBestLoesung(_, Gewinn), MaximalGewinnListe),
	max_member(SpitzenGewinn, MaximalGewinnListe),
	stoffBestLoesung(Stoff, SpitzenGewinn),
	!,
	format('Bester Stoff: ~k', Stoff),
	format(' Gewinn: ~k~n', SpitzenGewinn).

bestesRezeptSub(Stoff) :-
	ausgangsStoff:reaktionsStoff(Stoff, _),
	bestesRezept(1, Stoff, MaximalGewinn),
	assertz(stoffBestLoesung(Stoff, MaximalGewinn)),
	fail.
	
bestesRezept(Anzahl, Stoff, MaximalErloesProSammelItem) :-
	ausgangsStoff:reaktionsStoff(Stoff, Wert),
	\+suchAlgorithmus:baue(Anzahl, Stoff, Wert),
	findall(ErloesProItem, 
	        (	suchAlgorithmus:loesung(Stoff, _, _, GesamtZahl, _, _, _, Erloes),
	            GesamtZahl > 0,
		        ErloesProItem is Erloes / GesamtZahl
	        ), GewinnListe),
	max_member(MaximalErloesProSammelItem, GewinnListe).
	
			
load :-
	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyMaterialBeschaffung/ausgabe'),
	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyMaterialBeschaffung/ausgangsStoff'),
	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyMaterialBeschaffung/rezept'),
	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyMaterialBeschaffung/sammeln'),
	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyMaterialBeschaffung/kaufen'),
	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyMaterialBeschaffung/reisen'),
	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyMaterialBeschaffung/statistik'),
	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyMaterialBeschaffung/suchAlgorithmus').
