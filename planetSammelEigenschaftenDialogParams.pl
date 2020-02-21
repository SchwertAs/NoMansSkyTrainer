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
List =
[ auswahlSystem(AuswahlSystem,[length>0]),  auswahlPlanet(AuswahlPlanet,[length>0]),
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
  auswahlRohStoff25(AuswahlRohStoff25, [length > 0]), auswahlRohStoff26(AuswahlRohStoff26, [length > 0]), 
  auswahlRohStoff27(AuswahlRohStoff27, [length > 0]), auswahlRohStoff28(AuswahlRohStoff28, [length > 0]), 
  auswahlRohStoff29(AuswahlRohStoff29, [length > 0]), auswahlRohStoff30(AuswahlRohStoff30, [length > 0]), 
  auswahlRohStoff31(AuswahlRohStoff31, [length > 0]), auswahlRohStoff32(AuswahlRohStoff32, [length > 0]), 
  auswahlRohStoff33(AuswahlRohStoff33, [length > 0]), auswahlRohStoff34(AuswahlRohStoff34, [length > 0]), 
  auswahlRohStoff35(AuswahlRohStoff35, [length > 0]), auswahlRohStoff36(AuswahlRohStoff36, [length > 0]), 
  auswahlRohStoff37(AuswahlRohStoff37, [length > 0]), auswahlRohStoff38(AuswahlRohStoff38, [length > 0]), 
  auswahlRohStoff39(AuswahlRohStoff39, [length > 0]), auswahlRohStoff40(AuswahlRohStoff40, [length > 0]), 
  auswahlRohStoff41(AuswahlRohStoff41, [length > 0]), auswahlRohStoff42(AuswahlRohStoff42, [length > 0]), 
  auswahlRohStoff43(AuswahlRohStoff43, [length > 0]), auswahlRohStoff44(AuswahlRohStoff44, [length > 0]), 
  auswahlRohStoff45(AuswahlRohStoff45, [length > 0]), auswahlRohStoff46(AuswahlRohStoff46, [length > 0]), 
  auswahlRohStoff47(AuswahlRohStoff47, [length > 0]), auswahlRohStoff48(AuswahlRohStoff48, [length > 0]), 
  auswahlRohStoff49(AuswahlRohStoff49, [length > 0]), auswahlRohStoff50(AuswahlRohStoff50, [length > 0]), 
  auswahlRohStoff51(AuswahlRohStoff51, [length > 0]), auswahlRohStoff52(AuswahlRohStoff52, [length > 0]), 
  auswahlRohStoff53(AuswahlRohStoff53, [length > 0]), auswahlRohStoff54(AuswahlRohStoff54, [length > 0]), 
  auswahlRohStoff55(AuswahlRohStoff55, [length > 0]), auswahlRohStoff56(AuswahlRohStoff56, [length > 0]), 
  auswahlRohStoff57(AuswahlRohStoff57, [length > 0]), auswahlRohStoff58(AuswahlRohStoff58, [length > 0]), 
  auswahlRohStoff59(AuswahlRohStoff59, [length > 0]), auswahlRohStoff60(AuswahlRohStoff60, [length > 0]), 
  auswahlRohStoff61(AuswahlRohStoff61, [length > 0]), auswahlRohStoff62(AuswahlRohStoff62, [length > 0]), 
  auswahlRohStoff63(AuswahlRohStoff63, [length > 0]), auswahlRohStoff64(AuswahlRohStoff64, [length > 0]), 
  auswahlRohStoff65(AuswahlRohStoff65, [length > 0]), auswahlRohStoff66(AuswahlRohStoff66, [length > 0]), 
  auswahlRohStoff67(AuswahlRohStoff67, [length > 0]), auswahlRohStoff68(AuswahlRohStoff68, [length > 0]), 
  auswahlRohStoff69(AuswahlRohStoff69, [length > 0]), auswahlRohStoff70(AuswahlRohStoff70, [length > 0]), 
  auswahlRohStoff71(AuswahlRohStoff71, [length > 0]), auswahlRohStoff72(AuswahlRohStoff72, [length > 0]), 
  auswahlRohStoff73(AuswahlRohStoff73, [length > 0]), auswahlRohStoff74(AuswahlRohStoff74, [length > 0]), 
  auswahlRohStoff75(AuswahlRohStoff75, [length > 0]), auswahlRohStoff76(AuswahlRohStoff76, [length > 0]), 
  auswahlRohStoff77(AuswahlRohStoff77, [length > 0]), auswahlRohStoff78(AuswahlRohStoff78, [length > 0]), 
  auswahlRohStoff79(AuswahlRohStoff79, [length > 0]), auswahlRohStoff80(AuswahlRohStoff80, [length > 0]), 
  auswahlRohStoff81(AuswahlRohStoff81, [length > 0]), auswahlRohStoff82(AuswahlRohStoff82, [length > 0]), 
  auswahlRohStoff83(AuswahlRohStoff83, [length > 0]), auswahlRohStoff84(AuswahlRohStoff84, [length > 0]), 
  auswahlRohStoff85(AuswahlRohStoff85, [length > 0]), auswahlRohStoff86(AuswahlRohStoff86, [length > 0]), 
  auswahlRohStoff87(AuswahlRohStoff87, [length > 0]), auswahlRohStoff88(AuswahlRohStoff88, [length > 0]), 
  auswahlRohStoff89(AuswahlRohStoff89, [length > 0]), auswahlRohStoff90(AuswahlRohStoff90, [length > 0]), 
  auswahlRohStoff91(AuswahlRohStoff91, [length > 0]), auswahlRohStoff92(AuswahlRohStoff92, [length > 0]), 
  auswahlRohStoff93(AuswahlRohStoff93, [length > 0]), auswahlRohStoff94(AuswahlRohStoff94, [length > 0]), 
  auswahlRohStoff95(AuswahlRohStoff95, [length > 0]), auswahlRohStoff96(AuswahlRohStoff96, [length > 0]), 
  auswahlRohStoff97(AuswahlRohStoff97, [length > 0]), auswahlRohStoff98(AuswahlRohStoff98, [length > 0]), 
  auswahlRohStoff99(AuswahlRohStoff99, [length > 0]), auswahlRohStoff100(AuswahlRohStoff100, [length > 0]), 
  auswahlRohStoff101(AuswahlRohStoff101, [length > 0]), auswahlRohStoff102(AuswahlRohStoff102, [length > 0]), 
  auswahlRohStoff103(AuswahlRohStoff103, [length > 0]), auswahlRohStoff104(AuswahlRohStoff104, [length > 0]), 
  auswahlRohStoff105(AuswahlRohStoff105, [length > 0]), auswahlRohStoff106(AuswahlRohStoff106, [length > 0]), 
  auswahlRohStoff107(AuswahlRohStoff107, [length > 0]), auswahlRohStoff108(AuswahlRohStoff108, [length > 0]), 
  auswahlRohStoff109(AuswahlRohStoff109, [length > 0]), auswahlRohStoff110(AuswahlRohStoff110, [length > 0]), 
  auswahlRohStoff111(AuswahlRohStoff111, [length > 0]), auswahlRohStoff112(AuswahlRohStoff112, [length > 0]), 
  auswahlRohStoff113(AuswahlRohStoff113, [length > 0]), auswahlRohStoff114(AuswahlRohStoff114, [length > 0]), 
  auswahlRohStoff115(AuswahlRohStoff115, [length > 0]), auswahlRohStoff116(AuswahlRohStoff116, [length > 0]), 
  auswahlRohStoff117(AuswahlRohStoff117, [length > 0]), auswahlRohStoff118(AuswahlRohStoff118, [length > 0]), 
  auswahlRohStoff119(AuswahlRohStoff119, [length > 0]), auswahlRohStoff120(AuswahlRohStoff120, [length > 0]), 
  auswahlRohStoff121(AuswahlRohStoff121, [length > 0]), auswahlRohStoff122(AuswahlRohStoff122, [length > 0]), 
  auswahlRohStoff123(AuswahlRohStoff123, [length > 0]), auswahlRohStoff124(AuswahlRohStoff124, [length > 0]), 
  auswahlRohStoff125(AuswahlRohStoff125, [length > 0]), auswahlRohStoff126(AuswahlRohStoff126, [length > 0]), 
  auswahlRohStoff127(AuswahlRohStoff127, [length > 0]), auswahlRohStoff128(AuswahlRohStoff128, [length > 0]), 
  auswahlRohStoff129(AuswahlRohStoff129, [length > 0]), auswahlRohStoff130(AuswahlRohStoff130, [length > 0]), 
  auswahlRohStoff131(AuswahlRohStoff131, [length > 0]), auswahlRohStoff132(AuswahlRohStoff132, [length > 0]), 
  auswahlRohStoff133(AuswahlRohStoff133, [length > 0]), auswahlRohStoff134(AuswahlRohStoff134, [length > 0]), 
  auswahlRohStoff135(AuswahlRohStoff135, [length > 0]), auswahlRohStoff136(AuswahlRohStoff136, [length > 0]), 
  methode1(Methode1, [length > 0]), methode2(Methode2, [length > 0]), methode3(Methode3, [length > 0]), 
  methode4(Methode4, [length > 0]), methode5(Methode5, [length > 0]), methode6(Methode6, [length > 0]), 
  methode7(Methode7, [length > 0]), methode8(Methode8, [length > 0]), methode9(Methode9, [length > 0]), 
  methode10(Methode10, [length > 0]), methode11(Methode11, [length > 0]), methode12(Methode12, [length > 0]), 
  methode13(Methode13, [length > 0]), methode14(Methode14, [length > 0]), methode15(Methode15, [length > 0]), 
  methode16(Methode16, [length > 0]), methode17(Methode17, [length > 0]), methode18(Methode18, [length > 0]), 
  methode19(Methode19, [length > 0]), methode20(Methode20, [length > 0]), methode21(Methode21, [length > 0]), 
  methode22(Methode22, [length > 0]), methode23(Methode23, [length > 0]), methode24(Methode24, [length > 0]), 
  methode25(Methode25, [length > 0]), methode26(Methode26, [length > 0]), methode27(Methode27, [length > 0]), 
  methode28(Methode28, [length > 0]), methode29(Methode29, [length > 0]), methode30(Methode30, [length > 0]), 
  methode31(Methode31, [length > 0]), methode32(Methode32, [length > 0]), methode33(Methode33, [length > 0]), 
  methode34(Methode34, [length > 0]), methode35(Methode35, [length > 0]), methode36(Methode36, [length > 0]), 
  methode37(Methode37, [length > 0]), methode38(Methode38, [length > 0]), methode39(Methode39, [length > 0]), 
  methode40(Methode40, [length > 0]), methode41(Methode41, [length > 0]), methode42(Methode42, [length > 0]), 
  methode43(Methode43, [length > 0]), methode44(Methode44, [length > 0]), methode45(Methode45, [length > 0]), 
  methode46(Methode46, [length > 0]), methode47(Methode47, [length > 0]), methode48(Methode48, [length > 0]), 
  methode49(Methode49, [length > 0]), methode50(Methode50, [length > 0]), methode51(Methode51, [length > 0]), 
  methode52(Methode52, [length > 0]), methode53(Methode53, [length > 0]), methode54(Methode54, [length > 0]), 
  methode55(Methode55, [length > 0]), methode56(Methode56, [length > 0]), methode57(Methode57, [length > 0]), 
  methode58(Methode58, [length > 0]), methode59(Methode59, [length > 0]), methode60(Methode60, [length > 0]), 
  methode61(Methode61, [length > 0]), methode62(Methode62, [length > 0]), methode63(Methode63, [length > 0]), 
  methode64(Methode64, [length > 0]), methode65(Methode65, [length > 0]), methode66(Methode66, [length > 0]), 
  methode67(Methode67, [length > 0]), methode68(Methode68, [length > 0]), methode69(Methode69, [length > 0]), 
  methode70(Methode70, [length > 0]), methode71(Methode71, [length > 0]), methode72(Methode72, [length > 0]), 
  methode73(Methode73, [length > 0]), methode74(Methode74, [length > 0]), methode75(Methode75, [length > 0]), 
  methode76(Methode76, [length > 0]), methode77(Methode77, [length > 0]), methode78(Methode78, [length > 0]), 
  methode79(Methode79, [length > 0]), methode80(Methode80, [length > 0]), methode81(Methode81, [length > 0]), 
  methode82(Methode82, [length > 0]), methode83(Methode83, [length > 0]), methode84(Methode84, [length > 0]), 
  methode85(Methode85, [length > 0]), methode86(Methode86, [length > 0]), methode87(Methode87, [length > 0]), 
  methode88(Methode88, [length > 0]), methode89(Methode89, [length > 0]), methode90(Methode90, [length > 0]), 
  methode91(Methode91, [length > 0]), methode92(Methode92, [length > 0]), methode93(Methode93, [length > 0]), 
  methode94(Methode94, [length > 0]), methode95(Methode95, [length > 0]), methode96(Methode96, [length > 0]), 
  methode97(Methode97, [length > 0]), methode98(Methode98, [length > 0]), methode99(Methode99, [length > 0]), 
  methode100(Methode100, [length > 0]), methode101(Methode101, [length > 0]), methode102(Methode102, [length > 0]), 
  methode103(Methode103, [length > 0]), methode104(Methode104, [length > 0]), methode105(Methode105, [length > 0]), 
  methode106(Methode106, [length > 0]), methode107(Methode107, [length > 0]), methode108(Methode108, [length > 0]), 
  methode109(Methode109, [length > 0]), methode110(Methode110, [length > 0]), methode111(Methode111, [length > 0]), 
  methode112(Methode112, [length > 0]), methode113(Methode113, [length > 0]), methode114(Methode114, [length > 0]), 
  methode115(Methode115, [length > 0]), methode116(Methode116, [length > 0]), methode117(Methode117, [length > 0]), 
  methode118(Methode118, [length > 0]), methode119(Methode119, [length > 0]), methode120(Methode120, [length > 0]), 
  methode121(Methode121, [length > 0]), methode122(Methode122, [length > 0]), methode123(Methode123, [length > 0]), 
  methode124(Methode124, [length > 0]), methode125(Methode125, [length > 0]), methode126(Methode126, [length > 0]), 
  methode127(Methode127, [length > 0]), methode128(Methode128, [length > 0]), methode129(Methode129, [length > 0]), 
  methode130(Methode130, [length > 0]), methode131(Methode131, [length > 0]), methode132(Methode132, [length > 0]),
  methode133(Methode133, [length > 0]), methode134(Methode134, [length > 0]), methode135(Methode135, [length > 0]),
  methode136(Methode136, [length > 0]),  
  anzahl1(Anzahl1, [default('0')]), anzahl2(Anzahl2, [default('0')]), anzahl3(Anzahl3, [default('0')]), 
  anzahl4(Anzahl4, [default('0')]), anzahl5(Anzahl5, [default('0')]), anzahl6(Anzahl6, [default('0')]), 
  anzahl7(Anzahl7, [default('0')]), anzahl8(Anzahl8, [default('0')]), anzahl9(Anzahl9, [default('0')]), 
  anzahl10(Anzahl10, [default('0')]), anzahl11(Anzahl11, [default('0')]), anzahl12(Anzahl12, [default('0')]), 
  anzahl13(Anzahl13, [default('0')]), anzahl14(Anzahl14, [default('0')]), anzahl15(Anzahl15, [default('0')]), 
  anzahl16(Anzahl16, [default('0')]), anzahl17(Anzahl17, [default('0')]), anzahl18(Anzahl18, [default('0')]), 
  anzahl19(Anzahl19, [default('0')]), anzahl20(Anzahl20, [default('0')]), anzahl21(Anzahl21, [default('0')]), 
  anzahl22(Anzahl22, [default('0')]), anzahl23(Anzahl23, [default('0')]), anzahl24(Anzahl24, [default('0')]), 
  anzahl25(Anzahl25, [default('0')]), anzahl26(Anzahl26, [default('0')]), anzahl27(Anzahl27, [default('0')]), 
  anzahl28(Anzahl28, [default('0')]), anzahl29(Anzahl29, [default('0')]), anzahl30(Anzahl30, [default('0')]), 
  anzahl31(Anzahl31, [default('0')]), anzahl32(Anzahl32, [default('0')]), anzahl33(Anzahl33, [default('0')]), 
  anzahl34(Anzahl34, [default('0')]), anzahl35(Anzahl35, [default('0')]), anzahl36(Anzahl36, [default('0')]), 
  anzahl37(Anzahl37, [default('0')]), anzahl38(Anzahl38, [default('0')]), anzahl39(Anzahl39, [default('0')]), 
  anzahl40(Anzahl40, [default('0')]), anzahl41(Anzahl41, [default('0')]), anzahl42(Anzahl42, [default('0')]), 
  anzahl43(Anzahl43, [default('0')]), anzahl44(Anzahl44, [default('0')]), anzahl45(Anzahl45, [default('0')]), 
  anzahl46(Anzahl46, [default('0')]), anzahl47(Anzahl47, [default('0')]), anzahl48(Anzahl48, [default('0')]), 
  anzahl49(Anzahl49, [default('0')]), anzahl50(Anzahl50, [default('0')]), anzahl51(Anzahl51, [default('0')]), 
  anzahl52(Anzahl52, [default('0')]), anzahl53(Anzahl53, [default('0')]), anzahl54(Anzahl54, [default('0')]), 
  anzahl55(Anzahl55, [default('0')]), anzahl56(Anzahl56, [default('0')]), anzahl57(Anzahl57, [default('0')]), 
  anzahl58(Anzahl58, [default('0')]), anzahl59(Anzahl59, [default('0')]), anzahl60(Anzahl60, [default('0')]), 
  anzahl61(Anzahl61, [default('0')]), anzahl62(Anzahl62, [default('0')]), anzahl63(Anzahl63, [default('0')]), 
  anzahl64(Anzahl64, [default('0')]), anzahl65(Anzahl65, [default('0')]), anzahl66(Anzahl66, [default('0')]), 
  anzahl67(Anzahl67, [default('0')]), anzahl68(Anzahl68, [default('0')]), anzahl69(Anzahl69, [default('0')]), 
  anzahl70(Anzahl70, [default('0')]), anzahl71(Anzahl71, [default('0')]), anzahl72(Anzahl72, [default('0')]), 
  anzahl73(Anzahl73, [default('0')]), anzahl74(Anzahl74, [default('0')]), anzahl75(Anzahl75, [default('0')]), 
  anzahl76(Anzahl76, [default('0')]), anzahl77(Anzahl77, [default('0')]), anzahl78(Anzahl78, [default('0')]), 
  anzahl79(Anzahl79, [default('0')]), anzahl80(Anzahl80, [default('0')]), anzahl81(Anzahl81, [default('0')]), 
  anzahl82(Anzahl82, [default('0')]), anzahl83(Anzahl83, [default('0')]), anzahl84(Anzahl84, [default('0')]), 
  anzahl85(Anzahl85, [default('0')]), anzahl86(Anzahl86, [default('0')]), anzahl87(Anzahl87, [default('0')]), 
  anzahl88(Anzahl88, [default('0')]), anzahl89(Anzahl89, [default('0')]), anzahl90(Anzahl90, [default('0')]), 
  anzahl91(Anzahl91, [default('0')]), anzahl92(Anzahl92, [default('0')]), anzahl93(Anzahl93, [default('0')]), 
  anzahl94(Anzahl94, [default('0')]), anzahl95(Anzahl95, [default('0')]), anzahl96(Anzahl96, [default('0')]), 
  anzahl97(Anzahl97, [default('0')]), anzahl98(Anzahl98, [default('0')]), anzahl99(Anzahl99, [default('0')]), 
  anzahl100(Anzahl100, [default('0')]), anzahl101(Anzahl101, [default('0')]), anzahl102(Anzahl102, [default('0')]), 
  anzahl103(Anzahl103, [default('0')]), anzahl104(Anzahl104, [default('0')]), anzahl105(Anzahl105, [default('0')]), 
  anzahl106(Anzahl106, [default('0')]), anzahl107(Anzahl107, [default('0')]), anzahl108(Anzahl108, [default('0')]), 
  anzahl109(Anzahl109, [default('0')]), anzahl110(Anzahl110, [default('0')]), anzahl111(Anzahl111, [default('0')]), 
  anzahl112(Anzahl112, [default('0')]), anzahl113(Anzahl113, [default('0')]), anzahl114(Anzahl114, [default('0')]), 
  anzahl115(Anzahl115, [default('0')]), anzahl116(Anzahl116, [default('0')]), anzahl117(Anzahl117, [default('0')]), 
  anzahl118(Anzahl118, [default('0')]), anzahl119(Anzahl119, [default('0')]), anzahl120(Anzahl120, [default('0')]), 
  anzahl121(Anzahl121, [default('0')]), anzahl122(Anzahl122, [default('0')]), anzahl123(Anzahl123, [default('0')]), 
  anzahl124(Anzahl124, [default('0')]), anzahl125(Anzahl125, [default('0')]), anzahl126(Anzahl126, [default('0')]), 
  anzahl127(Anzahl127, [default('0')]), anzahl128(Anzahl128, [default('0')]), anzahl129(Anzahl129, [default('0')]), 
  anzahl130(Anzahl130, [default('0')]), anzahl131(Anzahl131, [default('0')]), anzahl132(Anzahl132, [default('0')]),
  anzahl133(Anzahl133, [default('0')]), anzahl134(Anzahl134, [default('0')]), anzahl135(Anzahl135, [default('0')]),
  anzahl136(Anzahl136, [default('0')]),
  dauer1(Dauer1, [default('0')]), dauer2(Dauer2, [default('0')]), dauer3(Dauer3, [default('0')]), 
  dauer4(Dauer4, [default('0')]), dauer5(Dauer5, [default('0')]), dauer6(Dauer6, [default('0')]), 
  dauer7(Dauer7, [default('0')]), dauer8(Dauer8, [default('0')]), dauer9(Dauer9, [default('0')]), 
  dauer10(Dauer10, [default('0')]), dauer11(Dauer11, [default('0')]), dauer12(Dauer12, [default('0')]), 
  dauer13(Dauer13, [default('0')]), dauer14(Dauer14, [default('0')]), dauer15(Dauer15, [default('0')]), 
  dauer16(Dauer16, [default('0')]), dauer17(Dauer17, [default('0')]), dauer18(Dauer18, [default('0')]), 
  dauer19(Dauer19, [default('0')]), dauer20(Dauer20, [default('0')]), dauer21(Dauer21, [default('0')]), 
  dauer22(Dauer22, [default('0')]), dauer23(Dauer23, [default('0')]), dauer24(Dauer24, [default('0')]), 
  dauer25(Dauer25, [default('0')]), dauer26(Dauer26, [default('0')]), dauer27(Dauer27, [default('0')]), 
  dauer28(Dauer28, [default('0')]), dauer29(Dauer29, [default('0')]), dauer30(Dauer30, [default('0')]), 
  dauer31(Dauer31, [default('0')]), dauer32(Dauer32, [default('0')]), dauer33(Dauer33, [default('0')]), 
  dauer34(Dauer34, [default('0')]), dauer35(Dauer35, [default('0')]), dauer36(Dauer36, [default('0')]), 
  dauer37(Dauer37, [default('0')]), dauer38(Dauer38, [default('0')]), dauer39(Dauer39, [default('0')]), 
  dauer40(Dauer40, [default('0')]), dauer41(Dauer41, [default('0')]), dauer42(Dauer42, [default('0')]), 
  dauer43(Dauer43, [default('0')]), dauer44(Dauer44, [default('0')]), dauer45(Dauer45, [default('0')]), 
  dauer46(Dauer46, [default('0')]), dauer47(Dauer47, [default('0')]), dauer48(Dauer48, [default('0')]), 
  dauer49(Dauer49, [default('0')]), dauer50(Dauer50, [default('0')]), dauer51(Dauer51, [default('0')]), 
  dauer52(Dauer52, [default('0')]), dauer53(Dauer53, [default('0')]), dauer54(Dauer54, [default('0')]), 
  dauer55(Dauer55, [default('0')]), dauer56(Dauer56, [default('0')]), dauer57(Dauer57, [default('0')]), 
  dauer58(Dauer58, [default('0')]), dauer59(Dauer59, [default('0')]), dauer60(Dauer60, [default('0')]), 
  dauer61(Dauer61, [default('0')]), dauer62(Dauer62, [default('0')]), dauer63(Dauer63, [default('0')]), 
  dauer64(Dauer64, [default('0')]), dauer65(Dauer65, [default('0')]), dauer66(Dauer66, [default('0')]), 
  dauer67(Dauer67, [default('0')]), dauer68(Dauer68, [default('0')]), dauer69(Dauer69, [default('0')]), 
  dauer70(Dauer70, [default('0')]), dauer71(Dauer71, [default('0')]), dauer72(Dauer72, [default('0')]), 
  dauer73(Dauer73, [default('0')]), dauer74(Dauer74, [default('0')]), dauer75(Dauer75, [default('0')]), 
  dauer76(Dauer76, [default('0')]), dauer77(Dauer77, [default('0')]), dauer78(Dauer78, [default('0')]), 
  dauer79(Dauer79, [default('0')]), dauer80(Dauer80, [default('0')]), dauer81(Dauer81, [default('0')]), 
  dauer82(Dauer82, [default('0')]), dauer83(Dauer83, [default('0')]), dauer84(Dauer84, [default('0')]), 
  dauer85(Dauer85, [default('0')]), dauer86(Dauer86, [default('0')]), dauer87(Dauer87, [default('0')]), 
  dauer88(Dauer88, [default('0')]), dauer89(Dauer89, [default('0')]), dauer90(Dauer90, [default('0')]), 
  dauer91(Dauer91, [default('0')]), dauer92(Dauer92, [default('0')]), dauer93(Dauer93, [default('0')]), 
  dauer94(Dauer94, [default('0')]), dauer95(Dauer95, [default('0')]), dauer96(Dauer96, [default('0')]), 
  dauer97(Dauer97, [default('0')]), dauer98(Dauer98, [default('0')]), dauer99(Dauer99, [default('0')]), 
  dauer100(Dauer100, [default('0')]), dauer101(Dauer101, [default('0')]), dauer102(Dauer102, [default('0')]), 
  dauer103(Dauer103, [default('0')]), dauer104(Dauer104, [default('0')]), dauer105(Dauer105, [default('0')]), 
  dauer106(Dauer106, [default('0')]), dauer107(Dauer107, [default('0')]), dauer108(Dauer108, [default('0')]), 
  dauer109(Dauer109, [default('0')]), dauer110(Dauer110, [default('0')]), dauer111(Dauer111, [default('0')]), 
  dauer112(Dauer112, [default('0')]), dauer113(Dauer113, [default('0')]), dauer114(Dauer114, [default('0')]), 
  dauer115(Dauer115, [default('0')]), dauer116(Dauer116, [default('0')]), dauer117(Dauer117, [default('0')]), 
  dauer118(Dauer118, [default('0')]), dauer119(Dauer119, [default('0')]), dauer120(Dauer120, [default('0')]), 
  dauer121(Dauer121, [default('0')]), dauer122(Dauer122, [default('0')]), dauer123(Dauer123, [default('0')]), 
  dauer124(Dauer124, [default('0')]), dauer125(Dauer125, [default('0')]), dauer126(Dauer126, [default('0')]), 
  dauer127(Dauer127, [default('0')]), dauer128(Dauer128, [default('0')]), dauer129(Dauer129, [default('0')]), 
  dauer130(Dauer130, [default('0')]), dauer131(Dauer131, [default('0')]), dauer132(Dauer132, [default('0')]),
  dauer133(Dauer133, [default('0')]), dauer134(Dauer134, [default('0')]), dauer135(Dauer135, [default('0')]),
  dauer136(Dauer136, [default('0')]),
  gebinde1(Gebinde1, [default('0')]), gebinde2(Gebinde2, [default('0')]), gebinde3(Gebinde3, [default('0')]), 
  gebinde4(Gebinde4, [default('0')]), gebinde5(Gebinde5, [default('0')]), gebinde6(Gebinde6, [default('0')]), 
  gebinde7(Gebinde7, [default('0')]), gebinde8(Gebinde8, [default('0')]), gebinde9(Gebinde9, [default('0')]), 
  gebinde10(Gebinde10, [default('0')]), gebinde11(Gebinde11, [default('0')]), gebinde12(Gebinde12, [default('0')]), 
  gebinde13(Gebinde13, [default('0')]), gebinde14(Gebinde14, [default('0')]), gebinde15(Gebinde15, [default('0')]), 
  gebinde16(Gebinde16, [default('0')]), gebinde17(Gebinde17, [default('0')]), gebinde18(Gebinde18, [default('0')]), 
  gebinde19(Gebinde19, [default('0')]), gebinde20(Gebinde20, [default('0')]), gebinde21(Gebinde21, [default('0')]), 
  gebinde22(Gebinde22, [default('0')]), gebinde23(Gebinde23, [default('0')]), gebinde24(Gebinde24, [default('0')]), 
  gebinde25(Gebinde25, [default('0')]), gebinde26(Gebinde26, [default('0')]), gebinde27(Gebinde27, [default('0')]), 
  gebinde28(Gebinde28, [default('0')]), gebinde29(Gebinde29, [default('0')]), gebinde30(Gebinde30, [default('0')]), 
  gebinde31(Gebinde31, [default('0')]), gebinde32(Gebinde32, [default('0')]), gebinde33(Gebinde33, [default('0')]), 
  gebinde34(Gebinde34, [default('0')]), gebinde35(Gebinde35, [default('0')]), gebinde36(Gebinde36, [default('0')]), 
  gebinde37(Gebinde37, [default('0')]), gebinde38(Gebinde38, [default('0')]), gebinde39(Gebinde39, [default('0')]), 
  gebinde40(Gebinde40, [default('0')]), gebinde41(Gebinde41, [default('0')]), gebinde42(Gebinde42, [default('0')]), 
  gebinde43(Gebinde43, [default('0')]), gebinde44(Gebinde44, [default('0')]), gebinde45(Gebinde45, [default('0')]), 
  gebinde46(Gebinde46, [default('0')]), gebinde47(Gebinde47, [default('0')]), gebinde48(Gebinde48, [default('0')]), 
  gebinde49(Gebinde49, [default('0')]), gebinde50(Gebinde50, [default('0')]), gebinde51(Gebinde51, [default('0')]), 
  gebinde52(Gebinde52, [default('0')]), gebinde53(Gebinde53, [default('0')]), gebinde54(Gebinde54, [default('0')]), 
  gebinde55(Gebinde55, [default('0')]), gebinde56(Gebinde56, [default('0')]), gebinde57(Gebinde57, [default('0')]), 
  gebinde58(Gebinde58, [default('0')]), gebinde59(Gebinde59, [default('0')]), gebinde60(Gebinde60, [default('0')]), 
  gebinde61(Gebinde61, [default('0')]), gebinde62(Gebinde62, [default('0')]), gebinde63(Gebinde63, [default('0')]), 
  gebinde64(Gebinde64, [default('0')]), gebinde65(Gebinde65, [default('0')]), gebinde66(Gebinde66, [default('0')]), 
  gebinde67(Gebinde67, [default('0')]), gebinde68(Gebinde68, [default('0')]), gebinde69(Gebinde69, [default('0')]), 
  gebinde70(Gebinde70, [default('0')]), gebinde71(Gebinde71, [default('0')]), gebinde72(Gebinde72, [default('0')]), 
  gebinde73(Gebinde73, [default('0')]), gebinde74(Gebinde74, [default('0')]), gebinde75(Gebinde75, [default('0')]), 
  gebinde76(Gebinde76, [default('0')]), gebinde77(Gebinde77, [default('0')]), gebinde78(Gebinde78, [default('0')]), 
  gebinde79(Gebinde79, [default('0')]), gebinde80(Gebinde80, [default('0')]), gebinde81(Gebinde81, [default('0')]), 
  gebinde82(Gebinde82, [default('0')]), gebinde83(Gebinde83, [default('0')]), gebinde84(Gebinde84, [default('0')]), 
  gebinde85(Gebinde85, [default('0')]), gebinde86(Gebinde86, [default('0')]), gebinde87(Gebinde87, [default('0')]), 
  gebinde88(Gebinde88, [default('0')]), gebinde89(Gebinde89, [default('0')]), gebinde90(Gebinde90, [default('0')]), 
  gebinde91(Gebinde91, [default('0')]), gebinde92(Gebinde92, [default('0')]), gebinde93(Gebinde93, [default('0')]), 
  gebinde94(Gebinde94, [default('0')]), gebinde95(Gebinde95, [default('0')]), gebinde96(Gebinde96, [default('0')]), 
  gebinde97(Gebinde97, [default('0')]), gebinde98(Gebinde98, [default('0')]), gebinde99(Gebinde99, [default('0')]), 
  gebinde100(Gebinde100, [default('0')]), gebinde101(Gebinde101, [default('0')]), gebinde102(Gebinde102, [default('0')]), 
  gebinde103(Gebinde103, [default('0')]), gebinde104(Gebinde104, [default('0')]), gebinde105(Gebinde105, [default('0')]), 
  gebinde106(Gebinde106, [default('0')]), gebinde107(Gebinde107, [default('0')]), gebinde108(Gebinde108, [default('0')]), 
  gebinde109(Gebinde109, [default('0')]), gebinde110(Gebinde110, [default('0')]), gebinde111(Gebinde111, [default('0')]), 
  gebinde112(Gebinde112, [default('0')]), gebinde113(Gebinde113, [default('0')]), gebinde114(Gebinde114, [default('0')]), 
  gebinde115(Gebinde115, [default('0')]), gebinde116(Gebinde116, [default('0')]), gebinde117(Gebinde117, [default('0')]), 
  gebinde118(Gebinde118, [default('0')]), gebinde119(Gebinde119, [default('0')]), gebinde120(Gebinde120, [default('0')]), 
  gebinde121(Gebinde121, [default('0')]), gebinde122(Gebinde122, [default('0')]), gebinde123(Gebinde123, [default('0')]), 
  gebinde124(Gebinde124, [default('0')]), gebinde125(Gebinde125, [default('0')]), gebinde126(Gebinde126, [default('0')]), 
  gebinde127(Gebinde127, [default('0')]), gebinde128(Gebinde128, [default('0')]), gebinde129(Gebinde129, [default('0')]), 
  gebinde130(Gebinde130, [default('0')]), gebinde131(Gebinde131, [default('0')]), gebinde132(Gebinde132, [default('0')]),
  gebinde133(Gebinde133, [default('0')]), gebinde134(Gebinde134, [default('0')]), gebinde135(Gebinde135, [default('0')]),
  gebinde136(Gebinde136, [default('0')])
],

http_parameters(Request, List),
VarValueList = [AuswahlSystem, AuswahlPlanet, 
  AuswahlRohStoff1, AuswahlRohStoff2, AuswahlRohStoff3, AuswahlRohStoff4, AuswahlRohStoff5, AuswahlRohStoff6, AuswahlRohStoff7, 
  AuswahlRohStoff8, AuswahlRohStoff9, AuswahlRohStoff10, AuswahlRohStoff11, AuswahlRohStoff12, AuswahlRohStoff13, AuswahlRohStoff14, 
  AuswahlRohStoff15, AuswahlRohStoff16, AuswahlRohStoff17, AuswahlRohStoff18, AuswahlRohStoff19, AuswahlRohStoff20, AuswahlRohStoff21, 
  AuswahlRohStoff22, AuswahlRohStoff23, AuswahlRohStoff24, AuswahlRohStoff25, AuswahlRohStoff26, AuswahlRohStoff27, AuswahlRohStoff28, 
  AuswahlRohStoff29, AuswahlRohStoff30, AuswahlRohStoff31, AuswahlRohStoff32, AuswahlRohStoff33, AuswahlRohStoff34, AuswahlRohStoff35, 
  AuswahlRohStoff36, AuswahlRohStoff37, AuswahlRohStoff38, AuswahlRohStoff39, AuswahlRohStoff40, AuswahlRohStoff41, AuswahlRohStoff42, 
  AuswahlRohStoff43, AuswahlRohStoff44, AuswahlRohStoff45, AuswahlRohStoff46, AuswahlRohStoff47, AuswahlRohStoff48, AuswahlRohStoff49, 
  AuswahlRohStoff50, AuswahlRohStoff51, AuswahlRohStoff52, AuswahlRohStoff53, AuswahlRohStoff54, AuswahlRohStoff55, AuswahlRohStoff56, 
  AuswahlRohStoff57, AuswahlRohStoff58, AuswahlRohStoff59, AuswahlRohStoff60, AuswahlRohStoff61, AuswahlRohStoff62, AuswahlRohStoff63, 
  AuswahlRohStoff64, AuswahlRohStoff65, AuswahlRohStoff66, AuswahlRohStoff67, AuswahlRohStoff68, AuswahlRohStoff69, AuswahlRohStoff70, 
  AuswahlRohStoff71, AuswahlRohStoff72, AuswahlRohStoff73, AuswahlRohStoff74, AuswahlRohStoff75, AuswahlRohStoff76, AuswahlRohStoff77, 
  AuswahlRohStoff78, AuswahlRohStoff79, AuswahlRohStoff80, AuswahlRohStoff81, AuswahlRohStoff82, AuswahlRohStoff83, AuswahlRohStoff84, 
  AuswahlRohStoff85, AuswahlRohStoff86, AuswahlRohStoff87, AuswahlRohStoff88, AuswahlRohStoff89, AuswahlRohStoff90, AuswahlRohStoff91, 
  AuswahlRohStoff92, AuswahlRohStoff93, AuswahlRohStoff94, AuswahlRohStoff95, AuswahlRohStoff96, AuswahlRohStoff97, AuswahlRohStoff98, 
  AuswahlRohStoff99, AuswahlRohStoff100, AuswahlRohStoff101, AuswahlRohStoff102, AuswahlRohStoff103, AuswahlRohStoff104, 
  AuswahlRohStoff105, AuswahlRohStoff106, AuswahlRohStoff107, AuswahlRohStoff108, AuswahlRohStoff109, AuswahlRohStoff110, 
  AuswahlRohStoff111, AuswahlRohStoff112, AuswahlRohStoff113, AuswahlRohStoff114, AuswahlRohStoff115, AuswahlRohStoff116, 
  AuswahlRohStoff117, AuswahlRohStoff118, AuswahlRohStoff119, AuswahlRohStoff120, AuswahlRohStoff121, AuswahlRohStoff122, 
  AuswahlRohStoff123, AuswahlRohStoff124, AuswahlRohStoff125, AuswahlRohStoff126, AuswahlRohStoff127, AuswahlRohStoff128, 
  AuswahlRohStoff129, AuswahlRohStoff130,  AuswahlRohStoff131, AuswahlRohStoff132, AuswahlRohStoff133, AuswahlRohStoff134,
  AuswahlRohStoff135, AuswahlRohStoff136,
  Methode1, Methode2, Methode3, Methode4, Methode5, Methode6, Methode7, Methode8, Methode9, Methode10, Methode11, Methode12, Methode13, 
  Methode14, Methode15, Methode16, Methode17, Methode18, Methode19, Methode20, Methode21, Methode22, Methode23, Methode24, Methode25, 
  Methode26, Methode27, Methode28, Methode29, Methode30, Methode31, Methode32, Methode33, Methode34, Methode35, Methode36, Methode37, 
  Methode38, Methode39, Methode40, Methode41, Methode42, Methode43, Methode44, Methode45, Methode46, Methode47, Methode48, Methode49, 
  Methode50, Methode51, Methode52, Methode53, Methode54, Methode55, Methode56, Methode57, Methode58, Methode59, Methode60, Methode61, 
  Methode62, Methode63, Methode64, Methode65, Methode66, Methode67, Methode68, Methode69, Methode70, Methode71, Methode72, Methode73, 
  Methode74, Methode75, Methode76, Methode77, Methode78, Methode79, Methode80, Methode81, Methode82, Methode83, Methode84, Methode85, 
  Methode86, Methode87, Methode88, Methode89, Methode90, Methode91, Methode92, Methode93, Methode94, Methode95, Methode96, Methode97, 
  Methode98, Methode99, Methode100, Methode101, Methode102, Methode103, Methode104, Methode105, Methode106, Methode107, Methode108, 
  Methode109, Methode110, Methode111, Methode112, Methode113, Methode114, Methode115, Methode116, Methode117, Methode118, Methode119, 
  Methode120, Methode121, Methode122, Methode123, Methode124, Methode125, Methode126, Methode127, Methode128, Methode129, Methode130, 
  Methode131, Methode132, Methode133, Methode134, Methode135, Methode136, 
  Anzahl1, Anzahl2, Anzahl3, Anzahl4, Anzahl5, Anzahl6, Anzahl7, Anzahl8, Anzahl9, Anzahl10, Anzahl11, Anzahl12, Anzahl13, Anzahl14, 
  Anzahl15, Anzahl16, Anzahl17, Anzahl18, Anzahl19, Anzahl20, Anzahl21, Anzahl22, Anzahl23, Anzahl24, Anzahl25, Anzahl26, Anzahl27, 
  Anzahl28, Anzahl29, Anzahl30, Anzahl31, Anzahl32, Anzahl33, Anzahl34, Anzahl35, Anzahl36, Anzahl37, Anzahl38, Anzahl39, Anzahl40, 
  Anzahl41, Anzahl42, Anzahl43, Anzahl44, Anzahl45, Anzahl46, Anzahl47, Anzahl48, Anzahl49, Anzahl50, Anzahl51, Anzahl52, Anzahl53, 
  Anzahl54, Anzahl55, Anzahl56, Anzahl57, Anzahl58, Anzahl59, Anzahl60, Anzahl61, Anzahl62, Anzahl63, Anzahl64, Anzahl65, Anzahl66, 
  Anzahl67, Anzahl68, Anzahl69, Anzahl70, Anzahl71, Anzahl72, Anzahl73, Anzahl74, Anzahl75, Anzahl76, Anzahl77, Anzahl78, Anzahl79, 
  Anzahl80, Anzahl81, Anzahl82, Anzahl83, Anzahl84, Anzahl85, Anzahl86, Anzahl87, Anzahl88, Anzahl89, Anzahl90, Anzahl91, Anzahl92, 
  Anzahl93, Anzahl94, Anzahl95, Anzahl96, Anzahl97, Anzahl98, Anzahl99, Anzahl100, Anzahl101, Anzahl102, Anzahl103, Anzahl104, Anzahl105, 
  Anzahl106, Anzahl107, Anzahl108, Anzahl109, Anzahl110, Anzahl111, Anzahl112, Anzahl113, Anzahl114, Anzahl115, Anzahl116, Anzahl117, 
  Anzahl118, Anzahl119, Anzahl120, Anzahl121, Anzahl122, Anzahl123, Anzahl124, Anzahl125, Anzahl126, Anzahl127, Anzahl128, Anzahl129, 
  Anzahl130, Anzahl131, Anzahl132, Anzahl133, Anzahl134, Anzahl135, Anzahl136, 
  Dauer1, Dauer2, Dauer3, Dauer4, Dauer5, Dauer6, Dauer7, Dauer8, Dauer9, Dauer10, Dauer11, Dauer12, Dauer13, Dauer14, Dauer15, Dauer16, 
  Dauer17, Dauer18, Dauer19, Dauer20, Dauer21, Dauer22, Dauer23, Dauer24, Dauer25, Dauer26, Dauer27, Dauer28, Dauer29, Dauer30, Dauer31, 
  Dauer32, Dauer33, Dauer34, Dauer35, Dauer36, Dauer37, Dauer38, Dauer39, Dauer40, Dauer41, Dauer42, Dauer43, Dauer44, Dauer45, Dauer46, 
  Dauer47, Dauer48, Dauer49, Dauer50, Dauer51, Dauer52, Dauer53, Dauer54, Dauer55, Dauer56, Dauer57, Dauer58, Dauer59, Dauer60, Dauer61, 
  Dauer62, Dauer63, Dauer64, Dauer65, Dauer66, Dauer67, Dauer68, Dauer69, Dauer70, Dauer71, Dauer72, Dauer73, Dauer74, Dauer75, Dauer76, 
  Dauer77, Dauer78, Dauer79, Dauer80, Dauer81, Dauer82, Dauer83, Dauer84, Dauer85, Dauer86, Dauer87, Dauer88, Dauer89, Dauer90, Dauer91, 
  Dauer92, Dauer93, Dauer94, Dauer95, Dauer96, Dauer97, Dauer98, Dauer99, Dauer100, Dauer101, Dauer102, Dauer103, Dauer104, Dauer105, 
  Dauer106, Dauer107, Dauer108, Dauer109, Dauer110, Dauer111, Dauer112, Dauer113, Dauer114, Dauer115, Dauer116, Dauer117, Dauer118, 
  Dauer119, Dauer120, Dauer121, Dauer122, Dauer123, Dauer124, Dauer125, Dauer126, Dauer127, Dauer128, Dauer129, Dauer130, Dauer131, 
  Dauer132, Dauer133, Dauer134, Dauer135, Dauer136, 
  Gebinde1, Gebinde2, Gebinde3, Gebinde4, Gebinde5, Gebinde6, Gebinde7, Gebinde8, Gebinde9, Gebinde10, Gebinde11, Gebinde12, Gebinde13, 
  Gebinde14, Gebinde15, Gebinde16, Gebinde17, Gebinde18, Gebinde19, Gebinde20, Gebinde21, Gebinde22, Gebinde23, Gebinde24, Gebinde25, 
  Gebinde26, Gebinde27, Gebinde28, Gebinde29, Gebinde30, Gebinde31, Gebinde32, Gebinde33, Gebinde34, Gebinde35, Gebinde36, Gebinde37, 
  Gebinde38, Gebinde39, Gebinde40, Gebinde41, Gebinde42, Gebinde43, Gebinde44, Gebinde45, Gebinde46, Gebinde47, Gebinde48, Gebinde49, 
  Gebinde50, Gebinde51, Gebinde52, Gebinde53, Gebinde54, Gebinde55, Gebinde56, Gebinde57, Gebinde58, Gebinde59, Gebinde60, Gebinde61, 
  Gebinde62, Gebinde63, Gebinde64, Gebinde65, Gebinde66, Gebinde67, Gebinde68, Gebinde69, Gebinde70, Gebinde71, Gebinde72, Gebinde73, 
  Gebinde74, Gebinde75, Gebinde76, Gebinde77, Gebinde78, Gebinde79, Gebinde80, Gebinde81, Gebinde82, Gebinde83, Gebinde84, Gebinde85, 
  Gebinde86, Gebinde87, Gebinde88, Gebinde89, Gebinde90, Gebinde91, Gebinde92, Gebinde93, Gebinde94, Gebinde95, Gebinde96, Gebinde97, 
  Gebinde98, Gebinde99, Gebinde100, Gebinde101, Gebinde102, Gebinde103, Gebinde104, Gebinde105, Gebinde106, Gebinde107, Gebinde108, 
  Gebinde109, Gebinde110, Gebinde111, Gebinde112, Gebinde113, Gebinde114, Gebinde115, Gebinde116, Gebinde117, Gebinde118, Gebinde119, 
  Gebinde120, Gebinde121, Gebinde122, Gebinde123, Gebinde124, Gebinde125, Gebinde126, Gebinde127, Gebinde128, Gebinde129, Gebinde130,
  Gebinde131, Gebinde132, Gebinde133, Gebinde134, Gebinde135, Gebinde136
].
