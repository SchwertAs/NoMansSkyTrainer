:- module(ausgabe, [ausgabeVorgaenge/1, ausgabeSummen/5]).

ausgabeSammlung(SammelSet) :-
	dict_create(SammelSet0, 'SammelStueckliste', []),
	SammelSet = SammelSet0.
	
ausgabeSammlung(SammelSet) :-
	get_dict(Stoff, SammelSet, Vorgang),
	Vorgang = [Operation, SammelAnzahl],
	format('Bitte sammeln Sie ~k ', SammelAnzahl),
	format('~k ', Stoff),
	format('durch ~k.~n', Operation), 
	del_dict(Stoff, SammelSet, Vorgang, SammelSetDanach),
	ausgabeSammlung(SammelSetDanach),
	!. 
    
ausgabeVorgaenge(Vorgaenge) :-
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
	Kopf = [WandelAnz, [Operation, _], Komponenten, [_, Produkt]],
	sammeln:wandelAktion(Operation),
	format('führe ~k mal ', WandelAnz),
	format('~k ', Operation),
	format('von ~k ', Produkt),
	format('mit den Komponenten '),
	gebeKomponenteAus(Komponenten),
	format('aus~n', [Komponenten]),
	gebeAus(Rest),
	!.		

gebeAus(Vorgaenge) :-
	Vorgaenge = [ _ | Rest], 
	gebeAus(Rest).		 

gebeKomponenteAus(Komponenten) :-
	Komponenten = [].
	
gebeKomponenteAus(Komponenten) :-
	Komponenten = [ Kopf | Rest ],
	Kopf = [_, Stoff],
	format('~k', Stoff),
	(Rest \= [], format(', '); format(' ')),
	gebeKomponenteAus(Rest),
	!.
	
ausgabeSummen(GesamtZahl, GesamtWertSammlung, GesamtZeit, GesamtKosten, GesamtWertEndProdukt) :-
	format('Sammeln Gesamtbedarf: ~k Stück~n', GesamtZahl),
    format('Gesamtwert Sammlung: ~k Units~n', GesamtWertSammlung),
    format('GesamtZeitAufwand: ~k 1/100 sec~n', GesamtZeit),
    format('Kosten Einkauf: ~k Units~n', GesamtKosten),
    format('Gesamtwert Endstoff: ~k Units~n', GesamtWertEndProdukt),
    MehrWert is GesamtWertEndProdukt - GesamtWertSammlung,
    format('Mehrwert: ~k Units~n', MehrWert),
    StundenLohn is round(MehrWert * 360000 / GesamtZeit),
    format('Stundenlohn: ~k Units/Stunde~n', StundenLohn).
