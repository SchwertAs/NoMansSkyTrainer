:- module(vorfertigen, [vorgefertigeLoesungenErstellen/0, 
                        fertigeLoesung/5]).

:- dynamic(fertigeLoesung/5).
                   
/* Liste der Rohstoffe, die vorgefertigt werden sollen */
vorfertigen(diWasserStoff).
vorfertigen(sauerStoff).
vorfertigen(kupfer).
vorfertigen(pugneum).
vorfertigen(deuterium).
vorfertigen(aktiviertesCadmium).
vorfertigen(aktiviertesEmeril).
vorfertigen(aktiviertesIndium).
vorfertigen(aktiviertesKupfer).
vorfertigen(cadmium).
vorfertigen(emeril).
vorfertigen(indium).
vorfertigen(gammaWurzel).
vorfertigen(natrium).
vorfertigen(kobalt).
vorfertigen(kuerbisKnolle).
vorfertigen(chlor).
vorfertigen(ferritStaub).
vorfertigen(ammoniak).
vorfertigen(kaktusFleisch).
vorfertigen(kohlenStoff).
vorfertigen(faecium).
vorfertigen(tritium).


/* Basis */
vorfertigen(reinesFerrit).
vorfertigen(magnetisiertesFerrit).
vorfertigen(natriumNitrat).
vorfertigen(paraffinium).
vorfertigen(ionisiertesKobalt).
vorfertigen(dioxit). 
vorfertigen(salz).
vorfertigen(phosphor).
vorfertigen(schwefelin).
vorfertigen(radon).
vorfertigen(uran).
vorfertigen(frostKristall).

/* mittlere agglomeration*/
vorfertigen(antiMaterie).
vorfertigen(antiMaterieGehaeuse).
vorfertigen(glas).
vorfertigen(instabilesGel).
vorfertigen(instabilesNatrium).
vorfertigen(kohlenStoffKristall).
vorfertigen(saeure).
vorfertigen(seltenesMetallElement).
vorfertigen(stickStoffSalz).
vorfertigen(superOxidKristall).
vorfertigen(tetraKobalt).
vorfertigen(angereicherterKohlenStoff).

vorfertigen(chlorGitter).
vorfertigen(herox).
vorfertigen(lemmium).
vorfertigen(magnoGold).
vorfertigen(strassenKoeterBronze).
vorfertigen(aronium).
vorfertigen(grantine).

vorfertigen(silber).
vorfertigen(gold).
vorfertigen(pyrit).
vorfertigen(platin).
vorfertigen(chromatischesMetall).

vorfertigen(thermischesKondensat).
vorfertigen(organischerKatalysator).

/* kochen */
vorfertigen(geraeuchertesFleisch).
vorfertigen(geheimnisVollerFleischEintopf).

vorfertigen(immerBrennendeMarmelade).
vorfertigen(schlaengelndeMarmelade).
vorfertigen(kaktusGelee).

vorfertigen(geschlageneButter).
vorfertigen(protoButter).
vorfertigen(verfeinertesMehl).

vorfertigen(klebrigerPudding).
vorfertigen(monstroeserPudding).
vorfertigen(salzigerPudding).

vorfertigen(protoTeig).
vorfertigen(heulenderTeig).
vorfertigen(kuchenTeig).
vorfertigen(dickerSuesserTeig).
vorfertigen(extraFluffigerTeig).
vorfertigen(windenderAufgewuehlterTeig).
vorfertigen(tortenBoden).

vorfertigen(delikatessBaiser).
vorfertigen(klobigerDonut).
vorfertigen(wuerzigerKaese).
vorfertigen(synthetischerHonig).																		
vorfertigen(knusperKaramell).

vorgefertigeLoesungenErstellen :-
	abolish(fertigeLoesung/5),
	forall((spielStatus:planeten(_, System, Planet, _), System \= 'System'), \+alleVorfertigen(System, Planet)).
	
	
alleVorfertigen(System, Planet) :-
	vorfertigen(Stoff),
	debug(myTrace, 'System: ~k Planet: ~k Stoff: ~k startet', [System, Planet, Stoff]),
	\+generiereFertigeLoesungen(System, Planet, Stoff),
	fail.
	
generiereFertigeLoesungen(System, Planet, Stoff) :-
	optimierung:optimierungsZiel(Strategie),
	ignore(retractall(fertigeLoesung(System, Planet, Strategie, Stoff, _))),
	\+suchAlgorithmus:baueFuerVorfertigung(System, Planet, Strategie, 1, Stoff),
	(optimierung:optimierungsStrategie(Strategie, Stoff, _, Vorgaenge, _, _, _, _, _) ->
		assertz(fertigeLoesung(System, Planet, Strategie, Stoff, Vorgaenge));
		assertz(fertigeLoesung(System, Planet, Strategie, Stoff, []))
	),
	debug(myTrace, 'System: ~k Planet: ~k Stoff: ~k Strategie: ~k generiert', [System, Planet, Stoff, Strategie]),
	fail.
                     