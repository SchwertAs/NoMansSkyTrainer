:- module(ausgabe, [ausgabeSammlung/3, ausgabeVorgaenge/3, ausgabeSummen/6, 
          baueBegruendung/2, zeitFeldToNumber/2, partialList/4, letzesListenElement/2, hierarchieGrafik/2]).

:- dynamic(baum/4).  /* baum(Position, Ebene, Stoff, PositionParent  */

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

 	string_concat('Führen Sie ', WandelAnzString, Anweisung0),
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
	
	
hierarchieGrafik(Vorgaenge, Svg) :-
  Svg0 = '<svg width=1300 height=450>
  <defs
    id=defs2>
    <marker
       orient=auto
       refY=0.0
       refX="0.0"
       id="Arrow2Lend"
       style="overflow:visible;">
      <path
         id="path838"
		 class="pfeil"
         d="M 8.7185878,4.0337352 L -2.2072895,0.016013256 L 8.7185884,-4.0017078 C 6.9730900,-1.6296469 6.9831476,1.6157441 8.7185878,4.0337352 z "
         transform="scale(0.8) rotate(180) translate(0)" />
    </marker>
  </defs>',
  letzterVorgang(Vorgaenge, LetzterVorgang),
  LetzterVorgang = [_,_,_,_,_,[_, EndStoff]],
  ebenePos(Vorgaenge, LetzterVorgang, [[1,1,EndStoff, 0]]),
  findall(Stoff, baum(_, _, Stoff, _), Beschriftungen),
  findall(SvgX, (select(Beschriftung, Beschriftungen, _), symbolFromBeschriftung(Beschriftung, SvgX)), Symbols),
  concatSymbols(Symbols, "", Svg1),
  findall(AnzPosesEbene, (between(1, 9, UntersuchungsEbene), 
                          findall(Pos, (ausgabe:baum(Pos, Ebene, _, _), 
                                        Ebene=UntersuchungsEbene
                                       ), PosesPerEbene), 
                          length(PosesPerEbene, AnzPosesEbene)), AnzPosesEbene),
  findall(SvgX, (baum(Pos, Ebene, Stoff, PosParent), 
  				 useFromBeschriftung(Pos, Ebene, Stoff, PosParent, AnzPosesEbene, SvgX)
                ), Uses),
  concatSymbols(Uses, "", Svg2),
  string_concat(Svg0, Svg1, Svg01),
  string_concat(Svg01, Svg2, Svg3),
  string_concat(Svg3, '</svg>', Svg),
  debug(myTrace, 'Vorgaenge: ~k', [Vorgaenge]).

useFromBeschriftung(Pos, Ebene, Stoff, PosParent, AnzPosesEbene, Use) :-
	Ebene > 1,
	nth1(Ebene, AnzPosesEbene, Anz),
	EbeneParent is Ebene - 1,
	nth1(EbeneParent, AnzPosesEbene, AnzParent),
    breiteBeschriftung(Stoff, Breite),
    X is (1500 / (Anz + 1)) * Pos - (Breite / 2) - 100,
	Y is 60 * (Ebene - 1),
	buildUseForBox(X, Y, Stoff, Use1),
	XArrow is X + (Breite / 2),
	XParent is (1500 / (AnzParent + 1)) * PosParent - 100,
	Yarrow is Y,
	YArrowParent is Y - 28,
	buildUseForArrow(XArrow, XParent, Yarrow, YArrowParent, Use2),
	string_concat(Use1, Use2, Use).

useFromBeschriftung(_, Ebene, Stoff, _, _, Use) :-
	Ebene = 1,
	breiteBeschriftung(Stoff, Breite),
    X is 750 - (Breite / 2) - 100,
	buildUseForBox(X, 0, Stoff, Use).

buildUseForBox(X, Y, Stoff, Use) :-
	string_concat('<use x=', X, Use0),
	string_concat(Use0, ' y=', Use1),
	string_concat(Use1, Y, Use2),
	string_concat(Use2, ' xlink:href=#textbox', Use3),
	string_concat(Use3, Stoff, Use4),
	string_concat(Use4, ' />', Use).
	
buildUseForArrow(X, XParent, Yarrow, YArrowParent, Use) :-
	string_concat('<g> <path class=pfeilLinie d="M ', X, Use0),
	string_concat(Use0, ', ', Use1),
	string_concat(Use1, Yarrow, Use2),
	string_concat(Use2, ' L ', Use3),
	string_concat(Use3, XParent, Use4),
	string_concat(Use4, ', ', Use5),
	string_concat(Use5, YArrowParent, Use6),
	string_concat(Use6, '" transform=scale(1.0) rotate(0) translate(0,0) /></g>', Use).
	
symbolFromBeschriftung(Beschriftung, Symbol) :-
	string_concat('<symbol id=textbox', Beschriftung, Sym0),
	string_concat(Sym0, '> <rect class=kastenGelb x=0 y=0 width=', Sym1),
	breiteBeschriftung(Beschriftung, Breite),
	atom_string(Breite, BreiteString),
	string_concat(Sym1, BreiteString, Sym2),
	string_concat(Sym2, ' height=30 /> <text class=stoffText x=5 y=22 >', Sym3),
	string_concat(Sym3, Beschriftung, Sym4),
	string_concat(Sym4, '</text> </symbol>', Symbol).

letzterVorgang(Vorgaenge, LetzterVorgang) :-
	retractall(baum(_, _, _, _)),
	length(Vorgaenge, LastNo),
	nth1(LastNo, Vorgaenge, LetzterVorgang).

ebenePos(_, AktuellerVorgang, EbenenPos) :-
	AktuellerVorgang = [_,_,_,_,[],_],
	forall((select([Pos, Eb, Stoff, PosParent], EbenenPos, _), \+baum(Pos, Eb, Stoff, PosParent)), assertz(baum(Pos, Eb, Stoff, PosParent))).
	
ebenePos(Vorgaenge, AktuellerVorgang, EbenenPos) :-
	AktuellerVorgang = [_,_,_,_,Komponenten,_],
	EbenenPos = [[PosParent, Ebene, _, _]|_],
	forall(select(KopfKomp, Komponenten, _),
	 (EbeneNeu is Ebene + 1,
	 findall(Pos, baum(Pos, EbeneNeu, _, _), Poses),
	 ((Poses = [], NewPos0 = 0); max_member(NewPos0, Poses)),
	 NewPos is NewPos0 + 1,
	 KopfKomp = [_, KopfKompStoff],
	 append([[NewPos, EbeneNeu, KopfKompStoff, PosParent]], EbenenPos, EbenenPos1),
	 select(AktuellerVorgang1, Vorgaenge, _),
	 AktuellerVorgang1 = [_,_,_,_,_,[_,KopfKompStoff]],
	 ebenePos(Vorgaenge, AktuellerVorgang1, EbenenPos1)
	)).
	
breiteBeschriftung(Beschriftung, Breite) :-
	atom_length(Beschriftung, ZeichenZahl),
	findall(Len, 
	        (between(1,ZeichenZahl, Index),
	         string_code(Index, Beschriftung, Code),
	         lenOfCode(Code, Len)
		    ), Lens),
		    sum_list(Lens, Breite0),
		    Breite is Breite0 + 5.

lenOfCode(Code, Len) :-
	Code > 64,
	Code < 91,
	LenGrossBuchstaben = [12,12,13,13,12,11,14,13,5,9,12,10,15,13,14,12,14,13,12,11,13,12,17,12,12,11],
	Index is Code - 64, 
	nth1(Index, LenGrossBuchstaben, Len),
	!.
	
lenOfCode(Code, Len) :-
	Code > 96,
    Code < 123, 
	LenKleinbuchstaben = [10,10,9,10,10,4.8,10,10,4,4,9,4,15,10,10,10,10,6,9,5,10,9,12.9,9,9,9], 
    Index is Code - 96, 
    nth1(Index, LenKleinbuchstaben, Len),
    !.
    
lenOfCode(_, Len) :-
	Len = 0.
	
concatSymbols([], Svg0, Svg) :-	
	Svg0 = Svg.
	
concatSymbols([Sym0|Rest], Svg0, Svg) :-
	string_concat(Svg0, Sym0, Svg1),
	concatSymbols(Rest, Svg1, Svg).