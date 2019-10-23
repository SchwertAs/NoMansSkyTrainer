:-module(rezeptBekanntDialogParams, [rezeptBekanntDialogParamList/2]).

:- use_module(library(http/http_parameters)).

baueParameterListen(FeldNrUnten, FeldNrOben, PredListeDanach) :-
	baueParameterListe(FeldNrUnten, FeldNrOben, 'rezept', '[default('''')]', "", PredListeDanach).
	
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
	baueVariablenListe(FeldNrUnten, FeldNrOben, 'rezept', "", ListeDanach).
		
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

rezeptBekanntDialogParamList(Request, VarValueList) :-
	List =
	[ auswahlStoffKlasse(AuswahlStoffKlasse, [length > 0]),
      rezept101(Rezept101, [default('')]), rezept102(Rezept102, [default('')]), 
	  rezept103(Rezept103, [default('')]), rezept104(Rezept104, [default('')]), 
	  rezept105(Rezept105, [default('')]), rezept106(Rezept106, [default('')]), 
	  rezept107(Rezept107, [default('')]), rezept108(Rezept108, [default('')]), 
	  rezept109(Rezept109, [default('')]), rezept110(Rezept110, [default('')]), 
	  rezept111(Rezept111, [default('')]), rezept112(Rezept112, [default('')]), 
	  rezept113(Rezept113, [default('')]), rezept114(Rezept114, [default('')]), 
	  rezept115(Rezept115, [default('')]), rezept116(Rezept116, [default('')]), 
	  rezept117(Rezept117, [default('')]), rezept118(Rezept118, [default('')]), 
	  rezept119(Rezept119, [default('')]), rezept120(Rezept120, [default('')]), 
	  rezept121(Rezept121, [default('')]),
	  rezept201(Rezept201, [default('')]), rezept202(Rezept202, [default('')]), 
	  rezept203(Rezept203, [default('')]), rezept204(Rezept204, [default('')]), 
	  rezept205(Rezept205, [default('')]), rezept206(Rezept206, [default('')]), 
	  rezept207(Rezept207, [default('')]), rezept208(Rezept208, [default('')]), 
	  rezept209(Rezept209, [default('')]), rezept210(Rezept210, [default('')]), 
	  rezept211(Rezept211, [default('')]), rezept212(Rezept212, [default('')]), 
	  rezept213(Rezept213, [default('')]), rezept214(Rezept214, [default('')]), 
	  rezept215(Rezept215, [default('')]), rezept216(Rezept216, [default('')]), 
	  rezept217(Rezept217, [default('')]), rezept218(Rezept218, [default('')]), 
	  rezept219(Rezept219, [default('')]), rezept220(Rezept220, [default('')]), 
	  rezept221(Rezept221, [default('')]),
	  rezept301(Rezept301, [default('')]), rezept302(Rezept302, [default('')]), 
	  rezept303(Rezept303, [default('')]), rezept304(Rezept304, [default('')]), 
	  rezept305(Rezept305, [default('')]), rezept306(Rezept306, [default('')]), 
	  rezept307(Rezept307, [default('')]), rezept308(Rezept308, [default('')]), 
	  rezept309(Rezept309, [default('')]), rezept310(Rezept310, [default('')]), 
	  rezept311(Rezept311, [default('')]), rezept312(Rezept312, [default('')]), 
	  rezept313(Rezept313, [default('')]), rezept314(Rezept314, [default('')]), 
	  rezept315(Rezept315, [default('')]), rezept316(Rezept316, [default('')]), 
	  rezept317(Rezept317, [default('')]), rezept318(Rezept318, [default('')]), 
	  rezept319(Rezept319, [default('')]), rezept320(Rezept320, [default('')]), 
	  rezept321(Rezept321, [default('')]),
	  rezept401(Rezept401, [default('')]), rezept402(Rezept402, [default('')]), 
	  rezept403(Rezept403, [default('')]), rezept404(Rezept404, [default('')]), 
	  rezept405(Rezept405, [default('')]), rezept406(Rezept406, [default('')]), 
	  rezept407(Rezept407, [default('')]), rezept408(Rezept408, [default('')]), 
	  rezept409(Rezept409, [default('')]), rezept410(Rezept410, [default('')]), 
	  rezept411(Rezept411, [default('')]), rezept412(Rezept412, [default('')]), 
	  rezept413(Rezept413, [default('')]), rezept414(Rezept414, [default('')]), 
	  rezept415(Rezept415, [default('')]), rezept416(Rezept416, [default('')]), 
	  rezept417(Rezept417, [default('')]), rezept418(Rezept418, [default('')]), 
	  rezept419(Rezept419, [default('')]), rezept420(Rezept420, [default('')]), 
	  rezept421(Rezept421, [default('')])
	],
	http_parameters(Request, List),
	VarValueList = [
	 AuswahlStoffKlasse,
	 Rezept101, Rezept102, Rezept103, Rezept104, Rezept105, Rezept106, Rezept107, Rezept108, 
	 Rezept109, Rezept110, Rezept111, Rezept112, Rezept113, Rezept114, Rezept115, Rezept116, 
	 Rezept117, Rezept118, Rezept119, Rezept120, Rezept121,
	 Rezept201, Rezept202, Rezept203, Rezept204, Rezept205, Rezept206, Rezept207, Rezept208, 
	 Rezept209, Rezept210, Rezept211, Rezept212, Rezept213, Rezept214, Rezept215, Rezept216, 
	 Rezept217, Rezept218, Rezept219, Rezept220, Rezept221,
	 Rezept301, Rezept302, Rezept303, Rezept304, Rezept305, Rezept306, Rezept307, Rezept308, 
	 Rezept309, Rezept310, Rezept311, Rezept312, Rezept313, Rezept314, Rezept315, Rezept316, 
	 Rezept317, Rezept318, Rezept319, Rezept320, Rezept321,
	 Rezept401, Rezept402, Rezept403, Rezept404, Rezept405, Rezept406, Rezept407, Rezept408, 
	 Rezept409, Rezept410, Rezept411, Rezept412, Rezept413, Rezept414, Rezept415, Rezept416, 
	 Rezept417, Rezept418, Rezept419, Rezept420, Rezept421
	].	
	