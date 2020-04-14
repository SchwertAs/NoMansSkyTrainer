:- module(planetSammelEigenschaftenDefaults, [sammelDefaultPlanetenTyp/3, sammelDefaultSystemTyp/3]).

/* Farbe des Systems und Typ des Planets als Parameter, Stoff als Attribut */
/* nur die nicht überall möglichen werden angegeben */
sammelDefaultSystemTyp(blau, terrainFormerNutzen, indium).
sammelDefaultSystemTyp(blau, terrainFormerNutzen, aktiviertesIndium).
sammelDefaultSystemTyp(gelb, terrainFormerNutzen, kupfer).
sammelDefaultSystemTyp(gelb, terrainFormerNutzen, aktiviertesKupfer).
sammelDefaultSystemTyp(gruen, terrainFormerNutzen, emeril).
sammelDefaultSystemTyp(gruen, terrainFormerNutzen, aktiviertesEmeril).
sammelDefaultSystemTyp(rot, terrainFormerNutzen, cadmium).
sammelDefaultSystemTyp(rot, terrainFormerNutzen, aktiviertesCadmium).

/* Störungen */
sammelDefaultPlanetenTyp(exotischBlasen, pfluecken, blasenBallen).
sammelDefaultPlanetenTyp(exotischScherben, pfluecken, defekterSeparator).
sammelDefaultPlanetenTyp(exotischDrahtZelle, pfluecken, elektrischerWuerfel).
sammelDefaultPlanetenTyp(exotischKonturiert, pfluecken, kabelKapsel).
sammelDefaultPlanetenTyp(exotischWasserGarten, pfluecken, kalziPilz).
sammelDefaultPlanetenTyp(exotischIrrealeMuscheln, pfluecken, kappillarMuschel).
sammelDefaultPlanetenTyp(exotischKnochen, pfluecken, klapperWirbleSaeule).
sammelDefaultPlanetenTyp(exotischStrahlen, pfluecken, lichtBruch).
sammelDefaultPlanetenTyp(exotischNanoPhage, pfluecken, terbiumWachstum).
sammelDefaultPlanetenTyp(exotischMStruktur, pfluecken, verknoecherterStern).

/* auf allen ausser toten Planeten gibt es diese Kochstoffe */
sammelDefaultPlanetenTyp(PlanetenTyp, pfluecken, fleischigeWurzeln) :-
	PlanetenTyp \= tot.
	
sammelDefaultPlanetenTyp(PlanetenTyp, pfluecken, heptaPloidWeizen) :-
	PlanetenTyp \= tot.
	
sammelDefaultPlanetenTyp(PlanetenTyp, pfluecken, suessWurzel) :-
	PlanetenTyp \= tot.

/* spezielle Kochstoffe zum pflücken auf normalen Planeten */
sammelDefaultPlanetenTyp(frostig, pfluecken, frostKristall).
sammelDefaultPlanetenTyp(frostig, pfluecken, gefroreneKnollen).

sammelDefaultPlanetenTyp(frostig, pfluecken, heptaPloidWeizen).
sammelDefaultPlanetenTyp(frostig, pfluecken, suessWurzel).

sammelDefaultPlanetenTyp(gemaessigt, pfluecken, sternenKnolle).
sammelDefaultPlanetenTyp(gemaessigt, pfluecken, impulsBohnen).

sammelDefaultPlanetenTyp(giftig, pfluecken, pilzSchimmel).
sammelDefaultPlanetenTyp(giftig, pfluecken, jadeErbsen).

sammelDefaultPlanetenTyp(heiss, pfluecken, solanium).
sammelDefaultPlanetenTyp(heiss, pfluecken, feuerBeere).

sammelDefaultPlanetenTyp(radioAktiv, pfluecken, gammaWurzel).
sammelDefaultPlanetenTyp(radioAktiv, pfluecken, grahBeere).

sammelDefaultPlanetenTyp(trocken, pfluecken, kaktusFleisch).
sammelDefaultPlanetenTyp(trocken, pfluecken, aloeFleisch).

/* auf exotischen Planeten */
sammelDefaultPlanetenTyp(PlanetenTyp, pfluecken, hexaBeere) :-
	planetenTypen:planetenTypIstExotisch(PlanetenTyp).

/* mega exotische Planeten */
sammelDefaultPlanetenTyp(megaExotisch, pfluecken, hexaBeere).	
sammelDefaultPlanetenTyp(megaExotisch, pfluecken, fleischigeWurzeln).
sammelDefaultPlanetenTyp(megaExotisch, pfluecken, heptaPloidWeizen).
sammelDefaultPlanetenTyp(megaExotisch, pfluecken, suessWurzel).

/* Planeten-Goodies */
sammelDefaultPlanetenTyp(PlanetenTyp, pfluecken, eiweissPerle) :-
	PlanetenTyp \= tot.
sammelDefaultPlanetenTyp(PlanetenTyp, pfluecken, gravitinoBall) :-
	PlanetenTyp \= tot.
sammelDefaultPlanetenTyp(PlanetenTyp, pfluecken, sturmKristall) :-
	PlanetenTyp \= tot.
sammelDefaultPlanetenTyp(PlanetenTyp, pfluecken, tetraKobalt) :- /* unter Wirbelwürfel */
	PlanetenTyp \= tot.

/* Minenlaser nutzen */
/* Gibt es vermutlich auf allen Planeten */
sammelDefaultPlanetenTyp(_, minenLaserNutzen, natrium).
sammelDefaultPlanetenTyp(_, minenLaserNutzen, diWasserStoff).
sammelDefaultPlanetenTyp(_, minenLaserNutzen, kohlenStoff).
sammelDefaultPlanetenTyp(_, minenLaserNutzen, sauerStoff).
sammelDefaultPlanetenTyp(_, minenLaserNutzen, ferritStaub).
sammelDefaultPlanetenTyp(_, minenLaserNutzen, kristallFragment).
sammelDefaultPlanetenTyp(_, minenLaserNutzen, geode).
sammelDefaultPlanetenTyp(_, minenLaserNutzen, faecium).
sammelDefaultPlanetenTyp(_, minenLaserNutzen, schwefelin).
sammelDefaultPlanetenTyp(_, minenLaserNutzen, radon).
sammelDefaultPlanetenTyp(_, minenLaserNutzen, stickStoff).
sammelDefaultPlanetenTyp(_, minenLaserNutzen, salz).
	
/* Gibt es vermutlich auf fast allen Planeten (ausser tote) */
sammelDefaultPlanetenTyp(PlanetenTyp, minenLaserNutzen, kuerbisKnolle) :-
	PlanetenTyp \= tot.
sammelDefaultPlanetenTyp(PlanetenTyp, minenLaserNutzen, kobalt) :-
	PlanetenTyp \= tot.

sammelDefaultPlanetenTyp(gemaessigt, minenLaserNutzen, paraffinium).
sammelDefaultPlanetenTyp(gemaessigt, minenLaserNutzen, sternenKnolle).
sammelDefaultPlanetenTyp(radioAktiv, minenLaserNutzen, uran).
sammelDefaultPlanetenTyp(radioAktiv, minenLaserNutzen, gammaWurzel).
sammelDefaultPlanetenTyp(giftig, minenLaserNutzen, ammoniak).
sammelDefaultPlanetenTyp(giftig, minenLaserNutzen, pilzSchimmel).
sammelDefaultPlanetenTyp(frostig, minenLaserNutzen, dioxit).
sammelDefaultPlanetenTyp(frostig, minenLaserNutzen, frostKristall).
sammelDefaultPlanetenTyp(heiss, minenLaserNutzen, phosphor).
sammelDefaultPlanetenTyp(heiss, minenLaserNutzen, solanium).
sammelDefaultPlanetenTyp(trocken, minenLaserNutzen, pyrit).
sammelDefaultPlanetenTyp(trocken, minenLaserNutzen, kaktusFleisch).

/* verbessertenMinenLaserNutzen */
sammelDefaultPlanetenTyp(trocken, verbessertenMinenLaserNutzen, verdichteterKohlenStoff).
sammelDefaultPlanetenTyp(trocken, verbessertenMinenLaserNutzen, reinesFerrit).
sammelDefaultPlanetenTyp(trocken, verbessertenMinenLaserNutzen, natriumNitrat).

sammelDefaultPlanetenTyp(trocken, exoFahrzeugMinenLaserNutzen, natriumNitrat).

/* Terrainformer nutzen */
/* dritte Planetenressource (zufällig eine daraus) */
sammelDefaultPlanetenTyp(_, terrainFormerNutzen, magnetisiertesFerrit).
sammelDefaultPlanetenTyp(_, terrainFormerNutzen, salz).
sammelDefaultPlanetenTyp(_, terrainFormerNutzen, natrium).
sammelDefaultPlanetenTyp(_, terrainFormerNutzen, kobalt).
sammelDefaultPlanetenTyp(_, terrainFormerNutzen, silber).
sammelDefaultPlanetenTyp(_, terrainFormerNutzen, silikatPulver).

sammelDefaultPlanetenTyp(PlanetenTyp, minenLaserNutzen, geborgeneDaten) :-
	PlanetenTyp \= tot.

/* zweites Mineral */
sammelDefaultPlanetenTyp(gemaessigt, terrainFormerNutzen, paraffinium).
sammelDefaultPlanetenTyp(giftig, terrainFormerNutzen, ammoniak).
sammelDefaultPlanetenTyp(frostig, terrainFormerNutzen, dioxit).
sammelDefaultPlanetenTyp(heiss, terrainFormerNutzen, phosphor).
sammelDefaultPlanetenTyp(radioAktiv, terrainFormerNutzen, uran).
sammelDefaultPlanetenTyp(trocken, terrainFormerNutzen, pyrit).

/* Exoten zweites Mineral Gold */
sammelDefaultPlanetenTyp(PlanetenTyp, terrainFormerNutzen, gold) :-
	planetenTypen:planetenTypIstExotisch(PlanetenTyp).

/* Tote Planeten zweites Mineral verrostetesMetall */
sammelDefaultPlanetenTyp(tot, terrainFormerNutzen, verrostetesMetall).

/* jagen */
sammelDefaultPlanetenTyp(_, jagen, beinFleisch).
sammelDefaultPlanetenTyp(_, jagen, fleischigeStuecke).
sammelDefaultPlanetenTyp(_, jagen, fleischigeFluegel).
sammelDefaultPlanetenTyp(_, jagen, katzenLeber).
sammelDefaultPlanetenTyp(_, jagen, mordit).
sammelDefaultPlanetenTyp(_, jagen, beirohesSteaknFleisch).
sammelDefaultPlanetenTyp(_, jagen, salzigeFischFilets).
sammelDefaultPlanetenTyp(_, jagen, schuppigesFleisch).

/* erkämpfen */
sammelDefaultPlanetenTyp(_, erkaempfen, pugneum).
sammelDefaultPlanetenTyp(_, erkaempfen, vierfachServo).
sammelDefaultPlanetenTyp(_, erkaempfen, kampfLaeuferGehirn).
sammelDefaultPlanetenTyp(tot, erkaempfen, larvenKern).

/* raumschürfen */
sammelDefaultPlanetenTyp(_, raumSchuerfen, tritium).
sammelDefaultPlanetenTyp(_, raumSchuerfen, gold).
sammelDefaultPlanetenTyp(_, raumSchuerfen, silber).
sammelDefaultPlanetenTyp(_, raumSchuerfen, platin).
sammelDefaultPlanetenTyp(_, raumSchuerfen, tritiumHyperCluster).
sammelDefaultPlanetenTyp(_, raumSchuerfen, goldKlumpen).

/* kaufen */
sammelDefaultPlanetenTyp(_, kaufen, antiMaterie).
sammelDefaultPlanetenTyp(_, kaufen, antiMaterieGehaeuse).
sammelDefaultPlanetenTyp(_, kaufen, diWasserStoffGelee).
sammelDefaultPlanetenTyp(_, kaufen, hermetischesSiegel).
sammelDefaultPlanetenTyp(_, kaufen, ionenAkku).
sammelDefaultPlanetenTyp(_, kaufen, kabelBaum).
sammelDefaultPlanetenTyp(_, kaufen, kobaltSpiegel).
sammelDefaultPlanetenTyp(_, kaufen, lebensErhaltungsGel).
sammelDefaultPlanetenTyp(_, kaufen, metallPlatten).
sammelDefaultPlanetenTyp(_, kaufen, mikroProzessor).
sammelDefaultPlanetenTyp(_, kaufen, natriumDiode).
sammelDefaultPlanetenTyp(_, kaufen, salzRefaktor).
sammelDefaultPlanetenTyp(_, kaufen, sauerStoffFilter).
sammelDefaultPlanetenTyp(_, kaufen, sternenSeide).
sammelDefaultPlanetenTyp(_, kaufen, raumSchiffStartTreibStoff).
sammelDefaultPlanetenTyp(_, kaufen, vierfachServo).

/* ernten */
sammelDefaultPlanetenTyp(_, ernten, beutelGift).
sammelDefaultPlanetenTyp(_, ernten, eiweissPerle).
sammelDefaultPlanetenTyp(_, ernten, faecium).
sammelDefaultPlanetenTyp(_, ernten, frostKristall).
sammelDefaultPlanetenTyp(_, ernten, frostKristall).
sammelDefaultPlanetenTyp(_, ernten, gammaWurzel).
sammelDefaultPlanetenTyp(_, ernten, gravitinoBall).
sammelDefaultPlanetenTyp(_, ernten, kaktusFleisch).
sammelDefaultPlanetenTyp(_, ernten, mordit).
sammelDefaultPlanetenTyp(_, ernten, nipNipKnospen).
sammelDefaultPlanetenTyp(_, ernten, pilzSchimmel).
sammelDefaultPlanetenTyp(_, ernten, solanium).
sammelDefaultPlanetenTyp(_, ernten, sternenKnolle).

sammelDefaultPlanetenTyp(_, herausSchlagen, kohlenStoff).
sammelDefaultPlanetenTyp(_, exoFahrzeugMinenLaserNutzen, sauerStoff).

/* aus Tierhaltung */
sammelDefaultPlanetenTyp(PlanetenTyp, vonTierErhalten, faecium) :-
	PlanetenTyp \= tot.
sammelDefaultPlanetenTyp(PlanetenTyp, vonTierErhalten, wildeMilch) :-
	PlanetenTyp \= tot.
sammelDefaultPlanetenTyp(PlanetenTyp, vonTierErhalten, frischeMilch) :-
	PlanetenTyp \= tot.
sammelDefaultPlanetenTyp(PlanetenTyp, vonTierErhalten, leopardenFrucht) :-
	PlanetenTyp \= tot.
sammelDefaultPlanetenTyp(PlanetenTyp, vonTierErhalten, klebrigerHonig) :-
	PlanetenTyp \= tot.
sammelDefaultPlanetenTyp(PlanetenTyp, vonTierErhalten, holzApfel) :-
	PlanetenTyp \= tot.
sammelDefaultPlanetenTyp(PlanetenTyp, vonTierErhalten, regisFett) :-
	PlanetenTyp \= tot.
sammelDefaultPlanetenTyp(PlanetenTyp, vonTierErhalten, kreaturenEi) :-
	PlanetenTyp \= tot.
sammelDefaultPlanetenTyp(PlanetenTyp, vonTierErhalten, grosseEier) :-
	PlanetenTyp \= tot.

/* wird für alle vorgeschlagen auch wenn kein Wasserplanet */
sammelDefaultPlanetenTyp(_, ertauchen, kelpBeutel).
sammelDefaultPlanetenTyp(_, ertauchen, zytoPhosphat).
sammelDefaultPlanetenTyp(_, ertauchen, kristallSulfid).

sammelDefaultPlanetenTyp(_, unterWasserErkaempfen, lebendePerle).
sammelDefaultPlanetenTyp(_, unterWasserErkaempfen, hypnotischesAuge).

/* Gasgewinnung */
sammelDefaultPlanetenTyp(gemaessigt, ausAtmosphaerenAnlageGewinnen, stickStoff).
sammelDefaultPlanetenTyp(giftig, ausAtmosphaerenAnlageGewinnen, stickStoff).
sammelDefaultPlanetenTyp(heiss, ausAtmosphaerenAnlageGewinnen, schwefelin).
sammelDefaultPlanetenTyp(trocken, ausAtmosphaerenAnlageGewinnen, schwefelin).
sammelDefaultPlanetenTyp(radioAktiv, ausAtmosphaerenAnlageGewinnen, radon).
sammelDefaultPlanetenTyp(frostig, ausAtmosphaerenAnlageGewinnen, radon).

sammelDefaultPlanetenTyp(PlanetenTyp, ausAtmosphaerenAnlageGewinnen, sauerStoff) :-
	planetenTypen:planetenTypIstExotisch(PlanetenTyp).






