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

planetenTyp(exotischBlasen).
planetenTyp(exotischDrahtZelle).
planetenTyp(exotischIrrealeMuscheln).
planetenTyp(exotischKnochen).
planetenTyp(exotischKonturiert).
planetenTyp(exotischMStruktur).
planetenTyp(exotischNanoPhage).
planetenTyp(exotischScherben).
planetenTyp(exotischSechsEckig).
planetenTyp(exotischStrahlen).
planetenTyp(exotischWasserGarten).
planetenTyp(frostig).
planetenTyp(gemaessigt).
planetenTyp(giftig).
planetenTyp(heiss).
planetenTyp(megaExotisch).
planetenTyp(radioAktiv).
planetenTyp(seltsam).
planetenTyp(tot).
planetenTyp(trocken).

planetenGruppePlanetenTyp(sprudelnder, exotischBlasen). 
planetenGruppePlanetenTyp(schaeumender, exotischBlasen). 
planetenGruppePlanetenTyp(schaumiger, exotischBlasen). 

planetenGruppePlanetenTyp(fragmentierter, exotischDrahtZelle). 
planetenGruppePlanetenTyp(gebrochener, exotischDrahtZelle). 
planetenGruppePlanetenTyp(zerschmetterter, exotischDrahtZelle). 

planetenGruppePlanetenTyp(konturierter, exotischKonturiert). 
planetenGruppePlanetenTyp(verkabelter, exotischKonturiert). 
planetenGruppePlanetenTyp(eingesponnener, exotischKonturiert). 

planetenGruppePlanetenTyp(gerippter, exotischIrrealeMuscheln). 
planetenGruppePlanetenTyp(messerscharfer, exotischIrrealeMuscheln). 
planetenGruppePlanetenTyp(schalenübersäter, exotischIrrealeMuscheln). 

planetenGruppePlanetenTyp(rasselnder, exotischKnochen). 
planetenGruppePlanetenTyp(skelettartiger, exotischKnochen). 
planetenGruppePlanetenTyp(stacheliger, exotischKnochen). 

planetenGruppePlanetenTyp(verkalkter, exotischMStruktur). 
planetenGruppePlanetenTyp(verknöcherter, exotischMStruktur). 
planetenGruppePlanetenTyp(versteinerter, exotischMStruktur). 

planetenGruppePlanetenTyp(mechanischer, exotischNanoPhage). 
planetenGruppePlanetenTyp(metallener, exotischNanoPhage). 
planetenGruppePlanetenTyp(metallurgischer, exotischNanoPhage). 

planetenGruppePlanetenTyp(saeuliger, exotischScherben). 
planetenGruppePlanetenTyp(stuetzen, exotischScherben). 
planetenGruppePlanetenTyp(scherben, exotischScherben). 

planetenGruppePlanetenTyp(sechseckiger, exotischSechsEckig). 
planetenGruppePlanetenTyp(schuppiger, exotischSechsEckig). 
planetenGruppePlanetenTyp(metallueberzogener, exotischSechsEckig). 

planetenGruppePlanetenTyp(zerkluefteter, exotischStrahlen). 
planetenGruppePlanetenTyp(desLichts, exotischStrahlen). 
planetenGruppePlanetenTyp(durchbrochener, exotischStrahlen). 

planetenGruppePlanetenTyp(bedeckter, exotischWasserGarten). 
planetenGruppePlanetenTyp(pilz, exotischWasserGarten). 
planetenGruppePlanetenTyp(sporiger, exotischWasserGarten). 

planetenGruppePlanetenTyp(einsamer, tot). 
planetenGruppePlanetenTyp(katastrophalesTerraforming, tot). 
planetenGruppePlanetenTyp(leerer, tot). 
planetenGruppePlanetenTyp(mitGeringerAtmosphere, tot). 
planetenGruppePlanetenTyp(stickiger, tot). 
planetenGruppePlanetenTyp(toter, tot). 
planetenGruppePlanetenTyp(unbewohnbarer, tot). 
planetenGruppePlanetenTyp(unbelebter, tot). 
planetenGruppePlanetenTyp(trostloserTot, tot).

planetenGruppePlanetenTyp(chromatischerNebel, megaExotisch). 
planetenGruppePlanetenTyp(toedlicheGrueneAnomalie, megaExotisch). 

planetenGruppePlanetenTyp(aetzender, giftig). 
planetenGruppePlanetenTyp(arktischer, frostig). 
planetenGruppePlanetenTyp(ausgetrockneter, trocken). 
planetenGruppePlanetenTyp(bluehender, gemaessigt). 
planetenGruppePlanetenTyp(bruehender, heiss). 
planetenGruppePlanetenTyp(eisiger, frostig). 
planetenGruppePlanetenTyp(eiskalter, frostig). 
planetenGruppePlanetenTyp(faulender, giftig). 
planetenGruppePlanetenTyp(felsiger, trocken). 
planetenGruppePlanetenTyp(feuchter, gemaessigt). 
planetenGruppePlanetenTyp(feuriger, heiss). 
planetenGruppePlanetenTyp(frostiger, frostig). 
planetenGruppePlanetenTyp(gammaintensiver, radioAktiv). 
planetenGruppePlanetenTyp(gefrorener, frostig). 
planetenGruppePlanetenTyp(gefrierender, frostig). 
planetenGruppePlanetenTyp(gemaessigter, gemaessigt). 
planetenGruppePlanetenTyp(giftiger, giftig). 
planetenGruppePlanetenTyp(gruenender, gemaessigt). 
planetenGruppePlanetenTyp(gruenlicher, gemaessigt). 
planetenGruppePlanetenTyp(heisser, heiss). 
planetenGruppePlanetenTyp(hyperboreisch, frostig). 
planetenGruppePlanetenTyp(isotopischer, radioAktiv). 
planetenGruppePlanetenTyp(kontaminierter, radioAktiv). 
planetenGruppePlanetenTyp(mitHoherEnergie, radioAktiv). 
planetenGruppePlanetenTyp(mitHoherRadioQuelle, radioAktiv). 
planetenGruppePlanetenTyp(nuklearer, radioAktiv). 
planetenGruppePlanetenTyp(paradiesischer, gemaessigt). 
planetenGruppePlanetenTyp(radioaktiver, radioAktiv). 
planetenGruppePlanetenTyp(regnerischer, gemaessigt). 
planetenGruppePlanetenTyp(reichhaltiger, gemaessigt).
planetenGruppePlanetenTyp(saeuerlicher, giftig). 
planetenGruppePlanetenTyp(schaedlicher, giftig). 
planetenGruppePlanetenTyp(scharfer, giftig). 
planetenGruppePlanetenTyp(sengender, heiss). 
planetenGruppePlanetenTyp(sengendHeisser, heiss). 
planetenGruppePlanetenTyp(siedender, heiss). 
planetenGruppePlanetenTyp(schaedlicher, giftig). 
planetenGruppePlanetenTyp(staubiger, frostig). 
planetenGruppePlanetenTyp(sternKorruptionEntdeckt, frostig). 
planetenGruppePlanetenTyp(superkritischer, radioAktiv). 
planetenGruppePlanetenTyp(toedlicheGrueneAnomalie, giftig). 
planetenGruppePlanetenTyp(trostloser, trocken). 
planetenGruppePlanetenTyp(tropischer, gemaessigt). 
planetenGruppePlanetenTyp(ultramarin, frostig). 
planetenGruppePlanetenTyp(unfruchtbarer, heiss). 
planetenGruppePlanetenTyp(ungesunder, giftig).
planetenGruppePlanetenTyp(unwirtlicher, trocken).
planetenGruppePlanetenTyp(verbrannter, heiss). 
planetenGruppePlanetenTyp(verfallenerNuklearer, radioAktiv). 
planetenGruppePlanetenTyp(verdorbener, giftig). 
planetenGruppePlanetenTyp(verlassener, trocken). 
planetenGruppePlanetenTyp(verstrahlter, radioAktiv). 
planetenGruppePlanetenTyp(verwilderter, gemaessigt). 
planetenGruppePlanetenTyp(weissGluehender, heiss). 
planetenGruppePlanetenTyp(windgepeitschter, trocken). 
planetenGruppePlanetenTyp(winterlicher, frostig). 
planetenGruppePlanetenTyp(wuesten, trocken). 
planetenGruppePlanetenTyp(zugefrorener, frostig). 


/* drittes Mineral */
sammelDefaultPlanetenTyp(gemaessigt, terrainFormerNutzen, paraffinium).
sammelDefaultPlanetenTyp(giftig, terrainFormerNutzen, ammoniak).
sammelDefaultPlanetenTyp(frostig, terrainFormerNutzen, dioxit).
sammelDefaultPlanetenTyp(heiss, terrainFormerNutzen, phosphor).
sammelDefaultPlanetenTyp(radioAktiv, terrainFormerNutzen, uran).
sammelDefaultPlanetenTyp(trocken, terrainFormerNutzen, pyrit).

/* Exoten zweites Mineral Gold */
sammelDefaultPlanetenTyp(exotischBlasen, terrainFormerNutzen, gold).
sammelDefaultPlanetenTyp(exotischScherben, terrainFormerNutzen, gold).
sammelDefaultPlanetenTyp(exotischKnochen, terrainFormerNutzen, gold).
sammelDefaultPlanetenTyp(exotischWasserGarten, terrainFormerNutzen, gold).
sammelDefaultPlanetenTyp(exotischNanoPhage, terrainFormerNutzen, gold).
sammelDefaultPlanetenTyp(exotischIrrealeMuscheln, terrainFormerNutzen, gold).
sammelDefaultPlanetenTyp(exotischDrahtZelle, terrainFormerNutzen, gold).
sammelDefaultPlanetenTyp(exotischMStruktur, terrainFormerNutzen, gold).
sammelDefaultPlanetenTyp(exotischStrahlen, terrainFormerNutzen, gold).

/* Exoten zweites Mineral verrostetesMetall */
sammelDefaultPlanetenTyp(tot, terrainFormerNutzen, verrostetesMetall).

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

/* Pflanzen auf normalen Planeten */
sammelDefaultPlanetenTyp(frostig, pfluecken, frostKristall).
sammelDefaultPlanetenTyp(frostig, pfluecken, gefroreneKnollen).
sammelDefaultPlanetenTyp(frostig, pfluecken, fleischigeWurzeln).
sammelDefaultPlanetenTyp(frostig, pfluecken, heptaPloidWeizen).
sammelDefaultPlanetenTyp(frostig, pfluecken, suessWurzel).

sammelDefaultPlanetenTyp(gemaessigt, pfluecken, sternenKnolle).
sammelDefaultPlanetenTyp(gemaessigt, pfluecken, impulsBohnen).
sammelDefaultPlanetenTyp(gemaessigt, pfluecken, fleischigeWurzeln).
sammelDefaultPlanetenTyp(gemaessigt, pfluecken, heptaPloidWeizen).
sammelDefaultPlanetenTyp(gemaessigt, pfluecken, suessWurzel).

sammelDefaultPlanetenTyp(giftig, pfluecken, pilzSchimmel).
sammelDefaultPlanetenTyp(giftig, pfluecken, jadeErbsen).
sammelDefaultPlanetenTyp(giftig, pfluecken, fleischigeWurzeln).
sammelDefaultPlanetenTyp(giftig, pfluecken, heptaPloidWeizen).
sammelDefaultPlanetenTyp(giftig, pfluecken, suessWurzel).

sammelDefaultPlanetenTyp(heiss, pfluecken, solanium).
sammelDefaultPlanetenTyp(heiss, pfluecken, feuerBeere).
sammelDefaultPlanetenTyp(heiss, pfluecken, fleischigeWurzeln).
sammelDefaultPlanetenTyp(heiss, pfluecken, heptaPloidWeizen).
sammelDefaultPlanetenTyp(heiss, pfluecken, suessWurzel).

sammelDefaultPlanetenTyp(radioAktiv, pfluecken, gammaWurzel).
sammelDefaultPlanetenTyp(radioAktiv, pfluecken, grahBeere).
sammelDefaultPlanetenTyp(radioAktiv, pfluecken, fleischigeWurzeln).
sammelDefaultPlanetenTyp(radioAktiv, pfluecken, heptaPloidWeizen).
sammelDefaultPlanetenTyp(radioAktiv, pfluecken, suessWurzel).

sammelDefaultPlanetenTyp(trocken, pfluecken, kaktusFleisch).
sammelDefaultPlanetenTyp(trocken, pfluecken, aloeFleisch).
sammelDefaultPlanetenTyp(trocken, pfluecken, fleischigeWurzeln).
sammelDefaultPlanetenTyp(trocken, pfluecken, heptaPloidWeizen).
sammelDefaultPlanetenTyp(trocken, pfluecken, suessWurzel).

/* Pflanzen auf exotischen Planeten */
sammelDefaultPlanetenTyp(exotischBlasen, pfluecken, hexaBeere).
sammelDefaultPlanetenTyp(exotischBlasen, pfluecken, fleischigeWurzeln).
sammelDefaultPlanetenTyp(exotischBlasen, pfluecken, heptaPloidWeizen).

sammelDefaultPlanetenTyp(exotischKnochen, pfluecken, fleischigeWurzeln).
sammelDefaultPlanetenTyp(exotischKnochen, pfluecken, heptaPloidWeizen).
sammelDefaultPlanetenTyp(exotischKnochen, pfluecken, fleischigeWurzeln).

sammelDefaultPlanetenTyp(exotischWasserGarten, pfluecken, hexaBeere).

sammelDefaultPlanetenTyp(exotischDrahtZelle, pfluecken, hexaBeere).

sammelDefaultPlanetenTyp(exotischKonturiert, pfluecken, hexaBeere).
sammelDefaultPlanetenTyp(exotischKonturiert, pfluecken, heptaPloidWeizen).

sammelDefaultPlanetenTyp(exotischIrrealeMuscheln, pfluecken, hexaBeere).
sammelDefaultPlanetenTyp(exotischIrrealeMuscheln, pfluecken, heptaPloidWeizen).
sammelDefaultPlanetenTyp(exotischIrrealeMuscheln, pfluecken, fleischigeWurzeln).
sammelDefaultPlanetenTyp(exotischIrrealeMuscheln, pfluecken, suessWurzel).

sammelDefaultPlanetenTyp(exotischStrahlen, pfluecken, hexaBeere).

sammelDefaultPlanetenTyp(exotischSechsEckig, pfluecken, hexaBeere).
sammelDefaultPlanetenTyp(exotischSechsEckig, pfluecken, heptaPloidWeizen).
sammelDefaultPlanetenTyp(exotischSechsEckig, pfluecken, fleischigeWurzeln).
sammelDefaultPlanetenTyp(exotischSechsEckig, pfluecken, suessWurzel).

sammelDefaultPlanetenTyp(exotischNanoPhage, pfluecken, hexaBeere).
sammelDefaultPlanetenTyp(exotischNanoPhage, pfluecken, heptaPloidWeizen).
sammelDefaultPlanetenTyp(exotischNanoPhage, pfluecken, fleischigeWurzeln).

/* Tote Planeten */
sammelDefaultPlanetenTyp(tot, minenLaserNutzen, larvenKern).

/* mega exotische Planeten */
sammelDefaultPlanetenTyp(megaExotisch, pfluecken, hexaBeere).
sammelDefaultPlanetenTyp(megaExotisch, pfluecken, fleischigeWurzeln).
sammelDefaultPlanetenTyp(megaExotisch, pfluecken, heptaPloidWeizen).
sammelDefaultPlanetenTyp(megaExotisch, pfluecken, suessWurzel).

