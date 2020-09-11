:- module(ausgabe, [ausgabeSammlung/3, ausgabeVorgaenge/3, ausgabeSummen/6, 
          baueBegruendung/2, zeitFeldToNumber/2, partialList/4, letzesListenElement/2]).

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
	Kopf = [_, _, WandelAnz, Operation, Komponenten, [ProduktAnzahl, Produkt]],
	wandelAktion:wandelAktion(Operation, _),
	arbeitsVorbereitung:bildeAvZeiten([Kopf], 0, GesamtVorgaengeZeit),
	bildeOperation(GesamtVorgaengeZeit, Operation, OperationStringMaske),
	gebeKomponenteAus(Komponenten, '', KompPred),
	atom_string(WandelAnz, WandelAnzString),
	atom_string(Produkt, ProduktString),
	atom_string(Operation, OperationString),

 	string_concat('F�hren Sie ', WandelAnzString, Anweisung0),
 	string_concat(Anweisung0, ' mal ', Anweisung1),
 	string_concat(Anweisung1, OperationString, Anweisung2),
 	string_concat(Anweisung2, ' von ', Anweisung3),
 	string_concat(Anweisung3, ProduktString, Anweisung4),
 	string_concat(Anweisung4, ' mit ', Anweisung5),
 	string_concat(Anweisung5, KompPred, Anweisung6),
 	string_concat(Anweisung6, ' aus', Anweisung),

    bildeErgebnis(ProduktAnzahl, Produkt, Ergebnis),
	append(VorgaengePred, [vorg(Anweisung, OperationStringMaske, Ergebnis)], VorgaengePred0),
	ausgabeVorgaenge(Rest, VorgaengePred0, VorgaengePredDanach),
	!.		

ausgabeVorgaenge(Vorgaenge, VorgaengePred, VorgaengePredDanach) :-
	Vorgaenge = [ Kopf | Rest], 
	Kopf = [_, _, _, Operation, _, [_, Produkt]],
	Operation = bekannt,
	atom_string(Produkt, ProduktString),
	string_concat('Das ', ProduktString, Anweisung0),
	string_concat(Anweisung0, ' ist bekannt.', Anweisung),
	append(VorgaengePred, [vorg(Anweisung, Operation, '')], VorgaengePred0),
	ausgabeVorgaenge(Rest, VorgaengePred0, VorgaengePredDanach),
	!.		

ausgabeVorgaenge(Vorgaenge, VorgaengePred, VorgaengePredDanach) :-
	Vorgaenge = [ Kopf | Rest], 
	Kopf = [System, Planet, _, Operation, _, [ProduktAnzahl, Produkt]],
	sammelAktion:sammelAktion(Operation),
	sammlung:sammlung(_, System, Planet, Operation, Produkt, HauptZeit, NebenZeit, RuestZeit),
	Zeit is (ProduktAnzahl * HauptZeit + RuestZeit + (ProduktAnzahl - 1) * NebenZeit),
	bildeOperation(Zeit, Operation, OperationStringMaske),
	atom_string(ProduktAnzahl, WandelAnzString),
	atom_string(Operation, OperationString),
	atom_string(Produkt, ProduktString),

 	string_concat('Erlangen Sie ', WandelAnzString, Anweisung0),
 	string_concat(Anweisung0, ' Einheiten ', Anweisung1),
 	string_concat(Anweisung1, ProduktString, Anweisung2),
 	string_concat(Anweisung2, ' mit ', Anweisung3),
 	string_concat(Anweisung3, OperationString, Anweisung),
 	bildeErgebnis(ProduktAnzahl, Produkt, Ergebnis),
 	append(VorgaengePred, [vorg(Anweisung, OperationStringMaske, Ergebnis)], VorgaengePred0),
	ausgabeVorgaenge(Rest, VorgaengePred0, VorgaengePredDanach),
	!.		

ausgabeVorgaenge(Vorgaenge, VorgaengePred, VorgaengePredDanach) :-
	Vorgaenge = [ Kopf | Rest], 
	Kopf = [_, _, _, Operation, [[_, VonOrt], [_, NachOrt]], [_, Produkt]],
	Operation = reisen,
	VonOrt = [System, Planet, _],
	NachOrt = [SystemNach, PlanetNach, Nach],
	
	retractall(spielStatus:systemAusstattung([_, _, ortSimulationsSpieler], _)),
	assertz(spielStatus:systemAusstattung([System, Planet, ortSimulationsSpieler], 0)),
	retractall(reisen:letzterOrt(_, _, _)),
	assertz(reisen:letzterOrt(System, Planet, ortHauptBasis)),
	reisen:reisen(NachOrt, ReiseZeit),
	bildeOperation(ReiseZeit, Operation, OperationString),
	
	atom_string(SystemNach, SystemNachString),
	atom_string(PlanetNach, PlanetNachString),
	atom_string(Nach, NachString),
	atom_string(Produkt, ProduktString),

 	string_concat('Bitte reisen Sie nach System ', SystemNachString, Anweisung6),
 	string_concat(Anweisung6, ' Planet ', Anweisung7),
 	string_concat(Anweisung7, PlanetNachString, Anweisung8), 
 	string_concat(Anweisung8, ' ', Anweisung9),
 	string_concat(Anweisung9, NachString, Anweisung10),
	
 	string_concat('in ', NachString, Ergebnis0),
 	string_concat(Ergebnis0, ' ', Ergebnis1),
 	string_concat(Ergebnis1, ProduktString, Ergebnis),

 	append(VorgaengePred, [vorg(Anweisung10, OperationString, Ergebnis)], VorgaengePred0),
	ausgabeVorgaenge(Rest, VorgaengePred0, VorgaengePredDanach),
	!.		

ausgabeVorgaenge(Vorgaenge, VorgaengePred, VorgaengePredDanach) :-
	Vorgaenge = [ _ | Rest], 
	ausgabeVorgaenge(Rest, VorgaengePred, VorgaengePredDanach),
	!.		 

bildeOperation(Zeit, Operation, OperationString) :-
	atom_string(Zeit, ZeitString),
	atom_string(Operation, OperationString0),
	string_concat(ZeitString, ' 1/100 sec ', OperationString1),
	string_concat(OperationString1, OperationString0, OperationString).
		
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

	SummenPred0 =[sum('Sammeln Gesamtbedarf', GesamtZahl, 'St�ck')],
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

joinRecordsNumbering(ListOfLists1, _, _, KombinierteListOfLists) :-
	ListOfLists1 = [[]],
	KombinierteListOfLists = [[]].
	
joinRecordsNumbering(ListOfLists1, _, InnereLaenge2, _) :-
	ListOfLists1 = [Elem1|_],
	length(Elem1, Len),
	(Len \= 1; InnereLaenge2 < 1),
	!, fail.
	
joinRecordsNumbering(ListOfLists1, ListOfLists2, InnereLaenge2, KombinierteListOfLists) :-
	baueLeerStringList(InnereLaenge2, [], LeerStringList2),
	joinLists(ListOfLists1, ListOfLists2, LeerStringList2, [], KombinierteListOfLists),
	!.
	
joinLists(ListOfLists1, _, _, Bisher, Danach) :-
	ListOfLists1 = [],
	Bisher = Danach.
	
joinLists(ListOfLists1, ListOfLists2, LeerStringList2, Bisher, Danach) :-
	ListOfLists1 = [Elem1|Rest1],
	((ListOfLists2 = [], Record = LeerStringList2, Rest2=[]); (ListOfLists2 = [Record|Rest2])),
	append(Elem1, Record, KombinierterRecord),
	append(Bisher, [KombinierterRecord], Bisher0),
	joinLists(Rest1, Rest2, LeerStringList2, Bisher0, Danach),
	!.
	 	
joinRecordsByRecordNo(ListOfLists1, _, _, KombinierteListOfLists) :-
	ListOfLists1 = [[]],
	KombinierteListOfLists = [[]].
	
joinRecordsByRecordNo(ListOfLists1, _, InnereLaenge2, _) :-
	ListOfLists1 = [Elem1|_],
	length(Elem1, Len),
	(Len \= 1; InnereLaenge2 < 1),
	!, fail.
	
joinRecordsByRecordNo(ListOfLists1, ListOfLists2, InnereLaenge2, KombinierteListOfLists) :-
	baueLeerStringList(1, [], LeerStringList1),
	baueLeerStringList(InnereLaenge2, [], LeerStringList2),
	joinListsByRecordNo(ListOfLists1, ListOfLists2, LeerStringList1, LeerStringList2, [], KombinierteListOfLists),
	!.

baueLeerStringList(InnerLen, LeerStringListDavor, LeerStringListDanach) :-
	InnerLen = 0,
	LeerStringListDavor = LeerStringListDanach.
	
baueLeerStringList(InnerLen, LeerStringListDavor, LeerStringListDanach) :-
	append(LeerStringListDavor, [''], LeerStringListDavor0),
	InnerLen0 is InnerLen - 1,
	baueLeerStringList(InnerLen0, LeerStringListDavor0, LeerStringListDanach).
	

joinListsByRecordNo(ListOfLists1, _, _, _, Bisher, Danach) :-
	ListOfLists1 = [],
	Bisher = Danach.
	
joinListsByRecordNo(ListOfLists1, ListOfLists2, LeerStringList1, LeerStringList2, Bisher, Danach) :-
	ListOfLists1 = [Elem1|Rest1],
	((ListOfLists2 = [], Elem2 = [0, LeerStringList2]); (ListOfLists2 = [Elem2|_])),
	Elem1 = [FeldNo|_], Elem2 = [RecordNo|Record],
	(((FeldNo = RecordNo; RecordNo = 0),
	  append(Elem1, Record, KombinierterRecord),
	  ListOfLists2 = [_|Rest2]
	 );
	 (append(Elem1, LeerStringList2, KombinierterRecord),
	  Rest2 = ListOfLists2
	)),	  
	append(Bisher, [KombinierterRecord], Bisher0),
	joinListsByRecordNo(Rest1, Rest2, LeerStringList1, LeerStringList2, Bisher0, Danach),
	!.
	 
partialList(List, Von, Bis, TeilListe) :-
	Von > 0,
	Bis > 0,
	findall(Elem, (member(Elem, List), nth1(Pos, List, Elem), Pos >= Von, Pos =< Bis), TeilListe).

letzesListenElement(Liste, Ende) :-
	Liste = [Ende],
	!.

letzesListenElement([_|Rest], Ende) :-
	letzesListenElement(Rest, Ende).
	