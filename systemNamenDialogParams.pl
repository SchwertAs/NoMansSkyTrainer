:-module(systemNamenDialogParams, [systemNamenDialogParamList/2]).

:- use_module(library(http/http_parameters)).

baueParameterListen(FeldNrUnten, FeldNrOben, PredListeDanach) :-
	baueParameterListe(FeldNrUnten, FeldNrOben, 'systemName', '[default('''')]', "", PredList1),
	baueParameterListe(FeldNrUnten, FeldNrOben, 'farbe', '[length > 0]', "", PredList2),
	
	string_concat(PredList1, ', ', PredListeDanach0),
	string_concat(PredListeDanach0, PredList2, PredListeDanach).
	
baueParameterListe(FeldNrUnten, FeldNrOben, _, _, PredListeBisher, PredListeDanach) :-
	FeldNrUnten > FeldNrOben,
	PredListeDanach = PredListeBisher,
	!.

baueParameterListe(FeldNrUnten, FeldNrOben, FeldNameRumpf, FeldOptionen, PredListeBisher, PredListeDanach) :-
	join_identifier_parts(style(false, false, ''), [FeldNameRumpf, FeldNrUnten], PredName),
	join_identifier_parts(style(true, false, ''), [FeldNameRumpf, FeldNrUnten], VarName),
	(PredListeBisher = "" -> PredName = Pred0; string_concat(', ', PredName,  Pred0)),
	string_concat(Pred0, '(' , Pred1),
	string_concat(Pred1, VarName, Pred2),
	string_concat(Pred2, ', ', Pred3),
	string_concat(Pred3, FeldOptionen, Pred4),
	string_concat(Pred4, ')', Pred5),
	string_concat(PredListeBisher, Pred5, PredListeBisher0),
	FeldNo0 is FeldNrUnten + 1,
	baueParameterListe(FeldNo0, FeldNrOben, FeldNameRumpf, FeldOptionen, PredListeBisher0, PredListeDanach).

baueVariablenListen(FeldNrUnten, FeldNrOben, ListeDanach) :-
	baueVariablenListe(FeldNrUnten, FeldNrOben, 'system', "", VarList1),
	baueVariablenListe(FeldNrUnten, FeldNrOben, 'farbe', "", VarList2),
	string_concat(VarList1, ', ' , Danach0),
	string_concat(Danach0, VarList2 , ListeDanach).
		
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

systemNamenDialogParamList(Request, VarValueList) :-
	List =
	[systemName101(SystemName101, [default('''')]),
	 systemName102(SystemName102, [default('''')]),
	 systemName103(SystemName103, [default('''')]),
	 systemName104(SystemName104, [default('''')]),
	 systemName105(SystemName105, [default('''')]),
	 systemName106(SystemName106, [default('''')]),
	 systemName107(SystemName107, [default('''')]),
	 systemName108(SystemName108, [default('''')]),
	 systemName109(SystemName109, [default('''')]),
	 systemName110(SystemName110, [default('''')]),
	 systemName111(SystemName111, [default('''')]),
	 systemName112(SystemName112, [default('''')]),
	 systemName113(SystemName113, [default('''')]),
	 systemName114(SystemName114, [default('''')]),
	 systemName115(SystemName115, [default('''')]),
	 systemName116(SystemName116, [default('''')]),
	 systemName117(SystemName117, [default('''')]),
	 systemName118(SystemName118, [default('''')]),
	 systemName119(SystemName119, [default('''')]),
	 systemName120(SystemName120, [default('''')]),
	 farbe101(Farbe101, [length > 0]),
	 farbe102(Farbe102, [length > 0]),
	 farbe103(Farbe103, [length > 0]),
	 farbe104(Farbe104, [length > 0]),
	 farbe105(Farbe105, [length > 0]),
	 farbe106(Farbe106, [length > 0]),
	 farbe107(Farbe107, [length > 0]),
	 farbe108(Farbe108, [length > 0]),
	 farbe109(Farbe109, [length > 0]),
	 farbe110(Farbe110, [length > 0]),
	 farbe111(Farbe111, [length > 0]),
	 farbe112(Farbe112, [length > 0]),
	 farbe113(Farbe113, [length > 0]),
	 farbe114(Farbe114, [length > 0]),
	 farbe115(Farbe115, [length > 0]),
	 farbe116(Farbe116, [length > 0]),
	 farbe117(Farbe117, [length > 0]),
	 farbe118(Farbe118, [length > 0]),
	 farbe119(Farbe119, [length > 0]),
	 farbe120(Farbe120, [length > 0]),
	 systemName201(SystemName201, [default('''')]),
	 systemName202(SystemName202, [default('''')]),
	 systemName203(SystemName203, [default('''')]),
	 systemName204(SystemName204, [default('''')]),
	 systemName205(SystemName205, [default('''')]),
	 systemName206(SystemName206, [default('''')]),
	 systemName207(SystemName207, [default('''')]),
	 systemName208(SystemName208, [default('''')]),
	 systemName209(SystemName209, [default('''')]),
	 systemName210(SystemName210, [default('''')]),
	 systemName211(SystemName211, [default('''')]),
	 systemName212(SystemName212, [default('''')]),
	 systemName213(SystemName213, [default('''')]),
	 systemName214(SystemName214, [default('''')]),
	 systemName215(SystemName215, [default('''')]),
	 systemName216(SystemName216, [default('''')]),
	 systemName217(SystemName217, [default('''')]),
	 systemName218(SystemName218, [default('''')]),
	 systemName219(SystemName219, [default('''')]),
	 systemName220(SystemName220, [default('''')]),
	 farbe201(Farbe201, [length > 0]),
	 farbe202(Farbe202, [length > 0]),
	 farbe203(Farbe203, [length > 0]),
	 farbe204(Farbe204, [length > 0]),
	 farbe205(Farbe205, [length > 0]),
	 farbe206(Farbe206, [length > 0]),
	 farbe207(Farbe207, [length > 0]),
	 farbe208(Farbe208, [length > 0]),
	 farbe209(Farbe209, [length > 0]),
	 farbe210(Farbe210, [length > 0]),
	 farbe211(Farbe211, [length > 0]),
	 farbe212(Farbe212, [length > 0]),
	 farbe213(Farbe213, [length > 0]),
	 farbe214(Farbe214, [length > 0]),
	 farbe215(Farbe215, [length > 0]),
	 farbe216(Farbe216, [length > 0]),
	 farbe217(Farbe217, [length > 0]),
	 farbe218(Farbe218, [length > 0]),
	 farbe219(Farbe219, [length > 0]),
	 farbe220(Farbe220, [length > 0]),
	 systemName301(SystemName301, [default('''')]),
	 systemName302(SystemName302, [default('''')]),
	 systemName303(SystemName303, [default('''')]),
	 systemName304(SystemName304, [default('''')]),
	 systemName305(SystemName305, [default('''')]),
	 systemName306(SystemName306, [default('''')]),
	 systemName307(SystemName307, [default('''')]),
	 systemName308(SystemName308, [default('''')]),
	 systemName309(SystemName309, [default('''')]),
	 systemName310(SystemName310, [default('''')]),
	 systemName311(SystemName311, [default('''')]),
	 systemName312(SystemName312, [default('''')]),
	 systemName313(SystemName313, [default('''')]),
	 systemName314(SystemName314, [default('''')]),
	 systemName315(SystemName315, [default('''')]),
	 systemName316(SystemName316, [default('''')]),
	 systemName317(SystemName317, [default('''')]),
	 systemName318(SystemName318, [default('''')]),
	 systemName319(SystemName319, [default('''')]),
	 systemName320(SystemName320, [default('''')]),
	 farbe301(Farbe301, [length > 0]),
	 farbe302(Farbe302, [length > 0]),
	 farbe303(Farbe303, [length > 0]),
	 farbe304(Farbe304, [length > 0]),
	 farbe305(Farbe305, [length > 0]),
	 farbe306(Farbe306, [length > 0]),
	 farbe307(Farbe307, [length > 0]),
	 farbe308(Farbe308, [length > 0]),
	 farbe309(Farbe309, [length > 0]),
	 farbe310(Farbe310, [length > 0]),
	 farbe311(Farbe311, [length > 0]),
	 farbe312(Farbe312, [length > 0]),
	 farbe313(Farbe313, [length > 0]),
	 farbe314(Farbe314, [length > 0]),
	 farbe315(Farbe315, [length > 0]),
	 farbe316(Farbe316, [length > 0]),
	 farbe317(Farbe317, [length > 0]),
	 farbe318(Farbe318, [length > 0]),
	 farbe319(Farbe319, [length > 0]),
	 farbe320(Farbe320, [length > 0])
	],
	http_parameters(Request, List),
	VarValueList = [
	 SystemName101, SystemName102, SystemName103, SystemName104, SystemName105, SystemName106, SystemName107, SystemName108, 
	 SystemName109, SystemName110, SystemName111, SystemName112, SystemName113, SystemName114, SystemName115, SystemName116, 
	 SystemName117, SystemName118, SystemName119, SystemName120, 
	 Farbe101, Farbe102, Farbe103, Farbe104, Farbe105, Farbe106, Farbe107, Farbe108, 
	 Farbe109, Farbe110, Farbe111, Farbe112, Farbe113, Farbe114, Farbe115, Farbe116, 
	 Farbe117, Farbe118, Farbe119, Farbe120,
	 SystemName201, SystemName202, SystemName203, SystemName204, SystemName205, SystemName206, SystemName207, SystemName208, 
	 SystemName209, SystemName210, SystemName211, SystemName212, SystemName213, SystemName214, SystemName215, SystemName216, 
	 SystemName217, SystemName218, SystemName219, SystemName220, 
	 Farbe201, Farbe202, Farbe203, Farbe204, Farbe205, Farbe206, Farbe207, Farbe208, 
	 Farbe209, Farbe210, Farbe211, Farbe212, Farbe213, Farbe214, Farbe215, Farbe216, 
	 Farbe217, Farbe218, Farbe219, Farbe220,
	 SystemName301, SystemName302, SystemName303, SystemName304, SystemName305, SystemName306, SystemName307, SystemName308, 
	 SystemName309, SystemName310, SystemName311, SystemName312, SystemName313, SystemName314, SystemName315, SystemName316, 
	 SystemName317, SystemName318, SystemName319, SystemName320, 
	 Farbe301, Farbe302, Farbe303, Farbe304, Farbe305, Farbe306, Farbe307, Farbe308, 
	 Farbe309, Farbe310, Farbe311, Farbe312, Farbe313, Farbe314, Farbe315, Farbe316, 
	 Farbe317, Farbe318, Farbe319, Farbe320
	].	