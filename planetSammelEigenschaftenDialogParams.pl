:-module(planetSammelEigenschaftenDialogParams, [planetSammelEigenschaftenDialogParamList/2]).

:- use_module(library(http/http_parameters)).

baueParameterListen(FeldNrUnten, FeldNrOben, PredListeDanach) :-
	baueParameterListe(FeldNrUnten, FeldNrOben, 'auswahlRohStoff', '[length > 0]', "", PredList1),
	baueParameterListe(FeldNrUnten, FeldNrOben, 'anzahl', '[default(''0'')]', "", PredList2),
	baueParameterListe(FeldNrUnten, FeldNrOben, 'dauer', '[default(''0'')]', "", PredList3),
	baueParameterListe(FeldNrUnten, FeldNrOben, 'gebinde', '[default(''0'')]', "", PredList4),
	
	string_concat(PredList1, ', ', PredListeDanach0),
	string_concat(PredListeDanach0, PredList2, PredListeDanach1),
	string_concat(PredListeDanach1, ', ', PredListeDanach2),
	string_concat(PredListeDanach2, PredList3, PredListeDanach3),
	string_concat(PredListeDanach3, ', ', PredListeDanach4),
	string_concat(PredListeDanach4, PredList4, PredListeDanach).
	
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
	baueVariablenListe(FeldNrUnten, FeldNrOben, 'anzahl', "", VarList2),
	baueVariablenListe(FeldNrUnten, FeldNrOben, 'dauer', "", VarList3),
	baueVariablenListe(FeldNrUnten, FeldNrOben, 'gebinde', "", VarList4),
	string_concat(VarList1, ', ' , Danach0),
	string_concat(Danach0, VarList2 , Danach1),
	string_concat(Danach1, ', ' , Danach2),
	string_concat(Danach2, VarList3 , Danach3),
	string_concat(Danach3, ', ' , Danach4),
	string_concat(Danach4, VarList4 , ListeDanach).
		
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
anzahl1(Anzahl1, [default('0')]), anzahl2(Anzahl2, [default('0')]), anzahl3(Anzahl3, [default('0')]), 
anzahl4(Anzahl4, [default('0')]), anzahl5(Anzahl5, [default('0')]), anzahl6(Anzahl6, [default('0')]), 
anzahl7(Anzahl7, [default('0')]), anzahl8(Anzahl8, [default('0')]), anzahl9(Anzahl9, [default('0')]), 
anzahl10(Anzahl10, [default('0')]), anzahl11(Anzahl11, [default('0')]), anzahl12(Anzahl12, [default('0')]), 
anzahl13(Anzahl13, [default('0')]), anzahl14(Anzahl14, [default('0')]),  
dauer1(Dauer1, [default('0')]), dauer2(Dauer2, [default('0')]), dauer3(Dauer3, [default('0')]), 
dauer4(Dauer4, [default('0')]), dauer5(Dauer5, [default('0')]), dauer6(Dauer6, [default('0')]), 
dauer7(Dauer7, [default('0')]), dauer8(Dauer8, [default('0')]), dauer9(Dauer9, [default('0')]), 
dauer10(Dauer10, [default('0')]), dauer11(Dauer11, [default('0')]), dauer12(Dauer12, [default('0')]), 
dauer13(Dauer13, [default('0')]), dauer14(Dauer14, [default('0')]), 
gebinde1(Gebinde1, [default('0')]), gebinde2(Gebinde2, [default('0')]), gebinde3(Gebinde3, [default('0')]), 
gebinde4(Gebinde4, [default('0')]), gebinde5(Gebinde5, [default('0')]), gebinde6(Gebinde6, [default('0')]), 
gebinde7(Gebinde7, [default('0')]), gebinde8(Gebinde8, [default('0')]), gebinde9(Gebinde9, [default('0')]), 
gebinde10(Gebinde10, [default('0')]), gebinde11(Gebinde11, [default('0')]), gebinde12(Gebinde12, [default('0')]), 
gebinde13(Gebinde13, [default('0')]), gebinde14(Gebinde14, [default('0')])
],

http_parameters(Request, List),
VarValueList = [AuswahlSystem, AuswahlPlanet, AuswahlSammelArt, 
AuswahlRohStoff1, AuswahlRohStoff2, AuswahlRohStoff3, AuswahlRohStoff4, AuswahlRohStoff5, AuswahlRohStoff6, 
AuswahlRohStoff7, AuswahlRohStoff8, AuswahlRohStoff9, AuswahlRohStoff10, AuswahlRohStoff11, AuswahlRohStoff12, 
AuswahlRohStoff13, AuswahlRohStoff14, 
Anzahl1, Anzahl2, Anzahl3, Anzahl4, Anzahl5, Anzahl6, Anzahl7, Anzahl8, Anzahl9, Anzahl10, Anzahl11, Anzahl12, 
Anzahl13, Anzahl14, 
Dauer1, Dauer2, Dauer3, Dauer4, Dauer5, Dauer6, Dauer7, Dauer8, Dauer9, Dauer10, Dauer11, Dauer12, Dauer13, 
Dauer14, 
Gebinde1, Gebinde2, Gebinde3, Gebinde4, Gebinde5, Gebinde6, Gebinde7, Gebinde8, Gebinde9, Gebinde10, Gebinde11, 
Gebinde12, Gebinde13, Gebinde14
].
