:- module(ausgangsStoff, [stoff/2, doppelteInStoff/0]).


/* name, Wert in units (GrundPreis) */

/* nur kaufen und verkaufen */
handelsWare(antiHaftKolben, 6000).
handelsWare(ausrangierteSchaltPlatte, 1000).
handelsWare(autonomePositionierungsEinheit, 30000).
handelsWare(experimentelleEnergieFluessigkeit, 30000).
handelsWare(bromSalz, 15000).
handelsWare(fuenfDimensionalerTorus, 30000).
handelsWare(funkenKanister, 1000).
handelsWare(gewaltigesMetallZahnRad, 1000).
handelsWare(holographischeKurbelWelle, 30000).
handelsWare(industrieBatterie, 6000).
handelsWare(instabilitaetsInjektor, 15000).
handelsWare(ionenKugel, 30000).
handelsWare(ionenKondensator, 15000).
handelsWare(kometenTroepfchen, 15000).
handelsWare(nanoRohrKiste, 1000).
handelsWare(neuralLeitung, 50000).
handelsWare(neutronenMikroskop, 6000).
handelsWare(nichtMehrDuftendePheromonFlasche, 1000). 
handelsWare(ohmschesGel, 15000).
handelsWare(optischesLoesungsMittel, 15000).
handelsWare(organischeRohre, 30000).
handelsWare(polyChronesZirkonium, 30000).
handelsWare(quantumBeschleuniger, 50000).
handelsWare(schmutz, 1000).
handelsWare(schweisserSeife, 6000).
handelsWare(sechsZackigerEntKoppler, 15000).
handelsWare(sichSelbstReparierendesHeridium, 6000).
handelsWare(supraleitendeFaser, 50000).
handelsWare(unraffiniertesPyritFett, 6000).
handelsWare(vergitterterBogenKristall, 50000).

/* nur aufnehmen, bauen, verkaufen */
anormaleMaterialien(kappillarMuschel, 1000).
anormaleMaterialien(lichtBruch, 1000).

/* ausgraben, pflücken, für Ansehen schenken, verkaufen */
relikt(gekNip, 20625).
relikt(gekRelikt, 23375).
relikt(korvaxGehaeuse, 22000).
relikt(vyKeenBildnis, 24750).
relikt(vyKeenDolch, 11688).

/* ausgraben, pflücken, verkaufen */
artefakte(schmutzigeKnochenFragmente, 104981).

/* sammeln, verkaufen */
gesammelteHandelsWare(beutelGift, 11685).
gesammelteHandelsWare(eiweissPerle, 9025).
gesammelteHandelsWare(gravitinoBall, 12445).
gesammelteHandelsWare(wirbelWuerfel, 5800).

/* sammeln, verkaufen oder analysieren */
konglomerat(goldKlumpen, 3280).
konglomerat(tritiumHyperCluster, 3280).
konglomerat(kristallFragment, 3280).
konglomerat(geode, 3280).


/* ----------------- alle Stoffe ------------------------------- */
stoff(absprungKapselKoordinaten, 85000).
stoff(abgruendigerEintopf, 800).
stoff(aloeFleisch, 300).
stoff(angereicherterKohlenStoff, 50000).
stoff(aktiviertesCadmium, 450).
stoff(aktiviertesEmeril, 696).
stoff(aktiviertesIndium, 949).
stoff(aktiviertesKupfer, 245).
stoff(alarmierendeTorte, 800).
stoff(anormaleMarmelade, 800).
stoff(anormaleTorte, 800).
stoff(anormalerDonut, 800).
stoff(ammoniak, 62).
stoff(antiMaterie, 5233).
stoff(antiMaterieGehaeuse, 6500).
stoff(apfelEisCreme, 800).
stoff(apfelKuchenVerlorenerSeelen, 800).
stoff(apfelKuriositaet, 800).
stoff(aronium, 25000).
stoff(balastStoffReichePastete, 800).
stoff(beinFleisch, 800).
stoff(beineImTeigMantel, 800).
stoff(bitterSuesserKakao, 800).
stoff(blutigesOrgan, 800).
stoff(brandKuchenDesGrauens, 800).
stoff(bratOel, 800).
stoff(brot, 800).
stoff(brueterTorte, 800).
stoff(cadmium, 234).
stoff(chlor, 602).
stoff(chlorGitter, 6150).
stoff(chromatischesMetall, 245).
stoff(cremigeSosse, 800).
stoff(delikatessBaiser, 800).
stoff(derMerkWuerdigsteKuchen, 800).
stoff(derStellarator, 800).
stoff(diploStuecke, 800).
stoff(deuterium, 34).
stoff(dickerFleischEintopf, 800).
stoff(dickerSuesserTeig, 800).
stoff(dioxit, 62).
stoff(diWasserStoff, 34).
stoff(diWasserStoffGelee, 200).
stoff(duftendeKraeuter, 800).
stoff(dunkleMaterie, 1000).
stoff(eisCreme, 800).
stoff(eisSchreie, 800).
stoff(emeril, 348).
stoff(endeDerDaemmerung, 1000).
stoff(engelsObstKuchen, 800).
stoff(entfesselteMonstrositaet, 800).
stoff(entfesseltesSahneHorn, 800).
stoff(entschluesselteBenutzerDaten, 1000).
stoff(entsetzlicherMarmeladenSchwamm, 800).
stoff(enzymFluessigkeit, 800).
stoff(erfrischungsGetraenk, 800).
stoff(ewigSiedenderKuchen, 800).
stoff(ewigeEisCreme, 800).
stoff(ewigerHonigKuchen, 800).
stoff(ewigerKuchen, 800).
stoff(ewigesMarmeladenBiskuit, 800).
stoff(extraFluffigerTeig, 800).
stoff(faecium, 30).
stoff(fasrigerEintopf, 800).
stoff(fellKnaeuelGelee, 800).
stoff(fellTorteInAspik, 800).
stoff(fermentierteFruechte, 800).
stoff(festerFettKuchen, 800).
stoff(feuerBeere, 300).
stoff(feuerWasser, 800).
stoff(feurigeMarmelade, 800).
stoff(feurigesMarmeladenBiskuit, 800).
stoff(ferritStaub, 14).
stoff(fluffigeKaramellFreude, 800).
stoff(fluffigerRachenSpalter, 800).
stoff(frischeFlutPalmenSprossen, 118669).
stoff(fleischFlocken, 300).
stoff(fleischigeFluegel, 800).
stoff(fleischigeStuecke, 300).
stoff(fleischigeWurzeln, 300).
stoff(fleischMitGewurzKruste, 800).
stoff(fluechtigeSchokoTorte, 800).
stoff(fluessigSprengStoff, 800500).
stoff(fluesterndesOmelett, 800).
stoff(fischPastete, 800).
stoff(fortschrittlicherIonenAkku, 500).
stoff(fragwuerdigerSuesserKuchen, 800).
stoff(fregattenTreibStoff100to, 40000).
stoff(fregattenTreibStoff200to, 80000).
stoff(fregattenTreibStoff50to, 20000).
stoff(frischeMilch, 800).
stoff(frostKristall, 12).
stoff(fruchtEisCreme, 800).
stoff(fruchtigerPudding, 800).
stoff(funkelnderHonigKuchen, 800).
stoff(fusionsBeschleuniger, 7500000).
stoff(fusionsZuender, 15600000).
stoff(gammaWurzel, 16).
stoff(gebaeck, 800).
stoff(gebackeneEier, 800).
stoff(gedankenBogen, 1000).
stoff(geduenstetesGemuese, 300).
stoff(gefangeneNanode, 1000).
stoff(gefroreneKnollen, 300).
stoff(gefuellteOrgane, 800).
stoff(geheimnisVollerFleischEintopf, 800).
stoff(geheimnisVolleFleischPastete, 800).
stoff(gemueseCremeSuppe, 800).
stoff(geoDesit, 150000).
stoff(gequaelterHonigKuchen, 800).
stoff(geraeucherteFleischPastete, 800).
stoff(geraeuchertesFleisch, 800).
stoff(geschlageneButter, 800).
stoff(geschmorteOrgane, 800).
stoff(gestampfteWurzelPastete, 800).
stoff(gesuessteButter, 800).
stoff(gesuessteProtoButter, 800).
stoff(gesuessterKompost, 800).
stoff(gewuerzterApfelKuchen, 800).
stoff(glas, 13000).
stoff(glasKoerner, 300).
stoff(glasKuchen, 800).
stoff(gold, 202).
stoff(grantine, 25000).
stoff(grahBeere, 300).
stoff(grahmeLade, 800).
stoff(grosseEier, 800).
stoff(hackFleisch, 800).
stoff(halbFluessigerKaese, 800).
stoff(halbLeiter, 320000).
stoff(heimgesuchtePastete, 800).
stoff(heimgesuchteSchokoTraeume, 800).
stoff(heissesEis, 320000).
stoff(heisseSosse, 800).
stoff(heptaPloidWeizen, 300).
stoff(hermetischesSiegel, 800).
stoff(heulenderKaramellKuchen, 800).
stoff(heulenderTeig, 800).
stoff(herox, 25000).
stoff(herzDerSonne, 1000).
stoff(hexaBeere, 300).
stoff(hitzeKondensator, 50000).
stoff(holzApfel, 800).
stoff(honigButter, 800).
stoff(honigButterDonut, 800).
stoff(honigDonut, 800).
stoff(honigEisCreme, 800).
stoff(honigEngelKuchen, 800).
stoff(honigKuchenMitSalz, 800).
stoff(honigTorte, 800).
stoff(hypnotischesAuge, 60000).
stoff(hydrothermaleTreibStoffZelle, 7200).
stoff(immerBrennendeMarmelade, 800).
stoff(impulsBohnen, 300).
stoff(indium, 464).
stoff(innereienBeutel, 800).
stoff(instabilesGel, 50000).
stoff(instabilesNatrium, 12300).
stoff(instabilesPlasma, 5750).
stoff(interStellareKuriositaet, 800).
stoff(interStellareTorte, 800).
stoff(ionenAkku, 200).
stoff(ionisiertesKobalt, 401).
stoff(iridesit, 150000).
stoff(jadeErbsen, 300).
stoff(kabelBaum, 50000).
stoff(kaeseFleischEintopf, 800).
stoff(kaeseGemuesePastete, 800).
stoff(kaeseTorte, 800).
stoff(kakaoDonut, 800).
stoff(kakaoTorte, 800).
stoff(kaktusFleisch, 28).
stoff(kaktusGelee, 800).
stoff(kaktusNektar, 300).
stoff(kampfLaeuferGehirn, 35000).
stoff(karamellDonut, 800).
stoff(karamellEisCreme, 800).
stoff(karamellisierterAlbTraum, 800).
stoff(karamellKuriositaet, 800).
stoff(karamellTorte, 800).
stoff(katzenLeber, 800).
stoff(kelpBeutel, 41).
stoff(kelpReis, 300).
stoff(klebrigeButter, 800).
stoff(klebrigeFruchtUeberraschung, 800).
stoff(klebrigeProtoButter, 800).
stoff(klebrigePuddingTorte, 800).
stoff(klebrigerBrueller, 800).
stoff(klebrigerHonig, 800).
stoff(klebrigerKaramellKuchen, 800).
stoff(klebrigerProtoDonut, 800).
stoff(klebrigerPudding, 800).
stoff(klebrigerSchokoladenKuchen, 800).
stoff(klebrigesHonigKuechlein, 800).
stoff(klebrigesMundFeuer, 800).
stoff(klobigerDonut, 800).
stoff(knusperKaramell, 800).
stoff(kobalt, 198).
stoff(kobaltSpiegel, 20500).
stoff(koestlicherGemueseEintopf, 800).
stoff(kohlenStoff, 12).
stoff(kohlenStoffKristall, 3600).
stoff(kohlenStoffNanoRohr, 500).
stoff(korvaxKonvergenzWuerfel, 13063).
stoff(kreaturenEi, 800).
stoff(kreaturenKugeln, 20).
stoff(kriechendesJuckHonigBiskuit, 7410).
stoff(kristallSulfid, 7410).
stoff(kryogenKammer, 3800000).
stoff(kryoPumpe, 1500000).
stoff(kuchenDerSuende, 800).
stoff(kuchenDerVerlorenen, 800).
stoff(kuchenMitKaramellKruste, 800).
stoff(kuchenTeig, 800).
stoff(kuerbisFleisch, 300).
stoff(kuerbisKnolle, 41).
stoff(kuenstlicheWuermer, 800).
stoff(kupfer, 121).
stoff(larvenKern, 65000).
stoff(lebendePerle, 4798).
stoff(lebenderSchleim, 20).
stoff(lebendesGlas, 566000).
stoff(lebensErhaltungsGel, 200).
stoff(leopardenFrucht, 800).
stoff(lemmium, 25000).
stoff(leuchtPastete, 800).
stoff(magnetisiertesFerrit, 82).
stoff(magnoGold, 25000).
stoff(marmeladenBiskuit, 800).
stoff(marmeladenDonut, 800).
stoff(marmeladenKuriositaet, 800).
stoff(marmeladenSchleimer, 800).
stoff(marmeladenTorte, 800).
stoff(metallPlatten, 800).
stoff(mikroProzessor, 2000).
stoff(modifizierteQuanten, 1000).
stoff(monstroeserDonut, 800).
stoff(monstroeserHonigKuchen, 800).
stoff(monstroeserPudding, 800).
stoff(mordit, 40).
stoff(nanitHaufen, -1).
stoff(natrium, 41).
stoff(natriumDiode, 3500).
stoff(natriumNitrat, 82).
stoff(navigationsDaten, 1000).
stoff(nipNipKnospen, 17776).
stoff(nooSphaerischKugel, 1000).
stoff(novaeRegenerat, 1000).
stoff(omelett, 800).
stoff(organischerKatalysator, 320000).
stoff(paraffinium, 62).
stoff(parasitenOmelett, 800).
stoff(pheromonBeutel, 800).
stoff(phosphor, 62).
stoff(photischerJade, 1000).
stoff(pilgerBeere, 300).
stoff(pilgerElixier, 800).
stoff(pikanteFleischBaellchen, 800).
stoff(pilzSchimmel, 16).
stoff(pilzTorte, 800).
stoff(platin, 303).
stoff(polyFaser, 130000).
stoff(projektilMunition, 50).
stoff(proteinReicherDonut, 800).
stoff(protoButter, 800).
stoff(protoButterMitHonig, 800).
stoff(protoKaese, 800).
stoff(protoKrapfen, 800).
stoff(protoKuchenMitHonig, 800).
stoff(protoOel, 800).
stoff(protoOmelett, 800).
stoff(protoSahne, 800).
stoff(protoTeig, 800).
stoff(protoWurst, 800).
stoff(protoWurstPastete, 800).
stoff(puddingDonut, 800).
stoff(puddingKuriositaet, 800).
stoff(puddingTorte, 800).
stoff(pugneum, 138).
stoff(pyrit, 62).
stoff(quantumProzessor, 4400000).
stoff(rachenKleberMitHonig, 800).
stoff(radon, 20).
stoff(rahmOrganSuppe, 800).
stoff(raumSchiffStartTreibStoff, 450).
stoff(regisFett, 800).
stoff(reinesFerrit, 28).
stoff(riesenEi, 800).
stoff(restSubstanz, 20).
stoff(rohesSteak, 800).
stoff(saeure, 188000).
stoff(sahne, 800).
stoff(sahneBroetchen, 800).
stoff(sahneHaeppchen, 800).
stoff(sahneKuchenDesUntergangs, 800).
stoff(sahneKuriositaet, 800).
stoff(salz, 299).
stoff(salzigeFischFilets, 800).
stoff(salzigeKoestlichkeit, 800).
stoff(salzigeUeberraschung, 800).
stoff(salzigerDonut, 800).
stoff(salzigerPudding, 800).
stoff(salzigerRauReif, 800).
stoff(salzRefaktor, 30500).
stoff(sanfteStachelUeberraschung, 800).
stoff(sauerStoff, 34).
stoff(sauerStoffFilter, 615).
stoff(sauerStoffKapsel, 350).
stoff(schaltPlatte, 916250).
stoff(scharferGemueseEintopf, 800).
stoff(schlaengelndeMarmelade, 800).
stoff(schlaengelndeTorte, 800).
stoff(schlaengelnderDonut, 800).
stoff(schmierMittel, 110000).
stoff(schokoladenEisCreme, 800).
stoff(schokoladenKuchen, 800).
stoff(schokoladenKuriositaet, 800).
stoff(schokoTraum, 800).
stoff(schrecklicheklebrigeKoestlichkeit, 800).
stoff(schrecklicherBrei, 800).
stoff(schreiterWurst, 800).
stoff(schuppigesFleisch, 800).
stoff(schwefelin, 20).
stoff(seelenEngine, 1000).
stoff(seltenesMetallElement, 4200).
stoff(silber, 101).
stoff(sievertBohnen, 300).
stoff(silikatPulver, 2).
stoff(silikonEi, 800).
stoff(solanium, 70).
stoff(softePuddingTorte, 800).
stoff(solartillo, 300).
stoff(speiseRoehrenUeberraschung, 800).
stoff(stacheligeKuriositaet, 800).
stoff(stacheligeTorte, 800).
stoff(staseGeraet, 15600000).
stoff(sternenEisCreme, 800).
stoff(sternenGeburtKoestlichkeit, 32).
stoff(sternenKnolle, 32).
stoff(sternenPudding, 800).
stoff(sternenPuddingTorte, 800).
stoff(sternenSeide, 6000).
stoff(sternenSchildBatterie, 500).
stoff(stickStoff, 20).
stoff(stickStoffSalz, 50000).
stoff(strassenKoeterBronze, 25000).
stoff(sturmKristall, 129150).
stoff(suesseSahneTraeume, 800).
stoff(suessWurzel, 300).
stoff(superLeichterSahneKuchen, 800).
stoff(superOxidKristall, 5100).
stoff(supraLeiter, 1500000).
stoff(synthetischerHonig, 800).
stoff(teleportKoordinaten, 50000).
stoff(teig, 800).
stoff(tetraKobalt, 6150).
stoff(toedlichKalteEisCreme, 800).
stoff(tortenBoden, 800).
stoff(thermischesKondensat, 50000).
stoff(tragbarerReaktor, 4200000).
stoff(traditionsKuchen, 800).
stoff(tritium, 6).
stoff(ueppigeHonigTorte, 800).
stoff(umhuellterSchatten, 1000).
stoff(ungiftigerPilz, 300).
stoff(unholdRogen, 800).
stoff(unkontrollierbarerSchimmel, 20).
stoff(unloesbarerMarmeladenSturz, 800).
stoff(uran, 248).
stoff(verarbeiteterZucker, 800).
stoff(verarbeitetesFleisch, 800).
stoff(verdichteterKohlenStoff, 600).
stoff(verfeinertesMehl, 800).
stoff(verrostetesMetall, 20).
stoff(vierfachServo, 20000).
stoff(vyEisCreme, 800).
stoff(warpZelle, 11733).
stoff(warmeProtoMilch, 800).
stoff(warpHyperKern, 46750).
stoff(wildeHefe, 300).
stoff(wildeMilch, 800).
stoff(windenderAufgewuehlterTeig, 800).
stoff(windendesMarmeladenKuechlein, 800).
stoff(geborgeneDaten, 50000).
stoff(wohlSchmeckendeSosse, 800).
stoff(wuergendesKuchenMonster, 800).
stoff(wuerzigerGemueseEintopf, 800).
stoff(wuerzigerKaese, 800).
stoff(wuerzigesEis, 800).
stoff(wuerzigeOrganUeberraschung, 800).
stoff(wurzelSaft, 800).
stoff(zaeheFluessigkeiten, 20).
stoff(zaeheOrganPaste, 800).
stoff(zustandsPhase, 1000).
stoff(zytoPhosphat, 201).

stoff(Stoff, Wert) :-
	basisBauEndStoff(Stoff),
	Wert = 0.

stoff(Stoff, Wert) :-
	modul(Stoff),
	Wert = 0.

/* =============================== Ausruestung ========================== */
/* ------------------------------- Anzugmodule -------------------------- */
modul(belueftungsMembranB).
modul(bewegungsModulC).
modul(bewegungsModulS).
modul(effizienteWasserDuesenA).
modul(einfacherUeberSetzerB).
modul(gefahrenSchutz).
modul(gefahrGutSchutzHandschuh).
modul(giftSchutzModulA).
modul(giftSchutzModulB).
modul(jetPack).
modul(kuehlMittelNetzwerkC).
modul(lebensErhaltung).
modul(lebensErhaltungsModulA).
modul(lebensErhaltungsModulB).
modul(lebensErhaltungsModulS).
modul(neuralStimulatorB).
modul(perfektionierterUebersetzerS).
modul(raketenStiefelA).
modul(sauerStoffUmleiterA).
modul(sauerStoffWiederVerwerterC).
modul(schildGitterB).
modul(schildModulA).
modul(schildModulC).
modul(strahlungsDeflektorC).
modul(strahlungsSchutzModulA).
modul(strahlungsSchutzModulB).
modul(strahlungsSchutzModulS).
modul(toxinDaempferC).
modul(verbesserterUebersetzerA).
modul(waermeSchichtC).
modul(waermeSchutzModulA).
modul(waermeSchutzModulB).
modul(waermeSchutzModulKaelteB).
modul(unterWasserSchutzModulB).

/* ------------------------------- Raumschiffmodule --------------------- */
modul(ablativePanzerungC).
modul(cadmiumAntriebB).
modul(deflektorSchild).
modul(dysonPumpeB).
modul(effizienteDuesenB).
modul(emerilAntriebA).
modul(fourierBegrenzerB).
modul(fragmentSuperAufladerB).
modul(grosseRaketenRohreB).
modul(hyperAntrieb).
modul(hyperAntriebModulC).
modul(impulsAntrieb).
modul(impulsAntriebModulC).
modul(infraMesser).
modul(infraMesserBeschleuniger).
modul(infraMesserModulC).
modul(infraMesserModulS).
modul(indiumAntriebS).
modul(konfliktScanner).
modul(nichtlineareOptikB).
modul(nichtlineareOptikC).
modul(phasenStrahler).
modul(phasenStrahlerModulC).
modul(phasenStrahlerModulS).
modul(photonenKanone).
modul(photonenKanonenModulC).
modul(positronenWerfer).
modul(positronModulB).
modul(positronModulC).
modul(positronModulS).
modul(raketenWerfer).
modul(raumSchiffSchildModulB).
modul(raumSchiffSchildModulC).
modul(startSchubDuese).
modul(startSystemLadeGeraetS).
modul(teleportEmpfaenger).
modul(wirtschaftsScanner).
modul(zyklotronBalliste).
modul(zyklotronModulB).
modul(zyklotronModulC).
modul(zyklotronModulS).


/* ------------------------------- Frachtermodule ----------------------- */
modul(frachterHyperAntrieb).
modul(frachterWarpReaktorSigmaC).
modul(frachterWarpReaktorTauB).
modul(frachterWarpReaktorThetaA).

/* ------------------------------- Fregatten-Module ------------------ */
modul(gedankenKontrollGeraet).
modul(holografischerAnalysator).
modul(mineralKompressor).
modul(sprengDrohnen).
modul(treibStoffOxidant).

/* ------------------------------- Multiwerkzeugmodule ------------------ */
modul(analyseVisier).
modul(bergBauStrahlModulC).
modul(blitzWerfer).
modul(blitzWerferModulC).
modul(blitzWerferModulS).
modul(eigenesKraftFeld).
modul(fortgeschrittenerMinenLaserA).
modul(geologieKanone).
modul(geologieKanonenModulC).
modul(geschossSchmiererC).
modul(glutSpeer).
modul(glutSpeerModulC).
modul(impulsWerfer).
modul(impulsWerferModulB).
modul(impulsWerferModulC).
modul(kampfVisier).
modul(laufIonisatorC).
modul(masseBeschleunigerC).
modul(minenLaser).
modul(optischerBohrerS).
modul(plasmaWerfer).
modul(plasmaWerferModulB).
modul(plasmaWerferModulC).
modul(plasmaWerferModulS).
modul(scanner).
modul(scannerModulA).
modul(scannerModulC).
modul(scannerModulS).
modul(streuBlaster).
modul(streuBlasterModulC).
modul(terrainManipulator).
modul(untersuchungsGeraetA).
modul(verstaerkteKartuschenC).
modul(wellenFormWiederVerwerterB).


/* ------------------------------- Exo-Fahrzeugmodule ------------------- */

modul(exoFahrzeugAntriebModulC).
modul(exoFahrzeugAntriebModulS).
modul(exoFahrzeugBeschleunigungsModul).
modul(exoFahrzeugBoostModulB).
modul(exoFahrzeugBoostModulC).
modul(exoFahrzeugBoostModulS).
modul(exoFahrzeugBordKanone).
modul(exoFahrzeugKanonenModulC).
modul(exoFahrzeugKanonenModulS).
modul(exoFahrzeugLaserModulC).
modul(exoFahrzeugMinenLaser).
modul(exoFahrzeugMinenLaserUpgradeSigmaA).
modul(exoFahrzeugSignalBooster).
modul(exoFahrzeugSignalBoosterUpgradeSigmaB).
modul(exoFahrzeugSignalBoosterUpgradeTauA).
modul(fusionsAntrieb).
modul(hochleistungsSonar).
modul(humboldtAntrieb).
modul(humboldtAntriebsModulC).
modul(humboldtAntriebsModulS).
modul(nautilonKanone).
modul(nautilonKanonenModulC).
modul(osmotischerGeneratorC).
modul(tethysStrahl).

/* ------------------------------- Zugangskarten ------------------------ */
basisBauEndStoff(atlasPassV1).
basisBauEndStoff(atlasPassV2).
basisBauEndStoff(atlasPassV3).

/* ------------------------------- Inventarnippes ----------------------- */
basisBauEndStoff(sternenSamen).

/* =============================== Baustoffe ============================ */
/* ------------------------------- Terminals ---------------------------- */
basisBauEndStoff(konstruktionsTerminal).
basisBauEndStoff(exoFahrzeugTerminal).
basisBauEndStoff(waffenTerminal).
basisBauEndStoff(wissenschaftsTerminal).
basisBauEndStoff(landwirtschaftsTerminal).

/* ------------------------------- Industriemodule ---------------------- */
basisBauEndStoff(annaeherungsSchalter).
basisBauEndStoff(bodenSchalter).
basisBauEndStoff(elektroMagnetischerGenerator).
basisBauEndStoff(energieUmkehrer).
basisBauEndStoff(gasExtraktor).
basisBauEndStoff(mineralienExtraktor).
basisBauEndStoff(schalter).
basisBauEndStoff(solarModul).
basisBauEndStoff(treibStoffReaktor).
basisBauEndStoff(versorgungsDepot).
basisBauEndStoff(versorgungsRohr).
basisBauEndStoff(wandSchalter).


/* ------------------------------- Landwirtschaftsmodule ---------------- */
basisBauEndStoff(echinoKaktus).
basisBauEndStoff(eiweissPerlenKugel).
basisBauEndStoff(floraBehaelterHochBeet).
basisBauEndStoff(floraBehaelterKasten).
basisBauEndStoff(floraBehaelterTubus).
basisBauEndStoff(frostWurz).
basisBauEndStoff(gammaGras).
basisBauEndStoff(giftIgel).
basisBauEndStoff(gravitinoWirt).
basisBauEndStoff(grosserHydroKulturTrog).
basisBauEndStoff(hydroKulturTrog).
basisBauEndStoff(magenKrampfBlume).
basisBauEndStoff(morditWurzel).
basisBauEndStoff(nipNip).
basisBauEndStoff(pilzGeflecht).
basisBauEndStoff(sonnenRebe).
basisBauEndStoff(sternenDorn).
basisBauEndStoff(topfPflanze).


/* ------------------------------- Lager --- ---------------------------- */
basisBauEndStoff(lagerBehaelter).
basisBauEndStoff(verschlosseneKiste).

/* ------------------------------- Exo-Fahrzeug-Stationen --------------- */
basisBauEndStoff(kolossGeoBucht).
basisBauEndStoff(nomadenGeoBucht).
basisBauEndStoff(roamerGeoBucht).
basisBauEndStoff(exoFahrzeugRufStation).
basisBauEndStoff(nautilonKammer).
basisBauEndStoff(pilgerGeoBucht).
basisBauEndStoff(rennInitiator).
basisBauEndStoff(rennHindernis).
basisBauEndStoff(rennKraftVerstaerker).

/* ------------------------------- Tragbare Technologie ----------------- */
basisBauEndStoff(atmosphaerenVerarbeitungsAnlage).
basisBauEndStoff(autonomeBergBauEinheit).
basisBauEndStoff(basisComputer).
basisBauEndStoff(batterie).
basisBauEndStoff(konstruktionsForschungsStation).
basisBauEndStoff(bioTreibStoffReaktor).
basisBauEndStoff(kommunikationsStation).
basisBauEndStoff(nachrichtenModul).
basisBauEndStoff(naehrStoffProzessor).
basisBauEndStoff(signalBooster).
basisBauEndStoff(speicherPunkt).
basisBauEndStoff(speicherSignal).
basisBauEndStoff(tragbareRaffinerie).

/* ------------------------------- Technologie Allgemein ---------------- */
basisBauEndStoff(antiMaterieReaktor).
basisBauEndStoff(aussehenModifikator).
basisBauEndStoff(automatischerFuetterer).
basisBauEndStoff(basisBergungsKapsel).
basisBauEndStoff(basisTelePorterModul).
basisBauEndStoff(gefahrenSchutzEinheit).
basisBauEndStoff(gesundheitsStation).
basisBauEndStoff(grosseRaffinerie).
basisBauEndStoff(kurzStreckenTelePorter).
basisBauEndStoff(landeFeld).
basisBauEndStoff(mittlereRaffinerie).
basisBauEndStoff(nutzTierEinheit).
basisBauEndStoff(terminalDesGalaktischenMarktes).

/* ------------------------------- Energietechnologie ------------------- */
basisBauEndStoff(elektrischeVerkabelung).

/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Dekoration %%%%%%%%%%%%%%%%%%%%%%%%%%% */
/* =====================  Motiv Designs ============================================== */
basisBauEndStoff(motivStilisiertesR).
basisBauEndStoff(motivRundPipette).
basisBauEndStoff(motivFaltungDuennDick).
basisBauEndStoff(motivZiegelSteine).
basisBauEndStoff(motivRadioAktivGrau).
basisBauEndStoff(motivGrabStein).
basisBauEndStoff(motivHelloGames).
basisBauEndStoff(motivBuegel).
basisBauEndStoff(motivNo1).
basisBauEndStoff(motivNo2).
basisBauEndStoff(motivNo3).
basisBauEndStoff(motivNo4).
basisBauEndStoff(motivNo5).
basisBauEndStoff(motivNo6).
basisBauEndStoff(motivNo7).
basisBauEndStoff(motivNo8).
basisBauEndStoff(motivNo9).
basisBauEndStoff(motivSchildErstochenerVogel).
basisBauEndStoff(motivSchildGrünerMann).
basisBauEndStoff(motivSchildKorvax).
basisBauEndStoff(motivFroschSack).
basisBauEndStoff(motivLaemmchen).

/* =====================  Dekorative Module 1 ======================================== */
basisBauEndStoff(achtEckSchrank).
basisBauEndStoff(deckenPaneel).
basisBauEndStoff(fassFoermigerFabrikator).
basisBauEndStoff(flachesModul).
basisBauEndStoff(gruenerWandBildSchirm).
basisBauEndStoff(hoherSchrank).
basisBauEndStoff(kanisterRegal).
basisBauEndStoff(kistenFoermigerFabrikator).
basisBauEndStoff(kleineKiste).
basisBauEndStoff(lagerModulDeko).
basisBauEndStoff(oszilloskop).
basisBauEndStoff(regalModul).
basisBauEndStoff(roboterArm).
basisBauEndStoff(schliessFach).
basisBauEndStoff(schubLadenSchrank).
basisBauEndStoff(seitenModul).
basisBauEndStoff(server).
basisBauEndStoff(techBedienFeld).
basisBauEndStoff(waffenRegal).
basisBauEndStoff(wandBildSchirm).
basisBauEndStoff(wandEinheit).
basisBauEndStoff(wandVentilator).

/* =====================  Dekorative Module 2 ======================================== */
basisBauEndStoff(arbeitsPlatte).
basisBauEndStoff(bett).
basisBauEndStoff(bodenMatte).
basisBauEndStoff(eckSofa).
basisBauEndStoff(einfacherSchreibTisch).
basisBauEndStoff(ergonomischesSofa).
basisBauEndStoff(flagge1).
basisBauEndStoff(flagge2).
basisBauEndStoff(flagge3).
basisBauEndStoff(flagge4).
basisBauEndStoff(gewoelbterTisch).
basisBauEndStoff(grosseMonitorStation).
basisBauEndStoff(leichterTisch).
basisBauEndStoff(monitorStation).
basisBauEndStoff(sofa).
basisBauEndStoff(stuhl).
basisBauEndStoff(tisch).
basisBauEndStoff(wandFlagge1).
basisBauEndStoff(wandFlagge2).
basisBauEndStoff(wandFlagge3).

/* =====================  Beleuchtung ================================================ */
basisBauEndStoff(deckenLeuchte).
basisBauEndStoff(laborLampe).
basisBauEndStoff(lichtHandLampe).
basisBauEndStoff(lichtStehLampeEckig).
basisBauEndStoff(lichtStehLampeRund).
basisBauEndStoff(lichtStehLampeSchirm).
basisBauEndStoff(farbigeLeuchte).
basisBauEndStoff(farbigeLeuchteBlau).
basisBauEndStoff(farbigeLeuchteGruen).
basisBauEndStoff(farbigeLeuchteGelb).
basisBauEndStoff(farbigeLeuchteOrange).
basisBauEndStoff(farbigeLeuchteRot).


/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Strukturen %%%%%%%%%%%%%%%%%%%%%%%%%%% */
/* =============================== Einfache Komponenten ================= */
/* ------------------------------- Holzkomponenten ---------------------- */
basisBauEndStoff(dachInnenEckteilAusHolz).
basisBauEndStoff(duenneHolzWand).
basisBauEndStoff(elektrischeHolzTuer).
basisBauEndStoff(glasPlatteMitHolzRahmen).
basisBauEndStoff(grosseElektrischeHolzTuer).
basisBauEndStoff(halbeHolzRampe).
basisBauEndStoff(halberHolzBogen).
basisBauEndStoff(holzBodenPlatte).
basisBauEndStoff(holzBogen).
basisBauEndStoff(holzDach).
basisBauEndStoff(holzDachEckStueck).
basisBauEndStoff(holzDachPlatte).
basisBauEndStoff(holzFassade).
basisBauEndStoff(holzFenster).
basisBauEndStoff(holzRampe).
basisBauEndStoff(holzTuerRahmen).
basisBauEndStoff(holzWand).
basisBauEndStoff(holzTuer).
basisBauEndStoff(kleineHolzPlatte).
basisBauEndStoff(kleineHolzTuer).
basisBauEndStoff(kleineHolzWand).
basisBauEndStoff(kurzeHolzWand).
basisBauEndStoff(schraegeHolzPlatte).

/* ------------------------------- Metallkomponenten -------------------- */
basisBauEndStoff(dachInnenEckteilAusMetall).
basisBauEndStoff(duenneMetallWand).
basisBauEndStoff(elektrischeMetallTuer).
basisBauEndStoff(glasPlatteMitMetallRahmen).
basisBauEndStoff(grosseElektrischeMetallTuer).
basisBauEndStoff(halbeMetallRampe).
basisBauEndStoff(halberMetallBogen).
basisBauEndStoff(kleineMetallPlatte).
basisBauEndStoff(kleineMetallTuer).
basisBauEndStoff(kleineMetallWand).
basisBauEndStoff(kurzeMetallWand).
basisBauEndStoff(metallBodenPlatte).
basisBauEndStoff(metallBogen).
basisBauEndStoff(metallDach).
basisBauEndStoff(metallDachEckStueck).
basisBauEndStoff(metallDachPlatte).
basisBauEndStoff(metallFassade).
basisBauEndStoff(metallFenster).
basisBauEndStoff(metallRampe).
basisBauEndStoff(metallTuer).
basisBauEndStoff(metallTuerRahmen).
basisBauEndStoff(metallWand).
basisBauEndStoff(schraegeMetallPlatte).

/* ------------------------------- Betonkomponenten --------------------- */
basisBauEndStoff(betonBodenPlatte).
basisBauEndStoff(betonBogen).
basisBauEndStoff(betonDach).
basisBauEndStoff(betonDachEckStueck).
basisBauEndStoff(betonDachPlatte).
basisBauEndStoff(betonFassade).
basisBauEndStoff(betonFenster).
basisBauEndStoff(betonRampe).
basisBauEndStoff(betonTuer).
basisBauEndStoff(betonTuerRahmen).
basisBauEndStoff(betonWand).
basisBauEndStoff(dachInnenEckteilAusBeton).
basisBauEndStoff(duenneBetonWand).
basisBauEndStoff(elektrischeBetonTuer).
basisBauEndStoff(glasPlatteMitBetonRahmen).
basisBauEndStoff(grosseElektrischeBetonTuer).
basisBauEndStoff(halbeBetonRampe).
basisBauEndStoff(halberBetonBogen).
basisBauEndStoff(kleineBetonBodenPlatte).
basisBauEndStoff(kleineBetonTuer).
basisBauEndStoff(kleineBetonWand).
basisBauEndStoff(kurzeBetonWand).
basisBauEndStoff(schraegeBetonPlatte).


/* =====================  gross vorgefertigt ========================================= */
basisBauEndStoff(zylindrischerRaum).
basisBauEndStoff(quadratischerRaum).
basisBauEndStoff(geraderKorridor).
basisBauEndStoff(tuer).
basisBauEndStoff(fenster).
basisBauEndStoff(fundament).
basisBauEndStoff(lFoermigerKorridor).
basisBauEndStoff(korridorMitGlasDach).
basisBauEndStoff(holoTuer).
basisBauEndStoff(zugangsRampe).
basisBauEndStoff(rollTor).
basisBauEndStoff(pflasterungVierFach).
basisBauEndStoff(viererFundamentStrebe).
basisBauEndStoff(fundamentStrebe).
basisBauEndStoff(zylindrischerRaumRahmen).
basisBauEndStoff(tFoermigerKorridor).
basisBauEndStoff(xFoermigerKorridor).
basisBauEndStoff(korridorFenster).
basisBauEndStoff(bioKuppelRaum).
basisBauEndStoff(gebogenerKorridor).
basisBauEndStoff(leiter).
basisBauEndStoff(pflasterung).
basisBauEndStoff(pflasterungPodest).
basisBauEndStoff(grossesGlasPaneel).
basisBauEndStoff(aussichtsKugel).

/* =====================  klein vorgefertigt ========================================= */
basisBauEndStoff(wuerfelFoermigerRaum).
basisBauEndStoff(wuerfelRaumFundamentStrebe).
basisBauEndStoff(gewoelbteWuerfelFoermigeWand).
basisBauEndStoff(wuerfelFoermigerGlasRaum).
basisBauEndStoff(wuerfelFoermigerRaumRahmen).
basisBauEndStoff(wuerfelFoermigerRaumBoden).
basisBauEndStoff(wuerfelRaumViererFundamentStrebe).
basisBauEndStoff(innenTreppen).
basisBauEndStoff(wuerfelFoermigeInnenWand).
basisBauEndStoff(wuerfelFoermigerDachAufsatz).
basisBauEndStoff(gewoelbtesWuerfelFoermigesDach).
basisBauEndStoff(wuerfelFoermigesFensterEckig).
basisBauEndStoff(wuerfelFoermigesFensterRund).
basisBauEndStoff(infraStrukturLeiter).
basisBauEndStoff(wuerfelFoermigeInnenTuer).

/* =============================== Wasser-Konstruktion ================== */
basisBauEndStoff(glasTunnel).
basisBauEndStoff(lFoermigerGlasTunnel).
basisBauEndStoff(meeresUnterSchlupf).
basisBauEndStoff(mondTeichBoden).
basisBauEndStoff(quadratischeTiefSeeKammer).
basisBauEndStoff(tFoermigerGlasTunnel).
basisBauEndStoff(tiefSeeKammer).
basisBauEndStoff(vertikalerGlasTunnel).
basisBauEndStoff(xFoermigerGlasTunnel).
basisBauEndStoff(wasserDichteTuer).

/* =============================== Frachter ============================= */
basisBauEndStoff(flottenKommandoRaum).
basisBauEndStoff(grosserFrachtRaum).
basisBauEndStoff(frachterKorridor).
basisBauEndStoff(gebogenerFrachterKorridor).
basisBauEndStoff(frachterKreuzungDreiFach).
basisBauEndStoff(frachterKreuzungVierFach).


/* Eine Komponente */
basisBauEndStoff(frachterTreppe).
basisBauEndStoff(gebogenesRohr).
basisBauEndStoff(grosserKeil).
basisBauEndStoff(kleinerKeil).
basisBauEndStoff(kugel).
basisBauEndStoff(pyramide).
basisBauEndStoff(rohr).
basisBauEndStoff(stabilerWuerfel).
basisBauEndStoff(wuerfel).
basisBauEndStoff(zylinder).


/* ------------------------------- Kochzutat ---------------------------- */
kochStoff(Stoff) :-
	setof(St, kochStoffSub(St), KochStoffeSet),
	select(Stoff, KochStoffeSet, _).
	
kochStoffSub(Stoff) :-
	rezept:rezept(kochen, [[_, Stoff]], _, _);
	rezept:rezept(kochen, [[_, Stoff], [_, _]], _, _);
	rezept:rezept(kochen, [[_, _], [_, Stoff]], _, _);
	rezept:rezept(kochen, [[_, Stoff], [_, _], [_, _]], _, _);
	rezept:rezept(kochen, [[_, _], [_, Stoff], [_, _]], _, _);
	rezept:rezept(kochen, [[_, _], [_, _], [_, Stoff]], _, _);
	rezept:rezept(kochen, _,[_,Stoff], _).
	
/* Testprädikate */
/*----------------------------------------------------------------*/
stoffInFunktionEingangsStoff(Stoff) :-
	rezept:rezept(_, [[_, Stoff]], _, _);
	rezept:rezept(_, [[_, Stoff], [_, _]], _, _);
	rezept:rezept(_, [[_, _], [_, Stoff]], _, _);
	rezept:rezept(_, [[_, Stoff], [_, _], [_, _]], _, _);
	rezept:rezept(_, [[_, _], [_, Stoff], [_, _]], _, _);
	rezept:rezept(_, [[_, _], [_, _], [_, Stoff]], _, _).

stoffInFunktionErgebnisStoff(Stoff) :-
	rezept:rezept(_, _,[_,Stoff], _).
	

fehlerInputStoffNichtDefiniert(Stoff) :-
	stoffInFunktionEingangsStoff(Stoff),
	\+stoff(Stoff, _),
	format('falscher Eingangs-Stoff: ~k~n', Stoff).

fehlerOutputStoffNichtDefiniert(Stoff) :-
	stoffInFunktionErgebnisStoff(Stoff),
	\+stoff(Stoff, _),
	format('falscher Produkt-Stoff: ~k~n', Stoff).

produktNichtBewertet(Stoff) :-
	stoff(Stoff, Wert),
	\+basisBauEndStoff(Stoff),
	\+modul(Stoff),
	Wert = 0.

stoffNichtVerwendet(Stoff) :-
	stoff(Stoff, _),
	\+stoffInFunktionErgebnisStoff(Stoff),
	\+stoffInFunktionEingangsStoff(Stoff),
	format('Element(e) ~k ist nicht verwendet~n', Stoff),
	fail.
	
doppelteInStoff :-
	findall(Stoff0, stoff(Stoff0, _), StoffListe),
	sort(StoffListe, Sorted),
	dubChk(StoffListe, Sorted, Doppelte),
	Doppelte \= [],
	format('Element(e) ~k ist/sind doppelt~n', [Doppelte]).

dubChk(List, SortedList, Doppelte) :-
	SortedList = [],
	Doppelte = List.
	
dubChk(List, SortedList, Doppelte) :-
	SortedList = [ Kopf | SortedRest ],
	selectchk(Kopf, List, RestList),
	dubChk(RestList, SortedRest, Doppelte). 