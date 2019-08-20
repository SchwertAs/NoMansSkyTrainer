:- module(ausgabe, [ausgabeVorgaenge/1, ausgabeSummen/5]).

ausgabeSammlung(SammelSet) :-
	dict_create(SammelSet0, 'SammelStueckliste', []),
	SammelSet = SammelSet0.
	
ausgabeSammlung(SammelSet) :-
	get_dict(Stoff, SammelSet, Vorgang),
	Vorgang = [Operation, SammelAnzahl],
	format('<tr>~n'),
	format('<td>Bitte sammeln Sie&nbsp;</td>~n', []),
	format('<td>~k&nbsp;</td>~n', SammelAnzahl),
	format('<td>~k&nbsp;</td>~n', Stoff),
	format('<td>durch&nbsp;</td>~n', []), 
	format('<td>~k&nbsp;</td>~n', Operation), 
	format('</tr>~n'),
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
	format('<tr>~n'),
	format('<td>Führe~n&nbsp;</td>', []),
	format('<td>~k~n&nbsp;</td>', WandelAnz),
	format('<td>mal~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>', Operation),
	format('<td>von~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>', Produkt),
	format('<td>mit den Komponenten~n&nbsp;</td>'),
	format('<td>',[]),
	gebeKomponenteAus(Komponenten),
	format('~n&nbsp;</td>',[]),
	format('<td>aus.~n&nbsp;</td>', [Komponenten]),
	format('</tr>~n'),
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
	
	format('<tr>~n<td>Sammeln Gesamtbedarf~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>', GesamtZahl),
	format('<td>Stück~n&nbsp;</td>~n</tr>'),
    format('<tr>~n<td>Gesamtwert Sammlung~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>', GesamtWertSammlung),
	format('<td>Units~n&nbsp;</td>~n</tr>'),
    format('<tr>~n<td>GesamtZeitAufwand~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>', GesamtZeit),
	format('<td>1/100 sec~n&nbsp;</td>~n</tr>'),
    format('<tr>~n<td>Kosten Einkauf~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>', GesamtKosten),
	format('<td>Units~n&nbsp;</td>~n</tr>'),
    format('<tr>~n<td>Gesamtwert Endstoff~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>', GesamtWertEndProdukt),
	format('<td>Units~n&nbsp;</td>~n</tr>'),
    MehrWert is GesamtWertEndProdukt - GesamtWertSammlung,
    format('<tr>~n<td>Mehrwert~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>', MehrWert),
	format('<td>Units~n&nbsp;</td>~n</tr>'),
    StundenLohn is round(MehrWert * 360000 / GesamtZeit),
    format('<tr>~n<td>Stundenlohn~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>', StundenLohn),
	format('<td>Units/Stunde~n&nbsp;</td>~n</tr>').
