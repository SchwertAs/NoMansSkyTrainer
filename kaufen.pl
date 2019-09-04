:- module(kaufen, [kaufen/4, terminal/3, kaufbar/3]).

/* System, Planet, TerminalId*/
terminal(nogiazusk, raumStation, terminal_9_6_W).
terminal(noaklaXVI, raumStation, terminalR_44A_DQ0).
terminal(ceksionar, raumStation, terminal_60O_Q).
terminal(nogiazusk, raumStation, terminal_13H_9).
terminal(kourneLigr, raumStation, terminal_4W78_3).
terminal(kourneLigr, raumStation, terminal_1_US4).

/* System, Terminal, Stoff, Preis */
kaufbar(terminal_9_6_W, ammoniak, 79).
kaufbar(terminal_9_6_W, chromatischesMetall, 319).
kaufbar(terminal_9_6_W, diWasserStoffGelee, 242). 
kaufbar(terminal_9_6_W, experimentelleEnergieFluessigkeit, 0).
kaufbar(terminal_9_6_W, ferritStaub, 17).
kaufbar(terminal_9_6_W, instabilesPlasma, 6999).
kaufbar(terminal_9_6_W, ionenAkku, 244).
kaufbar(terminal_9_6_W, kobalt, 245).
kaufbar(terminal_9_6_W, lemmium, 38435).
kaufbar(terminal_9_6_W, magnoGold, 34177).
kaufbar(terminal_9_6_W, metallPlatten, 956).
kaufbar(terminal_9_6_W, mikroProzessor, 19000).
kaufbar(terminal_9_6_W, natrium, 51).
kaufbar(terminal_9_6_W, natriumNitrat, 101).
kaufbar(terminal_9_6_W, nichtMehrDuftendePheromonFlasche, 857).
kaufbar(terminal_9_6_W, restSubstanz, 25).
kaufbar(terminal9_6_W, sauerStoff, 42).
kaufbar(terminal9_6_W,sauerStoffKapsel, 395).
kaufbar(terminal9_6_W, silber, 133).
kaufbar(terminal9_6_W, technologieModul, 59345).

kaufbar(terminalR_44A_DQ0, ammoniak, 81).
kaufbar(terminalR_44A_DQ0, chlor, 711).
kaufbar(terminalR_44A_DQ0, chromatischesMetall, 307).
kaufbar(terminalR_44A_DQ0, ferritStaub, 17).
kaufbar(terminalR_44A_DQ0, instabilesPlasma, 6737).
kaufbar(terminalR_44A_DQ0, ionenAkku, 252).
kaufbar(terminalR_44A_DQ0, kobalt, 243).
kaufbar(terminalR_44A_DQ0, kobaltSpiegel, 23899).
kaufbar(terminalR_44A_DQ0, metallPlatten, 946).
kaufbar(terminalR_44A_DQ0, mikroProzessor, 19000).
kaufbar(terminalR_44A_DQ0, natrium, 54).
kaufbar(terminalR_44A_DQ0, natriumDiode, 4042).
kaufbar(terminalR_44A_DQ0, nichtMehrDuftendePheromonFlasche, 718).
kaufbar(terminalR_44A_DQ0, sauerStoff, 41).
kaufbar(terminalR_44A_DQ0,sauerStoffKapsel, 398).
kaufbar(terminalR_44A_DQ0, silber, 134).
kaufbar(terminalR_44A_DQ0, technologieModul, 59241).

kaufbar(terminal_60O_Q, ferritStaub, 17).
kaufbar(terminal_60O_Q, funkenKanister, 929).
kaufbar(terminal_60O_Q, fusionsKern, 52168).
kaufbar(terminal_60O_Q, hermetischeSiegel, 935).
kaufbar(terminal_60O_Q, gold, 256).
kaufbar(terminal_60O_Q, industrieBatterie, 5768).
kaufbar(terminal_60O_Q, instabilesPlasma, 6690).
kaufbar(terminal_60O_Q, ionenAkku, 235).
kaufbar(terminal_60O_Q, kobalt, 242).
kaufbar(terminal_60O_Qionar, metallPlatten, 944).
kaufbar(terminal_60O_Q, mikroProzessor, 19000).
kaufbar(terminal_60O_Q, natrium, 51).
kaufbar(terminal_60O_Q, ohmschesGel, 14862).
kaufbar(terminal_60O_Q, pugneum, 168). 
kaufbar(terminal_60O_Q, sauerStoff, 41).
kaufbar(terminal_60O_Q,sauerStoffKapsel, 421).
kaufbar(terminal_60O_Q, technologieModul, 57069).
kaufbar(terminal_60O_Q, verrostetesMetall, 24).

kaufbar(terminal_13H_9, nichtMehrDuftendePheromonFlasche, 463).
kaufbar(terminal_13H_9, neutronenMikroskop, 3440).
kaufbar(terminal_13H_9, mikroProzessor, 19000).
kaufbar(terminal_13H_9, sauerStoffKapsel, 432).
kaufbar(terminal_13H_9, instabilesPlasma, 6862).
kaufbar(terminal_13H_9, ionenAkku, 254).
kaufbar(terminal_13H_9, ferritStaub, 17).
kaufbar(terminal_13H_9, kobalt, 241).
kaufbar(terminal_13H_9, sauerStoff, 43).
kaufbar(terminal_13H_9, natrium, 52).
kaufbar(terminal_13H_9, metallPlatten, 921).
kaufbar(terminal_13H_9, raumSchiffStartTreibStoff, 41496).
kaufbar(terminal_13H_9, pyrit, 76).
kaufbar(terminal_13H_9, chlor, 736).

kaufbar(terminal_4W78_3, nichtMehrDuftendePheromonFlasche, 946).
kaufbar(terminal_4W78_3, neutronenMikroskop, 5844).
kaufbar(terminal_4W78_3, instabiltitaetsInjektor, 15210).
kaufbar(terminal_4W78_3, technologieModul, 60379).
kaufbar(terminal_4W78_3, sauerStoffKapsel, 416).
kaufbar(terminal_4W78_3, instabilesPlasma, 6821).
kaufbar(terminal_4W78_3, ferritStaub, 16).
kaufbar(terminal_4W78_3, kobalt, 245).
kaufbar(terminal_4W78_3, sauerStoff, 41).
kaufbar(terminal_4W78_3, natrium, 52).
kaufbar(terminal_4W78_3, sauerStoffFilter, 1726).
kaufbar(terminal_4W78_3, kohlenStoffNanoRohr, 573).
kaufbar(terminal_4W78_3, natriumDiode, 4064).
kaufbar(terminal_4W78_3, metallPlatten, 934).
kaufbar(terminal_4W78_3, ionenAkku, 247).
kaufbar(terminal_4W78_3, mikroProzessor, 19000).
kaufbar(terminal_4W78_3, pugneum, 167).
kaufbar(terminal_4W78_3, ionisiertesKobalt, 483).
kaufbar(terminal_4W78_3, phosphor, 76).
kaufbar(terminal_4W78_3, paraffinium, 77).
kaufbar(terminal_4W78_3, platin, 394).

kaufbar(terminal_1_US4, nichtMehrDuftendePheromonFlasche, 554).
kaufbar(terminal_1_US4, neutronenMikroskop, 3882).
kaufbar(terminal_1_US4, instabiltitaetsInjektor, 11816).
kaufbar(terminal_1_US4, organischeRohre, 26202).
kaufbar(terminal_1_US4, instabilesPlasma, 6926).
kaufbar(terminal_1_US4, ionenAkku, 244).
kaufbar(terminal_1_US4, ferritStaub, 17).
kaufbar(terminal_1_US4, kobalt, 249).
kaufbar(terminal_1_US4, sauerStoff, 42).
kaufbar(terminal_1_US4, natrium, 51).
kaufbar(terminal_1_US4, kobaltSpiegel, 24649).
kaufbar(terminal_1_US4, diWasserStoffGelee, 236).
kaufbar(terminal_1_US4, navigationsDaten, 1195).
kaufbar(terminal_1_US4, metallPlatten, 963).
kaufbar(terminal_1_US4, raumSchiffStartTreibStoff, 45322).
kaufbar(terminal_1_US4, mikroProzessor, 19000).
kaufbar(terminal_1_US4, sauerStoffKapsel, 429).
kaufbar(terminal_1_US4, pyrit, 77).
kaufbar(terminal_1_US4, reinesFerrit, 36).

kaufen(Anzahl, Stoff, Operation, HauptZeit) :-
	spielStatus:spielStatus(torWarpVerfügbar),
	kaufbar(Terminal, Stoff, _), 
	Operation = Terminal,
	HauptZeit is 2415 / Anzahl.


/* TODO verkaufbar mit Werten anlegen */
	
