:- module(main, [minimaleSammlungLoesung/2]).

:-	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/ausgangsStoff').
:-	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/spielStatus').
:-	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/sammeln').
:-	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/rezept').
:-	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/kaufen').
:-	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/reisen').
:-	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/logistik').
:-	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/arbeitsVorbereitung').
:-	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/statistik').
:-	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/suchAlgorithmus').
:-	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/ausgabe').
:-	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/server').
:-	sammeln:sammelbarInit.

produktMit(Stoff, Komponenten, Anzahl, Produkt, Wert) :-
	rezept:rezept(_, Komponenten, [Anzahl, Produkt], _),
	ausgangsStoff:stoff(Produkt, EinzelWert), 
	Wert is EinzelWert * Anzahl,
	memberchk([_, Stoff], Komponenten).



/* Declarationen */
/* :- dynamic stoffBestLoesung/2.
 
 Benutzerprädikate   



raffinierRezepteFuer(Stoff, Komponenten, Anzahl) :-
	rezept:rezept(raffinieren, Komponenten, [Anzahl, Stoff], _).

schnellsteLoesung(Anzahl, Stoff) :-
	\+suchAlgorithmus:baue(Anzahl, Stoff),
	findall(ZeitSammlung, suchAlgorithmus:loesung(Stoff, _, _, _, _, ZeitSammlung, _, _), ZeitSammlungListe),
	min_member(MinimalZeit, ZeitSammlungListe),
	suchAlgorithmus:loesung(Stoff, Vorgaenge, SammelSet, GesamtZahl, GesamtWertSammlung, MinimalZeit, GesamtKosten, Erloes),
	!,
	ausgabe:ausgabe(Vorgaenge),
	ausgabe:ausgabeSummen(SammelSet, GesamtZahl, GesamtWertSammlung, MinimalZeit, GesamtKosten, Erloes).

billigsteLoesung(Anzahl, Stoff) :-
	\+suchAlgorithmus:baue(Anzahl, Stoff),
	findall(GesamtAufwand, suchAlgorithmus:loesung(Stoff, _, _, _, _, _, GesamtAufwand, _), GesamtAufwandListe),
	min_member(MinimalKosten, GesamtAufwandListe),
	suchAlgorithmus:loesung(Stoff, Vorgaenge, SammelSet, GesamtZahl, GesamtWertSammlung, GesamtZeitSammlung, MinimalKosten, Erloes),
	!,
	ausgabe:ausgabe(Vorgaenge),
	ausgabe:ausgabeSummen(SammelSet, GesamtZahl, GesamtWertSammlung, GesamtZeitSammlung, MinimalKosten, Erloes).
*/

minimaleSammlungLoesung(Anzahl, Stoff) :- 
	\+suchAlgorithmus:baue(Anzahl, Stoff),
	findall(GesamtZahlSammlung, (suchAlgorithmus:loesung(Stoff, _, _, GesamtZahlSammlung, _, _, _, _), GesamtZahlSammlung > 0), GesamtZahlListe),
	min_member(MinimalSammelZahl, GesamtZahlListe),
	findall(ZeitSammlung, suchAlgorithmus:loesung(Stoff, _, _, MinimalSammelZahl, _, ZeitSammlung, _, _), ZeitSammlungListe),
	min_member(MinimalZeit, ZeitSammlungListe),
	suchAlgorithmus:loesung(Stoff, Vorgaenge, SammelSet, MinimalSammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes),
	!,
	ausgabe:printMinSammlungForm(SammelSet, Vorgaenge, MinimalSammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes).

startServer :-
	server:server(8000).

testMinimaleSammlung :-
	ausgangsStoff:stoff(Stoff, _),
	minimaleSammlungLoesung(1, Stoff),
	fail.

testStoffNichtSammelbar(Stoff) :-
 	stoff(Stoff, _),
	\+sammeln:sammelbar(Stoff, _, _).
	
testRezepte(FehlOperation, FehlOpProdukt, 
			FehlKomponente,
			FehlProdukt,
			FertigungsZeitFehlStoff, FertigungsZeitFehlKomponenten) :-
	\+rezept:fehlerOperation(FehlOperation, FehlOpProdukt),
	format('Operationen ok~n'),
	\+rezept:komponenteIstKeinStoff(FehlKomponente),
	format('Komponenten ok~n'),
	\+rezept:produktIstKeinStoff(FehlProdukt),
	format('Produkte ok~n'),
	\+rezept:raffinerieRezeptHatKeineFertigungsZeit(FertigungsZeitFehlStoff,FertigungsZeitFehlKomponenten),
	format('Fertigungszeiten ok~n').
	
testStoff :-
	format('Eingangsstoffe testen '),
	\+ausgangsStoff:fehlerInputStoffNichtDefiniert(_),
	format('ok~n'),
	format('Ausgangsstoffe testen '),
	\+ausgangsStoff:fehlerOutputStoffNichtDefiniert(_),
	format('ok~n'),
	format('Wertangaben testen '),
	\+ausgangsStoff:produktNichtBewertet(_),
	format('ok~n'),
	format('Doppelte testen '),
	\+ausgangsStoff:doppelteInStoff,
	format('ok~n'),
	format('Verwendung testen~n'),
	\+ausgangsStoff:stoffNichtVerwendet(_),
	format('ok~n').
	