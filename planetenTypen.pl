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
planetenTyp(tot).
planetenTyp(trocken).	
	
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
	PlanetenTyp = trocken.
	
	
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

planetenGruppePlanetenTyp(chromatischerNebel, megaExotisch). 
planetenGruppePlanetenTyp(toedlicheGrueneAnomalieMegaExot, megaExotisch). 
planetenGruppePlanetenTyp(himmelBlauerPlanet, megaExotisch). 
planetenGruppePlanetenTyp(verlorenerBlauerPlanet, megaExotisch). 

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

test :-
	\+testInKonsistent.
	
testInKonsistent :-
	planetenGruppePlanetenTyp(PlanetenGruppe, Typ),
	\+planetenTyp(Typ),
	format('Planetengruppe ~k nicht bekannt.~n',[PlanetenGruppe]).
	