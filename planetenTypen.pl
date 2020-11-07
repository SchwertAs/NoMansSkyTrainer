:- module(planetenTypen, [planetenGruppePlanetenTyp/2]).

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
planetenTyp(sumpfig).
planetenTyp(tot).
planetenTyp(trocken).
planetenTyp(vulkanisch).
	
planetenTypIstExotisch(PlanetenTypExotisch) :-
	PlanetenTypExotisch = exotischBlasen;
	PlanetenTypExotisch = exotischDrahtZelle;
	PlanetenTypExotisch = exotischIrrealeMuscheln;
	PlanetenTypExotisch = exotischKnochen;
	PlanetenTypExotisch = exotischKonturiert;
	PlanetenTypExotisch = exotischMStruktur;
	PlanetenTypExotisch = exotischNanoPhage;
	PlanetenTypExotisch = exotischScherben;
	PlanetenTypExotisch = exotischSechsEckig;
	PlanetenTypExotisch = exotischStrahlen;
	PlanetenTypExotisch = exotischWasserGarten.

planetenTypIstNormal(PlanetenTyp) :-
	PlanetenTyp = frostig;
	PlanetenTyp = gemaessigt;
	PlanetenTyp = giftig;
	PlanetenTyp = heiss;
	PlanetenTyp = radioAktiv;
	PlanetenTyp = trocken,
	PlanetenTyp = sumpfig.
	
	
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
planetenGruppePlanetenTyp(schalenuebersaeter, exotischIrrealeMuscheln). 

planetenGruppePlanetenTyp(rasselnder, exotischKnochen). 
planetenGruppePlanetenTyp(skelettartiger, exotischKnochen). 
planetenGruppePlanetenTyp(stacheliger, exotischKnochen). 

planetenGruppePlanetenTyp(verkalkter, exotischMStruktur). 
planetenGruppePlanetenTyp(verknoecherter, exotischMStruktur). 
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

/* noch ungesicherte Planetentypen */
planetenGruppePlanetenTyp(blut, tot).
planetenGruppePlanetenTyp(basaltPlanet, tot).

planetenGruppePlanetenTyp(azur, megaExotisch). 
planetenGruppePlanetenTyp(heimgesuchterEmeril, megaExotisch). 
planetenGruppePlanetenTyp(himmelBlauer, megaExotisch). 
planetenGruppePlanetenTyp(nichtFunktionierender, megaExotisch). 
planetenGruppePlanetenTyp(purpur, megaExotisch). 
planetenGruppePlanetenTyp(scharlachRoter, vulkanisch). 
planetenGruppePlanetenTyp(toedlicheGrueneAnomalieMegaExot, megaExotisch). 
planetenGruppePlanetenTyp(ultramarin, megaExotisch). 
planetenGruppePlanetenTyp(verdammterJade, megaExotisch). 
planetenGruppePlanetenTyp(verlorenerBlauer, megaExotisch). 
planetenGruppePlanetenTyp(verlorenerGruener, megaExotisch). 
planetenGruppePlanetenTyp(verlorenerRoter, megaExotisch).  
planetenGruppePlanetenTyp(zensiert, megaExotisch). 
planetenGruppePlanetenTyp(infizierter, megaExotisch). 
planetenGruppePlanetenTyp(glaeserner, megaExotisch). 
planetenGruppePlanetenTyp(duerstender, megaExotisch). 
planetenGruppePlanetenTyp(verdammter, megaExotisch). 
planetenGruppePlanetenTyp(geloeschter, megaExotisch). 
planetenGruppePlanetenTyp(temporaerer, megaExotisch). 

planetenGruppePlanetenTyp(bewoelkter, sumpfig). 
planetenGruppePlanetenTyp(chromatischerNebel, sumpfig). 
planetenGruppePlanetenTyp(diesiger, sumpfig). 
planetenGruppePlanetenTyp(dampf, sumpfig). 
planetenGruppePlanetenTyp(dunstiger, sumpfig). 
planetenGruppePlanetenTyp(endloserMorast, sumpfig). 
planetenGruppePlanetenTyp(klammer, sumpfig). 
planetenGruppePlanetenTyp(marschLand, sumpfig). 
planetenGruppePlanetenTyp(morastBoden, sumpfig). 
planetenGruppePlanetenTyp(stinkender, sumpfig). 
planetenGruppePlanetenTyp(tropischer, sumpfig). 
planetenGruppePlanetenTyp(trueber, sumpfig). 
planetenGruppePlanetenTyp(sumpfGebiet, sumpfig). 

planetenGruppePlanetenTyp(asche, vulkanisch). 
planetenGruppePlanetenTyp(ascheVerdunkelter, vulkanisch). 
planetenGruppePlanetenTyp(aufbrechender, vulkanisch). 
planetenGruppePlanetenTyp(blutroter, vulkanisch). 
planetenGruppePlanetenTyp(brutaler, vulkanisch). 
planetenGruppePlanetenTyp(drohendeKernExplosion, vulkanisch).
planetenGruppePlanetenTyp(flammenGepeitschter, vulkanisch). 
planetenGruppePlanetenTyp(geschmolzener, vulkanisch).
planetenGruppePlanetenTyp(instabiler, vulkanisch). 
planetenGruppePlanetenTyp(lava, vulkanisch). 
planetenGruppePlanetenTyp(magma, vulkanisch). 
planetenGruppePlanetenTyp(obsidianPerle, vulkanisch).
planetenGruppePlanetenTyp(tektonischer, vulkanisch). 
planetenGruppePlanetenTyp(vulkanischer, vulkanisch). 

planetenGruppePlanetenTyp(wurmbefallener, gemaessigt). 
planetenGruppePlanetenTyp(verseuchter, gemaessigt). 
planetenGruppePlanetenTyp(beschaedigter, gemaessigt). 
planetenGruppePlanetenTyp(mutierter, gemaessigt). 

planetenGruppePlanetenTyp(wasser, gemaessigt). 
planetenGruppePlanetenTyp(versunkener, gemaessigt). 
planetenGruppePlanetenTyp(wasserWelt, gemaessigt). 
planetenGruppePlanetenTyp(ozeanischer, gemaessigt). 
planetenGruppePlanetenTyp(flut, gemaessigt). 
planetenGruppePlanetenTyp(wasserBedeckter, gemaessigt). 
planetenGruppePlanetenTyp(aquatischer, gemaessigt). 
planetenGruppePlanetenTyp(meeres, gemaessigt). 


/* Typ gesichert */
planetenGruppePlanetenTyp(aetzender, giftig). 
planetenGruppePlanetenTyp(faulender, giftig). 
planetenGruppePlanetenTyp(giftiger, giftig). 
planetenGruppePlanetenTyp(saeuerlicher, giftig). 
planetenGruppePlanetenTyp(schaedlicher, giftig). 
planetenGruppePlanetenTyp(scharfer, giftig). 
planetenGruppePlanetenTyp(toedlicheGrueneAnomalie, giftig). 
planetenGruppePlanetenTyp(ungesunder, giftig).
planetenGruppePlanetenTyp(verdorbener, giftig). 

planetenGruppePlanetenTyp(arktischer, frostig). 
planetenGruppePlanetenTyp(eisiger, frostig). 
planetenGruppePlanetenTyp(eiskalter, frostig). 
planetenGruppePlanetenTyp(frostiger, frostig). 
planetenGruppePlanetenTyp(hyperboreisch, frostig). 
planetenGruppePlanetenTyp(gefrorener, frostig). 
planetenGruppePlanetenTyp(gefrierender, frostig). 
planetenGruppePlanetenTyp(staubiger, frostig). 
planetenGruppePlanetenTyp(sternKorruptionEntdeckt, frostig). 
planetenGruppePlanetenTyp(ultramarin, frostig). 
planetenGruppePlanetenTyp(winterlicher, frostig). 
planetenGruppePlanetenTyp(zugefrorener, frostig). 
  
planetenGruppePlanetenTyp(ausgetrockneter, trocken). 
planetenGruppePlanetenTyp(felsiger, trocken). 
planetenGruppePlanetenTyp(trostloser, trocken). 
planetenGruppePlanetenTyp(unwirtlicher, trocken).
planetenGruppePlanetenTyp(verlassener, trocken). 
planetenGruppePlanetenTyp(windgepeitschter, trocken). 
planetenGruppePlanetenTyp(wuesten, trocken). 
  
planetenGruppePlanetenTyp(bluehender, gemaessigt). 
planetenGruppePlanetenTyp(feuchter, gemaessigt). 
planetenGruppePlanetenTyp(gemaessigter, gemaessigt). 
planetenGruppePlanetenTyp(gruenender, gemaessigt). 
planetenGruppePlanetenTyp(gruenlicher, gemaessigt). 
planetenGruppePlanetenTyp(paradiesischer, gemaessigt). 
planetenGruppePlanetenTyp(regnerischer, gemaessigt). 
planetenGruppePlanetenTyp(reichhaltiger, gemaessigt).
planetenGruppePlanetenTyp(tropischer, gemaessigt). 
planetenGruppePlanetenTyp(verwilderter, gemaessigt). 
planetenGruppePlanetenTyp(verseuchtesParadies, gemaessigt). 

planetenGruppePlanetenTyp(feurigeSchreckensWelt, heiss).
planetenGruppePlanetenTyp(heisser, heiss). 
planetenGruppePlanetenTyp(sengender, heiss). 
planetenGruppePlanetenTyp(sengendHeisser, heiss). 
planetenGruppePlanetenTyp(siedender, heiss). 
planetenGruppePlanetenTyp(unfruchtbarer, heiss). 
planetenGruppePlanetenTyp(bruehender, heiss). 
planetenGruppePlanetenTyp(feuriger, heiss). 
planetenGruppePlanetenTyp(verbrannter, heiss). 
planetenGruppePlanetenTyp(weissGluehender, heiss). 

planetenGruppePlanetenTyp(gammaintensiver, radioAktiv). 
planetenGruppePlanetenTyp(isotopischer, radioAktiv). 
planetenGruppePlanetenTyp(kontaminierter, radioAktiv). 
planetenGruppePlanetenTyp(mitHoherEnergie, radioAktiv). 
planetenGruppePlanetenTyp(mitHoherRadioQuelle, radioAktiv). 
planetenGruppePlanetenTyp(nuklearer, radioAktiv). 
planetenGruppePlanetenTyp(radioaktiver, radioAktiv). 
planetenGruppePlanetenTyp(superkritischer, radioAktiv). 
planetenGruppePlanetenTyp(verfallenerNuklearer, radioAktiv). 
planetenGruppePlanetenTyp(verstrahlter, radioAktiv). 



test :-
	\+testInKonsistent.
	
testInKonsistent :-
	planetenGruppePlanetenTyp(PlanetenGruppe, Typ),
	\+planetenTyp(Typ),
	format('Planetengruppe ~k nicht bekannt.~n',[PlanetenGruppe]).
	