:- module(sammlung, [sammlungInit/0, vorgefertigeLoesungenErstellen/0, sammlung/8, fertigeLoesung/5]).

:- dynamic(fertigeLoesung/5).
:- dynamic(sammlung/8).
	
baueRezepte :-
	stoff:stoff(bauRezept, Rezept, _),
	assertz(sammlung(1, 'System', 'MeinPlanet', bekannt, Rezept, 0, 0, 0)),
	fail.

komponenten :-
	stoff:stoff(komponente, Stoff, _),
	assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, Stoff, 150, 1310, 250 )),
	fail.
			
/* sammlung(<RecordNo>, <System>, <Planet>, <SammelAktion>, <Stoff>, <Hauptzeit>, <Nebenzeit>, <Rüstzeit>) */
sammlungInit :-
	abolish(sammlung/8),
	abolish(fertigeLoesung/5),
	\+baueRezepte,
	\+komponenten

/* Stoffe ohne Gerät zu Fuss wild ernten */
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, natrium, 8, 10, 0)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, sauerStoff, 8, 9, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, eiweissPerle, 300, 339, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, gravitinoBall, 150, 339, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, sturmKristall, 150, 150, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, tetraKobalt, 150, 150, 0))


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
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, heptaploidWeizen, 14, 14, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, impulsBohnen, 25, 27, 0))

/* Anreise mit Raumschiff zu natürlichem Vorkommen auf Planet */
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, kaktusFleisch, 2, 13, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, pilzSchimmel, 10, 10, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, solanium, 4, 29, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, gammaWurzel, 5, 4, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, frostKristall, 4, 4, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', pfluecken, sternenKnolle, 8, 12, 0))

/*------------ noch offen ------------- */
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

	/* verbesserter Minenlaser */
	,assertz(sammlung(0, 'System', 'MeinPlanet', verbessertenMinenLaserNutzen, verdichteterKohlenStoff, 12, 0, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', verbessertenMinenLaserNutzen, reinesFerrit, 3, 0, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', verbessertenMinenLaserNutzen, natriumNitrat, 3, 0, 150))

	,assertz(sammlung(0, 'System', 'MeinPlanet', verbessertenMinenLaserNutzen, paraffinium, 3, 0, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', verbessertenMinenLaserNutzen, mordit, 3, 0, 150))
	
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
	/* nach Systemfarbe */
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, aktiviertesCadmium, 15, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, aktiviertesEmeril, 8, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, aktiviertesIndium, 46, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, aktiviertesKupfer, 20, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, cadmium, 24, 0, 300))	
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, emeril, 24, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, indium, 20, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, kupfer, 3, 0, 300))
	
	/* nach Planetentyp */
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, ammoniak, 3, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, dioxit, 3, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, paraffinium, 3, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, phosphor, 3, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, pyrit, 3, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, uran, 3, 0, 300)) 

	/* Als zweite Resource */
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, gold, 3, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, salz, 3, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, verrostetesMetall, 3, 0, 300)) 
	
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, magnetisiertesFerrit, 3, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, reinesFerrit, 3, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, silber, 3, 0, 300)) 
	
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, kobalt, 3, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, natrium, 6, 0, 300))
	
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, silikatPulver, 6, 0, 300))
	
	
	/* mit Terrainformer ausgraben */
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, geborgeneDaten, 300, 0, 300))
	
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
	,assertz(sammlung(0, 'System', 'MeinPlanet', erkaempfen, vierfachServo, 1180, 0, 300))     /* von Kampfkäfer */
	,assertz(sammlung(0, 'System', 'MeinPlanet', erkaempfen, unholdRogen, 12000, 0, 300))  /*   von ??? */
	
	/* Meteoritenfelder */
	,assertz(sammlung(0, 'System', 'MeinPlanet', raumSchuerfen, tritium, 2, 0, 63))
	,assertz(sammlung(0, 'System', 'MeinPlanet', raumSchuerfen, gold, 75, 0, 63))
	,assertz(sammlung(0, 'System', 'MeinPlanet', raumSchuerfen, silber, 16, 0, 63))
	,assertz(sammlung(0, 'System', 'MeinPlanet', raumSchuerfen, platin, 20, 0, 63))
	,assertz(sammlung(0, 'System', 'MeinPlanet', raumSchuerfen, tritiumHyperCluster, 20, 0, 63))
	,assertz(sammlung(0, 'System', 'MeinPlanet', raumSchuerfen, goldKlumpen, 20, 0, 63))
	
	/* kaufen */
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, ferritStaub, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, restSubstanz, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, kobalt, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, sternenSeide, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, pyrit, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, pugneum, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, reinesFerrit, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, salz, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, sauerStoff, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, sauerStoffKapsel, 150, 1310, 250 ))
	
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, antiMaterie, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, antiMaterieGehaeuse, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, diWasserStoffGelee, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, hermetischesSiegel, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, ionenAkku, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, kabelBaum, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, kobaltSpiegel, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, lebensErhaltungsGel, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, metallPlatten, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, mikroProzessor, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, natriumDiode, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, salzRefaktor, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, sauerStoffFilter, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, raumSchiffStartTreibStoff, 150, 1310, 250 ))
	,assertz(sammlung(0, 'System', 'MeinPlanet', kaufen, vierfachServo, 150, 1310, 250 ))

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
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, faecium, 6, 19, 5))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, frischeMilch, 90, 160, 30))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, holzApfel, 550, 150, 1180))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, klebrigerHonig, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, leopardenFrucht, 550, 150, 1180))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, regisFett, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, wildeMilch, 20, 0, 0))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonTierErhalten, riesenEi, 550, 150, 1180))
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

	,assertz(sammlung(0, 'System', 'MeinPlanet', ausAtmosphaerenAnlageGewinnen, schwefelin, 1450, 150, 630))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ausAtmosphaerenAnlageGewinnen, radon, 1450, 150, 630))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ausAtmosphaerenAnlageGewinnen, stickStoff, 1450, 150, 630))
	,assertz(sammlung(0, 'System', 'MeinPlanet', ausAtmosphaerenAnlageGewinnen, sauerStoff, 290, 150, 630))

	,assertz(sammlung(0, 'System', 'MeinPlanet', raumSchuerfen, lebendesWasser, 20, 0, 63))
	,assertz(sammlung(0, 'System', 'MeinPlanet', solarStrahlNutzen, fluessigSonne, 20, 400, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', gemuetsStrahlNutzen, fragmentierteQualia, 20, 400, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', verdienen, hexit, 60000, 0, 150))
	,assertz(sammlung(0, 'System', 'MeinPlanet', verdienen, nanitHaufen, 60000, 0, 150))


	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, aktiviertesCadmium, 1450, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, aktiviertesEmeril, 1450, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, aktiviertesIndium, 1450, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, aktiviertesKupfer, 1450, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, cadmium, 1450, 0, 300))	
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, emeril, 1450, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, indium, 1450, 0, 300))
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, kupfer, 1450, 0, 300))
	
	/* nach Planetentyp */
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, ammoniak, 1450, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, dioxit, 1450, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, paraffinium, 1450, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, phosphor, 1450, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, pyrit, 1450, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, uran, 1450, 0, 300)) 

	/* Als zweite Resource */
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, gold, 1450, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, salz, 1450, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, verrostetesMetall, 1450, 0, 300)) 
	
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, magnetisiertesFerrit, 1450, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, reinesFerrit, 1450, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, silber, 1450, 0, 300)) 
	
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, kobalt, 1450, 0, 300)) 
	,assertz(sammlung(0, 'System', 'MeinPlanet', vonBergbauEinheitGewinnen, natrium, 1450, 0, 300))
	
	
	/* mit Terrainformer ausgraben */
	,assertz(sammlung(0, 'System', 'MeinPlanet', terrainFormerNutzen, geborgeneDaten, 300, 0, 300))
	



	,assertz(fertigeLoesung('System', 'MeinPlanet', dummy, dummy, []))
	.

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


baueDefaults(System, Planet, DefaultSammelArten) :-
	spielStatus:systeme(_, System, Farbe),
	findall([SammelAktion0, Stoff0], planetSammelEigenschaftenDefaults:sammelDefaultSystemTyp(Farbe, SammelAktion0, Stoff0), SammelArt0),
	spielStatus:planeten(_, System, Planet, PlanetenGruppe),
	planetenTypen:planetenGruppePlanetenTyp(PlanetenGruppe, PlanetenTyp),
	findall([SammelAktion1, Stoff1], planetSammelEigenschaftenDefaults:sammelDefaultPlanetenTyp(PlanetenTyp, SammelAktion1, Stoff1), SammelArt1),
	append(SammelArt0, SammelArt1, DefaultSammelArten),
	!.

copyDefaultIfEmpty(System, Planet) :-
	findall(Stoff0, sammlung(_, System, Planet, _, Stoff0, _, _, _), Stoffe),
	((Stoffe = [],
	  baueDefaults(System, Planet, DefaultStoffe),
	  forall((select([Operation, Stoff], DefaultStoffe, _), sammlung(_, 'System', 'MeinPlanet', Operation, Stoff, Haupt, Neben, Ruest)),
	      assertz(sammlung(0, System, Planet, Operation, Stoff, Haupt, Neben, Ruest))
	        ));
	  true
	).
	
vorgefertigeLoesungenErstellen :-
	forall(spielStatus:planeten(_, System, Planet, _), \+alleVorfertigen(System, Planet)).
	
	
alleVorfertigen(System, Planet) :-
	vorfertigen(Stoff),
	\+generiereFertigeLoesungen(System, Planet, Stoff),
	debug(myTrace, 'Stoff: ~k generiert', Stoff),
	fail.
	
generiereFertigeLoesungen(System, Planet, Stoff) :-
	optimierung:optimierungsZiel(Strategie),
	ignore(retractall(fertigeLoesung(System, Planet, Strategie, Stoff, _))),
	\+suchAlgorithmus:baueFuerVorfertigung(System, Planet, Strategie, 1, Stoff),
	optimierung:optimierungsStrategie(Strategie, Stoff, _, Vorgaenge, _, _, _, _, _),
	assertz(fertigeLoesung(System, Planet, Strategie, Stoff, Vorgaenge)),
	fail.
