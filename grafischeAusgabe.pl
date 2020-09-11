:- module(grafischeAusgabe, [hierarchieGrafik/2]).

:- dynamic(baum/4).  /* baum(Position, Ebene, Stoff, PositionParent  */

hierarchieGrafik(Vorgaenge, Svg) :-
  letzterVorgang(Vorgaenge, LetzterVorgang),
  LetzterVorgang = [_,_,_,_,_,[_, EndStoff]],
  ebenePos(Vorgaenge, LetzterVorgang, [[1,1,EndStoff, 0]]),
  findall(Stoff, baum(_, _, Stoff, _), Beschriftungen),
  findall(SvgX, (select(Beschriftung, Beschriftungen, _), symbolFromBeschriftung(Beschriftung, SvgX)), Symbols),
  concatSymbols(Symbols, "", Svg1),
  findall(AnzPosesEbene, (between(1, 9, UntersuchungsEbene), 
                          findall(Pos, (baum(Pos, Ebene, _, _), 
                                        Ebene=UntersuchungsEbene
                                       ), PosesPerEbene), 
                          length(PosesPerEbene, AnzPosesEbene)), AnzPosesEbene),
  findall(SvgX, (baum(Pos, Ebene, Stoff, PosParent), 
  				 useFromBeschriftung(Pos, Ebene, Stoff, PosParent, AnzPosesEbene, SvgX)
                ), Uses),
  concatSymbols(Uses, "", Svg2),
  findall(Pos, (select(Pos, AnzPosesEbene, _), Pos > 0), BelegteEbenen),
  length(BelegteEbenen, EbenenAnz),
  CanvasHoehe is 60 * EbenenAnz - 20,
  string_concat('<svg width=1300 height=', CanvasHoehe, Svg00),
  string_concat(Svg00,
  '>
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
  </defs>', Svg0),
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