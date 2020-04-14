:-module(planetSammelEigenschaftenDialogParams, [planetSammelEigenschaftenDialogParamList/2]).

:- use_module(library(http/http_parameters)).

baueParameterListen(FeldNrUnten, FeldNrOben, PredListeDanach) :-
	baueParameterListe(FeldNrUnten, FeldNrOben, 'auswahlRohStoff', '[length > 0]', "", PredList1),
	baueParameterListe(FeldNrUnten, FeldNrOben, 'methode', '[length > 0]', "", PredList2),
	baueParameterListe(FeldNrUnten, FeldNrOben, 'anzahl', '[default(''0'')]', "", PredList3),
	baueParameterListe(FeldNrUnten, FeldNrOben, 'dauer', '[default(''0'')]', "", PredList4),
	baueParameterListe(FeldNrUnten, FeldNrOben, 'gebinde', '[default(''0'')]', "", PredList5),
	
	string_concat(PredList1, ', ', PredListeDanach0),
	string_concat(PredListeDanach0, PredList2, PredListeDanach1),
	string_concat(PredListeDanach1, ', ', PredListeDanach2),
	string_concat(PredListeDanach2, PredList3, PredListeDanach3),
	string_concat(PredListeDanach3, ', ', PredListeDanach4),
	string_concat(PredListeDanach4, PredList4, PredListeDanach5),
	string_concat(PredListeDanach5, ', ', PredListeDanach6),
	string_concat(PredListeDanach6, PredList5, PredListeDanach).
	
baueParameterListe(FeldNrUnten, FeldNrOben, _, _, PredListeBisher, PredListeDanach) :-
	FeldNrUnten > FeldNrOben,
	PredListeDanach = PredListeBisher,
	!.

baueParameterListe(FeldNrUnten, FeldNrOben, FeldNameRumpf, FeldOptionen, PredListeBisher, PredListeDanach) :-
	join_identifier_parts(style(false, false, ''), [FeldNameRumpf, FeldNrUnten], PredName),
	join_identifier_parts(style(true, false, ''), [FeldNameRumpf, FeldNrUnten], VarName),
	(PredListeBisher = "" -> PredName = Pred0;string_concat(', ', PredName,  Pred0)),
	string_concat(Pred0, '(' , Pred1),
	string_concat(Pred1, VarName, Pred2),
	string_concat(Pred2, ', ', Pred3),
	string_concat(Pred3, FeldOptionen, Pred4),
	string_concat(Pred4, ')', Pred5),
	string_concat(PredListeBisher, Pred5, PredListeBisher0),
	FeldNo0 is FeldNrUnten + 1,
	baueParameterListe(FeldNo0, FeldNrOben, FeldNameRumpf, FeldOptionen, PredListeBisher0, PredListeDanach).

baueVariablenListen(FeldNrUnten, FeldNrOben, ListeDanach) :-
	baueVariablenListe(FeldNrUnten, FeldNrOben, 'auswahlRohStoff', "", VarList1),
	baueVariablenListe(FeldNrUnten, FeldNrOben, 'methode', "", VarList2),
	baueVariablenListe(FeldNrUnten, FeldNrOben, 'anzahl', "", VarList3),
	baueVariablenListe(FeldNrUnten, FeldNrOben, 'dauer', "", VarList4),
	baueVariablenListe(FeldNrUnten, FeldNrOben, 'gebinde', "", VarList5),
	string_concat(VarList1, ', ' , Danach0),
	string_concat(Danach0, VarList2 , Danach1),
	string_concat(Danach1, ', ' , Danach2),
	string_concat(Danach2, VarList3 , Danach3),
	string_concat(Danach3, ', ' , Danach4),
	string_concat(Danach4, VarList4 , Danach5),
	string_concat(Danach5, ', ' , Danach6),
	string_concat(Danach6, VarList5 , ListeDanach).
		
baueVariablenListe(FeldNrUnten, FeldNrOben, _, ListeBisher, ListeDanach) :-
	FeldNrUnten > FeldNrOben,
	ListeBisher = ListeDanach,
	!.
	
baueVariablenListe(FeldNrUnten, FeldNrOben, FeldNameRumpf, ListeBisher, ListeDanach) :-
	join_identifier_parts(style(true, false, ''), [FeldNameRumpf, FeldNrUnten], FeldName),
	(ListeBisher = "" -> FeldName = Klausel; string_concat(', ', FeldName, Klausel)),
	string_concat(ListeBisher, Klausel, ListeBisher0),
	FeldNo0 is FeldNrUnten + 1,
	baueVariablenListe(FeldNo0, FeldNrOben, FeldNameRumpf, ListeBisher0, ListeDanach).

planetSammelEigenschaftenDialogParamList(Request, VarValueList) :-
List = [ 
auswahlSystem(AuswahlSystem,[length>0]),  auswahlPlanet(AuswahlPlanet,[length>0]), auswahlSammelArt(AuswahlSammelArt, [length>0]),
auswahlRohStoff1(AuswahlRohStoff1, [length > 0]), auswahlRohStoff2(AuswahlRohStoff2, [length > 0]), 
auswahlRohStoff3(AuswahlRohStoff3, [length > 0]), auswahlRohStoff4(AuswahlRohStoff4, [length > 0]), 
auswahlRohStoff5(AuswahlRohStoff5, [length > 0]), auswahlRohStoff6(AuswahlRohStoff6, [length > 0]), 
auswahlRohStoff7(AuswahlRohStoff7, [length > 0]), auswahlRohStoff8(AuswahlRohStoff8, [length > 0]), 
auswahlRohStoff9(AuswahlRohStoff9, [length > 0]), auswahlRohStoff10(AuswahlRohStoff10, [length > 0]), 
auswahlRohStoff11(AuswahlRohStoff11, [length > 0]), auswahlRohStoff12(AuswahlRohStoff12, [length > 0]), 
auswahlRohStoff13(AuswahlRohStoff13, [length > 0]), auswahlRohStoff14(AuswahlRohStoff14, [length > 0]), 
auswahlRohStoff15(AuswahlRohStoff15, [length > 0]), auswahlRohStoff16(AuswahlRohStoff16, [length > 0]), 
auswahlRohStoff17(AuswahlRohStoff17, [length > 0]), auswahlRohStoff18(AuswahlRohStoff18, [length > 0]), 
auswahlRohStoff19(AuswahlRohStoff19, [length > 0]), auswahlRohStoff20(AuswahlRohStoff20, [length > 0]), 
auswahlRohStoff21(AuswahlRohStoff21, [length > 0]), auswahlRohStoff22(AuswahlRohStoff22, [length > 0]), 
auswahlRohStoff23(AuswahlRohStoff23, [length > 0]), auswahlRohStoff24(AuswahlRohStoff24, [length > 0]), 
auswahlRohStoff25(AuswahlRohStoff25, [length > 0]), 
methode1(Methode1, [length > 0]), methode2(Methode2, [length > 0]), methode3(Methode3, [length > 0]), 
methode4(Methode4, [length > 0]), methode5(Methode5, [length > 0]), methode6(Methode6, [length > 0]), 
methode7(Methode7, [length > 0]), methode8(Methode8, [length > 0]), methode9(Methode9, [length > 0]), 
methode10(Methode10, [length > 0]), methode11(Methode11, [length > 0]), methode12(Methode12, [length > 0]), 
methode13(Methode13, [length > 0]), methode14(Methode14, [length > 0]), methode15(Methode15, [length > 0]), 
methode16(Methode16, [length > 0]), methode17(Methode17, [length > 0]), methode18(Methode18, [length > 0]), 
methode19(Methode19, [length > 0]), methode20(Methode20, [length > 0]), methode21(Methode21, [length > 0]), 
methode22(Methode22, [length > 0]), methode23(Methode23, [length > 0]), methode24(Methode24, [length > 0]), 
methode25(Methode25, [length > 0]), 
anzahl1(Anzahl1, [default('0')]), anzahl2(Anzahl2, [default('0')]), anzahl3(Anzahl3, [default('0')]), 
anzahl4(Anzahl4, [default('0')]), anzahl5(Anzahl5, [default('0')]), anzahl6(Anzahl6, [default('0')]), 
anzahl7(Anzahl7, [default('0')]), anzahl8(Anzahl8, [default('0')]), anzahl9(Anzahl9, [default('0')]), 
anzahl10(Anzahl10, [default('0')]), anzahl11(Anzahl11, [default('0')]), anzahl12(Anzahl12, [default('0')]), 
anzahl13(Anzahl13, [default('0')]), anzahl14(Anzahl14, [default('0')]), anzahl15(Anzahl15, [default('0')]), 
anzahl16(Anzahl16, [default('0')]), anzahl17(Anzahl17, [default('0')]), anzahl18(Anzahl18, [default('0')]), 
anzahl19(Anzahl19, [default('0')]), anzahl20(Anzahl20, [default('0')]), anzahl21(Anzahl21, [default('0')]), 
anzahl22(Anzahl22, [default('0')]), anzahl23(Anzahl23, [default('0')]), anzahl24(Anzahl24, [default('0')]), 
anzahl25(Anzahl25, [default('0')]), 
dauer1(Dauer1, [default('0')]), dauer2(Dauer2, [default('0')]), dauer3(Dauer3, [default('0')]), 
dauer4(Dauer4, [default('0')]), dauer5(Dauer5, [default('0')]), dauer6(Dauer6, [default('0')]), 
dauer7(Dauer7, [default('0')]), dauer8(Dauer8, [default('0')]), dauer9(Dauer9, [default('0')]), 
dauer10(Dauer10, [default('0')]), dauer11(Dauer11, [default('0')]), dauer12(Dauer12, [default('0')]), 
dauer13(Dauer13, [default('0')]), dauer14(Dauer14, [default('0')]), dauer15(Dauer15, [default('0')]), 
dauer16(Dauer16, [default('0')]), dauer17(Dauer17, [default('0')]), dauer18(Dauer18, [default('0')]), 
dauer19(Dauer19, [default('0')]), dauer20(Dauer20, [default('0')]), dauer21(Dauer21, [default('0')]), 
dauer22(Dauer22, [default('0')]), dauer23(Dauer23, [default('0')]), dauer24(Dauer24, [default('0')]), 
dauer25(Dauer25, [default('0')]), 
gebinde1(Gebinde1, [default('0')]), gebinde2(Gebinde2, [default('0')]), gebinde3(Gebinde3, [default('0')]), 
gebinde4(Gebinde4, [default('0')]), gebinde5(Gebinde5, [default('0')]), gebinde6(Gebinde6, [default('0')]), 
gebinde7(Gebinde7, [default('0')]), gebinde8(Gebinde8, [default('0')]), gebinde9(Gebinde9, [default('0')]), 
gebinde10(Gebinde10, [default('0')]), gebinde11(Gebinde11, [default('0')]), gebinde12(Gebinde12, [default('0')]), 
gebinde13(Gebinde13, [default('0')]), gebinde14(Gebinde14, [default('0')]), gebinde15(Gebinde15, [default('0')]), 
gebinde16(Gebinde16, [default('0')]), gebinde17(Gebinde17, [default('0')]), gebinde18(Gebinde18, [default('0')]), 
gebinde19(Gebinde19, [default('0')]), gebinde20(Gebinde20, [default('0')]), gebinde21(Gebinde21, [default('0')]), 
gebinde22(Gebinde22, [default('0')]), gebinde23(Gebinde23, [default('0')]), gebinde24(Gebinde24, [default('0')]), 
gebinde25(Gebinde25, [default('0')])
],

http_parameters(Request, List),
VarValueList = [AuswahlSystem, AuswahlPlanet, AuswahlSammelArt, 
AuswahlRohStoff1, AuswahlRohStoff2, AuswahlRohStoff3, AuswahlRohStoff4, AuswahlRohStoff5, AuswahlRohStoff6, 
AuswahlRohStoff7, AuswahlRohStoff8, AuswahlRohStoff9, AuswahlRohStoff10, AuswahlRohStoff11, AuswahlRohStoff12, 
AuswahlRohStoff13, AuswahlRohStoff14, AuswahlRohStoff15, AuswahlRohStoff16, AuswahlRohStoff17, AuswahlRohStoff18, 
AuswahlRohStoff19, AuswahlRohStoff20, AuswahlRohStoff21, AuswahlRohStoff22, AuswahlRohStoff23, AuswahlRohStoff24, 
AuswahlRohStoff25, 
Methode1, Methode2, Methode3, Methode4, Methode5, Methode6, Methode7, Methode8, Methode9, Methode10, Methode11, 
Methode12, Methode13, Methode14, Methode15, Methode16, Methode17, Methode18, Methode19, Methode20, Methode21, 
Methode22, Methode23, Methode24, Methode25, 
Anzahl1, Anzahl2, Anzahl3, Anzahl4, Anzahl5, Anzahl6, Anzahl7, Anzahl8, Anzahl9, Anzahl10, Anzahl11, Anzahl12, 
Anzahl13, Anzahl14, Anzahl15, Anzahl16, Anzahl17, Anzahl18, Anzahl19, Anzahl20, Anzahl21, Anzahl22, Anzahl23, 
Anzahl24, Anzahl25, 
Dauer1, Dauer2, Dauer3, Dauer4, Dauer5, Dauer6, Dauer7, Dauer8, Dauer9, Dauer10, Dauer11, Dauer12, Dauer13, 
Dauer14, Dauer15, Dauer16, Dauer17, Dauer18, Dauer19, Dauer20, Dauer21, Dauer22, Dauer23, Dauer24, Dauer25, 
Gebinde1, Gebinde2, Gebinde3, Gebinde4, Gebinde5, Gebinde6, Gebinde7, Gebinde8, Gebinde9, Gebinde10, Gebinde11, 
Gebinde12, Gebinde13, Gebinde14, Gebinde15, Gebinde16, Gebinde17, Gebinde18, Gebinde19, Gebinde20, Gebinde21, 
Gebinde22, Gebinde23, Gebinde24, Gebinde25
].
