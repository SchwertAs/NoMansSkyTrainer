:- module(sammeln, [sammelbar/3, sammelAktion/1, wandelAktion/1, fertigeLoesung/8]).

:- dynamic(sammelbar/3).
:- dynamic(fertigeLoesung/8).

/* mögliche Sammleaktionen */
sammelAktion(erkaempfen).
sammelAktion(ernten).
sammelAktion(vonTierenErhalten).
sammelAktion(jagen).
sammelAktion(minenLaserNutzen).
sammelAktion(pfluecken).
sammelAktion(raumSchuerfen).
sammelAktion(terrainFormerNutzen).
sammelAktion(verbessertenMinenLaserNutzen).
sammelAktion(vorfertigen).

/* mögliche Stoffwandelaktionen */
wandelAktion(bauen).
wandelAktion(herstellen).
wandelAktion(kochen).
wandelAktion(raffinieren).

/* Pflanzen ohne Gerät wild ernten */
pfluecken(natrium, 20).
pfluecken(sauerStoff, 20).
pfluecken(pilzSchimmel, 20).
pfluecken(kristallSulfid, 20).
pfluecken(kelpBeutel, 20).

/* seit Koch Update */
pfluecken(aloeFleisch, 20).
pfluecken(beutelGift, 20).
pfluecken(eiweissPerle, 20).
pfluecken(feuerBeere, 20).
pfluecken(fleischigeWurzeln, 20).
pfluecken(frostKristall, 20).
pfluecken(gammaWurzel, 20).
pfluecken(gefroreneKnollen, 20).
pfluecken(grahBeere, 20).
pfluecken(gravitinoBall, 20).
pfluecken(heptaPloidWeizen, 20).
pfluecken(hexaBeere, 20).
pfluecken(impulsBohnen, 20).
pfluecken(jadeErbsen, 20).
pfluecken(kaktusFleisch, 20).
pfluecken(pilzSchimmel, 20).
pfluecken(solanium, 0).
pfluecken(sternenKnolle, 20).
pfluecken(sturmKristall, 20).
pfluecken(suessWurzel, 20).

/* nutzbare anomalieen (Deko) */
einsacken(defekterSeparator).
einsacken(lichtBruch).

/* jagen */
jagen(beinFleisch, 20).
jagen(diploStuecke, 20).
jagen(fleischigeStuecke, 20).
jagen(fleischigeFluegel, 20).
jagen(katzenLeber, 20).
jagen(mordit, 20).
jagen(protoWurst, 20).
jagen(rohesSteak, 20).
jagen(salzigeFischFilets, 20).
jagen(schreiterWurst, 20).
jagen(schuppigesFleisch, 20).

/* mit Minenlaser auf Planet */
minenLaserNutzen(ammoniak, 7).
minenLaserNutzen(cadmium, 0).
minenLaserNutzen(deuterium, 0).
minenLaserNutzen(diWasserStoff, 4).
minenLaserNutzen(ferritStaub, 3).
minenLaserNutzen(gammaWurzel, 4).
minenLaserNutzen(geode, 0).
minenLaserNutzen(kelpBeutel, 20).
minenLaserNutzen(kristallFragment, 0).
minenLaserNutzen(kobalt, 4).
minenLaserNutzen(kohlenStoff, 2).
minenLaserNutzen(kuerbisKnolle, 5).
minenLaserNutzen(natrium, 7).
minenLaserNutzen(pilzSchimmel, 1).
minenLaserNutzen(sauerStoff, 9).
minenLaserNutzen(sternenKnolle, 0).
minenLaserNutzen(stickStoff, 9).
minenLaserNutzen(sturmKristall, 0).

/* mit Terrainformer abbauen */
terrainFormerNutzen(aktiviertesCadmium, 0).
terrainFormerNutzen(aktiviertesEmeril, 0).
terrainFormerNutzen(aktiviertesIndmium, 0).
terrainFormerNutzen(aktiviertesKupfer, 0).
terrainFormerNutzen(ammoniak, 3).
terrainFormerNutzen(cadmium, 0).
terrainFormerNutzen(emeril, 0).
terrainFormerNutzen(indmium, 0).
terrainFormerNutzen(kupfer, 3).
terrainFormerNutzen(natrium, 6).

/* mit Terrainformer ausgraben */
terrainFormerNutzen(schmutzigeKnochenFragmente, 300).
terrainFormerNutzen(geborgeneDaten, 300).

/* verbesserter Minenlaser */
verbessertenMinenLaserNutzen(reinesFerrit, 3).
verbessertenMinenLaserNutzen(paraffinium, 3).
verbessertenMinenLaserNutzen(mordit, 3).

/*verbessertenMinenLaserNutzen(salz, 29).*/

/* bei Zerstörung von Wesen */
erkaempfen(pugneum, 12000).      /* von Wächter */
erkaempfen(hypnotischesAuge, 0). /* von abyssal horror */
erkaempfen(larvenKern, 0).       /* von flüsterndes Ei */
erkaempfen(lebendePerle, 0).     /* von gepanzerte Muschel */
erkaempfen(kampfLaeuferGehirn, 0).     /* von gepanzerte Muschel */

/* Agrar */
ernten(frostKristall, 20).
ernten(eiweissPerle, 20).
ernten(gammaWurzel, 20).
ernten(gravitinoBall, 20).
ernten(pilzSchimmel, 20).
ernten(faecium, 20).
ernten(kaktusFleisch, 20).
ernten(sternenKnolle, 20).
ernten(mordit, 20).
ernten(solanium, 20).
ernten(gravitinoBall, 20).

/* Meteoritenfelder */
raumSchuerfen(tritium, 2).
raumSchuerfen(gold, 75).
raumSchuerfen(goldKlumpen, 0).
raumSchuerfen(tritiumHyperCluster, 0).
raumSchuerfen(silber, 16).
raumSchuerfen(platin, 20).

/* Vorfertigen */
vonTierErhalten(faecium, 20).
vonTierErhalten(frischeMilch, 20).
vonTierErhalten(grosseEier, 20).
vonTierErhalten(holzApfel, 20).
vonTierErhalten(klebrigerHonig, 20).
vonTierErhalten(kreaturenEi, 20).
vonTierErhalten(leopardenFrucht, 20).
vonTierErhalten(regisFett, 20).
vonTierErhalten(riesenEi, 20).
vonTierErhalten(warmeProtoMilch, 20).
vonTierErhalten(wildeMilch, 20).

/* Vorfertigen */
vorfertigen(antiMaterie).
vorfertigen(antiMaterieGehaeuse).
vorfertigen(aronium).
vorfertigen(glas).
vorfertigen(grantine).
vorfertigen(herox).
vorfertigen(instabilesGel).
vorfertigen(instabilesNatrium).
vorfertigen(kohlenStoffKristall).
vorfertigen(lemmium).
vorfertigen(magnoGold).
vorfertigen(saeure).
vorfertigen(seltenesMetallElement).
vorfertigen(stickStoffSalz).
vorfertigen(strassenKoeterBronze).
vorfertigen(superOxidKristall).
vorfertigen(tetraKobalt).
vorfertigen(thermischesKondensat).
vorfertigen(chlorGitter).
vorfertigen(frostKristall).
vorfertigen(gammaWurzel).
vorfertigen(organischerKatalysator).

vorfertigen(geheimnisVollerFleischEintopf).

sammelbarInit :-
	\+sammelbarInitFlach,
	\+sammelbarVorfertigen.
	
sammelbarInitFlach :-
	abolish(sammelbar/3),
	ausgangsStoff:stoff(Stoff, _),
	findall(EineHauptZeit, sammelArt(Stoff, _, EineHauptZeit), HauptZeiten),
	min_member( MinimaleHauptZeit, HauptZeiten),
	\+HauptZeiten = [],
	sammelArt(Stoff, Operation, MinimaleHauptZeit),
	assertz(sammelbar(Stoff, Operation, MinimaleHauptZeit)),
	fail.
	
sammelbarVorfertigen :-
	abolish(fertigeLoesung/8),
	vorfertigen(Stoff),
	Operation = vorfertigen,
	\+suchAlgorithmus:baue(1, Stoff),
	findall(GesamtZahlSammlung, (suchAlgorithmus:loesung(Stoff, _, _, GesamtZahlSammlung, _, _, _, _), GesamtZahlSammlung > 0), GesamtZahlListe),
	min_member(MinimalSammelZahl, GesamtZahlListe),
	findall(ZeitSammlung, suchAlgorithmus:loesung(Stoff, _, _, MinimalSammelZahl, _, ZeitSammlung, _, _), ZeitSammlungListe),
	min_member(MinimalZeit, ZeitSammlungListe),
	suchAlgorithmus:loesung(Stoff, Vorgaenge, SammelSet, MinimalSammelZahl, GesamtWertSammlung, MinimalZeit, GesamtAufwand, Erloes),
	assertz(sammelbar(Stoff, Operation, MinimalZeit)),
	assertz(fertigeLoesung(Stoff, Vorgaenge, SammelSet, MinimalSammelZahl, GesamtWertSammlung, MinimalZeit, GesamtAufwand, Erloes)),
	fail.

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = minenLaserNutzen,
	spielStatus:spielStatus(minenLaser, true),
	minenLaserNutzen(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = verbessertenMinenLaserNutzen,
	spielStatus:spielStatus(verbesserterMinenLaser, true),
	verbessertenMinenLaserNutzen(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = terrainFormerNutzen,
	spielStatus:spielStatus(terrainFormer, true),
	terrainFormerNutzen(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = pfluecken,
	pfluecken(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = raumSchuerfen,
	spielStatus:spielStatus(raumSchiffIstFlott, true),
	raumSchuerfen(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = ernten,
	spielStatus:spielStatus(anbau, true),
	ernten(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = erkaempfen,
	spielStatus:spielStatus(kampfWille, true),
	erkaempfen(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = vonTierenErhalten,
	spielStatus:spielStatus(tierHaltung, true),
	vonTierErhalten(Stoff, HauptZeit).

sammelArt(Stoff, Operation, HauptZeit) :-
	Operation = jagen,
	jagen(Stoff, HauptZeit).




