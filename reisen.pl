:- module(reisen, [bildeReiseZeiten/2]).

bildeReiseZeiten(Vorgaenge, ReiseZeit) :-
	findall(Operation1, (member(Vorgang, Vorgaenge), operation(Vorgang, Operation1)), Operationen1),
	list_to_set(Operationen1, Operationen2),
	findall(EinzelZeit, (member(Operation2, Operationen2), reisen(Operation2, EinzelZeit, _)), EinzelZeiten),
	sum_list(EinzelZeiten, ReiseZeit).

operation(Vorgang, Operation) :-
	Vorgang = [_, [Operation1, _], _, _],
	(Operation1 = minenLaserNutzen; Operation1 = verbessertenMinenLaserNutzen; Operation1 = pfluecken),
	Operation = zumWald,
	!.
	
operation(Vorgang, Operation) :-
	Vorgang = [_, [Operation1, _], _, _],
	Operation = Operation1.
	
reisen(Nach, Zeit, Kosten) :-
	Nach = raumSchuerfen,
	Kosten = 496, /* Sprit für Startschubduesen mit effiziente Düsen gefuellt 496 mit Uran, 450 mit raumSchiffStartTreibStoff (+- gekauft), 2060 mit gebautem raumSchiffStartTreibStoff */
	laufZeit(piseidBase, flieger, HinZeit),
	flugZeit(piseidBase, raumSchuerfen, FlugZeit),
	Zeit is 2 * (HinZeit + FlugZeit),
	!.

reisen(Nach, Zeit, Kosten) :-
	Nach = zumWald,
	laufZeit(piseidBase, minenLaserNutzen, HinZeit),
	Zeit is 2 * HinZeit,
    Kosten = 0,
	!.

reisen(Nach, Zeit, Kosten) :-  /* wir gehen davon aus, zur Resourcenansammlung zu laufen */
	Nach = terrainFormerNutzen,
	resourcenAnsammlungSuchen(SuchZeit),
	laufZeit(piseidBase, terrainFormerNutzen, HinZeit),
	Zeit is 2 * HinZeit + SuchZeit,
	Kosten = 0,
	!.

reisen(Nach, Zeit, Kosten) :-
	Nach = herstellen,
	Zeit = 0,
	Kosten = 0,
	!.

reisen(Nach, Zeit, Kosten) :-
	Nach = erkaempfen,
	Zeit = 0 ,
	Kosten = 0,
	!.

reisen(Nach, Zeit, Kosten) :-
	Nach = raffinieren,
	laufZeit(piseidBase, Nach, HinZeit),
	Zeit is 2 * HinZeit,
	Kosten = 0,
	!.
    
/* kaufen mit Teleportreise Raumstation */	
reisen(Nach, Zeit, Kosten) :-
	kaufen:terminal(_, raumStation, Nach),
	laufZeit(piseidBase, gate, ZumGate),
	laufZeit(Nach, gate, HinZeit),
	teleportZeit(PortZeit),
	terminalOeffnen(OeffnenZeit),
	Zeit is 2 * (ZumGate + HinZeit) + OeffnenZeit + PortZeit,
	Kosten = 0,
	!.

/* kaufen mit flug gleicher Planet */
/* kaufen mit flug anderer Planet, gleiches System */
/* kaufen mit flug anderer Planet, anderes System, mit Teleport */
/* kaufen mit flug anderer Planet, anderes System, mit Warp */

/* Nebenzeiten */
laufZeit(terminal_9_6_W, gate, 600).
laufZeit(terminal_13H_9, gate, 600).
laufZeit(terminal_R_44A_DQ0, gate, 600).
laufZeit(terminal_60O_Q, gate, 600).
laufZeit(terminal_4W78_3, gate, 600).
laufZeit(terminal_1_US4, gate, 600).

laufZeit(piseidBase, gate, 600).
laufZeit(piseidBase, raffinieren, 450).
laufZeit(piseidBase, minenLaserNutzen, 2500).
laufZeit(piseidBase, flieger, 800).

laufZeit(A, B) :-
	laufZeit(B, A).

flugZeit(piseidBase, raumSchuerfen, 4500).

teleportZeit(3880).
resourcenAnsammlungSuchen(800).
terminalOeffnen(980).
