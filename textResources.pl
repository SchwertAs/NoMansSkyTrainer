:- module(textResources, [getText/2]).

getText(Atom, Text) :-
	spielStatus:sprache(Sprache), 
	text(Sprache, Atom, Text),
	!.

getText(_, Text) :-
	Text = 'default'.

getText(Atom, _) :-
	Atom = default.

atomToSubstantiv(Stoff, Beschriftung) :-
	atom_string(Stoff, StoffString),
	sub_string(StoffString, 0, 1, RestLen, Capital),
	sub_string(StoffString, 1, RestLen, _, Rest),
	string_upper(Capital, BigCapital),
	string_lower(Rest, RestLowered),
	string_concat(BigCapital, RestLowered, Beschriftung).

/* text(<Sprachkennzeichen>, <atom>, <Text>).*/
/* mehrere Module */
text(de, txtOk, 'OK').
text(de, txtReset, 'reset').
text(de, txtGespeichert, 'gespeichert!').
text(de, txtFunktionsAuswahl, 'Funktionsauswahl!').
text(de, txtBitteWaehlen, 'Bitte wählen').
text(de, txtSystem, 'System: ').
text(de, txtPlanet, 'Planet: ').
text(de, txtSternensystem, 'Sternensystem').

/* Fixtexte ausgabe */
text(de, txtBitteReisenSieNachSystem, 'Bitte reisen Sie nach System: ').
text(de, txtLeerPlanet, ' Planet: ').
text(de, txtFuerenSie, 'Führen Sie ').
text(de, txtLeerMal, ' mal ').
text(de, txtLeerVon, ' von ').
text(de, txtLeerMit, ' mit ').
text(de, txtLeerAus, ' aus').
text(de, txtDas, 'Das ').
text(de, txtIn, 'in ').
text(de, txtLeerIstBekannt, ' ist bekannt.').
text(de, txtErlangenSie, 'Erlangen Sie ').
text(de, txtLeerEinheiten, ' Einheiten ').
text(de, txtLeerEinHundertstel, ' 1/100 sec ').
text(de, txtReisen, 'reisen').
text(de, txtAngekommen, 'angekommen').

/* Fixtexte Hauptdialog */
text(de, txtFunktionsAuswahl, 'Funktionsauswahl').
text(de, txtLinkZurMaske, 'Link zur Maske').
text(de, txtErklaerung, 'Erklärung').
text(de, txtVorraussetzungenSammeln, 'Voraussetzungen des Sammelns eingeben').
text(de, txtWelcheMittelStoffeBekommen, 'Geben Sie ein mit welchen Mitteln Sie Stoffe bekommen können!').
text(de, txtBekannteRezepteEingeben, 'Bekannte Rezepte eingeben').
text(de, txtGibRezepteSpielstand, 'Geben Sie bekannte Rezepte ihres Spielstandes ein!').
text(de, txtSternenSystemeEingeben, 'Sternensysteme eingeben').
text(de, txtEntdeckteErfassen, 'Erfassen Sie alle entdeckten Sternensysteme ihres Spielstandes!').
text(de, txtHimmelsKoerperEingeben, 'Himmelskörper eingeben').
text(de, txtPlanetMondeEingeben, 'Geben Sie für ein Sternensystem Planeten und Monde ein!').
text(de, txtEigenschaftenHimmelsKoerperEingeben, 'Eigenschaften eines Himmelskörpers eingeben').
text(de, txtAusstattungEingeben, 'Geben Sie die planetare Ausstattung eines Himmelskörpers wie Basen, Raffinerieen etc. ein!').
text(de, txtEigenschaftenHimmelsKoerperEingeben, 'Eigenschaften eines Himmelskörpers eingeben').
text(de, txtSammelDetailsEingeben, 'SammelDetails eines Himmelskörpers eingeben').
text(de, txtSammelbareResourcenEingeben, 'Geben Sie die sammelbaren Resourcen eines Himmelskörpers ein!').
text(de, txtOptimiertesVorgehenErhalten, 'Optimiertes Vorgehen erhalten').
text(de, txtOptimierteVorgehensweiseErwerbBekommen, 'Bekommen Sie eine optimierte Vorgehensweise, für den Erwerb eines bestimmten Stoffes!').
text(de, txtLinksZeitweiseInaktiv, 'Links können zeitweise inaktiv sein, wenn notwendige Daten fehlen. Diese können Sie mit Hilfe der Masken, deren Link hier aktiv ist, eingegeben. Falls Sie die Daten inzwischen eingegeben haben, laden Sie diese Seite erneut (F5 bei Firefox)!').

/* Fixtexte SpielStatusDialog */
text(de, txtVorraussetzungenMaterialSammlung, 'Vorraussetzungen für die Materialsammlung').
text(de, txtAusstattung, 'Ausstattung').
text(de, txtMinenlaser, 'Minenlaser').
text(de, txtVerbesserterMinenLaser, 'verbesserter Minenlaser').
text(de, txtTerrainformer, 'Terrainformer').
text(de, txtWaffe, 'Waffe').
text(de, txtSolarStrahl, 'Solarstrahl').
text(de, txtGemuetsStrahl, 'Gemütsstrahl').
text(de, txtAnzugRaffinerie, 'Anzug-Raffinerie').
text(de, txtBewegungsmöglichkeiten, 'Bewegungsmöglichkeiten').
text(de, txtRaumschiffEinsetzbar, 'Raumschiff einsetzbar').
text(de, txtMinenLaserAufExoFahrzeug, 'Minenlaser auf Exofahrzeug vorhanden').
text(de, txtUmgebung, 'Umgebung').
text(de, txtFrachterVorhanden, 'Frachter vorhanden').
text(de, txtAnomalieSphaereRufbar, 'Anomalie / Sphäre rufbar').

/* Fixtexte rezeptBekanntAnzeigen */
text(de, txtStoffKlassenAuswahl, 'Stoffklassen-Auswahl').
text(de, txtStoffKlasse, 'StoffKlasse: ').

/* Fixtexte rezeptBekanntStoffklassenAuswahl */
text(de, txtEingabeBekannteRezepte, 'Eingabe bekannte Rezepte').

/* Fixtexte systemNamenDialog */
text(de, txtEingabeSternenSysteme, 'Eingabe der Sternensysteme').
text(de, txtSystemName, 'System-Name').
text(de, txtFarbe, 'Farbe').
text(de, txtDieZeile, 'Die Zeile ').
text(de, txtInSpalte, ' in Spalte ').
text(de, txtIstUnvollstaendig, ' ist unvollständig').

/* Fixtexte planetAuswahlDialog */
text(de, txtAuswahlHimmelskoerper, 'Auswahl Himmelskörper').
text(de, txtBitteEineAuswahlTreffen, 'bitte eine Auswahl treffen!').

/* Fixtexte planetMondNameDialog */
text(de, txtEigenschaftenSternenSystemEingeben, 'Eigenschaften Sternensystem eingeben').
text(de, txtSternenSystemNamenHimmelskoerperEingeben, 'Sternensystem: Namen der Himmelskörper eingeben').
text(de, txtPlanetenUndMonde, 'Name').
text(de, txtName, 'Planeten und Monde').
text(de, txtPlanetenTyp, 'Planetentyp').
text(de, txtPlanetenTypBeiScanAusWeltraumAngezeigt, 'Der Planetentyp wird beim Scan aus dem Weltraum angezeigt.').
text(de, txtAlternativStehtErAuchInDerEndtdeckungsListe, 'Alternativ steht er auch in der Entdeckungsliste. Im Fenster wenn man mit der Maus über den Planetennamen fährt.').

/* Fixtexte planetEigenschaftenDialog */
text(de, txtEigenschaftenHimmelsKoerper, 'Eigenschaften Himmelskörper eingeben').
text(de, txtEigenschaftenHimmelsKoerperEingeben, 'Eigenschaften Himmelskörper eingeben: Systemauswahln').
text(de, txtEigenschaftenHimmelsKoerperAuswahl, 'Eigenschaften Himmelskörper eingeben: Himmelskörperauswahl').
text(de, txtEinrichtungenUndIhreReisezeit, 'Einrichtungen und ihre Reisezeit von der Hauptbasis').
text(de, txtJeweilsDieEinrichtungMit, 'Jeweils die Einrichtung mit der kürzesten Entfernung zur Hauptbasis angeben!').
text(de, txtHauptBasis, 'Hauptbasis').
text(de, txtWasser, 'Wasser').
text(de, txtAussenPosten, 'Außenposten').
text(de, txtRaumstation, 'Raumstation').
text(de, txtMittlereRaffinerie, 'Mittlere Raffinerie').
text(de, txtGroßeRaffinerie, 'Große Raffinerie').
text(de, txtHandelsterminal, 'Handelsterminal').
text(de, txtHandelsstation, 'Handelsstation').
text(de, txtKleineRaffinerie, 'kleine Raffinerie').
text(de, txtNahrungsprozessor, 'Nahrungsprozessor').
text(de, txtBasisterminus, 'Basisterminus').
text(de, txtKonstruktionsforschungsstation, 'Konstruktionsforschungsstation').
text(de, txtSauerstoffverarbeiter, 'Sauerstoffverarbeiter').
text(de, txtAtmosphaerenanlage, 'Atmosphärenanlage').
text(de, txtBergbaueinheit, 'Bergbaueinheit').
text(de, txtPlantage, 'Plantage').

/* Fixtexte planetSammelEigenschaftenDialog */
text(de, txtEigenschaftenHimmelskörperEingebenSystemauswahl, 'Eigenschaften Himmelskörper eingeben: Systemauswahl').
text(de, txtEigenschaftenHimmelskoerperEingebenHimmelsKoerperauswahl, 'Eigenschaften Himmelskörper eingeben: Himmelskörperauswahl').
text(de, txtSammelartEingebenHimmelskoerperAuswahl, 'Sammelart eingeben: Himmelskörperauswahl').
text(de, txtAuswahlSammelart, 'Auswahl Sammelart').
text(de, txtZeitmessungenBeginnenDirektVorDerSammelQuelleUndEndenSobaldDieQuelleErschoepftIst, 'Zeitmessungen beginnen direkt vor der Sammelquelle und enden, sobald die Quelle erschöpft ist.').
text(de, txtDannArtGewinnungUndZahlDamitGewonnenenStoffeEingeben, 'Dann die Art der Gewinnung und die Zahl der damit gewonnenen Stoffe eingeben!').
text(de, txtSekundaerelementeNurEingebenWennEinzigeMöglichkeitStoffGewinnen, 'Die Sekundärelemente nur eingeben, wenn das die einzige Möglichkeit auf dem Himmelskörper ist, den Stoff zu gewinnen!').
text(de, txtEsGenuegtAngabeSchnellsteMethode, 'Es genügt die Angabe der schnellsten Methode.').
text(de, txtNurStoffeGewonnenWerdenKoennenEingeben, 'Nur Stoffe, die gewonnen werden können, eingeben!').

/* --------------------------------------------------------------------------------------- */
/* Sammelaktionen */
text(de, bekannt, 'bekannt').
text(de, erkaempfen, 'erkämpfen').
text(de, ernten, 'ernten').
text(de, ertauchen, 'ertauchen').
text(de, exoFahrzeugMinenLaserNutzen, 'Exofahrzeugminenlaser nutzen').
text(de, herausSchlagen, 'herausschlagen').
text(de, jagen, 'jagen').
text(de, kaufen, 'kaufen').
text(de, minenLaserNutzen, 'Minenlaser nutzen').
text(de, pfluecken, 'pflücken').
text(de, raumSchuerfen, 'raumschuerfen').
text(de, terrainFormerNutzen, 'Terrainformer nutzen').
text(de, unterWasserErkaempfen, 'unter Wasser erkämpfen').
text(de, verbessertenMinenLaserNutzen, 'verbesserten Minenlaser nutzen').
text(de, vonTierErhalten, 'von Tier erhalten').
text(de, solarStrahlNutzen, 'Solarstrahl nutzen').
text(de, gemuetsStrahlNutzen, 'Gemütsstrahl nutzen').
text(de, verdienen, 'verdienen').
text(de, vonBergbauEinheitGewinnen, 'von Bergbaueinheit gewinnen').


/* Planetentypen */
text(de, aetzender, 'Ätzender Planet'). 
text(de, arktischer, 'Arktischer Planet'). 
text(de, ausgetrockneter, 'Ausgetrockneter Planet'). 
text(de, bedeckter, 'Bedeckter Planet'). 
text(de, bluehender, 'Blühender Planet'). 
text(de, bruehender, 'Brühender Planet'). 
text(de, desLichts, 'Planet des Lichts'). 
text(de, chromatischerNebel, 'chromatischerNebel'). 
text(de, durchbrochener, 'Durchbrochener Planet'). 
text(de, eingesponnener, 'Eingesponnener Planet'). 
text(de, einsamer, 'Einsamer Planet'). 
text(de, eisiger, 'Eisiger  Planet'). 
text(de, eiskalter, 'Eiskalter  Planet'). 
text(de, faulender, 'Faulender Planet'). 
text(de, felsiger, 'Felsiger Planet'). 
text(de, feuchter, 'Feuchter Planet'). 
text(de, feuriger, 'Feuriger Planet'). 
text(de, fragmentierter, 'Fragmentierter Planet'). 
text(de, frostiger, 'Frostiger Planet'). 
text(de, gammaintensiver, 'Gammaintensiver Planet'). 
text(de, gebrochener, 'Gebrochener Planet'). 
text(de, gefrorener, 'Gefrorener Planet'). 
text(de, gefrierender, 'Gefrierender Planet'). 
text(de, gemaessigter, 'Gemäßigter Planet'). 
text(de, gerippter, 'Gerippter Planet'). 
text(de, giftiger, 'Giftiger Planet'). 
text(de, gruenender, 'Grünender Planet'). 
text(de, gruenlicher, 'Grünlicher Planet'). 
text(de, heisser, 'Heißer Planet'). 
text(de, himmelBlauerPlanet, 'Himmelblauer Planet'). 
text(de, hyperboreisch, 'Hyperboreischer Planet'). 
text(de, isotopischer, 'Isotopischer Planet'). 
text(de, katastrophalesTerraforming, 'Katastrophales Terraforming'). 
text(de, kontaminierter, 'Kontaminierter Planet'). 
text(de, konturierter, 'Konturierter Planet'). 
text(de, leerer, 'Leerer Planet'). 
text(de, mechanischer, 'Mechanischer Planet'). 
text(de, messerscharfer, 'Messerscharfer Planet'). 
text(de, metallener, 'Metallener Planet'). 
text(de, metallueberzogener, 'Metallüberzogener Planet'). 
text(de, metallurgischer, 'Metallurgischer Planet'). 
text(de, mitGeringerAtmosphere, 'Planet mit geringer Atmosphere'). 
text(de, mitHoherEnergie, 'Planet mit hoher Energie'). 
text(de, mitHoherRadioQuelle, 'Planet mit hoher Radioquelle'). 
text(de, nuklearer, 'Nuklearer Planet'). 
text(de, paradiesischer, 'Paradiesischer Planet'). 
text(de, pilz, 'Pilzplanet'). 
text(de, rasselnder, 'Rasselnder Planet'). 
text(de, radioaktiver, 'Radioaktiver Planet'). 
text(de, regnerischer, 'Regnerischer Planet'). 
text(de, reichhaltiger, 'Reichhaltiger Planet').
text(de, saeuerlicher, 'Säuerlicher Planet'). 
text(de, saeuliger, 'Säuliger Planet'). 
text(de, schaedlicher, 'Schädlicher Planet'). 
text(de, schaeumender, 'Schäumender Planet'). 
text(de, schalenuebersaeter, 'Schalenübersäter Planet'). 
text(de, scharfer, 'Scharfer Planet'). 
text(de, schaumiger, 'Schaumiger Planet'). 
text(de, scherben, 'Scherbenplanet'). 
text(de, schuppiger, 'Schuppiger Planet'). 
text(de, sechseckiger, 'Sechseckiger Planet'). 
text(de, sengender, 'Sengender Planet'). 
text(de, sengendHeisser, 'Sengend heisser Planet'). 
text(de, siedender, 'Siedender Planet'). 
text(de, skelettartiger, 'Skelettartiger Planet'). 
text(de, sporiger, 'Sporiger Planet'). 
text(de, sprudelnder, 'Sprudelnder Planet'). 
text(de, stacheliger, 'Stacheliger Planet'). 
text(de, staubiger, 'Staubiger Planet'). 
text(de, sternKorruptionEntdeckt, 'Sternkorruption entdeckt'). 
text(de, stickiger, 'Stickiger Planet'). 
text(de, stuetzen, 'Stützenplanet'). 
text(de, superkritischer, 'Superkritischer Planet'). 
text(de, toedlicheGrueneAnomalie, 'Tödliche grüne Anomalie'). 
text(de, toedlicheGrueneAnomalieMegaExot, 'Tödliche grüne Anomalie exotisch'). 
text(de, toter, 'Toter Planet'). 
text(de, trostloser, 'Trostloser Planet'). 
text(de, trostloserTot, 'Trostloser toter Planet').
text(de, tropischer, 'Tropischer Planet'). 
text(de, ultramarin, 'Ultramariner Planet'). 
text(de, unbelebter, 'Unbelebter Planet'). 
text(de, unbewohnbarer, 'Unbewohnbarer Planet'). 
text(de, unfruchtbarer, 'Unfruchtbarer Planet'). 
text(de, ungesunder, 'Ungesunder Planet').
text(de, unwirtlicher, 'Unwirtlicher Planet').
text(de, verbrannter, 'Verbrannter Planet'). 
text(de, verfallenerNuklearer, 'Verfallener nuklearer Planet'). 
text(de, verdorbener, 'Verdorbener Planet'). 
text(de, verlassener, 'Verlassener Planet'). 
text(de, verlorenerBlauerPlanet, 'Verlorener blauer Planet'). 
text(de, verkabelter, 'Verkabelter Planet'). 
text(de, verkalkter, 'Verkalkter Planet'). 
text(de, verknoecherter, 'Verknoecherter Planet'). 
text(de, versteinerter, 'Versteinerter Planet'). 
text(de, verstrahlter, 'Verstrahlter Planet'). 
text(de, verwilderter, 'Verwilderter Planet'). 
text(de, weissGluehender, 'Weißglühender Planet'). 
text(de, windgepeitschter, 'Windgepeitschter Planet'). 
text(de, winterlicher, 'Winterlicher Planet'). 
text(de, wuesten, 'Wuestenplanet'). 
text(de, zerkluefteter, 'Zerklüfteter Planet'). 
text(de, zerschmetterter, 'Zerschmetterter Planet'). 
text(de, zugefrorener, 'Zugefrorener Planet'). 


/* SternFarbe */
text(de, gelb, 'gelb').
text(de, rot, 'rot').
text(de, gruen, 'grün').
text(de, blau, 'blau').


/* StoffKlassen */
text(de, rohStoff, 'Rohstoff'). 
text(de, komponente, 'Komponente'). 
text(de, produkt, 'Produkt'). 
text(de, pass, 'Pass'). 
text(de, verbrauch, 'Verbrauch'). 
text(de, modul, 'Modul'). 
text(de, basisBauEndStoff, 'Basis-Baustoff').
text(de, stoerung, 'Störung').
text(de, geste, 'Geste').
text(de, kleidung, 'Kleidung').
text(de, han_lsWare, 'HandelsWare').
text(de, kuriositaet, 'Kuriosität'). 
text(de, artefakt, 'Artefakt'). 
text(de, bauRezept, 'Baurezept'). 
text(de, rohUndKochStoff, 'Roh- und Kochstoff'). 
text(de, produktUndKochStoff, 'Produkt und KochStoff'). 
text(de, kochStoff, 'KochStoff'). 
text(de, kaufModul, 'Kaufmodul'). 
text(de, anormaleMaterialien, 'Anormale Materialien'). 
text(de, gesammelteHandelsWare, 'gesammelte Handelsware'). 
text(de, relikt, 'Relikt'). 
text(de, konglomerat, 'Konglomerat'). 


/* Sammelaktionen */
text(de, bekannt, 'bekannt').
text(de, ausAtmosphaerenAnlageGewinnen, 'aus Atmosphaerenanlage gewinnen').
text(de, erkaempfen, 'erkämpfen').
text(de, ernten, 'ernten').
text(de, ertauchen, 'ertauchen').
text(de, exoFahrzeugMinenLaserNutzen, 'Exofahrzeug-Minenlaser nutzen').
text(de, herausSchlagen, 'herausschlagen').
text(de, jagen, 'jagen').
text(de, kaufen, 'kaufen').
text(de, minenLaserNutzen, 'Minenlaser nutzen').
text(de, pfluecken, 'pflücken').
text(de, raumSchuerfen, 'raumschürfen').
text(de, terrainFormerNutzen, 'Terrainformer nutzen').
text(de, unterWasserErkaempfen, 'unter Wasser erkaempfen').
text(de, verbessertenMinenLaserNutzen, 'verbesserten Minenlaser nutzen').
text(de, vonTierErhalten, 'von Tier erhalten').
text(de, solarStrahlNutzen, 'Solarstrahl nutzen').
text(de, gemuetsStrahlNutzen, 'Gemütsstrahl nutzen').
text(de, verdienen, 'verdienen').
text(de, vonBergbauEinheitGewinnen, 'von Bergbaueinheit gewinnen').

/* Wandelaktionen */
text(de, bauen, 'baün').
text(de, herstellen, 'herstellen').
text(de, installieren, 'installieren').
text(de, kochen, 'kochen').
text(de, raffinieren, 'raffinieren').
text(de, ausSauerStoffVearbeiterGewinnen, 'aus Sauerstoffvearbeiter gewinnen').
text(de, ausAtmosphaerenAnlageGewinnen, 'aus Atmosphaerenanlage gewinnen').
text(de, rezeptInAussenPostenErwerben, 'Rezept in Aussenposten erwerben').
text(de, rezeptAmForschungsComputerErwerben, 'Rezept am Forschungscomputer erwerben').
text(de, rezeptInAnomalieErwerben, 'Rezept in Anomalie erwerben').
text(de, rezeptInAnomalieForschungsComputerErwerben, 'Rezept in Anomalieforschungscomputer erwerben').
text(de, rezeptInFabrikErwerben, 'Rezept in Fabrikerwerben').
text(de, rezeptInFrachterErwerben, 'Rezept in Frachter erwerben').
text(de, modulInRaumstationErwerben, 'Modul in Raumstation erwerben').
text(de, zerlegen, 'zerlegen').
text(de, inEinfacherRaffinerieRaffinieren, 'in einfacher Raffinerie raffinieren').

/* Stoffe */
text(de, aktiviertesCadmium, 'aktiviertes Cadmium').
text(de, aktiviertesEmeril, 'aktiviertes Emeril').
text(de, aktiviertesIndium, 'aktiviertes Indium').
text(de, aktiviertesKupfer, 'aktiviertes Kupfer').
text(de, ammoniak, 'Ammoniak').
text(de, cadmium, 'Cadmium').
text(de, chlor, 'Chlor').
text(de, deuterium, 'Deuterium').
text(de, dioxit, 'Dioxit').
text(de, diWasserStoff, 'Diwasserstoff').
text(de, emeril, 'Emeril').
text(de, ferritStaub, 'Ferritstaub').
text(de, gold, 'Gold').
text(de, indium, 'Indium').
text(de, ionisiertesKobalt, 'ionisiertes Kobalt').
text(de, kobalt, 'Kobalt').
text(de, kupfer, 'Kupfer').
text(de, lebenderSchleim, 'lebender Schleim').
text(de, magnetisiertesFerrit, 'magnetisiertes Ferrit').
text(de, natrium, 'Natrium').
text(de, natriumNitrat, 'Natriumnitrat').
text(de, paraffinium, 'Paraffinium').
text(de, phosphor, 'Phosphor').
text(de, platin, 'Platin').
text(de, pugneum, 'Pugneum').
text(de, pyrit, 'Pyrit').
text(de, radon, 'Radon').
text(de, reinesFerrit, 'reines Ferrit').
text(de, restSubstanz, 'Restsubstanz').
text(de, sauerStoff, 'Sauerstoff').
text(de, schwefelin, 'Schwefelin').
text(de, silber, 'Silber').
text(de, silikatPulver, 'Silikatpulver').
text(de, stickStoff, 'Stickstoff').
text(de, tritium, 'Tritium').
text(de, unkontrollierbarerSchimmel, 'unkontrollierbarer Schimmel').
text(de, uran, 'Uran').
text(de, verrostetesMetall, 'verrostetes Metall').
text(de, zaeheFluessigkeiten, 'zähe Flüssigkeiten').
text(de, zytoPhosphat, 'Zytophosphat').
text(de, tritiumHyperCluster, 'Tritium Hypercluster').
text(de, geodeLand, 'Geode').
text(de, geodeHoehle, 'Geode').
text(de, kampfLaeuferGehirn, 'Kampfläufergehirn').
text(de, lebendePerle, 'lebende Perle').
text(de, goldKlumpen, 'Goldklumpen').
text(de, sturmKristall, 'Sturmkristall').
text(de, kristallSulfid, 'Kristallsulfid').
text(de, kristallFragment, 'Kristallfragment').
text(de, beutelGift, 'Beutelgift').
text(de, eiweissPerle, 'Eiweissperle').
text(de, gravitinoBall, 'Gravitinoball').
text(de, nipNipKnospen, 'Nipnipknospen').
text(de, fluessigSonne, 'Flüssigsonne').
text(de, hexit, 'Hexit').
text(de, lebendesWasser, 'lebendes Wasser').
text(de, fragmentierteQualia, 'fragmentierte Qualia').
text(de, nanitHaufen, 'Nanithaufen').
text(de, fabrikUeberschreibungsEinheit, 'Fabriküberschreibungseinheit').
text(de, verteidigungsBeleg, 'Verteidigungsbeleg').
text(de, geborgenesFregattenModul, 'geborgenes Fregattenmodul').
text(de, lagerErweiterung, 'Lagererweiterung').
text(de, frachtSchott, 'Frachtschott').
text(de, reparaturEinheit, 'Reparatureinheit').
text(de, anomalieDetektor, 'Anomaliedetektor').
text(de, antiMaterie, 'Antimaterie').
text(de, antiMaterieGehaeuse, 'Antimateriegehäuse').
text(de, diWasserStoffGelee, 'Diwasserstoffgelee').
text(de, hermetischesSiegel, 'hermetisches Siegel').
text(de, ionenAkku, 'Ionenakku').
text(de, kobaltSpiegel, 'Kobaltspiegel').
text(de, lebensErhaltungsGel, 'Lebenserhaltungsgel').
text(de, metallPlatten, 'Metallplatten').
text(de, mikroProzessor, 'Mikroprozessor').
text(de, natriumDiode, 'Natriumdiode').
text(de, salzRefaktor, 'Salzrefaktor').
text(de, sauerStoffFilter, 'Saürstofffilter').
text(de, sauerStoffKapsel, 'Saürstoffkapsel').
text(de, raumSchiffStartTreibStoff, 'Raumschiffstarttreibstoff').
text(de, vierfachServo, 'Vierfachservo').
text(de, angereicherterKohlenStoff, 'Angereicherter Kohlenstoff').
text(de, aronium, 'Aronium').
text(de, chlorGitter, 'Chlorgitter').
text(de, fluessigSprengStoff, 'Flüssigsprengstoff').
text(de, fortschrittlicherIonenAkku, 'Fortschrittlicher Ionenakku').
text(de, fregattenTreibStoff100to, 'Fregattentreibstoff 100 to').
text(de, fregattenTreibStoff200to, 'Fregattentreibstoff 200 to').
text(de, fregattenTreibStoff50to, 'Fregattentreibstoff 50 to').
text(de, fusionsBeschleuniger, 'Fusionsbeschleuniger').
text(de, fusionsZuender, 'Fusionszünder').
text(de, geoDesit, 'Geodesit').
text(de, glas, 'Glas').
text(de, grantine, 'Grantine').
text(de, halbLeiter, 'Halbleiter').
text(de, heissesEis, 'Heisseseis').
text(de, herox, 'Herox').
text(de, hitzeKondensator, 'Hitzekondensator').
text(de, hydrothermaleTreibStoffZelle, 'Hydrothermale Treibstoffzelle').
text(de, instabilesGel, 'Instabiles Gel').
text(de, instabilesNatrium, 'instabiles Natrium').
text(de, instabilesPlasma, 'instabiles Plasma').
text(de, iridesit, 'Iridesit').
text(de, kabelBaum, 'Kabelbaum').
text(de, kohlenStoffKristall, 'Kohlenstoffkristall').
text(de, kryogenKammer, 'Kryogenkammer').
text(de, kryoPumpe, 'Kryopumpe').
text(de, lebendesGlas, 'lebendes Glas').
text(de, lemmium, 'Lemmium').
text(de, magnoGold, 'Magnogold').
text(de, organischerKatalysator, 'organischer Katalysator').
text(de, polyFaser, 'Polyfaser').
text(de, projektilMunition, 'Projektilmunition').
text(de, quantumProzessor, 'Quantumprozessor').
text(de, saeure, 'Säure').
text(de, schaltPlatte, 'Schaltplatte').
text(de, schmierMittel, 'Schmiermittel').
text(de, seltenesMetallElement, 'seltenes Metallelement').
text(de, staseGeraet, 'Stasegerät').
text(de, sternenSchildBatterie, 'Sternenschildbatterie').
text(de, stickStoffSalz, 'Stickstoffsalz').
text(de, strassenKoeterBronze, 'Straßenköterbronze').
text(de, superOxidKristall, 'Superoxidkristall').
text(de, supraLeiter, 'Supraleiter').
text(de, tetraKobalt, 'Tetrakobalt').
text(de, thermischesKondensat, 'thermisches Kondensat').
text(de, tragbarerReaktor, 'tragbarer Reaktor').
text(de, warpZelle, 'Warpzelle').
text(de, warpHyperKern, 'Warphyperkern').
text(de, herzDerSonne, 'Herz der Sonne').
text(de, modifizierteQuanten, 'modifizierte Quanten').
text(de, novaeRegenerat, 'Novä Regenerat').
text(de, zustandsPhase, 'Zustandsphase').
text(de, photischerJade, 'photischer Jade').
text(de, endeDerDaemmerung, 'Ende der Daemmerung').
text(de, dunkleMaterie, 'dunkle Materie').
text(de, nooSphaerischKugel, 'Noosphärische Kugel').
text(de, umhuellterSchatten, 'umhüllter Schatten').
text(de, gefangeneNanode, 'gefangene Nanode').
text(de, seelenEngine, 'Seelenengine').
text(de, sternenSamen, 'Sternensamen').
text(de, gedankenBogen, 'Gedankenbogen').
text(de, pulsierenderKern, 'Pulsierenderkern').
text(de, bewusstseinsBruecke, 'Bewußtseinsbrücke').
text(de, unmoeglicheMembran, 'unmögliche Membran').
text(de, glasSamen, 'Glassamen').
text(de, singularitaetsKern, 'Singularitätskern').
text(de, verhaertetesGehaeuse, 'verhärtetes Gehäuse').
text(de, ausgewachsenerHerzKnotenPunkt, 'ausgewachsener Herzknotenpunkt').
text(de, ausgewachsenerNervenStamm, 'ausgewachsener Nervenstamm').
text(de, seelenKammer, 'Seelenkammer').
text(de, atlasPassV1, 'Atlas Pass V1').
text(de, atlasPassV2, 'Atlas Pass V2').
text(de, atlasPassV3, 'Atlas Pass V3').
text(de, belueftungsMembranB, 'Belüftungsmembran B').
text(de, bewegungsModulC, 'Bewegungsmodul C').
text(de, bewegungsModulS, 'Bewegungsmodul S').
text(de, effizienteWasserDuesenA, 'Effiziente Wasserdüsen A').
text(de, einfacherUeberSetzerB, 'Einfacher Übersetzer B').
text(de, gefahrenSchutz, 'Gefahrenschutz').
text(de, gefahrGutSchutzHandschuh, 'Gefahrgutschutzhandschuh').
text(de, giftSchutzModulA, 'Giftschutzmodul A').
text(de, giftSchutzModulB, 'Giftschutzmodul B').
text(de, jetPack, 'Jetpack').
text(de, kuehlMittelNetzwerkC, 'Kühlmittelnetzwerk C').
text(de, lebensErhaltung, 'Lebenserhaltung').
text(de, lebensErhaltungsModulA, 'Lebenserhaltungsmodul A').
text(de, lebensErhaltungsModulB, 'Lebenserhaltungsmodul B').
text(de, lebensErhaltungsModulS, 'Lebenserhaltungsmodul S').
text(de, neuralStimulatorB, 'Neuralstimulator B').
text(de, perfektionierterUebersetzerS, 'Perfektionierterübersetzer S').
text(de, raketenStiefelA, 'Raketenstiefel A').
text(de, sauerStoffUmleiterA, 'Saürstoffumleiter A').
text(de, sauerStoffWiederVerwerterC, 'Saürstoffwiederverwerter C').
text(de, schildGitterB, 'Schildgitter B').
text(de, schildModulA, 'Schildmodul A').
text(de, schildModulC, 'Schildmodul C').
text(de, strahlungsDeflektorC, 'Strahlungsdeflektor C').
text(de, strahlungsSchutzModulA, 'Strahlungsschutzmodul A').
text(de, strahlungsSchutzModulB, 'Strahlungsschutzmodul B').
text(de, strahlungsSchutzModulS, 'Strahlungsschutzmodul S').
text(de, toxinDaempferC, 'Toxindämpfer C').
text(de, verbesserterUebersetzerA, 'Verbesserterübersetzer A').
text(de, waermeSchichtC, 'Wärmeschicht C').
text(de, waermeSchutzModulA, 'Wärmeschutzmodul A').
text(de, waermeSchutzModulB, 'Wärmeschutzmodul B').
text(de, waermeSchutzModulKaelteB, 'Wärmeschutzmodulkälte B').
text(de, unterWasserSchutzModulB, 'Unterwasserschutzmodul B').
text(de, persoenlicheRaffinerie, 'Persönliche Raffinerie').
text(de, luftSchubAntriebS, 'Luftschubantrieb S').
text(de, ablativePanzerungC, 'Ablativepanzerung C').
text(de, cadmiumAntriebB, 'Cadmiumantrieb B').
text(de, deflektorSchild, 'Deflektorschild').
text(de, dysonPumpeB, 'Dysonpumpe B').
text(de, effizienteDuesenB, 'Effizientedüsen B').
text(de, emerilAntriebA, 'Emerilantrieb A').
text(de, fourierBegrenzerB, 'Fourierbegrenzer B').
text(de, fragmentSuperAufladerB, 'Fragmentsuperauflader B').
text(de, grosseRaketenRohreB, 'große Raketenrohre B').
text(de, hyperAntrieb, 'Hyperantrieb').
text(de, hyperAntriebModulC, 'Hyperantriebmodul C').
text(de, impulsAntrieb, 'Impulsantrieb').
text(de, impulsAntriebModulC, 'Impulsantriebmodul C').
text(de, impulsAntriebModulS, 'Impulsantriebmodul S').
text(de, infraMesserBeschleuniger, 'Inframesserbeschleuniger').
text(de, infraMesserModulC, 'Inframessermodul C').
text(de, infraMesserModulS, 'Inframessermodul S').
text(de, indiumAntriebS, 'Indiumantrieb S').
text(de, konfliktScanner, 'Konfliktscanner').
text(de, nichtlineareOptikB, 'Nichtlineareoptik B').
text(de, nichtlineareOptikC, 'Nichtlineareoptik C').
text(de, phasenStrahler, 'Phasenstrahler').
text(de, phasenStrahlerModulC, 'Phasenstrahlermodul C').
text(de, phasenStrahlerModulS, 'Phasenstrahlermodul S').
text(de, photonenKanone, 'Photonenkanone').
text(de, photonenKanonenModulC, 'Photonenkanonenmodul C').
text(de, photonenKanonenModulB, 'Photonenkanonenmodul B').
text(de, photonenKanonenModulS, 'Photonenkanonenmodul S').
text(de, positronenWerfer, 'Positronenwerfer').
text(de, positronModulB, 'Positronmodul B').
text(de, positronModulC, 'Positronmodul C').
text(de, positronModulS, 'Positronmodul S').
text(de, raketenWerfer, 'Raketenwerfer').
text(de, raumSchiffSchildModulB, 'Raumschiffschildmodul B').
text(de, raumSchiffSchildModulC, 'Raumschiffschildmodul C').
text(de, startSchubDuese, 'Startschubdüse').
text(de, startSystemLadeGeraetS, 'Startsystemladegerät S').
text(de, teleportEmpfaenger, 'Teleportempfänger').
text(de, wirtschaftsScanner, 'Wirtschaftsscanner').
text(de, zyklotronBalliste, 'Zyklotronballiste').
text(de, zyklotronModulB, 'Zyklotronmodul B').
text(de, zyklotronModulC, 'Zyklotronmodul C').
text(de, zyklotronModulS, 'Zyklotronmodul S').
text(de, instabilitaetsAntriebA, 'Instabilitätsantrieb A').
text(de, unterLichtVerstaerkerS, 'Unterlichtverstärker S').
text(de, notFallWarpEinheitA, 'Notfallwarpeinheit A').
text(de, poloFigur, 'Polofigur').
text(de, warpKernResonator, 'Warpkernresonator').
text(de, verstraerkterWarpSchildC, 'Versträrkterwarpschild C').
text(de, chromatischerWarpSchildB, 'Chromatischerwarpschild B').
text(de, temporalerWarpComputerA, 'Temporalerwarpcomputer A').
text(de, plasmaWarpInjektorB, 'Plasmawarpinjektor B').
text(de, realitaetsEntwirrer, 'Realitätsentwirrer').
text(de, materieStrahl, 'Materiestrahl').
text(de, gedankenKontrollGeraet, 'Gedankenkontrollgerät').
text(de, holografischerAnalysator, 'Holografischeranalysator').
text(de, mineralKompressor, 'Mineralkompressor').
text(de, sprengDrohnen, 'Sprengdrohnen').
text(de, treibStoffOxidant, 'Treibstoffoxidant').
text(de, analyseVisier, 'Analysevisier').
text(de, bergBauStrahlModulC, 'Bergbaustrahlmodul C').
text(de, blitzWerfer, 'Blitzwerfer').
text(de, blitzWerferModulC, 'Blitzwerfermodul C').
text(de, blitzWerferModulA, 'Blitzwerfermodul A').
text(de, blitzWerferModulS, 'Blitzwerfermodul S').
text(de, eigenesKraftFeld, 'Eigeneskraftfeld').
text(de, fortgeschrittenerMinenLaserA, 'Fortgeschrittenerminenlaser A').
text(de, geologieKanone, 'Geologiekanone').
text(de, geologieKanonenModulC, 'Geologiekanonenmodul C').
text(de, geologieKanonenModulB, 'Geologiekanonenmodul B').
text(de, geologieKanonenModulS, 'Geologiekanonenmodul S').
text(de, geschossSchmiererC, 'Geschoßschmierer C').
text(de, glutSpeer, 'Glutspeer').
text(de, glutSpeerModulC, 'Glutspeermodul C').
text(de, glutSpeerModulA, 'Glutspeermodul A').
text(de, glutSpeerModulS, 'Glutspeermodul S').
text(de, impulsWerfer, 'Impulswerfer').
text(de, impulsWerferModulC, 'Impulswerfermodul C').
text(de, impulsWerferModulB, 'Impulswerfermodul B').
text(de, impulsWerferModulA, 'Impulswerfermodul A').
text(de, kampfVisier, 'Kampfvisier').
text(de, laufIonisatorC, 'Laufionisator C').
text(de, masseBeschleunigerC, 'Massebeschleuniger C').
text(de, minenLaser, 'Minenlaser').
text(de, minenLaserModulC, 'Minenlasermodul C').
text(de, minenLaserModulS, 'Minenlasermodul S').
text(de, optischerBohrerS, 'Optischerbohrer S').
text(de, plasmaWerfer, 'Plasmawerfer').
text(de, plasmaWerferModulC, 'Plasmawerfermodul C').
text(de, plasmaWerferModulB, 'Plasmawerfermodul B').
text(de, plasmaWerferModulS, 'Plasmawerfermodul S').
text(de, scanner, 'Scanner').
text(de, scannerModulC, 'Scannermodul C').
text(de, scannerModulA, 'Scannermodul A').
text(de, scannerModulS, 'Scannermodul S').
text(de, streuBlaster, 'Streublaster').
text(de, streuBlasterModulC, 'Streublastermodul C').
text(de, streuBlasterModulB, 'Streublastermodul B').
text(de, terrainManipulator, 'Terrainmanipulator').
text(de, untersuchungsGeraetA, 'Untersuchungsgerät A').
text(de, verstaerkteKartuschenC, 'Verstärktekartuschen C').
text(de, wellenFormWiederVerwerterB, 'Wellenformwiederverwerter B').
text(de, solarStrahl, 'Solarstrahl').
text(de, gemuetsStrahl, 'Gemütsstrahl').
text(de, driftAufhaengungA, 'Driftaufhängung A').
text(de, haftungsVerstaerkungsAufhaengungA, 'Haftungsverstaerkungsaufhängung A').
text(de, rutschAufhaengungA, 'Rutschaufhängung A').
text(de, fusionsAntrieb, 'Fusionsantrieb').
text(de, humboldtAntrieb, 'Humboldtantrieb').
text(de, megaWattHeizung, 'Megawattheizung').
text(de, luftFilterEinheit, 'Luftfiltereinheit').
text(de, neutronenAbschirmung, 'Neutronenabschirmung').
text(de, thermalPuffer, 'Thermalpuffer').
text(de, exoFahrzeugSignalBooster, 'Exofahrzeugsignalbooster').
text(de, exoFahrzeugBeschleunigungsModul, 'Exofahrzeugbeschleunigungsmodul').
text(de, exoFahrzeugMinenLaser, 'Exofahrzeugminenlaser').
text(de, daidalosAntrieb, 'Daidalosantrieb').
text(de, hochleistungsSonar, 'Hochleistungssonar').
text(de, fortgeschrittenerSignalBoosterB, 'Fortgeschrittenersignalbooster B').
text(de, ikarusTreibStoffSystem, 'Ikarustreibstoffsystem').
text(de, exoFahrzeugMinenLaserUpgradeSigmaA, 'Exofahrzeugminenlaserupgradesigma A').
text(de, exoFahrzeugBordKanone, 'Exofahrzeugbordkanone').
text(de, umweltKontrollEinheit, 'Umweltkontrolleinheit').
text(de, minotaurusRadarAnlage, 'Minotaurusradaranlage').
text(de, minotaurusLaser, 'Minotauruslaser').
text(de, ariadnesFlamme, 'Ariadnesflamme').
text(de, minotaurusPraezisionsLaser, 'Minotauruspräzisionslaser').
text(de, minotaurusKanone, 'Minotauruskanone').
text(de, minotaurusBohrer, 'Minotaurusbohrer').
text(de, selbstSchmierendeServos, 'Selbstschmierendeservos').
text(de, exoFahrzeugAntriebModulC, 'Exofahrzeugantriebmodul C').
text(de, exoFahrzeugAntriebModulS, 'Exofahrzeugantriebmodul S').
text(de, exoFahrzeugBoostModulB, 'Exofahrzeugboostmodul B').
text(de, exoFahrzeugBoostModulC, 'Exofahrzeugboostmodul C').
text(de, exoFahrzeugBoostModulS, 'Exofahrzeugboostmodul S').
text(de, exoFahrzeugKanonenModulC, 'Exofahrzeugkanonenmodul C').
text(de, exoFahrzeugKanonenModulB, 'Exofahrzeugkanonenmodul B').
text(de, exoFahrzeugKanonenModulS, 'Exofahrzeugkanonenmodul S').
text(de, exoFahrzeugLaserModulC, 'Exofahrzeuglasermodul C').
text(de, exoFahrzeugLaserModulB, 'Exofahrzeuglasermodul B').
text(de, exoFahrzeugLaserModulS, 'Exofahrzeuglasermodul S').
text(de, exoFahrzeugSignalBoosterUpgradeTauA, 'Exofahrzeugsignalboosterupgradetau A').
text(de, humboldtAntriebsModulC, 'Humboldtantriebsmodul C').
text(de, humboldtAntriebsModulS, 'Humboldtantriebsmodul S').
text(de, nautilonKanone, 'Nautilonkanone').
text(de, nautilonKanonenModulA, 'Nautilonkanonenmodul A').
text(de, nautilonKanonenModulC, 'Nautilonkanonenmodul C').
text(de, osmotischerGeneratorC, 'Osmotischergenerator C').
text(de, tethysStrahl, 'Tethysstrahl').
text(de, konstruktionsTerminal, 'Konstruktionsterminal').
text(de, exoFahrzeugTerminal, 'Exofahrzeugterminal').
text(de, waffenTerminal, 'Waffenterminal').
text(de, wissenschaftsTerminal, 'Wissenschaftsterminal').
text(de, landwirtschaftsTerminal, 'Landwirtschaftsterminal').
text(de, annaeherungsSchalter, 'Annäherungsschalter').
text(de, bodenSchalter, 'Bodenschalter').
text(de, elektroMagnetischerGenerator, 'Elektromagnetischergenerator').
text(de, energieUmkehrer, 'Energieumkehrer').
text(de, gasExtraktor, 'Gasextraktor').
text(de, mineralienExtraktor, 'Mineralienextraktor').
text(de, schalter, 'Schalter').
text(de, solarModul, 'Solarmodul').
text(de, versorgungsDepot, 'Versorgungsdepot').
text(de, versorgungsRohr, 'Versorgungsrohr').
text(de, wandSchalter, 'Wandschalter').
text(de, echinoKaktus, 'Echinokaktus').
text(de, eiweissPerlenKugel, 'Eiweissperlenkugel').
text(de, floraBehaelterHochBeet, 'Florabehälter Hochbeet').
text(de, floraBehaelterKasten, 'Florabehälter Kasten').
text(de, floraBehaelterTubus, 'Florabehälter Tubus').
text(de, frostWurz, 'Frostwurz').
text(de, gammaGras, 'Gammagras').
text(de, giftIgel, 'Giftigel').
text(de, gravitinoWirt, 'Gravitinowirt').
text(de, grosserHydroKulturTrog, 'Großerhydrokulturtrog').
text(de, hydroKulturTrog, 'Hydrokulturtrog').
text(de, magenKrampfBlume, 'Magenkrampfblume').
text(de, morditWurzel, 'Morditwurzel').
text(de, nipNip, 'Nipnip').
text(de, pilzGeflecht, 'Pilzgeflecht').
text(de, sonnenRebe, 'Sonnenrebe').
text(de, sternenDorn, 'Sternendorn').
text(de, topfPflanze, 'Topfpflanze').
text(de, stehenderPflanzenBehaelter, 'stehender Pflanzenbehälter').
text(de, lagerBehaelter0, 'Lagerbehälter 0').
text(de, lagerBehaelter1, 'Lagerbehälter 1').
text(de, lagerBehaelter2, 'Lagerbehälter 2').
text(de, lagerBehaelter3, 'Lagerbehälter 3').
text(de, lagerBehaelter4, 'Lagerbehälter 4').
text(de, lagerBehaelter5, 'Lagerbehälter 5').
text(de, lagerBehaelter6, 'Lagerbehälter 6').
text(de, lagerBehaelter7, 'Lagerbehälter 7').
text(de, lagerBehaelter8, 'Lagerbehälter 8').
text(de, lagerBehaelter9, 'Lagerbehälter 9').
text(de, verschlosseneKiste, 'verschlossene Kiste').
text(de, roamerGeoBucht, 'Roamergeobucht').
text(de, nomadenGeoBucht, 'Nomadengeobucht').
text(de, exoFahrzeugRufStation, 'Exofahrzeugrufstation').
text(de, nautilonKammer, 'Nautilonkammer').
text(de, pilgerGeoBucht, 'Pilgergeobucht').
text(de, kolossGeoBucht, 'Koloßgeobucht').
text(de, minotaurusGeoBucht, 'Minotaurusgeobucht').
text(de, rennInitiator, 'Renninitiator').
text(de, rennHindernis, 'Rennhindernis').
text(de, rennKraftVerstaerker, 'Rennkraftverstärker').
text(de, autonomeBergBauEinheit, 'Autonomebergbaüinheit').
text(de, basisComputer, 'Basiscomputer').
text(de, batterie, 'Batterie').
text(de, konstruktionsForschungsStation, 'Konstruktionsforschungsstation').
text(de, bioTreibStoffReaktor, 'Biotreibstoffreaktor').
text(de, elektrischeTarneinheit, 'elektrische Tarneinheit').
text(de, kommunikationsStation, 'Kommunikationsstation').
text(de, nachrichtenModul, 'Nachrichtenmodul').
text(de, naehrStoffProzessor, 'Nährstoffprozessor').
text(de, signalBooster, 'Signalbooster').
text(de, speicherPunkt, 'Speicherpunkt').
text(de, speicherSignal, 'Speichersignal').
text(de, tragbareRaffinerie, 'Tragbareraffinerie').
text(de, antiMaterieReaktor, 'Antimateriereaktor').
text(de, atmosphaerenVerarbeitungsAnlage, 'Atmosphärenverarbeitungsanlage').
text(de, aussehenModifikator, 'Aussehenmodifikator').
text(de, automatischerFuetterer, 'Automatischerfütterer').
text(de, basisBergungsKapsel, 'Basisbergungskapsel').
text(de, basisTelePorterModul, 'Basisteleportermodul').
text(de, gefahrenSchutzEinheit, 'Gefahrenschutzeinheit').
text(de, geraeuschBox, 'Geräuschbox').
text(de, gesundheitsStation, 'Gesundheitsstation').
text(de, grosseRaffinerie, 'große Raffinerie').
text(de, kurzStreckenTelePorter, 'Kurzstreckenteleporter').
text(de, landeFeld, 'Landefeld').
text(de, leuchtBoden, 'Leuchtboden').
text(de, lichtBox, 'Lichtbox').
text(de, mittlereRaffinerie, 'mittlere Raffinerie').
text(de, nutzTierEinheit, 'Nutztiereinheit').
text(de, terminalDesGalaktischenMarktes, 'Terminal des galaktischen Marktes').
text(de, kugelErzeuger, 'Kugelerzeuger').
text(de, sauerStoffVerarbeiter, 'Saürstoffverarbeiter').
text(de, byteBeatGeraet, 'Bytebeatgerät').
text(de, byteBeatSchaltung, 'Bytebeatschaltung').
text(de, automatischerSchalter, 'automatischer Schalter').
text(de, motivStilisiertesR, 'Motiv stilisiertes R').
text(de, motivRundPipette, 'Motiv Rundpipette').
text(de, motivBuegel, 'Motiv Bügel').
text(de, motivNo0, 'Motiv No 0').
text(de, motivSchildErstochenerVogel, 'Motiv schild erstochener Vogel').
text(de, motivFaltungDuennDick, 'Motiv Faltung duenn dick').
text(de, motivZiegelSteine, 'Motiv Ziegelsteine').
text(de, motivRadioAktivGrau, 'Motiv radioaktiv grau').
text(de, motivGrabStein, 'Motiv Grabstein').
text(de, motivHelloGames, 'Motiv Hello games').
text(de, motivNo1, 'Motiv No 1').
text(de, motivNo2, 'Motiv No 2').
text(de, motivSchildGrünerMann, 'Motiv Schild grüner Mann').
text(de, motivSchildKorvax, 'Motiv Schild Korvax').
text(de, motivNo3, 'Motiv No 3').
text(de, motivNo5, 'Motiv No 5').
text(de, motivNo7, 'Motiv No 7').
text(de, motivNo9, 'Motiv No 9').
text(de, motivNo4, 'Motiv No 4').
text(de, motivNo6, 'Motiv No 6').
text(de, motivNo8, 'Motiv No 8').
text(de, motivFroschSack, 'Motiv Froschsack').
text(de, motivLaemmchen, 'Motiv Lämmchen').
text(de, wandBildSchirm, 'Wandbildschirm').
text(de, wandVentilator, 'Wandventilator').
text(de, gruenerWandBildSchirm, 'grüner Wandbildschirm').
text(de, schubLadenSchrank, 'Schubladenschrank').
text(de, wandEinheit, 'Wandeinheit').
text(de, lagerModulDeko, 'Lagermoduldeko').
text(de, deckenPaneel, 'Deckenpaneel').
text(de, techBedienFeld, 'Techbedienfeld').
text(de, server, 'Server').
text(de, kanisterRegal, 'Kanisterregal').
text(de, kleineKiste, 'kleine Kiste').
text(de, schliessFach, 'Schließfach').
text(de, flachesModul, 'flaches Modul').
text(de, seitenModul, 'Seitenmodul').
text(de, lagerModul, 'Lagermodul').
text(de, regalModul, 'Regalmodul').
text(de, roboterArm, 'Roboterarm').
text(de, waffenRegal, 'Waffenregal').
text(de, oszilloskop, 'Oszilloskop').
text(de, achtEckSchrank, 'Achteckschrank').
text(de, fassFoermigerFabrikator, 'faßförmiger Fabrikator').
text(de, hoherSchrank, 'hoher Schrank').
text(de, kistenFoermigerFabrikator, 'kistenförmiger Fabrikator').
text(de, schalenSitzStuhl, 'Schalensitzstuhl').
text(de, stuhlEckig, 'Stuhl eckig').
text(de, flagge1, 'Flagge 1').
text(de, tisch, 'Tisch').
text(de, bett, 'Bett').
text(de, stuhlFriseur, 'Friseurstuhl').
text(de, sofa, 'Sofa').
text(de, flagge2, 'Flagge 2').
text(de, wandFlagge1, 'Wandflagge 1').
text(de, tischSechsEckig, 'Tisch sechseckig').
text(de, einfacherSchreibTisch, 'Einfacher Schreibtisch').
text(de, ergonomischesSofa, 'ergonomisches Sofa').
text(de, eckSofa, 'Ecksofa').
text(de, flagge3, 'Flagge 3').
text(de, flagge4, 'Flagge 4').
text(de, wandFlagge3, 'Wandflagge 3').
text(de, wandFlagge2, 'Wandflagge 2').
text(de, bodenMatte, 'Bodenmatte').
text(de, grosseMonitorStation, 'große Monitorstation').
text(de, gewoelbterTisch, 'gewölbter Tisch').
text(de, monitorStation, 'Monitorstation').
text(de, arbeitsPlatte, 'Arbeitsplatte').
text(de, leichterTisch, 'leichter Tisch').
text(de, lichtHandLampe, 'Lichthandlampe').
text(de, weisseLeuchte, 'weiße Leuchte').
text(de, lichtStehLampeEckig, 'Licht Stehlampe eckig').
text(de, laborLampe, 'Laborlampe').
text(de, blaueLeuchte, 'blaue Leuchte').
text(de, roteLeuchte, 'rote Leuchte').
text(de, lichtStehLampeRund, 'Licht Stehlampe rund').
text(de, lichtStehLampeSchirm, 'Licht Stehlampe Schirm').
text(de, deckenLeuchte, 'Deckenleuchte').
text(de, gelbeLeuchte, 'gelbe Leuchte').
text(de, grueneLeuchte, 'grüne Leuchte').
text(de, pinkeLeuchte, 'pinke Leuchte').
text(de, holzWand, 'Holzwand').
text(de, holzBodenPlatte, 'Holzbodenplatte').
text(de, duenneHolzWand, 'dünne Holzwand').
text(de, holzTuerRahmen, 'Holztürrahmen').
text(de, holzDach, 'Holzdach').
text(de, glasPlatteMitHolzRahmen, 'Glasplatte mit Holzrahmen').
text(de, holzRampe, 'Holzrampe').
text(de, kleineHolzPlatte, 'kleine Holzplatte').
text(de, holzDreieck, 'Holzdreieck').
text(de, schraegeHolzPlatte, 'schräge Holzplatte').
text(de, kleineHolzWand, 'kleine Holzwand').
text(de, holzFenster, 'Holzfenster').
text(de, holzTuer, 'Holztür').
text(de, elektrischeHolzTuer, 'elektrische Holztuer').
text(de, holzDachPlatte, 'Holzdachplatte').
text(de, holzDachEckStueck, 'Holzdacheckstück').
text(de, holzBogen, 'Holzbogen').
text(de, halbeHolzRampe, 'halbe Holzrampe').
text(de, kleinesHolzDreieck, 'kleines Holzdreieck').
text(de, kurzeHolzWand, 'kurze Holzwand').
text(de, holzFassade, 'Holzfassade').
text(de, kleineHolzTuer, 'kleine Holztuer').
text(de, dachInnenEckteilAusHolz, 'Dachinneneckteil aus Holz').
text(de, halberHolzBogen, 'halber Holzbogen').
text(de, metallWand, 'Metallwand').
text(de, metallBodenPlatte, 'Metallbodenplatte').
text(de, duenneMetallWand, 'dünne Metallwand').
text(de, metallTuerRahmen, 'Metalltürrahmen').
text(de, metallDach, 'Metalldach').
text(de, glasPlatteMitMetallRahmen, 'Glasplatte mit Metallrahmen').
text(de, metallRampe, 'Metallrampe').
text(de, kleineMetallPlatte, 'kleine Metallplatte').
text(de, metallDreieck, 'Metalldreieck').
text(de, schraegeMetallPlatte, 'schräge Metallplatte').
text(de, kleineMetallWand, 'kleine Metallwand').
text(de, metallFenster, 'Metallfenster').
text(de, metallTuer, 'Metalltür').
text(de, elektrischeMetallTuer, 'elektrische Metalltuer').
text(de, metallDachPlatte, 'Metalldachplatte').
text(de, metallDachEckStueck, 'Metalldacheckstück').
text(de, metallBogen, 'Metallbogen').
text(de, halbeMetallRampe, 'halbe Metallrampe').
text(de, kleinesMetallDreieck, 'kleines Metalldreieck').
text(de, kurzeMetallWand, 'kurze Metallwand').
text(de, metallFassade, 'Metallfassade').
text(de, kleineMetallTuer, 'kleine Metalltuer').
text(de, dachInnenEckteilAusMetall, 'Dachinneneckteil aus Metall').
text(de, halberMetallBogen, 'halber Metallbogen').
text(de, betonWand, 'Betonwand').
text(de, betonBodenPlatte, 'Betonbodenplatte').
text(de, duenneBetonWand, 'dünne Betonwand').
text(de, betonTuerRahmen, 'Betontürrahmen').
text(de, betonDach, 'Betondach').
text(de, glasPlatteMitBetonRahmen, 'Glasplatte mit Betonrahmen').
text(de, betonRampe, 'Betonrampe').
text(de, kleineBetonBodenPlatte, 'kleine Betonbodenplatte').
text(de, betonDreieck, 'Betondreieck').
text(de, schraegeBetonPlatte, 'schräge Betonplatte').
text(de, kleineBetonWand, 'kleine Betonwand').
text(de, betonFenster, 'Betonfenster').
text(de, betonTuer, 'Betontür').
text(de, elektrischeBetonTuer, 'elektrische Betontür').
text(de, betonDachPlatte, 'Betondachplatte').
text(de, betonDachEckStueck, 'Betondacheckstück').
text(de, betonBogen, 'Betonbogen').
text(de, halbeBetonRampe, 'halbe Betonrampe').
text(de, kleinesBetonDreieck, 'kleines Betondreieck').
text(de, kurzeBetonWand, 'kurze Betonwand').
text(de, betonFassade, 'Betonfassade').
text(de, kleineBetonTuer, 'kleine Betontuer').
text(de, dachInnenEckteilAusBeton, 'Dachinneneckteil aus Beton').
text(de, halberBetonBogen, 'halber Betonbogen').
text(de, zylindrischerRaum, 'zylindrischer Raum').
text(de, quadratischerRaum, 'quadratischer Raum').
text(de, geraderKorridor, 'gerader Korridor').
text(de, tuer, 'Tür').
text(de, fundament, 'Fundament').
text(de, lFoermigerKorridor, 'L foermiger Korridor').
text(de, korridorMitGlasDach, 'Korridor mit Glasdach').
text(de, holoTuer, 'Holotür').
text(de, zugangsRampe, 'Zugangsrampe').
text(de, pflasterungVierFach, 'Pflasterung vierfach').
text(de, viererFundamentStrebe, 'Viererfundamentstrebe').
text(de, fundamentStrebe, 'Fundamentstrebe').
text(de, zylindrischerRaumRahmen, 'zylindrischer Raumrahmen').
text(de, tFoermigerKorridor, 'T foermiger Korridor').
text(de, xFoermigerKorridor, 'X foermiger Korridor').
text(de, korridorFenster, 'Korridorfenster').
text(de, bioKuppelRaum, 'Biokuppelraum').
text(de, gebogenerKorridor, 'Gebogener Korridor').
text(de, leiter, 'Leiter').
text(de, pflasterung, 'Pflasterung').
text(de, pflasterungPodest, 'Pflasterung Podest').
text(de, grossesGlasPaneel, 'großes Glaspaneel').
text(de, aussichtsKugel, 'Aussichtskugel').
text(de, wuerfelFoermigerRaum, 'würfelförmiger Raum').
text(de, wuerfelRaumFundamentStrebe, 'Würfelraumfundamentstrebe').
text(de, gewoelbteWuerfelFoermigeWand, 'gewölbte Wuerfelfoermige Wand').
text(de, wuerfelFoermigerGlasRaum, 'würfelförmiger Glasraum').
text(de, wuerfelFoermigerRaumRahmen, 'würfelförmiger Raumrahmen').
text(de, wuerfelFoermigerRaumBoden, 'würfelförmiger Raumboden').
text(de, wuerfelRaumViererFundamentStrebe, 'Würfelraumviererfundamentstrebe').
text(de, innenTreppen, 'Innentreppen').
text(de, wuerfelFoermigeInnenWand, 'würfelförmige Innenwand').
text(de, wuerfelFoermigerDachAufsatz, 'würfelförmiger Dachaufsatz').
text(de, gewoelbtesWuerfelFoermigesDach, 'gewölbtes wuerfelfoermiges Dach').
text(de, wuerfelFoermigesFensterEckig, 'würfelförmiges Fenster eckig').
text(de, wuerfelFoermigesFensterRund, 'würfelförmiges Fenster rund').
text(de, infraStrukturLeiter, 'Infrastrukturleiter').
text(de, wuerfelFoermigeInnenTuer, 'würfelförmige Innentuer').
text(de, tiefSeeKammer, 'Tiefseekammer').
text(de, meeresUnterSchlupf, 'Meeresunterschlupf').
text(de, glasTunnel, 'Glastunnel').
text(de, quadratischeTiefSeeKammer, 'quadratische Tiefseekammer').
text(de, wasserDichteTuer, 'wasserdichte Tuer').
text(de, lFoermigerGlasTunnel, 'L foermiger Glastunnel').
text(de, vertikalerGlasTunnel, 'vertikaler Glastunnel').
text(de, mondTeichBoden, 'Mondteichboden').
text(de, tFoermigerGlasTunnel, 'T foermiger Glastunnel').
text(de, xFoermigerGlasTunnel, 'X foermiger Glastunnel').
text(de, mineralBogen, 'Mineralbogen').
text(de, edelSteinFels, 'Edelsteinfels').
text(de, tentakelSpitze, 'Tentakelspitze').
text(de, wachsameWoelbung, 'Wachsamewölbung').
text(de, blasenBildenderPilz, 'blasenbildender Pilz').
text(de, uraltesNadelGehoelz, 'uraltes Nadelgehölz').
text(de, gefrorenerPflanzenBehaelter, 'gefrorener Pflanzenbehälter').
text(de, robusterStrauch, 'robuster Strauch').
text(de, meeresGestein, 'Meeresgestein').
text(de, terrarium, 'Terrarium').
text(de, segelPalme, 'Segelpalme').
text(de, kugelBaum, 'Kugelbaum').
text(de, steinGarten, 'Steingarten').
text(de, taschenRealitaetsGenerator, 'Taschenrealitätsgenerator').
text(de, krauseKoralle, 'krause Koralle').
text(de, wasserKristall, 'Wasserkristall').
text(de, kronLeuchterBluete, 'Kronleuchterblüte').
text(de, rankenFuesser, 'Rankenfüßer').
text(de, kleinesAquarium, 'kleines Aquarium').
text(de, bronzeneAtlasStatue, 'bronzene Atlasstatue').
text(de, silberneAtlasStatue, 'silberne Atlasstatue').
text(de, goldeneAtlasStatue, 'goldene Atlasstatue').
text(de, fleischFressenderStrauch, 'fleischfressender Strauch').
text(de, zwergPalme, 'Zwergpalme').
text(de, kurioserMais, 'kurioser Mais').
text(de, bronzeneJaegerStatue, 'bronzene Jaegerstatue').
text(de, silberneJaegerStatue, 'silberne Jaegerstatue').
text(de, goldeneJaegerStatue, 'goldene Jaegerstatue').
text(de, expansionsWuerfelGeraet, 'Expansionswürfelgerät').
text(de, roboterBegleiter, 'Roboterbegleiter').
text(de, kugelHologrammGeraet, 'Kugelhologrammgerät').
text(de, artemisMotiv, 'Artemismotiv').
text(de, nullMotiv, 'Nullmotiv').
text(de, fruechteBaum, 'Früchtebaum').
text(de, spindelBaum, 'Spindelbaum').
text(de, immerGruenBaum, 'Immergrünbaum').
text(de, apolloMotiv, 'Apollomotiv').
text(de, bronzeneDiploStatue, 'Bronzenediplostatü').
text(de, silberneDiploStatue, 'Silbernediplostatü').
text(de, goldeneDiploStatue, 'Goldenediplostatü').
text(de, nadaMotiv, 'Nadamotiv').
text(de, poloMotiv, 'Polomotiv').
text(de, bronzeneKampfLaeuferStatue, 'bronzene Kampflaeuferstatue').
text(de, silberneKampfLaeuferStatue, 'silberne Kampflaeuferstatue').
text(de, goldeneKampfLaeuferStatue, 'goldene Kampflaeuferstatue').
text(de, bronzeneGekStatue, 'bronzene Gekstatue').
text(de, silberneGekStatue, 'silberne Gekstatue').
text(de, goldeneGekStatue, 'goldene Gekstatue').
text(de, anomalieMotiv, 'Anomaliemotiv').
text(de, galaktischerHubMotiv, 'Galaktischerhubmotiv').
text(de, umschlingenderBaum, 'umschlingender Baum').
text(de, regenSchirmBaum, 'Regenschirmbaum').
text(de, windenderStrauch, 'windender Strauch').
text(de, nadaFigur, 'Nadafigur').
text(de, zustimmendeHandbewegungMotiv, 'zustimmende Handbewegungmotiv').
text(de, bronzeneKreaturStatue, 'bronzene Kreaturstatue').
text(de, silberneKreaturStatue, 'silberne Kreaturstatue').
text(de, goldeneKreaturStatue, 'goldene Kreaturstatue').
text(de, bronzeneAstronautenStatue, 'bronzene Astronautenstatue').
text(de, silberneAstronautenStatue, 'silberne Astronautenstatue').
text(de, goldeneAstronautenStatue, 'goldene Astronautenstatue').
text(de, flottenKommandoRaum, 'Flottenkommandoraum').
text(de, grosserFrachterRaum, 'großer Frachterraum').
text(de, frachterKorridor, 'Frachterkorridor').
text(de, gebogenerFrachterKorridor, 'gebogener Frachterkorridor').
text(de, frachterKreuzungDreiFach, 'Frachterkreuzung dreifach').
text(de, frachterKreuzungVierFach, 'Frachterkreuzung vierfach').
text(de, frachterTreppe, 'Frachtertreppe').
text(de, gebogenesRohr, 'gebogenes Rohr').
text(de, grosserKeil, 'großer Keil').
text(de, kleinerKeil, 'kleiner Keil').
text(de, kugel, 'Kugel').
text(de, pyramide, 'Pyramide').
text(de, rohr, 'Rohr').
text(de, stabilerWuerfel, 'stabiler Wuerfel').
text(de, wuerfel, 'Würfel').
text(de, zylinder, 'Zylinder').
text(de, zuckendesEi, 'zuckendes Ei').
text(de, absprungKapselKoordinaten, 'Absprungkapselkoordinaten').
text(de, protokollEntschluesselungsCode, 'Protokollentschlüsselungscode').
text(de, geborgeneDaten, 'geborgene Daten').
text(de, queckSilber, 'Qücksilber').
text(de, navigationsDaten, 'Navigationsdaten').
text(de, antiHaftKolben, 'Antihaftkolben').
text(de, ausrangierteSchaltPlatte, 'ausrangierte Schaltplatte').
text(de, autonomePositionierungsEinheit, 'Autonomepositionierungseinheit').
text(de, bromSalz, 'Bromsalz').
text(de, entschluesselteBenutzerDaten, 'wntschlüsselte Benutzerdaten').
text(de, experimentelleEnergieFluessigkeit, 'experimentelle Energiefluessigkeit').
text(de, fuenfDimensionalerTorus, 'fünfdimensionaler Torus').
text(de, funkenKanister, 'Funkenkanister').
text(de, fusionsKern, 'Fusionskern').
text(de, gewaltigesMetallZahnRad, 'gewaltiges Metallzahnrad').
text(de, holographischeKurbelWelle, 'holographische Kurbelwelle').
text(de, hochleistungsKompressor, 'Hochleistungskompressor').
text(de, industrieBatterie, 'Industriebatterie').
text(de, instabilitaetsInjektor, 'Instabilitätsinjektor').
text(de, ionenKugel, 'Ionenkugel').
text(de, ionenKondensator, 'Ionenkondensator').
text(de, kometenTroepfchen, 'Kometentröpfchen').
text(de, nanoRohrKiste, 'Nanorohrkiste').
text(de, neuralLeitung, 'Neuralleitung').
text(de, neutronenMikroskop, 'Neutronenmikroskop').
text(de, nichtMehrDuftendePheromonFlasche, 'nicht mehr duftende Pheromonflasche').
text(de, ohmschesGel, 'ohmsches Gel').
text(de, optischesLoesungsMittel, 'optisches Lösungsmittel').
text(de, organischeRohre, 'organische Rohre').
text(de, polyChromesZirkonium, 'polychromes Zirkonium').
text(de, quantumBeschleuniger, 'Quantumbeschleuniger').
text(de, schmutz, 'Schmutz').
text(de, schweisserSeife, 'Schweißerseife').
text(de, sechsZackigerEntKoppler, 'sechszackiger Entkoppler').
text(de, sichSelbstReparierendesHeridium, 'sich selbst reparierendes Heridium').
text(de, sternenSeide, 'Sternenseide').
text(de, supraleitendeFaser, 'Supraleitendefaser').
text(de, teleportKoordinatoren, 'Teleportkoordinatoren').
text(de, unraffiniertesPyritFett, 'unraffiniertes Pyritfett').
text(de, vergitterterBogenKristall, 'vergitterter Bogenkristall').
text(de, raumSchiffKiVentile, 'Raumschiff KI Ventile').
text(de, nanoKabelSpule, 'Nanokabelspule').
text(de, wiederVerwerterSchaltKreis, 'wiederverwerter Schaltkreis').
text(de, verdichteteIndiumReste, 'verdichtete Indiumreste').
text(de, subatomareRegler, 'subatomare Regler').
text(de, thermalModule, 'Thermalmodule').
text(de, handvollZahnRaeder, 'Hand voll Zahnraeder').
text(de, kuehlMittelTank, 'Kühlmitteltank').
text(de, verstaerkteRohre, 'verstärkte Rohre').
text(de, ehemalsNuetzlicheFedern, 'ehemals nuetzliche Federn').
text(de, unmoeglicheSporen, 'unmögliche Sporen').
text(de, sichWindendeSpulen, 'sich windende Spulen').
text(de, blasenBallen, 'Blasenballen').
text(de, defekterSeparator, 'defekter Separator').
text(de, elektrischerWuerfel, 'elektrischer Würfel').
text(de, kabelKapsel, 'Kabelkapsel').
text(de, kalziPilz, 'Kalzipilz').
text(de, kappillarMuschel, 'Kappillarmuschel').
text(de, klapperWirbleSaeule, 'Klapperwirblesäule').
text(de, lichtBruch, 'Lichtbruch').
text(de, terbiumWachstum, 'Terbiumwachstum').
text(de, verknoecherterStern, 'verknöcherter Stern').
text(de, gekNip, 'Gek Nip').
text(de, gekRelikt, 'Gek Relikt').
text(de, korvaxGehaeuse, 'Korvaxgehäuse').
text(de, vyKeenBildnis, 'Vykeenbildnis').
text(de, vyKeenDolch, 'Vykeendolch').
text(de, divergenzWuerfel, 'Divergenzwürfel').
text(de, hadalKern, 'Hadalkern').
text(de, korvaxKonvergenzWuerfel, 'Korvaxkonvergenzwürfel').
text(de, vykenTafel, 'Vykentafel').
text(de, abgeplatzteTeilSkelette, 'abgeplatzte Teilskelette').
text(de, ameisenRoggenZwiebeln, 'Ameisenroggenzwiebeln').
text(de, aussergewoehnlicheDrehmomentErzeuger, 'außergewöhnliche Drehmomenterzeuger').
text(de, behaelterMitUraltenMetallteilen, 'Behälter mit uralten Metallteilen').
text(de, behaelterMitAnzestralenJuwelen, 'Behälter mit anzestralen Juwelen').
text(de, beschaedigteGetriebe, 'beschädigte Getriebe').
text(de, boxMitSchoenenBohnen, 'Box mit schoenen Bohnen').
text(de, faszinierendeKnochenFragmente, 'faszinierende Knochenfragmente').
text(de, frischeFlutPalmenSprossen, 'frische Flutpalmensprossen').
text(de, fortgeschritteneProzessoren, 'fortgeschrittene Prozessoren').
text(de, gebrocheneSkelettFragmente, 'gebrochene Skelettfragmente').
text(de, gefroreneLarve, 'gefrorene Larve').
text(de, gekeimteMoschusFarnFruechte, 'gekeimte Moschusfarnfruechte').
text(de, gekeimteSaegeKelchBlattVerschnitte, 'gekeimte Saegekelchblattverschnitte').
text(de, heimgesuchteLarve, 'heimgesuchte Larve').
text(de, hochtechnologischeGyroskope, 'hochtechnologische Gyroskope').
text(de, konservierteKrabbenRueckenWirbel, 'konservierte Krabbenrückenwirbel').
text(de, merkwürdigeKnochenFragmente, 'merkwürdige Knochenfragmente').
text(de, ruhendeVersuchungsWurzVerschnitte, 'ruhende Versuchungswurzverschnitte').
text(de, schmutzigeKnochen, 'schmutzige Knochen').
text(de, schmutzigeKnochenFragmente, 'schmutzige Knochenfragmente').
text(de, schrecklicheUeberreste, 'schreckliche Überreste').
text(de, summendeGetriebe, 'summende Getriebe').
text(de, unheimlicheKerne, 'unheimliche Kerne').
text(de, uralterSchluessel, 'uralter Schlüssel').
text(de, uranfaenglicheTrilobitRippen, 'uranfängliche Trilobitrippen').
text(de, verschmolzeneTafel, 'verschmolzene Tafel').
text(de, wasserBefleckteBooster, 'wasserbefleckte Booster').
text(de, verschlisseneKnochen, 'verschlissene Knochen').
text(de, zusammenStellungAusVonVykeeStammendenKuriositaeten, 'Zusammenstellung aus von Vykee stammenden Kuriositaeten').
text(de, byteBeatGeraetRezept, 'Bytebeatgerätrezept').
text(de, saeureRezept, 'Säurerezept').
text(de, schmierMittelRezept, 'Schmiermittelrezept').
text(de, thermischesKondensatRezept, 'thermisches Kondensatrezept').
text(de, tragbarerReaktorRezept, 'tragbarer Reaktorrezept').
text(de, instabilesGelRezept, 'instabiles Gelrezept').
text(de, glasRezept, 'Glasrezept').
text(de, polyFaserRezept, 'Polyfaserrezept').
text(de, angereicherterKohlenStoffRezept, 'angereicherter Kohlenstoffrezept').
text(de, stickStoffSalzRezept, 'Stickstoffsalzrezept').
text(de, aroniumRezept, 'Aroniumrezept').
text(de, quantumProzessorRezept, 'Quantumprozessorrezept').
text(de, kryogenKammerRezept, 'Kryogenkammerrezept').
text(de, fluessigSprengStoffRezept, 'Flüssigsprengstoffrezept').
text(de, lebendesGlasRezept, 'lebendes Glasrezept').
text(de, hitzeKondensatorRezept, 'Hitzekondensatorrezept').
text(de, schaltPlatteRezept, 'Schaltplatterezept').
text(de, organischerKatalysatorRezept, 'organischer Katalysatorrezept').
text(de, halbLeiterRezept, 'Halbleiterrezept').
text(de, heissesEisRezept, 'heißes Eisrezept').
text(de, strassenKoeterBronzeRezept, 'Straßenköterbronzerezept').
text(de, heroxRezept, 'Heroxrezept').
text(de, lemmiumRezept, 'Lemmiumrezept').
text(de, magnoGoldRezept, 'Magnogoldrezept').
text(de, grantineRezept, 'Grantinerezept').
text(de, fusionsZuenderRezept, 'Fusionszünderrezept').
text(de, staseGeraetRezept, 'Stasegerätrezept').
text(de, fusionsBeschleunigerRezept, 'Fusionsbeschleunigerrezept').
text(de, supraLeiterRezept, 'Supraleiterrezept').
text(de, kryoPumpeRezept, 'Kryopumperezept').
text(de, iridesitRezept, 'Iridesitrezept').
text(de, geoDesitRezept, 'Geodesitrezept').
text(de, lebensErhaltungsGelRezept, 'Lebenserhaltungsgelrezept').
text(de, diWasserStoffGeleeRezept, 'Diwasserstoffgeleerezept').
text(de, ionenAkkuRezept, 'Ionenakkurezept').
text(de, warpZelleRezept, 'Warpzellerezept').
text(de, kohlenStoffKristallRezept, 'Kohlenstoffkristallrezept').
text(de, seltenesMetallElementRezept, 'seltenes Metallelementrezept').
text(de, tetraKobaltRezept, 'Tetrakobaltrezept').
text(de, chlorGitterRezept, 'Chlorgitterrezept').
text(de, instabilesNatriumRezept, 'instabiles Natriumrezept').
text(de, superOxidKristallRezept, 'Superoxidkristallrezept').
text(de, raumSchiffStartTreibStoffRezept, 'Raumschiffstarttreibstoffrezept').
text(de, fortschrittlicherIonenAkkuRezept, 'fortschrittlicher Ionenakkurezept').
text(de, atlasPassV1Rezept, 'Atlas Pass v1rezept').
text(de, kobaltSpiegelRezept, 'Kobaltspiegelrezept').
text(de, salzRefaktorRezept, 'Salzrefaktorrezept').
text(de, natriumDiodeRezept, 'Natriumdioderezept').
text(de, sauerStoffFilterRezept, 'Sauerstofffilterrezept').
text(de, sauerStoffKapselRezept, 'Sauerstoffkapselrezept').
text(de, hydrothermaleTreibStoffZelleRezept, 'hydrothermale Treibstoffzellerezept').
text(de, instabilesPlasmaRezept, 'instabiles Plasmarezept').
text(de, sternenSchildBatterieRezept, 'Sternenschildbatterierezept').
text(de, atlasPassV2Rezept, 'Atlas Pass V2 Rezept').
text(de, warpHyperKernRezept, 'Warphyperkernrezept').
text(de, atlasPassV3Rezept, 'Atlas Pass V3 Rezept').
text(de, hermetischesSiegelRezept, 'hermetisches Siegelrezept').
text(de, kohlenStoffNanoRohrRezept, 'Kohlenstoffnanorohrrezept').
text(de, metallPlattenRezept, 'Metallplattenrezept').
text(de, projektilMunitionRezept, 'Projektilmunitionrezept').
text(de, antiMaterieRezept, 'Antimaterierezept').
text(de, antiMaterieGehaeuseRezept, 'Antimateriegehäuserezept').
text(de, mikroProzessorRezept, 'Mikroprozessorrezept').
text(de, kreaturenKugelnRezept, 'Kreaturenkugelnrezept').
text(de, fregattenTreibStoff50toRezept, 'Fregattentreibstoff 50 to Rezept').
text(de, fregattenTreibStoff100toRezept, 'Fregattentreibstoff 100 to Rezept').
text(de, fregattenTreibStoff200toRezept, 'Fregattentreibstoff 200 to Rezept').
text(de, treibStoffOxidantRezept, 'Treibstoffoxidantrezept').
text(de, gedankenKontrollGeraetRezept, 'Gedankenkontrollgerätrezept').
text(de, holografischerAnalysatorRezept, 'holografischer Analysatorrezept').
text(de, sprengDrohnenRezept, 'Sprengdrohnenrezept').
text(de, mineralKompressorRezept, 'Mineralkompressorrezept').
text(de, warpKernResonatorRezept, 'Warpkernresonatorrezept').
text(de, verstraerkterWarpSchildCRezept, 'versträrkter Warpschild C Rezept').
text(de, chromatischerWarpSchildBRezept, 'Chromatischerwarpschild B Rezept').
text(de, temporalerWarpComputerARezept, 'temporaler Warpcomputer A Rezept').
text(de, plasmaWarpInjektorBRezept, 'Plasmawarpinjektor B Rezept').
text(de, realitaetsEntwirrerRezept, 'Realitätsentwirrerrezept').
text(de, materieStrahlRezept, 'Materiestrahlrezept').
text(de, gefangeneNanodeRezept, 'gefangene Nanoderezept').
text(de, umhuellterSchattenRezept, 'umhüllter Schattenrezept').
text(de, nooSphaerischKugelRezept, 'Noosphärischkugelrezept').
text(de, dunkleMaterieRezept, 'dunkle Naterierezept').
text(de, endeDerDaemmerungRezept, 'Ende der Dämmerungrezept').
text(de, photischerJadeRezept, 'photischer Jaderezept').
text(de, zustandsPhaseRezept, 'Zustandsphaserezept').
text(de, novaeRegeneratRezept, 'Noväregeneratrezept').
text(de, modifizierteQuantenRezept, 'modifizierte Quantenrezept').
text(de, herzDerSonneRezept, 'Herz der Sonne Rezept').
text(de, sternenSamenRezept, 'Sternensamenrezept').
text(de, seelenEngineRezept, 'Seelenenginerezept').
text(de, gedankenBogenRezept, 'Gedankenbogenrezept').
text(de, bewusstseinsBrueckeRezept, 'Bewusstseinsbrückerezept').
text(de, pulsierenderKernRezept, 'pulsierender Kern Rezept').
text(de, unmoeglicheMembranRezept, 'unmögliche Membran Rezept').
text(de, glasSamenRezept, 'Glassamenrezept').
text(de, lebensErhaltungRezept, 'Lebenserhaltungrezept').
text(de, gefahrGutSchutzHandschuhRezept, 'Gefahrgutschutzhandschuhrezept').
text(de, gefahrenSchutzRezept, 'Gefahrenschutzrezept').
text(de, sauerStoffWiederVerwerterCRezept, 'Saürstoffwiederverwerter C Rezept').
text(de, jetPackRezept, 'Jetpackrezept').
text(de, einfacherUeberSetzerBRezept, 'einfacher Übersetzer B Rezept').
text(de, kuehlMittelNetzwerkCRezept, 'Kühlmittelnetzwerk C Rezept').
text(de, waermeSchichtCRezept, 'Wärmeschicht C Rezept').
text(de, toxinDaempferCRezept, 'Toxindämpfer C Rezept').
text(de, strahlungsDeflektorCRezept, 'Strahlungsdeflektor C Rezept').
text(de, belueftungsMembranBRezept, 'Belüftungsmembran B Rezept').
text(de, schildGitterBRezept, 'Schildgitter B Rezept').
text(de, sauerStoffUmleiterARezept, 'Sauerstoffumleiter A Rezept').
text(de, neuralStimulatorBRezept, 'Neuralstimulator B Rezept').
text(de, raketenStiefelARezept, 'Raketenstiefel A Rezept').
text(de, effizienteWasserDuesenARezept, 'effiziente Wasserdüsen A Rezept').
text(de, verbesserterUebersetzerARezept, 'verbesserter Übersetzer A Rezept').
text(de, perfektionierterUebersetzerSRezept, 'perfektionierter Übersetzer S Rezept').
text(de, persoenlicheRaffinerieRezept, 'persönliche Raffinerie Rezept').
text(de, luftSchubAntriebSRezept, 'Luftschubantriebsrezept').
text(de, fusionsAntriebRezept, 'Fusionsantriebrezept').
text(de, humboldtAntriebRezept, 'Humboldtantriebrezept').
text(de, megaWattHeizungRezept, 'Megawattheizungrezept').
text(de, luftFilterEinheitRezept, 'Luftfiltereinheitrezept').
text(de, neutronenAbschirmungRezept, 'Neutronenabschirmungrezept').
text(de, thermalPufferRezept, 'Thermalpufferrezept').
text(de, exoFahrzeugSignalBoosterRezept, 'Exofahrzeugsignalboosterrezept').
text(de, exoFahrzeugBeschleunigungsModulRezept, 'Exofahrzeugbeschleunigungsmodulrezept').
text(de, exoFahrzeugMinenLaserRezept, 'Exofahrzeugminenlaserrezept').
text(de, daidalosAntriebRezept, 'Daidalosantriebrezept').
text(de, hochleistungsSonarRezept, 'Hochleistungssonarrezept').
text(de, fortgeschrittenerSignalBoosterBRezept, 'fortgeschrittener Signalbooster B Rezept').
text(de, ikarusTreibStoffSystemRezept, 'Ikarustreibstoffsystemrezept').
text(de, exoFahrzeugMinenLaserUpgradeSigmaARezept, 'Exofahrzeug Minenlaser Upgrade Sigma A Rezept').
text(de, exoFahrzeugBordKanoneRezept, 'Exofahrzeugbordkanonerezept').
text(de, umweltKontrollEinheitRezept, 'Umweltkontrolleinheitrezept').
text(de, minotaurusRadarAnlageRezept, 'Minotaurusradaranlagerezept').
text(de, minotaurusLaserRezept, 'Minotauruslaserrezept').
text(de, osmotischerGeneratorCRezept, 'osmotischer Generator C Rezept').
text(de, tethysStrahlRezept, 'Tethysstrahlrezept').
text(de, nautilonKanoneRezept, 'Nautilonkanonerezept').
text(de, exoFahrzeugSignalBoosterUpgradeTauARezept, 'Exofahrzeugsignalbooster Upgrade Tau A Rezept').
text(de, ariadnesFlammeRezept, 'Ariadnes Flamme Rezept').
text(de, minotaurusPraezisionsLaserRezept, 'Minotauruspräzisionslaserrezept').
text(de, minotaurusKanoneRezept, 'Minotauruskanonerezept').
text(de, minotaurusBohrerRezept, 'Minotaurusbohrerrezept').
text(de, selbstSchmierendeServosRezept, 'selbstschmierende Servos Rezept').
text(de, impulsAntriebRezept, 'Impulsantriebrezept').
text(de, teleportEmpfaengerRezept, 'Teleportempfängerrezept').
text(de, hyperAntriebRezept, 'Hyperantriebrezept').
text(de, startSchubDueseRezept, 'Startschubdüserezept').
text(de, deflektorSchildRezept, 'Deflektorschildrezept').
text(de, photonenKanoneRezept, 'Photonenkanonerezept').
text(de, konfliktScannerRezept, 'Konfliktscannerrezept').
text(de, wirtschaftsScannerRezept, 'Wirtschaftsscannerrezept').
text(de, cadmiumAntriebBRezept, 'Cadmiumantrieb B Rezept').
text(de, effizienteDuesenBRezept, 'Effizientedüsen B Rezept').
text(de, ablativePanzerungCRezept, 'ablative Panzerung C Rezept').
text(de, nichtlineareOptikCRezept, 'nichtlineare Optik C Rezept').
text(de, raketenWerferRezept, 'Raketenwerferrezept').
text(de, phasenStrahlerRezept, 'Phasenstrahlerrezept').
text(de, positronenWerferRezept, 'Positronenwerferrezept').
text(de, infraMesserBeschleunigerRezept, 'Inframesserbeschleunigerrezept').
text(de, zyklotronBallisteRezept, 'Zyklotronballisterezept').
text(de, emerilAntriebARezept, 'Emerilantrieb A Rezept').
text(de, startSystemLadeGeraetSRezept, 'Startsystemladegerät S Rezept').
text(de, grosseRaketenRohreBRezept, 'große Raketenrohre B Rezept').
text(de, fourierBegrenzerBRezept, 'Fourierbegrenzer B Rezept').
text(de, fragmentSuperAufladerBRezept, 'Fragmentsuperauflader B Rezept').
text(de, nichtlineareOptikBRezept, 'Nichtlineareoptik B Rezept').
text(de, dysonPumpeBRezept, 'Dysonpumpe B Rezept').
text(de, indiumAntriebSRezept, 'Indiumantrieb S Rezept').
text(de, analyseVisierRezept, 'Analysevisierrezept').
text(de, scannerRezept, 'Scannerrezept').
text(de, terrainManipulatorRezept, 'Terrainmanipulatorrezept').
text(de, minenLaserRezept, 'Minenlaserrezept').
text(de, blitzWerferRezept, 'Blitzwerferrezept').
text(de, eigenesKraftFeldRezept, 'eigenes Kraftfeld Rezept').
text(de, fortgeschrittenerMinenLaserARezept, 'fortgeschrittener Minenlaser A Rezept').
text(de, wellenFormWiederVerwerterBRezept, 'Wellenformwiederverwerter B Rezept').
text(de, laufIonisatorCRezept, 'Laufionisator C Rezept').
text(de, plasmaWerferRezept, 'Plasmawerferrezept').
text(de, glutSpeerRezept, 'Glutspeerrezept').
text(de, streuBlasterRezept, 'Streublasterrezept').
text(de, impulsWerferRezept, 'Impulswerferrezept').
text(de, kampfVisierRezept, 'Kampfvisierrezept').
text(de, optischerBohrerSRezept, 'optischer Bohrer S Rezept').
text(de, untersuchungsGeraetARezept, 'Untersuchungsgerät A Rezept').
text(de, geologieKanoneRezept, 'Geologiekanonerezept').
text(de, masseBeschleunigerCRezept, 'Massebeschleuniger C Rezept').
text(de, geschossSchmiererCRezept, 'Geschoßschmierer C Rezept').
text(de, verstaerkteKartuschenCRezept, 'verstärkte Kartuschen C Rezept').
text(de, instabilitaetsAntriebARezept, 'Instabilitätsantrieb A Rezept').
text(de, unterLichtVerstaerkerSRezept, 'Unterlichtverstärker S Rezept').
text(de, notFallWarpEinheitARezept, 'Notfallwarpeinheit A Rezept').
text(de, solarStrahlRezept, 'Solarstrahlrezept').
text(de, gemuetsStrahlRezept, 'Gemütsstrahlrezept').
text(de, basisBergungsKapselRezept, 'Basisbergungskapselrezept').
text(de, kommunikationsStationRezept, 'Kommunikationsstationrezept').
text(de, autonomeBergBauEinheitRezept, 'autonome Bergbaueinheitrezept').
text(de, atmosphaerenVerarbeitungsAnlageRezept, 'Atmosphärenverarbeitungsanlagerezept').
text(de, nachrichtenModulRezept, 'Nachrichtenmodulrezept').
text(de, basisComputerRezept, 'Basiscomputerrezept').
text(de, konstruktionsForschungsStationRezept, 'Konstruktionsforschungsstationrezept').
text(de, tragbareRaffinerieRezept, 'tragbare Raffinerierezept').
text(de, speicherPunktRezept, 'Speicherpunktrezept').
text(de, verschlosseneKisteRezept, 'verschlossene Kisterezept').
text(de, konstruktionsTerminalRezept, 'Konstruktionsterminalrezept').
text(de, exoFahrzeugTerminalRezept, 'Exofahrzeugterminalrezept').
text(de, waffenTerminalRezept, 'Waffenterminalrezept').
text(de, wissenschaftsTerminalRezept, 'Wissenschaftsterminalrezept').
text(de, landwirtschaftsTerminalRezept, 'Landwirtschaftsterminalrezept').
text(de, flottenKommandoRaumRezept, 'Flottenkommandoraumrezept').
text(de, grosserFrachterRaumRezept, 'großer Frachterraumrezept').
text(de, frachterKorridorRezept, 'Frachterkorridorrezept').
text(de, gebogenerFrachterKorridorRezept, 'gebogener Frachterkorridorrezept').
text(de, frachterKreuzungDreiFachRezept, 'Frachterkreuzung dreifachrezept').
text(de, frachterTreppeRezept, 'Frachtertrepperezept').
text(de, frachterKreuzungVierFachRezept, 'Frachterkreuzung vierfachrezept').
text(de, zylindrischerRaumRezept, 'zylindrischer Raumrezept').
text(de, quadratischerRaumRezept, 'quadratischer Raumrezept').
text(de, geraderKorridorRezept, 'ggerader Korridorrezept').
text(de, tuerRezept, 'Türrezept').
text(de, fundamentRezept, 'Fundamentrezept').
text(de, lFoermigerKorridorRezept, 'L förmiger Korridorrezept').
text(de, korridorMitGlasDachRezept, 'Korridor mit Glasdachrezept').
text(de, holoTuerRezept, 'Holotürrezept').
text(de, zugangsRampeRezept, 'Zugangsramperezept').
text(de, pflasterungVierFachRezept, 'Pflasterung vierfach Rezept').
text(de, viererFundamentStrebeRezept, 'Viererfundamentstreberezept').
text(de, fundamentStrebeRezept, 'Fundamentstreberezept').
text(de, zylindrischerRaumRahmenRezept, 'zylindrischer Raumrahmenrezept').
text(de, tFoermigerKorridorRezept, 'T förmiger Korridorrezept').
text(de, xFoermigerKorridorRezept, 'X förmiger Korridorrezept').
text(de, korridorFensterRezept, 'Korridorfensterrezept').
text(de, bioKuppelRaumRezept, 'Biokuppelraumrezept').
text(de, gebogenerKorridorRezept, 'gebogener Korridorrezept').
text(de, leiterRezept, 'Leiterrezept').
text(de, pflasterungRezept, 'Pflasterungrezept').
text(de, pflasterungPodestRezept, 'Pflasterung Podest Rezept').
text(de, grossesGlasPaneelRezept, 'großes Glaspaneel Rezept').
text(de, aussichtsKugelRezept, 'Aussichtskugelrezept').
text(de, wuerfelFoermigerRaumRezept, 'würfelförmiger Raumrezept').
text(de, wuerfelRaumFundamentStrebeRezept, 'Würfelraumfundamentstreberezept').
text(de, gewoelbteWuerfelFoermigeWandRezept, 'gewölbte Wuerfelförmigewandrezept').
text(de, wuerfelFoermigerGlasRaumRezept, 'würfelförmiger Glasraumrezept').
text(de, wuerfelFoermigerRaumRahmenRezept, 'würfelförmiger Raumrahmenrezept').
text(de, wuerfelFoermigerRaumBodenRezept, 'würfelförmiger Raumbodenrezept').
text(de, wuerfelRaumViererFundamentStrebeRezept, 'Würfelraumviererfundamentstreberezept').
text(de, innenTreppenRezept, 'Innentreppenrezept').
text(de, wuerfelFoermigeInnenWandRezept, 'würfelförmige Innenwandrezept').
text(de, wuerfelFoermigerDachAufsatzRezept, 'würfelförmiger Dachaufsatzrezept').
text(de, gewoelbtesWuerfelFoermigesDachRezept, 'gewölbtes wuerfelförmiges Dachrezept').
text(de, wuerfelFoermigesFensterEckigRezept, 'würfelförmiges Fenster eckig Rezept').
text(de, wuerfelFoermigesFensterRundRezept, 'würfelförmiges Fenster rund Rezept').
text(de, infraStrukturLeiterRezept, 'Infrastrukturleiterrezept').
text(de, wuerfelFoermigeInnenTuerRezept, 'würfelförmige Innentürrezept').
text(de, basisTelePorterModulRezept, 'Basisteleportermodulrezept').
text(de, bioTreibStoffReaktorRezept, 'Biotreibstoffreaktorrezept').
text(de, elektrischeTarneinheitRezept, 'elektrische Tarneinheitrezept').
text(de, speicherSignalRezept, 'Speichersignalrezept').
text(de, gesundheitsStationRezept, 'Gesundheitsstationrezept').
text(de, signalBoosterRezept, 'Signalboosterrezept').
text(de, gefahrenSchutzEinheitRezept, 'Gefahrenschutzeinheitrezept').
text(de, naehrStoffProzessorRezept, 'Nährstoffprozessorrezept').
text(de, lagerBehaelter0Rezept, 'Lagerbehälter 0 Rezept').
text(de, lagerBehaelter1Rezept, 'Lagerbehälter 1 Rezept').
text(de, lagerBehaelter2Rezept, 'Lagerbehälter 2 Rezept').
text(de, lagerBehaelter3Rezept, 'Lagerbehälter 3 Rezept').
text(de, lagerBehaelter4Rezept, 'Lagerbehälter 4 Rezept').
text(de, lagerBehaelter5Rezept, 'Lagerbehälter 5 Rezept').
text(de, lagerBehaelter6Rezept, 'Lagerbehälter 6 Rezept').
text(de, lagerBehaelter7Rezept, 'Lagerbehälter 7 Rezept').
text(de, lagerBehaelter8Rezept, 'Lagerbehälter 8 Rezept').
text(de, lagerBehaelter9Rezept, 'Lagerbehälter 9 Rezept').
text(de, aussehenModifikatorRezept, 'Aussehenmodifikatorrezept').
text(de, landeFeldRezept, 'Landefeldrezept').
text(de, nutzTierEinheitRezept, 'Nutztiereinheitrezept').
text(de, automatischerFuettererRezept, 'automatischer Füttererrezept').
text(de, terminalDesGalaktischenMarktesRezept, 'Terminal desg alaktischen Marktesrezept').
text(de, kurzStreckenTelePorterRezept, 'Kurzstreckenteleporterrezept').
text(de, mittlereRaffinerieRezept, 'Mittlere Raffinerierezept').
text(de, grosseRaffinerieRezept, 'große Raffinerierezept').
text(de, antiMaterieReaktorRezept, 'Antimateriereaktorrezept').
text(de, roamerGeoBuchtRezept, 'Roamergeobuchtrezept').
text(de, nomadenGeoBuchtRezept, 'Nomadengeobuchtrezept').
text(de, exoFahrzeugRufStationRezept, 'Exofahrzeugrufstationrezept').
text(de, nautilonKammerRezept, 'Nautilonkammerrezept').
text(de, pilgerGeoBuchtRezept, 'Pilgergeobuchtrezept').
text(de, kolossGeoBuchtRezept, 'Kolossgeobuchtrezept').
text(de, minotaurusGeoBuchtRezept, 'Minotaurusgeobuchtrezept').
text(de, rennInitiatorRezept, 'Renninitiatorrezept').
text(de, rennHindernisRezept, 'Rennhindernisrezept').
text(de, rennKraftVerstaerkerRezept, 'Rennkraftverstärkerrezept').
text(de, tiefSeeKammerRezept, 'Tiefseekammerrezept').
text(de, meeresUnterSchlupfRezept, 'Meeresunterschlupfrezept').
text(de, glasTunnelRezept, 'Glastunnelrezept').
text(de, quadratischeTiefSeeKammerRezept, 'quadratische Tiefseekammerrezept').
text(de, wasserDichteTuerRezept, 'wasserdichte Türrezept').
text(de, lFoermigerGlasTunnelRezept, 'L förmiger Glastunnelrezept').
text(de, vertikalerGlasTunnelRezept, 'Vertikaler Glastunnelrezept').
text(de, mondTeichBodenRezept, 'Mondteichbodenrezept').
text(de, tFoermigerGlasTunnelRezept, 'T förmiger Glastunnel Rezept').
text(de, xFoermigerGlasTunnelRezept, 'X förmiger Glastunnel Rezept').
text(de, motivStilisiertesRRezept, 'Motiv stilisiertes R Rezept').
text(de, motivRundPipetteRezept, 'Motiv Rundpipette Rezept').
text(de, motivFaltungDuennDickRezept, 'Motiv Faltungdünndick Rezept').
text(de, motivZiegelSteineRezept, 'Motiv Ziegelsteine Rezept').
text(de, motivRadioAktivGrauRezept, 'Motiv Radioaktivgrau Rezept').
text(de, motivGrabSteinRezept, 'Motiv Grabstein Rezept').
text(de, motivHelloGamesRezept, 'Motiv Hello Games Rezept').
text(de, motivBuegelRezept, 'Motiv Bügel Rezept').
text(de, motivNo0Rezept, 'Motiv No 0 Rezept').
text(de, motivNo1Rezept, 'Motiv No 1 Rezept').
text(de, motivNo2Rezept, 'Motiv No 2 Rezept').
text(de, motivNo3Rezept, 'Motiv No 3 Rezept').
text(de, motivNo4Rezept, 'Motiv No 4 Rezept').
text(de, motivNo5Rezept, 'Motiv No 5 Rezept').
text(de, motivNo6Rezept, 'Motiv No 6 Rezept').
text(de, motivNo7Rezept, 'Motiv No 7 Rezept').
text(de, motivNo8Rezept, 'Motiv No 8 Rezept').
text(de, motivNo9Rezept, 'Motiv No 9 Rezept').
text(de, motivSchildErstochenerVogelRezept, 'Motiv Schild erstochener Vogel Rezept').
text(de, motivSchildGrünerMannRezept, 'Motiv Schild grüner Mann Rezept').
text(de, motivSchildKorvaxRezept, 'Motiv Schild Korvax Rezept').
text(de, motivFroschSackRezept, 'Motiv Froschsack Rezept').
text(de, motivLaemmchenRezept, 'Motiv Lämmchen Rezept').
text(de, wandBildSchirmRezept, 'Wandbildschirmrezept').
text(de, wandVentilatorRezept, 'Wandventilatorrezept').
text(de, gruenerWandBildSchirmRezept, 'grüner Wandbildschirmrezept').
text(de, schubLadenSchrankRezept, 'Schubladenschrankrezept').
text(de, wandEinheitRezept, 'Wandeinheitrezept').
text(de, lagerModulDekoRezept, 'Lagermoduldekorezept').
text(de, deckenPaneelRezept, 'Deckenpaneelrezept').
text(de, techBedienFeldRezept, 'Techbedienfeldrezept').
text(de, serverRezept, 'Serverrezept').
text(de, kanisterRegalRezept, 'Kanisterregalrezept').
text(de, kleineKisteRezept, 'kleine Kisterezept').
text(de, schliessFachRezept, 'Schließfachrezept').
text(de, flachesModulRezept, 'flaches Modulrezept').
text(de, seitenModulRezept, 'Seitenmodulrezept').
text(de, regalModulRezept, 'Regalmodulrezept').
text(de, roboterArmRezept, 'Roboterarmrezept').
text(de, waffenRegalRezept, 'Waffenregalrezept').
text(de, oszilloskopRezept, 'Oszilloskoprezept').
text(de, achtEckSchrankRezept, 'Achteckschrankrezept').
text(de, fassFoermigerFabrikatorRezept, 'faßförmiger Fabrikatorrezept').
text(de, hoherSchrankRezept, 'hoher Schrankrezept').
text(de, kistenFoermigerFabrikatorRezept, 'kistenförmiger Fabrikatorrezept').
text(de, schalenSitzStuhlRezept, 'Schalensitzstuhlrezept').
text(de, stuhlFriseurRezept, 'Friseurstuhlrezept').
text(de, stuhlEckigRezept, 'Stuhl eckig Rezept').
text(de, flagge1Rezept, 'Flagge 1 Rezept').
text(de, tischRezept, 'Tischrezept').
text(de, tischSechsEckigRezept, 'Tisch sechseckig Rezept').
text(de, bettRezept, 'Bettrezept').
text(de, sofaRezept, 'Sofarezept').
text(de, flagge2Rezept, 'Flagge 2 Rezept').
text(de, wandFlagge1Rezept, 'Wandflagge 1 Rezept').
text(de, einfacherSchreibTischRezept, 'einfacher Schreibtischrezept').
text(de, ergonomischesSofaRezept, 'ergonomisches Sofarezept').
text(de, eckSofaRezept, 'Ecksofarezept').
text(de, flagge3Rezept, 'Flagge 3 Rezept').
text(de, flagge4Rezept, 'Flagge 4 Rezept').
text(de, wandFlagge3Rezept, 'Wandflagge 3 Rezept').
text(de, wandFlagge2Rezept, 'Wandflagge 2 Rezept').
text(de, bodenMatteRezept, 'Bodenmatterezept').
text(de, grosseMonitorStationRezept, 'große Monitorstationrezept').
text(de, gewoelbterTischRezept, 'gewölbter Tischrezept').
text(de, monitorStationRezept, 'Monitorstationrezept').
text(de, arbeitsPlatteRezept, 'Arbeitsplatterezept').
text(de, leichterTischRezept, 'leichter Tischrezept').
text(de, lichtHandLampeRezept, 'Licht Handlampe Rezept').
text(de, weisseLeuchteRezept, 'weiße Leuchte Rezept').
text(de, lichtStehLampeEckigRezept, 'Licht Stehlampe eckig Rezept').
text(de, laborLampeRezept, 'Laborlampe Rezept').
text(de, blaueLeuchteRezept, 'blaue Leuchte Rezept').
text(de, pinkeLeuchteRezept, 'pinke Leuchte Rezept').
text(de, lichtStehLampeRundRezept, 'Licht Stehlampe rund Rezept').
text(de, lichtStehLampeSchirmRezept, 'Licht Stehlampe Schirm Rezept').
text(de, deckenLeuchteRezept, 'Deckenleuchterezept').
text(de, gelbeLeuchteRezept, 'gelbe Leuchte Rezept').
text(de, grueneLeuchteRezept, 'grüne Leuchte Rezept').
text(de, roteLeuchteRezept, 'rote Leuchte Rezept').
text(de, byteBeatSchaltungRezept, 'Bytebeatschaltungrezept').
text(de, mineralienExtraktorRezept, 'Mineralienextraktorrezept').
text(de, wandSchalterRezept, 'Wandschalterrezept').
text(de, solarModulRezept, 'Solarmodulrezept').
text(de, batterieRezept, 'Batterierezept').
text(de, gasExtraktorRezept, 'Gasextraktorrezept').
text(de, versorgungsDepotRezept, 'Versorgungsdepotrezept').
text(de, versorgungsRohrRezept, 'Versorgungsrohrrezept').
text(de, bodenSchalterRezept, 'Bodenschalterrezept').
text(de, annaeherungsSchalterRezept, 'Annäherungsschalterrezept').
text(de, schalterRezept, 'Schalterrezept').
text(de, energieUmkehrerRezept, 'Energieumkehrerrezept').
text(de, elektroMagnetischerGeneratorRezept, 'elektromagnetischer Generatorrezept').
text(de, hydroKulturTrogRezept, 'Hydrokulturtrogrezept').
text(de, topfPflanzeRezept, 'Topfpflanzerezept').
text(de, grosserHydroKulturTrogRezept, 'großer Hydrokulturtrogrezept').
text(de, pilzGeflechtRezept, 'Pilzgeflechtrezept').
text(de, frostWurzRezept, 'Frostwurzrezept').
text(de, gammaGrasRezept, 'Gammagrasrezept').
text(de, echinoKaktusRezept, 'Echinokaktusrezept').
text(de, sternenDornRezept, 'Sternendornrezept').
text(de, sonnenRebeRezept, 'Sonnenreberezept').
text(de, floraBehaelterHochBeetRezept, 'Florabehälter Hochbeet Rezept').
text(de, floraBehaelterKastenRezept, 'Florabehälter Kasten Rezept').
text(de, floraBehaelterTubusRezept, 'Florabehälter Tubus Rezept').
text(de, giftIgelRezept, 'Giftigelrezept').
text(de, gravitinoWirtRezept, 'Gravitinowirtrezept').
text(de, magenKrampfBlumeRezept, 'Magenkrampfblumerezept').
text(de, morditWurzelRezept, 'Morditwurzelrezept').
text(de, eiweissPerlenKugelRezept, 'Eiweißperlenkugelrezept').
text(de, nipNipRezept, 'Nipniprezept').
text(de, holzWandRezept, 'Holzwandrezept').
text(de, holzBodenPlatteRezept, 'Holzbodenplatterezept').
text(de, duenneHolzWandRezept, 'dünne Holzwandrezept').
text(de, holzTuerRahmenRezept, 'Holztürrahmenrezept').
text(de, holzDachRezept, 'Holzdachrezept').
text(de, glasPlatteMitHolzRahmenRezept, 'Glasplatte mit Holzrahmenrezept').
text(de, holzRampeRezept, 'Holzramperezept').
text(de, kleineHolzPlatteRezept, 'kleine Holzplatterezept').
text(de, schraegeHolzPlatteRezept, 'schräge Holzplatterezept').
text(de, kleineHolzWandRezept, 'kleine Holzwandrezept').
text(de, holzFensterRezept, 'Holzfensterrezept').
text(de, holzTuerRezept, 'Holztürrezept').
text(de, elektrischeHolzTuerRezept, 'elektrische Holztürrezept').
text(de, holzDachPlatteRezept, 'Holzdachplatterezept').
text(de, holzDachEckStueckRezept, 'Holzdacheckstückrezept').
text(de, holzBogenRezept, 'Holzbogenrezept').
text(de, halbeHolzRampeRezept, 'Halbeholzramperezept').
text(de, kurzeHolzWandRezept, 'kurze Holzwandrezept').
text(de, holzFassadeRezept, 'Holzfassaderezept').
text(de, kleineHolzTuerRezept, 'kleine Holztürrezept').
text(de, dachInnenEckteilAusHolzRezept, 'Dachinneneckteil aus Holzrezept').
text(de, halberHolzBogenRezept, 'halber Holzbogenrezept').
text(de, metallWandRezept, 'Metallwandrezept').
text(de, metallBodenPlatteRezept, 'Metallbodenplatterezept').
text(de, duenneMetallWandRezept, 'dünne Metallwandrezept').
text(de, metallTuerRahmenRezept, 'Metalltürrahmenrezept').
text(de, metallDachRezept, 'Metalldachrezept').
text(de, glasPlatteMitMetallRahmenRezept, 'Glasplatte mit Metallrahmenrezept').
text(de, metallRampeRezept, 'Metallramperezept').
text(de, kleineMetallPlatteRezept, 'kleine Metallplatterezept').
text(de, schraegeMetallPlatteRezept, 'schräge Metallplatterezept').
text(de, kleineMetallWandRezept, 'kleine Metallwandrezept').
text(de, metallFensterRezept, 'Metallfensterrezept').
text(de, metallTuerRezept, 'Metalltürrezept').
text(de, elektrischeMetallTuerRezept, 'wlektrische Metalltürrezept').
text(de, metallDachPlatteRezept, 'Metalldachplatterezept').
text(de, metallDachEckStueckRezept, 'Metalldacheckstückrezept').
text(de, metallBogenRezept, 'Metallbogenrezept').
text(de, halbeMetallRampeRezept, 'halbe Metallramperezept').
text(de, kurzeMetallWandRezept, 'kurze Metallwandrezept').
text(de, metallFassadeRezept, 'Metallfassaderezept').
text(de, kleineMetallTuerRezept, 'kleine Metalltürrezept').
text(de, dachInnenEckteilAusMetallRezept, 'Dachinneneckteil aus Metallrezept').
text(de, halberMetallBogenRezept, 'halber Metallbogenrezept').
text(de, betonWandRezept, 'Betonwandrezept').
text(de, betonBodenPlatteRezept, 'Betonbodenplatterezept').
text(de, duenneBetonWandRezept, 'dünne Betonwandrezept').
text(de, betonTuerRahmenRezept, 'Betontürrahmenrezept').
text(de, betonDachRezept, 'Betondachrezept').
text(de, glasPlatteMitBetonRahmenRezept, 'Glasplatte mit Betonrahmenrezept').
text(de, betonRampeRezept, 'Betonramperezept').
text(de, kleineBetonBodenPlatteRezept, 'kleine Betonbodenplatterezept').
text(de, schraegeBetonPlatteRezept, 'schräge Betonplatterezept').
text(de, kleineBetonWandRezept, 'kleine Betonwandrezept').
text(de, betonFensterRezept, 'Betonfensterrezept').
text(de, betonTuerRezept, 'Betontürrezept').
text(de, elektrischeBetonTuerRezept, 'elektrisc Bebetontürrezept').
text(de, betonDachPlatteRezept, 'Betondachplatterezept').
text(de, betonDachEckStueckRezept, 'Betondacheckstückrezept').
text(de, betonBogenRezept, 'Betonbogenrezept').
text(de, halbeBetonRampeRezept, 'halbe Betonramperezept').
text(de, kurzeBetonWandRezept, 'kurze Betonwandrezept').
text(de, betonFassadeRezept, 'Betonfassaderezept').
text(de, kleineBetonTuerRezept, 'kleine Betontürrezept').
text(de, dachInnenEckteilAusBetonRezept, 'Dachinneneckteil aus Betonrezept').
text(de, halberBetonBogenRezept, 'halber Betonbogenrezept').
text(de, grosserKeilRezept, 'großer Keilrezept').
text(de, kleinerKeilRezept, 'kleiner Keilrezept').
text(de, rohrRezept, 'Rohrrezept').
text(de, pyramideRezept, 'Pyramiderezept').
text(de, gebogenesRohrRezept, 'gebogenes Rohrrezept').
text(de, stabilerWuerfelRezept, 'stabiler Würfelrezept').
text(de, zylinderRezept, 'Zylinderrezept').
text(de, wuerfelRezept, 'Würfelrezept').
text(de, kugelRezept, 'Kugelrezept').
text(de, holzDreieckRezept, 'Holzdreieckrezept').
text(de, kleinesHolzDreieckRezept, 'kleines Holzdreieckrezept').
text(de, metallDreieckRezept, 'Metalldreieckrezept').
text(de, kleinesMetallDreieckRezept, 'kleines Metalldreieckrezept').
text(de, betonDreieckRezept, 'Betondreieckrezept').
text(de, kleinesBetonDreieckRezept, 'kleines Betondreieckrezept').
text(de, lichtBoxRezept, 'Lichtboxrezept').
text(de, leuchtBodenRezept, 'Leuchtbodenrezept').
text(de, geraeuschBoxRezept, 'Geräuschboxrezept').
text(de, kugelErzeugerRezept, 'Kugelerzeugerrezept').
text(de, lagerModulRezept, 'Lagermodulrezept').
text(de, automatischerSchalterRezept, 'automatischer Schalterrezept').
text(de, stehenderPflanzenBehaelterRezept, 'stehender Pflanzenbehälterrezept').
text(de, sauerStoffVerarbeiterRezept, 'Sauerstoffverarbeiterrezept').
text(de, tentakelSpitzeRezept, 'Tentakelspitzerezept').
text(de, wachsameWoelbungRezept, 'wachsame Wölbungrezept').
text(de, blasenBildenderPilzRezept, 'blasenbildender Pilzrezept').
text(de, uraltesNadelGehoelzRezept, 'uraltes Nadelgehölzrezept').
text(de, gefrorenerPflanzenBehaelterRezept, 'gefrorener Pflanzenbehälterrezept').
text(de, robusterStrauchRezept, 'robuster Strauchrezept').
text(de, mineralBogenRezept, 'Mineralbogenrezept').
text(de, edelSteinFelsRezept, 'Edelsteinfelsrezept').
text(de, meeresGesteinRezept, 'Meeresgesteinrezept').
text(de, terrariumRezept, 'Terrariumrezept').
text(de, segelPalmeRezept, 'Segelpalmerezept').
text(de, kugelBaumRezept, 'Kugelbaumrezept').
text(de, steinGartenRezept, 'Steingartenrezept').
text(de, taschenRealitaetsGeneratorRezept, 'Taschenrealitätsgeneratorrezept').
text(de, krauseKoralleRezept, 'krause Korallerezept').
text(de, wasserKristallRezept, 'Wasserkristallrezept').
text(de, kronLeuchterBlueteRezept, 'Kronleuchterblüterezept').
text(de, rankenFuesserRezept, 'Rankenfüßerrezept').
text(de, kleinesAquariumRezept, 'kleines Aquariumrezept').
text(de, bronzeneAtlasStatueRezept, 'bronzene Atlasstatuerezept').
text(de, silberneAtlasStatueRezept, 'silberne Atlasstatuerezept').
text(de, goldeneAtlasStatueRezept, 'goldene Atlasstatuerezept').
text(de, fleischFressenderStrauchRezept, 'fleischfressender Strauchrezept').
text(de, zwergPalmeRezept, 'Zwergpalmerezept').
text(de, kurioserMaisRezept, 'kurioser Maisrezept').
text(de, bronzeneJaegerStatueRezept, 'bronzene Jägerstatuerezept').
text(de, silberneJaegerStatueRezept, 'silberne Jägerstatuerezept').
text(de, goldeneJaegerStatueRezept, 'goldene Jägerstatuerezept').
text(de, expansionsWuerfelGeraetRezept, 'Expansionswürfelgerätrezept').
text(de, roboterBegleiterRezept, 'Roboterbegleiterrezept').
text(de, kugelHologrammGeraetRezept, 'Kugelhologrammgerätrezept').
text(de, artemisMotivRezept, 'Artemismotivrezept').
text(de, nullMotivRezept, 'Nullmotivrezept').
text(de, fruechteBaumRezept, 'Früchtebaumrezept').
text(de, spindelBaumRezept, 'Spindelbaumrezept').
text(de, immerGruenBaumRezept, 'Immergrünbaumrezept').
text(de, apolloMotivRezept, 'Apollomotivrezept').
text(de, bronzeneDiploStatueRezept, 'bronzene Diplostatuerezept').
text(de, silberneDiploStatueRezept, 'silberne Diplostatuerezept').
text(de, goldeneDiploStatueRezept, 'goldene Diplostatuerezept').
text(de, nadaMotivRezept, 'Nadamotivrezept').
text(de, poloMotivRezept, 'Polomotivrezept').
text(de, bronzeneKampfLaeuferStatueRezept, 'bronzene Kampfläuferstatuerezept').
text(de, silberneKampfLaeuferStatueRezept, 'silberne Kampfläuferstatuerezept').
text(de, goldeneKampfLaeuferStatueRezept, 'goldene Kampfläuferstatuerezept').
text(de, bronzeneGekStatueRezept, 'bronzene Gekstatuerezept').
text(de, silberneGekStatueRezept, 'silberne Gekstatuerezept').
text(de, goldeneGekStatueRezept, 'goldene Gekstatuerezept').
text(de, anomalieMotivRezept, 'Anomaliemotivrezept').
text(de, galaktischerHubMotivRezept, 'galaktischer Hub Motivrezept').
text(de, umschlingenderBaumRezept, 'umschlingender Baumrezept').
text(de, regenSchirmBaumRezept, 'Regenschirmbaumrezept').
text(de, windenderStrauchRezept, 'windender Strauchrezept').
text(de, nadaFigurRezept, 'Nadafigurrezept').
text(de, poloFigurRezept, 'Polofigurrezept').
text(de, zustimmendeHandbewegungMotivRezept, 'zustimmende Handbewegungmotivrezept').
text(de, bronzeneKreaturStatueRezept, 'bronzene Kreaturstatuerezept').
text(de, silberneKreaturStatueRezept, 'silberne Kreaturstatuerezept').
text(de, goldeneKreaturStatueRezept, 'goldene Kreaturstatuerezept').
text(de, bronzeneAstronautenStatueRezept, 'bronzene Astronautenstatuerezept').
text(de, silberneAstronautenStatueRezept, 'silberne Astronautenstatuerezept').
text(de, goldeneAstronautenStatueRezept, 'goldene Astronautenstatuerezept').
text(de, chromatischesMetall, 'chromatisches Metall').
text(de, faecium, 'Faecium').
text(de, frostKristall, 'Frostkristall').
text(de, gammaWurzel, 'Gammawurzel').
text(de, hypnotischesAuge, 'Hypnotischesauge').
text(de, kaktusFleisch, 'Kaktusfleisch').
text(de, kelpBeutel, 'Kelpbeutel').
text(de, kohlenStoff, 'Kohlenstoff').
text(de, kuerbisKnolle, 'Kürbisknolle').
text(de, mordit, 'Mordit').
text(de, pilzSchimmel, 'Pilzschimmel').
text(de, salz, 'Salz').
text(de, solanium, 'Solanium').
text(de, sternenKnolle, 'Sternenknolle').
text(de, verdichteterKohlenStoff, 'verdichteter Kohlenstoff').
text(de, kohlenStoffNanoRohr, 'Kohlenstoffnanorohr').
text(de, kreaturenKugeln, 'Kreaturenkugeln').
text(de, abgruendigerEintopf, 'abgründiger Eintopf').
text(de, alarmierendeTorte, 'alarmierende Torte').
text(de, aloeFleisch, 'Aloefleisch').
text(de, anormaleMarmelade, 'anormale Marmelade').
text(de, anormaleTorte, 'anormale Torte').
text(de, anormalerDonut, 'anormaler Donut').
text(de, apfelEisCreme, 'Apfeleiscreme').
text(de, apfelKuchenVerlorenerSeelen, 'Apfelkuchen verlorener Seelen').
text(de, apfelKuriositaet, 'Apfelkuriosität').
text(de, balastStoffReichePastete, 'balaststoffreiche Pastete').
text(de, beinFleisch, 'Beinfleisch').
text(de, beineImTeigMantel, 'Beine im Teigmantel').
text(de, bitterSuesserKakao, 'bittersüßer Kakao').
text(de, blutigesOrgan, 'bblutiges Organ').
text(de, brandKuchenDesGrauens, 'Brandkuchen des Grauens').
text(de, bratOel, 'Bratöl').
text(de, brot, 'Brot').
text(de, brueterTorte, 'Brütertorte').
text(de, cremigeSosse, 'cremige Soße').
text(de, delikatessBaiser, 'Delikatessbaiser').
text(de, derMerkWuerdigsteKuchen, 'Der merkwürdigste Kuchen').
text(de, derStellarator, 'Der Stellarator').
text(de, dickerFleischEintopf, 'dicker Fleischeintopf').
text(de, dickerSuesserTeig, 'dicker süßer Teig').
text(de, diploStuecke, 'Diplostücke').
text(de, duftendeKraeuter, 'duftende Kräuter').
text(de, eisCreme, 'Eiscreme').
text(de, eisSchreie, 'Eisschreie').
text(de, engelsObstKuchen, 'Engelsobstkuchen').
text(de, entfesselteMonstrositaet, 'entfesselte Monstrosität').
text(de, entfesseltesSahneHorn, 'entfesseltes Sahnehorn').
text(de, entsetzlicherMarmeladenSchwamm, 'entsetzlicher Marmeladenschwamm').
text(de, enzymFluessigkeit, 'Enzymflüssigkeit').
text(de, erfrischungsGetraenk, 'Erfrischungsgetränk').
text(de, ewigSiedenderKuchen, 'ewig siedender Kuchen').
text(de, ewigeEisCreme, 'ewige Eiscreme').
text(de, ewigerHonigKuchen, 'ewiger Honigkuchen').
text(de, ewigerKuchen, 'ewiger Kuchen').
text(de, ewigesMarmeladenBiskuit, 'ewiges Marmeladenbiskuit').
text(de, extraFluffigerTeig, 'extra fluffiger Teig').
text(de, fasrigerEintopf, 'fasriger Eintopf').
text(de, fellKnaeuelGelee, 'Fellknäuelgelee').
text(de, fellTorteInAspik, 'Felltorte in Aspik').
text(de, fermentierteFruechte, 'fermentierte Früchte').
text(de, festerFettKuchen, 'fester Fettkuchen').
text(de, feuerBeere, 'Feuerbeere').
text(de, feuerWasser, 'Feuerwasser').
text(de, feurigeMarmeladenUeberraschung, 'feurige Marmeladenüberraschung').
text(de, feurigesMarmeladenBiskuit, 'feuriges Marmeladenbiskuit').
text(de, fischPastete, 'Fischpastete').
text(de, fleischFlocken, 'Fleischflocken').
text(de, fleischMitGewurzKruste, 'Fleisch mit Gewurzkruste').
text(de, fleischigeFluegel, 'fleischige Glügel').
text(de, fleischigeStuecke, 'fleischige Stücke').
text(de, fleischigeWurzeln, 'fleischige Wurzeln').
text(de, fluechtigeSchokoTorte, 'flüchtige Schokotorte').
text(de, fluesterndesOmelett, 'flüsterndes Omelett').
text(de, fluffigeKaramellFreude, 'fluffige Karamellfreude').
text(de, fluffigerRachenSpalter, 'fluffiger Rachenspalter').
text(de, fragwuerdigerSuesserKuchen, 'rragwürdiger süßer Kuchen').
text(de, frischeMilch, 'frische Milch').
text(de, fruchtEisCreme, 'Fruchteiscreme').
text(de, fruchtigerPudding, 'fruchtiger Pudding').
text(de, funkelnderHonigKuchen, 'funkelnder Honigkuchen').
text(de, gebackeneEier, 'gebackene Eier').
text(de, gebaeck, 'Gebäck').
text(de, geduenstetesGemuese, 'gedünstetes Gemüse').
text(de, gefroreneKnollen, 'gefrorene Knollen').
text(de, gefuellteOrgane, 'gefüllte Organe').
text(de, geheimnisVolleFleischPastete, 'Geheimnisvolle Fleischpastete').
text(de, geheimnisVollerFleischEintopf, 'geheimnisvoller Fleischeintopf').
text(de, gemueseCremeSuppe, 'Gemüsecremesuppe').
text(de, gequaelterHonigKuchen, 'gequälter Honigkuchen').
text(de, geraeucherteFleischPastete, 'geräucherte Fleischpastete').
text(de, geraeuchertesFleisch, 'geräuchertes Fleisch').
text(de, geschlageneButter, 'geschlagene Butter').
text(de, geschmorteOrgane, 'geschmorte Organe').
text(de, gestampfteWurzelPastete, 'festampfte Wurzelpastete').
text(de, gesuessteButter, 'gesüßte Butter').
text(de, gesuessteProtoButter, 'gesüßte Protobutter').
text(de, gesuessterKompost, 'gesüßter Kompost').
text(de, gewuerzterApfelKuchen, 'gewürzter Apfelkuchen').
text(de, glasKoerner, 'Glaskörner').
text(de, glasKuchen, 'Glaskuchen').
text(de, grahBeere, 'Grahbeere').
text(de, grahmeLade, 'Grahmelade').
text(de, grosseEier, 'große Eier').
text(de, hackFleisch, 'Hackfleisch').
text(de, halbFluessigerKaese, 'halbflüssiger Käse').
text(de, heimgesuchtePastete, 'heimgesuchte Pastete').
text(de, heimgesuchteSchokoTraeume, 'heimgesuchte Schokoträume').
text(de, heisseSosse, 'heiße Soße').
text(de, heptaploidWeizen, 'Heptaploidweizen').
text(de, heulenderKaramellKuchen, 'heulender Karamellkuchen').
text(de, heulenderTeig, 'heulender Teig').
text(de, hexaBeere, 'Hexabeere').
text(de, holzApfel, 'Holzapfel').
text(de, honigButter, 'Honigbutter').
text(de, honigButterDonut, 'Honigbutterdonut').
text(de, honigDonut, 'Honigdonut').
text(de, honigEisCreme, 'Honigeiscreme').
text(de, honigEngelKuchen, 'Honigengelkuchen').
text(de, honigKuchenMitSalz, 'Honigkuchen mit Salz').
text(de, honigTorte, 'Honigtorte').
text(de, immerBrennendeMarmelade, 'immerbrennende Marmelade').
text(de, impulsBohnen, 'Impulsbohnen').
text(de, innereienBeutel, 'Innereienbeutel').
text(de, interStellareKuriositaet, 'interstellare Kuriosität').
text(de, interStellareTorte, 'interstellare Torte').
text(de, jadeErbsen, 'Jadeerbsen').
text(de, kaeseFleischEintopf, 'Käsefleischeintopf').
text(de, kaeseGemuesePastete, 'Käsegemuesepastete').
text(de, kaeseTorte, 'Käsetorte').
text(de, kakaoDonut, 'Kakaodonut').
text(de, kakaoTorte, 'Kakaotorte').
text(de, kaktusGelee, 'Kaktusgelee').
text(de, kaktusNektar, 'Kaktusnektar').
text(de, karamellDonut, 'Karamelldonut').
text(de, karamellEisCreme, 'Karamelleiscreme').
text(de, karamellKuriositaet, 'Karamellkuriosität').
text(de, karamellTorte, 'Karamelltorte').
text(de, karamellisierterAlbTraum, 'karamellisierter Albtraum').
text(de, katzenLeber, 'Katzenleber').
text(de, kelpReis, 'Kelpreis').
text(de, klebrigeButter, 'klebrige Butter').
text(de, klebrigeFruchtUeberraschung, 'klebrige Fruchtüberraschung').
text(de, klebrigeProtoButter, 'klebrige Protobutter').
text(de, klebrigePuddingTorte, 'klebrige Puddingtorte').
text(de, klebrigerBrueller, 'klebriger Brüller').
text(de, klebrigerHonig, 'klebriger Honig').
text(de, klebrigerKaramellKuchen, 'klebriger Karamellkuchen').
text(de, klebrigerProtoDonut, 'klebriger Protodonut').
text(de, klebrigerPudding, 'klebriger Pudding').
text(de, klebrigerSchokoladenKuchen, 'klebriger Schokoladenkuchen').
text(de, klebrigesHonigKuechlein, 'klebriges Honigküchlein').
text(de, klebrigesMundFeuer, 'klebriges Mundfeuer').
text(de, klobigerDonut, 'klobiger Donut').
text(de, knusperKaramell, 'Knusperkaramell').
text(de, koestlicherGemueseEintopf, 'köstlicher Gemueseeintopf').
text(de, kreaturenEi, 'Kreaturenei').
text(de, kriechendesJuckHonigBiskuit, 'kriechendes Juckhonigbiskuit').
text(de, kuchenDerSuende, 'Kuchen der Sünde').
text(de, kuchenDerVerlorenen, 'Kuchen der Verlorenen').
text(de, kuchenMitKaramellKruste, 'Kuchen mit Karamellkruste').
text(de, kuchenTeig, 'Kuchenteig').
text(de, kuenstlicheWuermer, 'künstliche Würmer').
text(de, kuerbisFleisch, 'Kürbisfleisch').
text(de, larvenKern, 'Larvenkern').
text(de, leopardenFrucht, 'Leopardenfrucht').
text(de, leuchtPastete, 'Leuchtpastete').
text(de, marmeladenBiskuit, 'Marmeladenbiskuit').
text(de, marmeladenDonut, 'Marmeladendonut').
text(de, marmeladenKuriositaet, 'Marmeladenkuriosität').
text(de, marmeladenSchleimer, 'Marmeladenschleimer').
text(de, marmeladenTorte, 'Marmeladentorte').
text(de, monstroeserDonut, 'Monströserdonut').
text(de, monstroeserHonigKuchen, 'monströser Honigkuchen').
text(de, monstroeserPudding, 'monströser Pudding').
text(de, omelett, 'Omelett').
text(de, parasitenOmelett, 'Parasitenomelett').
text(de, pheromonBeutel, 'Pheromonbeutel').
text(de, pikanteFleischBaellchen, 'pikante Fleischbällchen').
text(de, pilgerBeere, 'Pilgerbeere').
text(de, pilgerElixier, 'Pilgerelixier').
text(de, pilzTorte, 'Pilztorte').
text(de, proteinReicherDonut, 'proteinreicher Donut').
text(de, protoButter, 'Protobutter').
text(de, protoButterMitHonig, 'Protobutter mit Honig').
text(de, protoKaese, 'Protokäse').
text(de, protoKrapfen, 'Protokrapfen').
text(de, protoKuchenMitHonig, 'Protokuchen mit Honig').
text(de, protoOel, 'Protoöl').
text(de, protoOmelett, 'Protoomelett').
text(de, protoSahne, 'Protosahne').
text(de, protoTeig, 'Prototeig').
text(de, protoWurst, 'Protowurst').
text(de, protoWurstPastete, 'Protowurstpastete').
text(de, puddingDonut, 'Puddingdonut').
text(de, puddingKuriositaet, 'Puddingkuriosität').
text(de, puddingTorte, 'Puddingtorte').
text(de, rachenKleberMitHonig, 'Rachenklebermithonig').
text(de, rahmOrganSuppe, 'Rahmorgansuppe').
text(de, regisFett, 'Regisfett').
text(de, riesenEi, 'Riesenei').
text(de, rohesSteak, 'rohes Steak').
text(de, sahne, 'Sahne').
text(de, sahneBroetchen, 'Sahnebrötchen').
text(de, sahneHaeppchen, 'Sahnehäppchen').
text(de, sahneKuchenDesUntergangs, 'Sahnekuchen des Untergangs').
text(de, sahneKuriositaet, 'Sahnekuriosität').
text(de, salzigeFischFilets, 'salzige Fischfilets').
text(de, salzigeKoestlichkeit, 'salzige Köstlichkeit').
text(de, salzigeUeberraschung, 'salzige Überraschung').
text(de, salzigerDonut, 'salziger Donut').
text(de, salzigerPudding, 'salziger Pudding').
text(de, salzigerRauReif, 'salziger Raureif').
text(de, sanfteStachelUeberraschung, 'sanfte Stachelüberraschung').
text(de, scharferGemueseEintopf, 'scharfer Gemüseeintopf').
text(de, schlaengelndeMarmelade, 'schlängelnde Marmelade').
text(de, schlaengelndeTorte, 'schlängelnde Torte').
text(de, schlaengelnderDonut, 'schlängelnder Donut').
text(de, schokoTraum, 'Schokotraum').
text(de, schokoladenEisCreme, 'Schokoladeneiscreme').
text(de, schokoladenKuchen, 'Schokoladenkuchen').
text(de, schokoladenKuriositaet, 'Schokoladenkuriosität').
text(de, schrecklicheklebrigeKoestlichkeit, 'schreckliche klebrige Köstlichkeit').
text(de, schrecklicherBrei, 'schrecklicher Brei').
text(de, schreiterWurst, 'Schreiterwurst').
text(de, schuppigesFleisch, 'schuppiges Fleisch').
text(de, sievertBohnen, 'Sievertbohnen').
text(de, silikonEi, 'Silikonei').
text(de, softePuddingTorte, 'softe Puddingtorte').
text(de, solartillo, 'Solartillo').
text(de, speiseRoehrenUeberraschung, 'Speiseröhrenueberraschung').
text(de, stacheligeKuriositaet, 'stachelige Kuriosität').
text(de, stacheligeTorte, 'stachelige Torte').
text(de, sternenEisCreme, 'Sterneneiscreme').
text(de, sternenGeburtKoestlichkeit, 'Sternengeburtköstlichkeit').
text(de, sternenPudding, 'Sternenpudding').
text(de, sternenPuddingTorte, 'Sternenpuddingtorte').
text(de, suessWurzel, 'Süßwurzel').
text(de, suesseSahneTraeume, 'Süßesahneträume').
text(de, superLeichterSahneKuchen, 'superleichter Sahnekuchen').
text(de, synthetischerHonig, 'synthetischer Honig').
text(de, teig, 'Teig').
text(de, toedlichKalteEisCreme, 'tödlich kalte Eiscreme').
text(de, tortenBoden, 'Tortenboden').
text(de, traditionsKuchen, 'Traditionskuchen').
text(de, ueppigeHonigTorte, 'üppige Honigtorte').
text(de, ungiftigerPilz, 'ungiftiger Pilz').
text(de, unholdRogen, 'Unholdrogen').
text(de, unloesbarerMarmeladenSturz, 'unlösbarer Marmeladensturz').
text(de, verarbeiteterZucker, 'verarbeiteter Zucker').
text(de, verarbeitetesFleisch, 'verarbeitetes Fleisch').
text(de, verfeinertesMehl, 'verfeinertes Mehl').
text(de, vyEisCreme, 'Vyeiscreme').
text(de, warmeProtoMilch, 'warme Protomilch').
text(de, wildeHefe, 'wilde Hefe').
text(de, wildeMilch, 'wilde Milch').
text(de, windenderAufgewuehlterTeig, 'windender aufgewühlter Teig').
text(de, windendesMarmeladenKuechlein, 'windendes Marmeladenküchlein').
text(de, wohlSchmeckendeSosse, 'wohlschmeckende Soße').
text(de, wuergendesKuchenMonster, 'würgendes Kuchenmonster').
text(de, wuerzigeOrganUeberraschung, 'würzige Organüberraschung').
text(de, wuerzigerGemueseEintopf, 'würziger Gemüseeintopf').
text(de, wuerzigerKaese, 'würziger Käse').
text(de, wuerzigesEis, 'würziges Eis').
text(de, wurzelSaft, 'Wurzelsaft').
text(de, zaeheOrganPaste, 'zähe Organpaste').

/* Orte */
text(de, ortHauptBasis, 'Hauptbasis').
text(de, ortWald, 'Wald').
text(de, ortBasisTerminus, 'Basisterminus').
text(de, ortWeltRaum, 'Weltraum').
text(de, ortAnomalie, 'Anomalie').
text(de, ortRaumStation, 'Raumstation').
text(de, ortWasser, 'Wasser').
text(de, ortAussenPosten, 'Aussenposten').
text(de, ortHandelsStation, 'Handelsstation').
text(de, ortNahrungsProzessor, 'Nahrungsprozessor').
text(de, ortKleineRaffinerie, 'kleine Raffinerie').
text(de, ortMittlereRaffinerie, 'mittlere Raffinerie').
text(de, ortGrosseRaffinerie, 'grosse Raffinerie').
text(de, ortHandelsTerminal, 'Handelsterminal').
text(de, ortForschungsTerminal, 'Forschungsterminal').
text(de, ortFrachter, 'Frachter').
text(de, ortSpieler, 'Aufenthaltsort Spieler').
text(de, ortBasis, 'Basis').
text(de, ortSauerStoffVerarbeiter, 'Sauerstoffverarbeiter').
text(de, ortAtmosphaerenAnlage, 'Atmosphaerenanlage').
text(de, ortBergbauEinheit, 'Bergbaueinheit').
text(de, ortPlantage, 'Plantage').

/* Tests
	texte überzählig
	texte fehlend
		stoffklasse
		sammelart
		wandelaktion
		stoffe
		ort 
		
		ein-eindeutige bezeichner und texte = keine doppelten Bezeichner, keine doppelten Texte
 */