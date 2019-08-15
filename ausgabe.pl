:- module(ausgabe, [ausgabe/1, ausgabeSummen/5]).

ausgabe(Vorgaenge) :-
	include(isRaffinieren, Vorgaenge, Raffinaden),
	group(Raffinaden, [], Gruppiert),
	!,
	exclude(isRaffinieren, Vorgaenge, NichtRaffinaden),
	append(Gruppiert, NichtRaffinaden, VorgaengeDanach),
	gebeAus(VorgaengeDanach).

isRaffinieren(Vorgang) :-
	Vorgang = [_, [raffinieren, _], _, [_, _]].

group(Vorgaenge, BisherGruppiert, Gruppiert) :-
	Vorgaenge = [],
	BisherGruppiert = Gruppiert.
	
group(Vorgaenge, BisherGruppiert, Gruppiert) :-
	/* Listen aufspalten in AnzahlenListe und StoffListe */
	length(Vorgaenge, Len),
	Len > 1,
	Vorgaenge = [SuchVorgang | _],
	between(2, Len, VergleichsVorgangNo),
	nth1(VergleichsVorgangNo, Vorgaenge, VergleichsVorgang),
	extrahiereKomponenten(SuchVorgang, SuchStoffListe),
	extrahiereKomponenten(VergleichsVorgang, VergleichsStoffListe),
	SuchStoffListe = VergleichsStoffListe,
	addiereVorgangsWerte(SuchVorgang, VergleichsVorgang, SummenVorgang),
	selectchk(SuchVorgang, Vorgaenge, VorgaengeDanach0),
	selectchk(VergleichsVorgang, VorgaengeDanach0, VorgaengeDanach1),
	append([SummenVorgang], VorgaengeDanach1, VorgaengeDanach),
	group(VorgaengeDanach, BisherGruppiert, Gruppiert).

group(Vorgaenge, BisherGruppiert, Gruppiert) :-
	Vorgaenge = [SuchVorgang | _],
	selectchk(SuchVorgang, Vorgaenge, VorgaengeDanach),
	append(BisherGruppiert, [SuchVorgang], BisherGruppiertDanach),
	group(VorgaengeDanach, BisherGruppiertDanach, Gruppiert).
	
extrahiereKomponenten(EinVorgang, KomponentenStoffListe) :-
	EinVorgang = [_, [raffinieren, _], Komponenten, [_, _]],
	maplist(nth1(2), Komponenten, KomponentenStoffListe).

addiereVorgangsWerte(SuchVorgang, VergleichsVorgang, SummenVorgang) :-
	SuchVorgang = [Anzahl1,[raffinieren, RaffinierZeit1], Komponenten, [ProduktZahl1, Produkt]],
	VergleichsVorgang = [Anzahl2,[raffinieren, RaffinierZeit2], Komponenten, [ProduktZahl2,_]],
	SummenAnzahl is Anzahl1 + Anzahl2,
	SummenRaffinierZeit is RaffinierZeit1 + RaffinierZeit2,
	SummenProduktZahl is ProduktZahl1 + ProduktZahl2,
	SummenVorgang = [SummenAnzahl,[raffinieren, SummenRaffinierZeit], Komponenten, [SummenProduktZahl, Produkt]].
	
gebeAus(Vorgaenge) :-
	Vorgaenge = [].
	
gebeAus(Vorgaenge) :-
	Vorgaenge = [ Kopf | Rest], 
	Kopf = [_, [Operation, _], _, [_, _]],
	(Operation = raffinieren; Operation = herstellen; Operation = bauen),
	format('~k~n', [Kopf]),
	gebeAus(Rest),
	!.		

gebeAus(Vorgaenge) :-
	Vorgaenge = [ _ | Rest], 
	gebeAus(Rest).		

ausgabeSammlung(SammelSet) :-
	format('~n', []),
	format('~k~n', SammelSet).
    
ausgabeSummen(GesamtZahl, GesamtWertSammlung, GesamtZeit, GesamtKosten, GesamtWertEndProdukt) :-
	format('Sammeln Gesamtbedarf: ~k Stück~n', GesamtZahl),
    format('Gesamtwert Sammlung: ~k Units~n', GesamtWertSammlung),
    format('GesamtZeitAufwand: ~k 1/100 sec~n', GesamtZeit),
    format('Kosten: ~k Units~n', GesamtKosten),
    format('Gesamtwert Endstoff: ~k Units~n', GesamtWertEndProdukt),
    MehrWert is GesamtWertEndProdukt - GesamtWertSammlung,
    format('Mehrwert: ~k Units~n', MehrWert).
