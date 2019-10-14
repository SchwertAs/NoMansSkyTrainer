:- module(ausgabe, [ausgabeSammlung/3, ausgabeVorgaenge/3, ausgabeSummen/6, baueBegruendung/2, zeitFeldToNumber/2]).

baueStoffListeFuerStoffKlassen(StoffKlassen, Stoffe) :-
	findall(St, (select(Sk, StoffKlassen, _), stoff:stoff(Sk, St, _)), Stoffe).
	
ausgabeSammlung(SammelSet, SammelList, SammelListDanach) :-
	dict_create(SammelSet0, 'SammelStueckliste', []),
	SammelSet = SammelSet0,
	SammelListDanach = SammelList.
	
ausgabeSammlung(SammelSet, SammelList, SammelListDanach) :-
	get_dict(Stoff, SammelSet, Vorgang),
	Vorgang = [Operation, _],
	Operation = bekannt,
	atom_string(Stoff, StoffString),
	append(SammelList, [sam('1', StoffString)], SammelList0),
	del_dict(Stoff, SammelSet, Vorgang, SammelSetDanach),
	ausgabeSammlung(SammelSetDanach, SammelList0, SammelListDanach),
	!. 

ausgabeSammlung(SammelSet, SammelList, SammelListDanach) :-
	get_dict(Stoff, SammelSet, Vorgang),
	Vorgang = [Operation, SammelAnzahl],
	Operation \= bekannt,
	number_string(SammelAnzahl, SammelAnzahlString),
	atom_string(Stoff, StoffString),
	append(SammelList, [sam(SammelAnzahlString, StoffString)], SammelList0),
	del_dict(Stoff, SammelSet, Vorgang, SammelSetDanach),
	ausgabeSammlung(SammelSetDanach, SammelList0, SammelListDanach),
	!. 

ausgabeVorgaenge(Vorgaenge, VorgaengePred, VorgaengePredDanach) :-
	Vorgaenge = [],
	VorgaengePred = VorgaengePredDanach,
	!.
	
ausgabeVorgaenge(Vorgaenge, VorgaengePred, VorgaengePredDanach) :-
	Vorgaenge = [ Kopf | Rest], 
	Kopf = [WandelAnz, Operation, Komponenten, [ProduktAnzahl, Produkt]],
	wandelAktion:wandelAktion(Operation, _),
	
	gebeKomponenteAus(Komponenten, '', KompPred),
	atom_string(WandelAnz, WandelAnzString),
	atom_string(Operation, OperationString),
	atom_string(Produkt, ProduktString),

 	string_concat('Führen Sie ', WandelAnzString, Anweisung0),
 	string_concat(Anweisung0, ' mal ', Anweisung1),
 	string_concat(Anweisung1, OperationString, Anweisung2),
 	string_concat(Anweisung2, ' von ', Anweisung3),
 	string_concat(Anweisung3, ProduktString, Anweisung4),
 	string_concat(Anweisung4, ' unter Verwendung von ', Anweisung5),
 	string_concat(Anweisung5, KompPred, Anweisung6),
 	string_concat(Anweisung6, ' aus', Anweisung),

    bildeErgebnis(ProduktAnzahl, Produkt, Ergebnis),
	append(VorgaengePred, [vorg(Anweisung, Operation, Ergebnis)], VorgaengePred0),
	ausgabeVorgaenge(Rest, VorgaengePred0, VorgaengePredDanach),
	!.		

ausgabeVorgaenge(Vorgaenge, VorgaengePred, VorgaengePredDanach) :-
	Vorgaenge = [ Kopf | Rest], 
	Kopf = [_, Operation, _, [_, Produkt]],
	Operation = bekannt,
	atom_string(Produkt, ProduktString),
	string_concat('Das ', ProduktString, Anweisung0),
	string_concat(Anweisung0, ' ist bekannt.', Anweisung),
	append(VorgaengePred, [vorg(Anweisung, Operation, '')], VorgaengePred0),
	ausgabeVorgaenge(Rest, VorgaengePred0, VorgaengePredDanach),
	!.		

ausgabeVorgaenge(Vorgaenge, VorgaengePred, VorgaengePredDanach) :-
	Vorgaenge = [ Kopf | Rest], 
	Kopf = [WandelAnz, Operation, _, [_, Produkt]],
	sammelAktion:sammelAktion(Operation),
	atom_string(WandelAnz, WandelAnzString),
	atom_string(Operation, OperationString),
	atom_string(Produkt, ProduktString),

 	string_concat('Erlangen Sie ', WandelAnzString, Anweisung0),
 	string_concat(Anweisung0, ' Einheiten ', Anweisung1),
 	string_concat(Anweisung1, ProduktString, Anweisung2),
 	string_concat(Anweisung2, ' mit ', Anweisung3),
 	string_concat(Anweisung3, OperationString, Anweisung),
 	bildeErgebnis(WandelAnz, Produkt, Ergebnis),
 	append(VorgaengePred, [vorg(Anweisung, Operation, Ergebnis)], VorgaengePred0),
	ausgabeVorgaenge(Rest, VorgaengePred0, VorgaengePredDanach),
	!.		

ausgabeVorgaenge(Vorgaenge, VorgaengePred, VorgaengePredDanach) :-
	Vorgaenge = [ Kopf | Rest], 
	Kopf = [_, Operation, [[_, _], [_, Nach]], [_, Produkt]],
	Operation = reisen,
	atom_string(Nach, NachString),
	atom_string(Produkt, ProduktString),

 	string_concat('Bitte reisen Sie nach ', NachString, Anweisung),
 	
 	string_concat('in ', NachString, Ergebnis0),
 	string_concat(Ergebnis0, ' ', Ergebnis1),
 	string_concat(Ergebnis1, ProduktString, Ergebnis),

 	append(VorgaengePred, [vorg(Anweisung, Operation, Ergebnis)], VorgaengePred0),
	ausgabeVorgaenge(Rest, VorgaengePred0, VorgaengePredDanach),
	!.		

ausgabeVorgaenge(Vorgaenge, VorgaengePred, VorgaengePredDanach) :-
	Vorgaenge = [ _ | Rest], 
	ausgabeVorgaenge(Rest, VorgaengePred, VorgaengePredDanach),
	!.		 

bildeErgebnis(ProduktAnzahl, Produkt, Ergebnis) :-
	atom_string(ProduktAnzahl, ProduktAnzahlString),
	atom_string(Produkt, ProduktString),
 	string_concat(ProduktAnzahlString, ' Einheiten ', Ergebnis0),
 	string_concat(Ergebnis0, ProduktString, Ergebnis).	

gebeKomponenteAus(Komponenten, KompPred, KompPredDanach) :-
	Komponenten = [],
	KompPredDanach = KompPred.
	
gebeKomponenteAus(Komponenten, KompPred, KompPredDanach) :-
	Komponenten = [ Kopf | Rest ],
	Kopf = [Anzahl, Stoff],
	atom_string(Anzahl, AnzahlString),
	atom_string(Stoff, StoffString),
	string_concat(KompPred, AnzahlString, KompPred0),
	string_concat(KompPred0, ' x ', KompPred1),
	string_concat(KompPred1, StoffString, KompPred2),
	(Rest \= [], string_concat(KompPred2, ', ', KompPred3); string_concat(KompPred2, '', KompPred3)),
	gebeKomponenteAus(Rest, KompPred3, KompPredDanach),
	!.

baueBegruendung(Ziel, BegrTupel) :-
	findall(FehlStoffTupel, (suchAlgorithmus:ersterNichtBeschaffbarerStoff(Ziel, FehlStoff, Vorgaenge), 
	                    FehlStoff \= none,
	                    FehlStoffTupel=[FehlStoff, Vorgaenge]
	                    ), FehlStoffTupels),
	baueBegruendungSub(FehlStoffTupels, [], BegrTupel).
	
baueBegruendungSub(BegrTupel, BegrTupelVorher, BegrTupelDanach) :-
	BegrTupel = [],
	BegrTupelVorher = BegrTupelDanach,
	!.
	
baueBegruendungSub([BegrTupel|RestBegrTupel], BegrTupelVorher, BegrTupelDanach) :-
	BegrTupel = [FehlStoff, Vorgaenge],  
	ausgabe:ausgabeVorgaenge(Vorgaenge, [], VorgaengePred),
	append(BegrTupelVorher, [begr(FehlStoff, VorgaengePred)], BegrTupelPred0),
	baueBegruendungSub(RestBegrTupel, BegrTupelPred0, BegrTupelDanach).


ausgabeSummen(GesamtZahl, GesamtWertSammlung, GesamtZeit, GesamtKosten, GesamtWertEndProdukt, SummenPred) :-
    MehrWert is GesamtWertEndProdukt - GesamtKosten,
	berechneStundenLohn(GesamtZeit, MehrWert, StundenLohn),

	SummenPred0 =[sum('Sammeln Gesamtbedarf', GesamtZahl, 'Stück')],
	append(SummenPred0, [sum('Gesamtwert Sammlung', GesamtWertSammlung, 'Units')], SummenPred1),
	append(SummenPred1, [sum('GesamtZeitAufwand', GesamtZeit, '1/100 sec')], SummenPred2),
	append(SummenPred2, [sum('Kosten Eingangsstoffe', GesamtKosten, 'Units')], SummenPred3),
	append(SummenPred3, [sum('Gesamtwert Endstoff', GesamtWertEndProdukt, 'Units')], SummenPred4),
	append(SummenPred4, [sum('Mehrwert', MehrWert, 'Units')], SummenPred5),
	append(SummenPred5, [sum('Stundenlohn', StundenLohn, 'Units/Stunde')], SummenPred).

berechneStundenLohn(GesamtZeit, _, StundenLohn) :-
		GesamtZeit = 0,
		StundenLohn = 0.
	
berechneStundenLohn(GesamtZeit, MehrWert, StundenLohn) :-
	StundenLohn is round(MehrWert * 360000 / GesamtZeit).
	
zeitFeldToNumber(ZeitFeld, _) :-
	ZeitFeld = 'Zeit'.
	
zeitFeldToNumber(ZeitFeld, ZeitFeldZahl) :-
	ZeitFeld \= 'Zeit', atom_number(ZeitFeld, ZeitFeldZahl).
		