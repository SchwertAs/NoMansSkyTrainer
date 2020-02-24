:- module(sammlung, [sammlungInit/0, sammelbarReInit/2, sammlung/8, sammelbar/2, fertigeLoesung/3]).

:- dynamic(sammelbar/2).
:- dynamic(fertigeLoesung/3).
:- dynamic(sammlung/8).
	
baueRezepte :-
	stoff:stoff(bauRezept, Rezept, _),
	assertz(sammlung(0, 'System', 'MeinPlanet', bekannt, Rezept, 0, 0, 0)),
	fail.
		
/* sammlung(<RecordNo>, <System>, <Planet>, <SammelAktion>, <Stoff>, <Hauptzeit>, <Nebenzeit>, <Rüstzeit>) */
sammlungInit :-
	abolish(sammlung:sammlung/8),
	\+sammlung:baueRezepte

/* Stoffe ohne Gerät zu Fuss wild ernten */
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, eiweissPerle, 300, 339, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, gravitinoBall, 150, 339, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, sturmKristall, 150, 150, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, natrium, 8, 10, 0)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, sauerStoff, 8, 9, 0))


/* variieren nach Planetentyp kürzere Zeiten bei geeigneterem Habitat */
/* TODO Planetentyp-Einfluss auf Stückzahl pro Gebinde abbilden */
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, jadeErbsen, 22, 22, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, suessWurzel, 23, 23, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, fleischigeWurzeln, 18, 18, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, aloeFleisch, 22, 22, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, feuerBeere, 15, 15, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, grahBeere, 19, 19, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, gefroreneKnollen, 38, 17, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, hexaBeere, 15, 15, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, heptaPloidWeizen, 14, 14, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, impulsBohnen, 25, 27, 0))

/* Anreise mit Raumschiff zu natürlichem Vorkommen auf Planet */
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, kaktusFleisch, 2, 13, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, pilzSchimmel, 10, 10, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, solanium, 4, 29, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, gammaWurzel, 5, 4, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, frostKristall, 4, 4, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, sternenKnolle, 8, 12, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, sturmKristall, 150, 150, 0))

/*------------ noch offen ------------- */
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, korvaxKonvergenzWuerfel, 20, 20, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, nipNipKnospen, 20, 20, 0))

	/* nutzbare anomalieen (Deko) */
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, kappillarMuschel, 150, 150, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, lichtBruch, 150, 150, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, defekterSeparator, 150, 150, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, kalziPilz, 150, 150, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, terbiumWachstum, 150, 150, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, verknoecherterStern, 150, 150, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, elektrischerWuerfel, 150, 150, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, klapperWirbleSaeule, 150, 150, 0))

	/* im Notfall Primär und Sekundärelement mit Q aus Planetenobjekten schlagen */
	,assertz(sammlung(0, 'System', 'MeinPlanet', herausSchlagen, kohlenStoff, 5, 5, 150))
	
	/* mit Minenlaser auf Planet */
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, radon, 87, 7, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, stickStoff, 9, 9, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, schwefelin, 87, 7, 150)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, ammoniak, 7, 7, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, pilzSchimmel, 1, 1, 150))

	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, diWasserStoff, 4, 4, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, ferritStaub, 3, 3, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, kobalt, 4, 4, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, kohlenStoff, 2, 2, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, kuerbisKnolle, 5, 5, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, sauerStoff, 9, 9, 150))

	/* exofahrzeug minenlaser nutzen */
	,assertz(sammlung(0, 'System', 'MeinPlanet', exoFahrzeugMinenLaserNutzen, sauerStoff, 9, 9, 150))

	/* nur sekundärelement */
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, sternenKnolle, 44, 44, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, gammaWurzel, 83, 50, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, natrium, 7, 7, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, paraffinium, 221, 30, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, geode, 221, 30, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', minenLaserNutzen, kristallFragment, 221, 30, 150))


	/* mit Terrainformer abbauen */
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, ammoniak, 3, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, aktiviertesCadmium, 15, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, aktiviertesEmeril, 8, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, aktiviertesIndium, 46, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, aktiviertesKupfer, 20, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, cadmium, 24, 0, 300))	
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, emeril, 24, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, indium, 20, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, natrium, 6, 0, 300))
	
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, kupfer, 3, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, silikatPulver, 6, 0, 300))
	
	/* mit Terrainformer ausgraben */
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, schmutzigeKnochenFragmente, 300, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, geborgeneDaten, 300, 0, 300))
	
	/* verbesserter Minenlaser */
	,assertz(sammlung(0, 'System', 'MeinPlanet', verbessertenMinenLaserNutzen, verdichteterKohlenStoff, 12, 0, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', verbessertenMinenLaserNutzen, reinesFerrit, 3, 0, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', verbessertenMinenLaserNutzen, paraffinium, 3, 0, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', verbessertenMinenLaserNutzen, mordit, 3, 0, 150))
	
	/* Jagd (mit Glutspeer, ein Schuss = tot, Aufladen ist Nebenzeit) */
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, beinFleisch, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, diploStuecke, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, fleischigeStuecke, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, fleischigeFluegel, 200, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, innereienBeutel, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, katzenLeber, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, mordit, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, protoWurst, 20, 400, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, rohesSteak, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, salzigeFischFilets, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, schreiterWurst, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, schuppigesFleisch, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', jagen, zaeheFluessigkeiten, 20, 400, 300)) /* versteinerter Planet */
	
	/* bei Zerstörung von Wesen */
	,assertz(sammlung(0, 'System', 'MeinPlanet', erkaempfen, pugneum, 12000, 0, 300))      /* von Wächter */
	,assertz(sammlung(0, 'System', 'MeinPlanet', erkaempfen, larvenKern, 9000, 0, 300))       /*  von flüsterndes Ei */
	,assertz(sammlung(0, 'System', 'MeinPlanet', erkaempfen, kampfLaeuferGehirn, 50000, 0, 300))     /* von Kampfläufer */
	,assertz(sammlung(0, 'System', 'MeinPlanet', erkaempfen, unholdRogen, 12000, 0, 300))  /*   von ??? */
	
	/* Meteoritenfelder */
	,assertz(sammlung(0, 'System', 'MeinPlanet', raumSchuerfen, tritium, 2, 0, 63))
	,assertz(sammlung(0, 'System', 'MeinPlanet', raumSchuerfen, gold, 75, 0, 63))
	,assertz(sammlung(0, 'System', 'MeinPlanet', raumSchuerfen, silber, 16, 0, 63))
	,assertz(sammlung(0, 'System', 'MeinPlanet', raumSchuerfen, platin, 20, 0, 63))
	,assertz(sammlung(0, 'System', 'MeinPlanet', raumSchuerfen, tritiumHyperCluster, 20, 0, 63))
	,assertz(sammlung(0, 'System', 'MeinPlanet', raumSchuerfen, goldKlumpen, 20, 0, 63))
	
	/* kaufen */
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, diWasserStoffGelee, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, ferritStaub, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, ionenAkku, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, kabelBaum, 150, 1310, 2460))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, raumSchiffStartTreibStoff, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, restSubstanz, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, kobalt, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, kobaltSpiegel, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, metallPlatten, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, mikroProzessor, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, sternenSeide, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, navigationsDaten, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, pyrit, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, pugneum, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, reinesFerrit, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, salz, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, sauerStoff, 150, 1310, 1000))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, sauerStoffKapsel, 150, 1310, 1000))
	

	/* Aus Anbau */
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, beutelGift, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, eiweissPerle, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, faecium, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, frostKristall, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, gammaWurzel, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, gravitinoBall, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, kaktusFleisch, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, mordit, 20, 0, 0))	
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, nipNipKnospen, 20, 0, 0))	
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, pilzSchimmel, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, solanium, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ernten, sternenKnolle, 20, 0, 0))
	
	/* aus Tierhaltung */
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, faecium, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, frischeMilch, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, holzApfel, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, klebrigerHonig, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, leopardenFrucht, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, regisFett, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, wildeMilch, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, riesenEi, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, kreaturenEi, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, grosseEier, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, warmeProtoMilch, 20, 0, 0))
	
	/* Stoff ohne Gerät unter Wasser ernten */
	,assertz(sammlung(0, 'System', 'MeinPlanet', ertauchen, kristallSulfid, 150, 634, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ertauchen, kelpBeutel, 18, 32, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ertauchen, zytoPhosphat, 20, 0, 150))
	
	/* Stoff unter Wasser mit Waffe erbeuten */
	,assertz(sammlung(0, 'System', 'MeinPlanet', unterWasserErkaempfen, lebendePerle, 150, 680, 0))     /* von gepanzerte Muschel */
	,assertz(sammlung(0, 'System', 'MeinPlanet', unterWasserErkaempfen, hypnotischesAuge, 4500, 0, 0)) /* von abyssal horror */
	.

/* Vorfertigen Rohstoffe */
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
vorfertigen(gammaWurzel).
vorfertigen(natrium).
vorfertigen(kobalt).
vorfertigen(kuerbisKnolle).
vorfertigen(natriumNitrat).
vorfertigen(chlor).
vorfertigen(ferritStaub).
vorfertigen(chromatischesMetall).
vorfertigen(ammoniak).
vorfertigen(kaktusFleisch).
vorfertigen(kohlenStoff).
vorfertigen(faecium).


/* Basis */
vorfertigen(paraffinium).
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
vorfertigen(grantine).
vorfertigen(herox).
vorfertigen(instabilesGel).
vorfertigen(instabilesNatrium).
vorfertigen(kohlenStoffKristall).
vorfertigen(saeure).
vorfertigen(seltenesMetallElement).
vorfertigen(stickStoffSalz).
vorfertigen(superOxidKristall).
vorfertigen(tetraKobalt).
vorfertigen(angereicherterKohlenStoff).

vorfertigen(aronium).
vorfertigen(lemmium).
vorfertigen(magnoGold).
vorfertigen(strassenKoeterBronze).
vorfertigen(chlorGitter).

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


copyDefaultIfEmpty(System, Planet) :-
	findall(Stoff, sammlung(_, System, Planet, _, Stoff, _, _, _), Stoffe),
	((Stoffe = [],
	  forall((sammlung(RecNo, 'System', 'MeinPlanet', Operation, Stoff, Haupt, Neben, Ruest)),
	      assertz(sammlung(RecNo, System, Planet, Operation, Stoff, Haupt, Neben, Ruest))));
	  true
	).
	
sammelbarReInit(System, Planet) :-
	\+sammelbarInitFlach(System, Planet),
	\+sammelbarVorfertigen(System, Planet).
	
sammelbarInitFlach(System, Planet) :-
	retractall(sammelbar(_, _)),
	stoff:stoff(_, Stoff, _),
	(sammlung(_, System, Planet, Operation, Stoff, _, _, _);
	 /* raumSchuerfen geht auf jedem Planeten */
	 (Operation = raumSchuerfen, sammlung(_, 'System', 'MeinPlanet', Operation, Stoff, _, _, _));
	 /* rezepte sind auch überall gleich bekannt */
	 (Operation = bekannt, sammlung(Position, 'System', 'MeinPlanet', Operation, Stoff, _, _, _)),
	 Position > 0
	),
	sammelAktion:pruefeSammelAktionVorraussetzung(Operation),
	assertz(sammelbar(Stoff, Operation)),
	fail.
	
sammelbarVorfertigen(System, Planet) :-
	retractall(fertigeLoesung(_, _, _)),
	vorfertigen(Stoff),
	\+generiereFertigeLoesungen(System, Planet, Stoff),
	fail.
	
generiereFertigeLoesungen(System, Planet, Stoff) :-
	optimierung:optimierungsZiel(Strategie),
	\+suchAlgorithmus:baueFuerVorfertigung(System, Planet, Strategie, 1, Stoff),
	optimierung:optimierungsStrategie(Strategie, Stoff, _, Vorgaenge, _, _, _, _, _),
	assertz(fertigeLoesung(Strategie, Stoff, Vorgaenge)),
	fail.
