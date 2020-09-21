:- module(textResources, [getText/2]).

getText(Atom, Text) :-
	spielStatus:sprache(Sprache), 
	text(Sprache, Atom, Text),
	!.

getText(_, Text) :-
	Text = 'default'.

getText(Atom, _) :-
	Atom = default.

stringToSubstantiv(StoffString, Substantiv) :-
	sub_string(StoffString, 0, 1, RestLen, Capital),
	sub_string(StoffString, 1, RestLen, _, Rest),
	string_upper(Capital, BigCapital),
	string_lower(Rest, RestLowered),
	string_concat(BigCapital, RestLowered, Substantiv).

/* text(<Sprachkennzeichen>, <atom>, <Text>).*/
/* mehrere Module */
text(de, txtOk, 'OK').
text(de, txtReset, 'reset').
text(de, txtGespeichert, 'gespeichert!').
text(de, txtFunktionsAuswahl, 'Funktionsauswahl').
text(de, txtBitteWaehlen, 'Bitte wählen').
text(de, txtSystemDp, 'System: ').
text(de, txtPlanetDp, 'Planet: ').
text(de, txtSternensystem, 'Sternensystem').
text(de, txtSternenSystemEingeben, 'System auswählen').
text(de, txtGrossAnzahl, 'Anzahl').

/* Fixtexte ausgabe */
text(de, txtBitteReisenSieNachSystem, 'Bitte reisen Sie nach System: ').
text(de, txtLeerPlanet, ' Planet: ').
text(de, txtFuerenSie, 'Führen Sie ').
text(de, txtLeerMal, ' mal ').
text(de, txtLeerVon, ' von ').
text(de, txtLeerMit, ' mit ').
text(de, txtLeerAus, ' aus').
text(de, txtDas, 'Das ').
text(de, txtIn, 'In ').
text(de, txtLeerIstBekannt, ' ist bekannt.').
text(de, txtErlangenSie, 'Erlangen Sie ').
text(de, txtLeerEinheiten, ' Stück ').
text(de, txtLeerEinHundertstel, ' 1/100 sec ').
text(de, txtEinheiten, 'Stück').
text(de, txtUnits, 'Units').
text(de, txtEinHundertstel, '1/100 sec').
text(de, txtUnitsProStunde, 'Units/Stunde').
text(de, reisen, 'reisen').
text(de, angekommen, 'angekommen').

text(de, txtSammelnGesamtbedarf, 'Sammeln Gesamtbedarf').
text(de, txtGesamtwertSammlung, 'Gesamtwert Sammlung').
text(de, txtGesamterZeitAufwand, 'Gesamter Zeitaufwand').
text(de, txtKostenEingangsstoffe, 'Kosten Eingangsstoffe').
text(de, txtGesamtwertEndstoff, 'Gesamtwert Endstoff').
text(de, txtMehrwert, 'Mehrwert').
text(de, txtStundenlohn, 'Stundenlohn').

/* Fixtexte Hauptdialog */
text(de, txtLinkZurMaske, 'Link zur Maske').
text(de, txtErklaerung, 'Erklärung').
text(de, txtSpracheEinstellen, 'Sprache einstellen').
text(de, txtStelleSpracheEin, 'Stellen Sie die Sprache dieser Anwendung ein').
text(de, txtVorraussetzungenSammeln, 'Voraussetzungen des Sammelns eingeben').
text(de, txtWelcheMittelStoffeBekommen, 'Geben Sie ein mit welchen Mitteln Sie Stoffe bekommen können!').
text(de, txtBekannteRezepteEingeben, 'Bekannte Rezepte eingeben').
text(de, txtGibRezepteSpielstand, 'Geben Sie bekannte Rezepte ihres Spielstandes ein!').
text(de, txtSternenSystemeEingeben, 'Sternensysteme eingeben').
text(de, txtEntdeckteErfassen, 'Erfassen Sie alle entdeckten Sternensysteme ihres Spielstandes!').
text(de, txtHimmelsKoerperEingeben, 'Himmelskörper eingeben').
text(de, txtPlanetMondeEingeben, 'Geben Sie für ein Sternensystem Planeten und Monde ein!').
text(de, txtAusstattungEingeben, 'Geben Sie die planetare Ausstattung eines Himmelskörpers wie Basen, Raffinerieen ein!').
text(de, txtEigenschaftenHimmelsKoerperEingeben, 'Eigenschaften eines Himmelskörpers eingeben').
text(de, txtSammelDetailsEingeben, 'Sammeldetails eines Himmelskörpers eingeben').
text(de, txtSammelbareResourcenEingeben, 'Geben Sie die sammelbaren Resourcen eines Himmelskörpers ein!').
text(de, txtOptimiertesVorgehenErhalten, 'Optimiertes Vorgehen erhalten').
text(de, txtOptimierteVorgehensweiseErwerbBekommen, 'Bekommen Sie eine optimierte Vorgehensweise, für den Erwerb eines bestimmten Stoffes!').
text(de, txtLinksZeitweiseInaktiv, 'Links können zeitweise inaktiv sein, wenn notwendige Daten fehlen. Diese können Sie mit Hilfe der Masken, deren Link hier aktiv ist, eingegeben. Falls Sie die Daten inzwischen eingegeben haben, laden Sie diese Seite erneut (F5 bei Firefox)!').

/* Fixtexte SpielStatusDialog */
text(de, txtVorraussetzungenMaterialSammlung, 'Einrichtungen').
text(de, txtAusstattung, 'Ausstattung').
text(de, txtVerbesserterMinenLaser, 'verbesserter Minenlaser').
text(de, txtWaffe, 'Waffe').
text(de, txtBewegungsmöglichkeiten, 'Bewegungsmöglichkeiten').
text(de, txtRaumschiffEinsetzbar, 'Raumschiff einsetzbar').
text(de, txtMinenLaserAufExoFahrzeug, 'Minenlaser auf Exofahrzeug vorhanden').
text(de, txtUmgebung, 'Umgebung').
text(de, txtFrachterVorhanden, 'Frachter vorhanden').
text(de, txtAnomalieSphaereRufbar, 'Anomalie / Sphäre rufbar').

/* Fixtexte rezeptBekanntAnzeigen */
text(de, txtStoffKlassenAuswahl, 'Stoffklasse auswählen').
text(de, txtStoffKlasse, 'StoffKlasse: ').

/* Fixtexte rezeptBekanntStoffklassenAuswahl */
text(de, txtEingabeBekannteRezepte, 'Bekannte Rezepte').

/* Fixtexte systemNamenDialog */
text(de, txtEingabeSternenSysteme, 'Name und Farbe').
text(de, txtSystemName, 'System-Name').
text(de, txtFarbe, 'Farbe').
text(de, txtDieZeile, 'Die Zeile ').
text(de, txtInSpalte, ' in Spalte ').
text(de, txtIstUnvollstaendig, ' ist unvollständig').

/* Fixtexte planetAuswahlDialog */
text(de, txtAuswahlHimmelskoerper, 'Auswahl Himmelskörper').
text(de, txtBitteEineAuswahlTreffen, 'bitte eine Auswahl treffen!').

/* Fixtexte planetMondNameDialog */
text(de, txtSternenSystemNamenHimmelskoerperEingeben, 'Name und Typ').
text(de, txtName, 'Name').
text(de, txtPlanetenUndMonde, 'Planeten und Monde').
text(de, txtPlanetenTyp, 'Typ des Himmelskörpers').
text(de, txtPlanetenTypBeiScanAusWeltraumAngezeigt, 'Der Planetentyp wird beim Scan aus dem Weltraum angezeigt.').
text(de, txtAlternativStehtErAuchInDerEndtdeckungsListe, 'Alternativ steht er auch in der Entdeckungsliste. Im Fenster wenn man mit der Maus über den Planetennamen fährt.').

/* Fixtexte planetEigenschaftenDialog */
text(de, txtEigenschaftenHimmelsKoerper, 'Einrichtungen und Reisezeiten').
text(de, txtEinrichtungenUndIhreReisezeit, 'Einrichtungen und ihre Reisezeit von der Hauptbasis').
text(de, txtJeweilsDieEinrichtungMit, 'Jeweils die Einrichtung mit der kürzesten Reisezeit zur Hauptbasis angeben!').
text(de, txtDieEinrichtung, 'Die Einrichtung ').
text(de, txtVorhandenGekennzeichnet, ' ist als vorhanden gekennzeichnet, aber die Zeitangabe fehlt').

/* Fixtexte planetSammelEigenschaftenDialog */
text(de, txtSammelartEingebenHimmelskoerperAuswahl, 'Sammelart eingeben').
text(de, txtAuswahlSammelart, 'Auswahl Sammelart').
text(de, txtSammelartDp, 'Sammelart: ').
text(de, txtZeitmessungenBeginnenDirektVorDerSammelQuelleUndEndenSobaldDieQuelleErschoepftIst, 'Zeitmessungen beginnen direkt vor der Sammelquelle und enden, sobald die Quelle erschöpft ist.').
text(de, txtDannArtGewinnungUndZahlDamitGewonnenenStoffeEingeben, 'Dann die Zahl der damit gewonnenen Stoffe, die Zahl der genutzten Gebinde und die Zeit dafür eingeben!').
text(de, txtSekundaerelementeNurEingebenWennEinzigeMöglichkeitStoffGewinnen, 'Die Sekundärelemente nur eingeben, wenn das die einzige Möglichkeit auf dem Himmelskörper ist, den Stoff zu gewinnen!').
text(de, txtEsGenuegtAngabeSchnellsteMethode, 'Es genügt die Angabe der schnellsten Methode.').
text(de, txtNurStoffeGewonnenWerdenKoennenEingeben, 'Nur Stoffe, die gewonnen werden können, eingeben!').
text(de, txtSammelmoeglichkeitenHimmelskörperEingeben, 'Sammelbarer Stoff und Sammelzeit').
text(de, txtGrossDauerEinHundertstelSekunden, 'Dauer 1/100 sec').
text(de, txtGrossGebindeZahl, 'Gebindezahl').

/* Fixtexte stoffErlangenDialog */
text(de, txtPlanetAuswaehlen, 'Himmelskörper auswählen').
text(de, txtAuswahlEmpfohleneHandlungenStoffErhalten, 'Strategie und gewünschter Stoff').
text(de, txtOptimierung, 'Optimierung').
text(de, txtMoeglichstWenig, 'Möglichst wenig').
text(de, txtZeitverbrauch, 'Zeitverbrauch').
text(de, txtSammlungsgegenstaende, 'Sammlungsgegenstände').
text(de, txtKosten, 'Kosten').
text(de, txtGewuenschterStoff, 'gewünschter Stoff').
text(de, txtAnzahlDp, 'Anzahl: ').
text(de, txtRohstoffe, 'Rohstoffe').
text(de, txtProdukte, 'Produkte').
text(de, txtBasisBauteile, 'Basis-Bauteile').
text(de, txtModule, 'Module').
text(de, txtGerichte, 'Gerichte').
text(de, txtBitteGenauEineAuswahlTreffen, 'Bitte genau eine Auswahl treffen!').
text(de, txtBitteNurEineAuswahlTreffen, 'Bitte nur eine Auswahl treffen! Bei den nicht benötigten Eingaben muss "Bitte wählen" eingestellt sein!').
text(de, txtStoffErlangen, 'Stoff erlangen').
text(de, txtEingaben, 'Eingaben').
text(de, txtGesuchterStoff, 'Gesuchter Stoff').
text(de, txtSystem, 'System').
text(de, txtPlanet, 'Planet').
text(de, txtStueckliste, 'Stückliste').
text(de, txtStoff, 'Stoff').
text(de, txtAktionsreihenfolge, 'Aktionsreihenfolge').
text(de, txtAnweisung, 'Anweisung').
text(de, txtOperation, 'Operation').
text(de, txtErgebnis, 'Ergebnis').
text(de, txtSummenwerte, 'Summenwerte').
text(de, txtSummenwert, 'Summenwert').
text(de, txtEinheit, 'Einheit').
text(de, txtBeschaffenUndHerstellenNichtMoeglich, 'Beschaffen und herstellen nicht möglich.').
text(de, txtBegruendungDp, 'Begründung: ').
text(de, txtBeschaffungNichtMoeglichUndKeineRezepteVvorhanden, 'Beschaffung nicht möglich und keine Rezepte vorhanden').
text(de, txtLeerKannNichtBeschafftWerden, ' kann nicht beschafft werden').
text(de, txtRezeptversuch, 'Rezeptversuch').

/* Fixtexte sprachUmschaltung */
text(de, txtSprache, 'Sprache').
text(de, txtSpracheAuswaehlen, 'Sprache auswählen').
text(de, txtSpracheDp, 'Sprache: ').

/* --------------------------------------------------------------------------------------- */
/* Optimierung */
text(de, minimaleSammlung, 'Minimale Sammlungsstücke').
text(de, minimaleZeit, 'Minimale Zeit').
text(de, minimaleKosten, 'Minimale Kosten').

/* Planetentypen */
text(de, aetzender, 'Ätzender Planet'). 
text(de, arktischer, 'Arktischer Planet'). 
text(de, ausgetrockneter, 'Ausgetrockneter Planet'). 
text(de, bedeckter, 'Bedeckter Planet'). 
text(de, bluehender, 'Blühender Planet'). 
text(de, bruehender, 'Brühender Planet'). 
text(de, desLichts, 'Planet des Lichts'). 
text(de, chromatischerNebel, 'chromatischer Nebel'). 
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
text(de, handelsWare, 'Handelsware'). 


/* Sammelaktionen */
text(de, bekannt, 'bekannt').
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
text(de, bauen, 'bauen').
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
text(de, deuterium, 'deuterium').
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
text(de, hexit, 'hexite').

text(de, tritiumHyperCluster, 'Tritium Hypercluster').
text(de, geodeLand, 'Geode (Land)').
text(de, geodeHoehle, 'Geode (Höhle)').
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
text(de, salzRefaktor, 'Salzrefraktor').
text(de, sauerStoffFilter, 'Sauerstofffilter').
text(de, sauerStoffKapsel, 'Sauerstoffkapsel').
text(de, raumSchiffStartTreibStoff, 'Raumschiffstarttreibstoff').
text(de, vierfachServo, 'Vierfachservo').
text(de, angereicherterKohlenStoff, 'angereicherter Kohlenstoff').
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
text(de, novaeRegenerat, 'Novae Regenerat').
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
text(de, bewegungsModulA, 'Bewegungsmodul A').
text(de, bewegungsModulB, 'Bewegungsmodul B').
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
text(de, sauerStoffUmleiterA, 'Sauerstoffumleiter A').
text(de, sauerStoffWiederVerwerterC, 'Sauerstoffwiederverwerter C').
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
text(de, autonomeBergBauEinheit, 'autonome Bergbaueinheit').
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
text(de, tragbareRaffinerie, 'tragbare Raffinerie').
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
text(de, mittlereRaffinerie, 'Mittlere Raffinerie').
text(de, nutzTierEinheit, 'Nutztiereinheit').
text(de, terminalDesGalaktischenMarktes, 'Terminal des galaktischen Marktes').
text(de, kugelErzeuger, 'Kugelerzeuger').
text(de, sauerStoffVerarbeiter, 'Sauerstoffverarbeiter').
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
text(de, supraleitendeFaser, 'Supraleitende Faser').
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
text(de, novaeRegeneratRezept, 'Novaeregeneratrezept').
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
text(de, sauerStoffWiederVerwerterCRezept, 'Sauerstoffwiederverwerter C Rezept').
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
text(de, elektrischeMetallTuerRezept, 'ektrische Metalltürrezept').
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
text(de, erinnerungRezept, 'Erinnerungrezept').

text(de, chromatischesMetall, 'chromatisches Metall').
text(de, faecium, 'Faecium').
text(de, frostKristall, 'Frostkristall').
text(de, gammaWurzel, 'Gammawurzel').
text(de, hypnotischesAuge, 'Hypnotischesauge').
text(de, kaktusFleisch, 'Kaktusfleisch').
text(de, kelpBeutel, 'Kelpbeutel').
text(de, kohlenStoff, 'Kohlenstoff').
text(de, kuerbisKnolle, 'Kürbisknolle').
text(de, mordit, 'Mordite').
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
text(de, fleischigeFluegel, 'fleischige Flügel').
text(de, fleischigeStuecke, 'fleischige Stücke').
text(de, fleischigeWurzeln, 'fleischige Wurzeln').
text(de, fluechtigeSchokoTorte, 'flüchtige Schokotorte').
text(de, fluesterndesOmelett, 'flüsterndes Omelett').
text(de, fluffigeKaramellFreude, 'fluffige Karamellfreude').
text(de, fluffigerRachenSpalter, 'fluffiger Rachenspalter').
text(de, fragwuerdigerSuesserKuchen, 'fragwürdig süßer Kuchen').
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
text(de, gestampfteWurzelPastete, 'gestampfte Wurzelpastete').
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
text(de, monstroeserDonut, 'Monströser Donut').
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
text(de, erinnerung, 'Erinnerung').

/* Orte */
text(de, ortNil, 'Irgendwo').
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
text(de, ortSauerStoffVerarbeiter, 'Sauerstoffanlage').
text(de, ortAtmosphaerenAnlage, 'Atmosphaerenanlage').
text(de, ortBergbauEinheit, 'Bergbaueinheit').
text(de, ortPlantage, 'Plantage').

/* ===================================  Englisch ========================================== */
/* mehrere Module */
text(en, txtOk, 'OK').
text(en, txtReset, 'reset').
text(en, txtGespeichert, 'Saved!').
text(en, txtFunktionsAuswahl, 'Function choice').
text(en, txtBitteWaehlen, 'please choose').
text(en, txtSystemDp, 'System: ').
text(en, txtPlanetDp, 'Planet: ').
text(en, txtSternensystem, 'Star system').
text(en, txtSternenSystemEingeben, 'Choose system').
text(en, txtGrossAnzahl, 'Quantity').
text(en, txtRohstoffe, 'Raw material').

/* Fixtexte ausgabe */
text(en, txtBitteReisenSieNachSystem, 'Please travel to system: ').
text(en, txtLeerPlanet, ' Planet: ').
text(en, txtFuerenSie, 'Execute ').
text(en, txtLeerMal, ' times ').
text(en, txtLeerVon, ' of ').
text(en, txtLeerMit, ' with ').
text(en, txtLeerAus, '').
text(en, txtDas, 'The ').
text(en, txtIn, 'In ').
text(en, txtLeerIstBekannt, ' is known.').
text(en, txtErlangenSie, 'Achieve ').
text(en, txtLeerEinheiten, ' pieces ').
text(en, txtLeerEinHundertstel, ' 1/100 sec ').
text(en, txtEinheiten, 'pieces').
text(en, txtUnits, 'units').
text(en, txtEinHundertstel, '1/100 sec').
text(en, txtUnitsProStunde, 'units/hour').
text(en, reisen, 'travel').
text(en, angekommen, 'arrived').

text(en, txtSammelnGesamtbedarf, 'Collected items needed').
text(en, txtGesamtwertSammlung, 'Collection value total').
text(en, txtGesamterZeitAufwand, 'Time needed total').
text(en, txtKostenEingangsstoffe, 'Cost input materials total').
text(en, txtGesamtwertEndstoff, 'Value product').
text(en, txtMehrwert, 'Added value').
text(en, txtStundenlohn, 'Wage rate per hour').

/* Fixtexte Hauptdialog */
text(en, txtLinkZurMaske, 'Link to screen').
text(en, txtErklaerung, 'Explanation').
text(en, txtSpracheEinstellen, 'Adjust language').
text(en, txtStelleSpracheEin, 'Adjust the language of this application.').
text(en, txtVorraussetzungenSammeln, 'Enter prerequisites of collecting').
text(en, txtWelcheMittelStoffeBekommen, 'Enter with which means you can get materials.').
text(en, txtBekannteRezepteEingeben, 'Enter known formulas.').
text(en, txtGibRezepteSpielstand, 'Enter known formulas of your game save.').
text(en, txtSternenSystemeEingeben, 'Enter star systems').
text(en, txtEntdeckteErfassen, 'Record all discovered star systems of your game save.').
text(en, txtHimmelsKoerperEingeben, 'Enter orbs').
text(en, txtPlanetMondeEingeben, 'Enter planets and moons of one star system.').
text(en, txtAusstattungEingeben, 'Enter planetary facilities of a orb like basens, refinery.').
text(en, txtEigenschaftenHimmelsKoerperEingeben, 'Enter properties of a orb').
text(en, txtSammelDetailsEingeben, 'Enter collecting details of a orb').
text(en, txtSammelbareResourcenEingeben, 'Enter collectabele resources of a orb.').
text(en, txtOptimiertesVorgehenErhalten, 'Get optimized approach').
text(en, txtOptimierteVorgehensweiseErwerbBekommen, 'Get optimized approach for aquiring a certain material.').
text(en, txtLinksZeitweiseInaktiv, 'Links can be timely inactive, when necessary data are missing. These can be entered by means of the screens, whose link is active. If you have already entered this data, reload the screen (F5 with firefox)!').

/* Fixtexte SpielStatusDialog */
text(en, txtVorraussetzungenMaterialSammlung, 'Facilities').
text(en, txtAusstattung, 'Configuration').
text(en, txtVerbesserterMinenLaser, 'Enhanced Mining Laser').
text(en, txtTerrainformer, 'Terrain Former').
text(en, txtWaffe, 'Weapon').
text(en, txtBewegungsmöglichkeiten, 'Motional options').
text(en, txtRaumschiffEinsetzbar, 'Starship applicable').
text(en, txtMinenLaserAufExoFahrzeug, 'Mining laser mounted on exo vehicle').
text(en, txtUmgebung, 'Environment').
text(en, txtFrachterVorhanden, 'Freighter existing').
text(en, txtAnomalieSphaereRufbar, 'Anomaly / sphere callable').

/* Fixtexte rezeptBekanntAnzeigen */
text(en, txtStoffKlassenAuswahl, 'Coose Material class').
text(en, txtStoffKlasse, 'Material class: ').

/* Fixtexte rezeptBekanntStoffklassenAuswahl */
text(en, txtEingabeBekannteRezepte, 'Known formulas').

/* Fixtexte systemNamenDialog */
text(en, txtEingabeSternenSysteme, 'Name and color').
text(en, txtSystemName, 'System name').
text(en, txtFarbe, 'Color').
text(en, txtDieZeile, 'The row ').
text(en, txtInSpalte, ' in column ').
text(en, txtIstUnvollstaendig, ' is incomplete').

/* Fixtexte planetAuswahlDialog */
text(en, txtAuswahlHimmelskoerper, 'Choice of orb').
text(en, txtBitteEineAuswahlTreffen, 'Please taka a choice!').

/* Fixtexte planetMondNameDialog */
text(en, txtSternenSystemNamenHimmelskoerperEingeben, 'Name and type').
text(en, txtName, 'Name').
text(en, txtPlanetenUndMonde, 'Planets and moons').
text(en, txtPlanetenTyp, 'Type of orb').
text(en, txtPlanetenTypBeiScanAusWeltraumAngezeigt, 'The type of planet is shown while scanning it from space.').
text(en, txtAlternativStehtErAuchInDerEndtdeckungsListe, 'Alternativ it is shown also in the discovery list. In the window, if your mouse passes over the  planet name.').

/* Fixtexte planetEigenschaftenDialog */
text(en, txtEigenschaftenHimmelsKoerper, 'Facilities and travel times').
text(en, txtEinrichtungenUndIhreReisezeit, 'Facilities and their travel times from the main base').
text(en, txtJeweilsDieEinrichtungMit, 'Specify each facility with has the lowest travel time from the main base!').
text(en, txtDieEinrichtung, 'The facility ').
text(en, txtVorhandenGekennzeichnet, ' is marked as existing, but the travel time is missing').


/* Fixtexte planetSammelEigenschaftenDialog */
text(en, txtSammelartEingebenHimmelskoerperAuswahl, 'Choice of collecting mode').
text(en, txtAuswahlSammelart, 'Choice collecting mode').
text(en, txtSammelartDp, 'Mode: ').
text(en, txtZeitmessungenBeginnenDirektVorDerSammelQuelleUndEndenSobaldDieQuelleErschoepftIst, 'Time measure begins directly standig at the collecting source and ends as soon as the source has depleted.').
text(en, txtDannArtGewinnungUndZahlDamitGewonnenenStoffeEingeben, 'Afterwards enter the quantity of the aquired materials, the time for that and the number of bundles you have exploited!').
text(en, txtSekundaerelementeNurEingebenWennEinzigeMöglichkeitStoffGewinnen, 'Enter the secondary elements only, if this is the only method to aquire the material at the orb!').
text(en, txtEsGenuegtAngabeSchnellsteMethode, 'Indication of the fastest method is sufficient.').
text(en, txtNurStoffeGewonnenWerdenKoennenEingeben, 'Enter only materials, that can be aquired!').
text(en, txtSammelmoeglichkeitenHimmelskörperEingeben, 'Collectable material and collection time').
text(en, txtGrossDauerEinHundertstelSekunden, 'Duration 1/100 sec').
text(en, txtGrossGebindeZahl, 'Bundle count').

/* Fixtexte stoffErlangenDialog */
text(en, txtPlanetAuswaehlen, 'Choose orb').
text(en, txtAuswahlEmpfohleneHandlungenStoffErhalten, 'Strategy and desired material').
text(en, txtOptimierung, 'Improvement').
text(en, txtMoeglichstWenig, 'as possible ').
text(en, txtZeitverbrauch, 'little time consumption').
text(en, txtSammlungsgegenstaende, 'little clollect items').
text(en, txtKosten, 'little cost').
text(en, txtGewuenschterStoff, 'Desired material').
text(en, txtAnzahlDp, 'Quantity: ').
text(en, txtProdukte, 'Products').
text(en, txtBasisBauteile, 'Base parts').
text(en, txtModule, 'Modules').
text(en, txtGerichte, 'Dish').
text(en, txtBitteGenauEineAuswahlTreffen, 'please take only one choice!').
text(en, txtBitteNurEineAuswahlTreffen, 'please take only one choice! input fields not needed have to contain "please choose"!').
text(en, txtStoffErlangen, 'Achieve material').
text(en, txtEingaben, 'Inputs').
text(en, txtGesuchterStoff, 'Wanted material').
text(en, txtSystem, 'System').
text(en, txtPlanet, 'Planet').
text(en, txtStueckliste, 'Parts list').
text(en, txtStoff, 'Material').
text(en, txtAktionsreihenfolge, 'Order of actions').
text(en, txtAnweisung, 'Instruction').
text(en, txtOperation, 'Operation').
text(en, txtErgebnis, 'Result').
text(en, txtSummenwerte, 'Summed values').
text(en, txtSummenwert, 'Sum value').
text(en, txtEinheit, 'Unit').
text(en, txtBeschaffenUndHerstellenNichtMoeglich, 'Sourcing or production not possible.').
text(en, txtBegruendungDp, 'Reason: ').
text(en, txtBeschaffungNichtMoeglichUndKeineRezepteVvorhanden, 'sourcing not possible and no formulas available').
text(en, txtLeerKannNichtBeschafftWerden, ' cannot be sourced').
text(en, txtRezeptversuch, 'Formula trial').

/* Fixtexte sprachUmschaltung */
text(en, txtSpracheAuswaehlen, 'Choose language').
text(en, txtSprache, 'Language').
text(en, txtSpracheDp, 'Language: ').

/* --------------------------------------------------------------------------------------- */
/* Optimierung */
text(en, minimaleSammlung, 'Minimal collection items').
text(en, minimaleZeit, 'Minimal time').
text(en, minimaleKosten, 'Minimal cost').

/* Planetentypen */
text(en, aetzender, 'corrosively planet'). 
text(en, arktischer, 'arctic planet'). 
text(en, ausgetrockneter, 'dried out planet'). 
text(en, bedeckter, 'coated planet'). 
text(en, bluehender, 'flourishing planet'). 
text(en, bruehender, 'scalding planet'). 
text(en, desLichts, 'planet of light'). 
text(en, chromatischerNebel, 'chromatic fog'). 
text(en, durchbrochener, 'breached planet'). 
text(en, eingesponnener, 'cocooned planet'). 
text(en, einsamer, 'lonely planet'). 
text(en, eisiger, 'icy  planet'). 
text(en, eiskalter, 'ice-cold  planet'). 
text(en, faulender, 'putrescent planet'). 
text(en, felsiger, 'rocky planet'). 
text(en, feuchter, 'moisty planet'). 
text(en, feuriger, 'fiery planet'). 
text(en, fragmentierter, 'fragmented planet'). 
text(en, frostiger, 'frosty planet'). 
text(en, gammaintensiver, 'gamma-intense planet'). 
text(en, gebrochener, 'broken planet'). 
text(en, gefrorener, 'frozen planet'). 
text(en, gefrierender, 'freezing planet'). 
text(en, gemaessigter, 'moderate planet'). 
text(en, gerippter, 'ribbed planet'). 
text(en, giftiger, 'poisonous planet'). 
text(en, gruenender, 'greening planet'). 
text(en, gruenlicher, 'greenly planet'). 
text(en, heisser, 'hot planet'). 
text(en, himmelBlauerplanet, 'azure planet'). 
text(en, hyperboreisch, 'hyperboral planet'). 
text(en, isotopischer, 'isotopic planet'). 
text(en, katastrophalesTerraforming, 'catastrophic terraforming'). 
text(en, kontaminierter, 'contaminated planet'). 
text(en, konturierter, 'contoured planet'). 
text(en, leerer, 'empty planet'). 
text(en, mechanischer, 'mechanical planet'). 
text(en, messerscharfer, 'razor-sharp planet'). 
text(en, metallener, 'metallic planet'). 
text(en, metallueberzogener, 'metal coated planet'). 
text(en, metallurgischer, 'metallurgic planet'). 
text(en, mitGeringerAtmosphere, 'planet with little atmosphere'). 
text(en, mitHoherEnergie, 'planet with high energy'). 
text(en, mitHoherRadioQuelle, 'planet with high radio source'). 
text(en, nuklearer, 'nuclear planet'). 
text(en, paradiesischer, 'paradisiac planet'). 
text(en, pilz, 'mushroom planet'). 
text(en, rasselnder, 'rattling planet'). 
text(en, radioaktiver, 'radioactive planet'). 
text(en, regnerischer, 'rainy planet'). 
text(en, reichhaltiger, 'comprehensive planet').
text(en, saeuerlicher, 'sourish planet'). 
text(en, saeuliger, 'pillary planet'). 
text(en, schaedlicher, 'harmful planet'). 
text(en, schaeumender, 'foamy planet'). 
text(en, schalenuebersaeter, 'shell strewn planet'). 
text(en, scharfer, 'harsh planet'). 
text(en, schaumiger, 'foamily planet'). 
text(en, scherben, 'sharded planet'). 
text(en, schuppiger, 'flaky planet'). 
text(en, sechseckiger, 'hexagonal planet'). 
text(en, sengender, 'Sengender planet'). 
text(en, sengendHeisser, 'searing hot planet'). 
text(en, siedender, 'boiling planet'). 
text(en, skelettartiger, 'skeleton like planet'). 
text(en, sporiger, 'spory planet'). 
text(en, sprudelnder, 'fizzing planet'). 
text(en, stacheliger, 'prickly planet'). 
text(en, staubiger, 'dusty planet'). 
text(en, sternKorruptionEntdeckt, 'Star Corruption discovered'). 
text(en, stickiger, 'stifling planet'). 
text(en, stuetzen, 'pillar planet'). 
text(en, superkritischer, 'supercritical planet'). 
text(en, toedlicheGrueneAnomalie, 'deadly green anomaly'). 
text(en, toedlicheGrueneAnomalieMegaExot, 'deadly green anomalie exotic'). 
text(en, toter, 'dead planet'). 
text(en, trostloser, 'Trostloser planet'). 
text(en, trostloserTot, 'dismal dead planet').
text(en, tropischer, 'tropic planet'). 
text(en, ultramarin, 'ultramarine planet'). 
text(en, unbelebter, 'lifeless planet'). 
text(en, unbewohnbarer, 'uninhabitable planet'). 
text(en, unfruchtbarer, 'barren planet'). 
text(en, ungesunder, 'unhealthy planet').
text(en, unwirtlicher, 'inhospitable planet').
text(en, verbrannter, 'burnded planet'). 
text(en, verfallenerNuklearer, 'declined nuclear planet'). 
text(en, verdorbener, 'spoiled planet'). 
text(en, verlassener, 'left planet'). 
text(en, verlorenerBlauerplanet, 'lost blue planet'). 
text(en, verkabelter, 'wired planet'). 
text(en, verkalkter, 'calcified planet'). 
text(en, verknoecherter, 'ossified planet'). 
text(en, versteinerter, 'stoned planet'). 
text(en, verstrahlter, 'irradiated planet'). 
text(en, verwilderter, 'braided planet'). 
text(en, weissGluehender, 'white glowing planet'). 
text(en, windgepeitschter, 'windswept planet'). 
text(en, winterlicher, 'winterly planet'). 
text(en, wuesten, 'desert planet'). 
text(en, zerkluefteter, 'jagged planet'). 
text(en, zerschmetterter, 'smashed planet'). 
text(en, zugefrorener, 'freezed up planet'). 


/* SternFarbe */
text(en, gelb, 'yellow').
text(en, rot, 'red').
text(en, gruen, 'green').
text(en, blau, 'blue').


/* StoffKlassen */
text(en, rohStoff, 'raw material'). 
text(en, komponente, 'component'). 
text(en, produkt, 'product'). 
text(en, pass, 'passport'). 
text(en, verbrauch, 'consumption'). 
text(en, modul, 'module'). 
text(en, basisBauEndStoff, 'base part').
text(en, stoerung, 'disturbance').
text(en, geste, 'gesture').
text(en, kleidung, 'clothes').
text(en, handelsWare, 'merchandise').
text(en, kuriositaet, 'curiosity'). 
text(en, artefakt, 'artefakt'). 
text(en, bauRezept, 'formula'). 
text(en, rohUndKochStoff, 'raw material and cooking incredient'). 
text(en, produktUndKochStoff, 'product and cooking incredient'). 
text(en, kochStoff, 'cooking incredient'). 
text(en, kaufModul, 'buyable module'). 
text(en, anormaleMaterialien, 'abnormal materials'). 
text(en, gesammelteHandelsWare, 'collected merchandise'). 
text(en, relikt, 'relic'). 
text(en, konglomerat, 'conglomerate'). 


/* Sammelaktionen */
text(en, bekannt, 'known').
text(en, erkaempfen, 'eke out').
text(en, ernten, 'harvest').
text(en, ertauchen, 'dive').
text(en, exoFahrzeugMinenLaserNutzen, 'use exo vehicle mining lasern').
text(en, herausSchlagen, 'strike out').
text(en, jagen, 'hunt').
text(en, kaufen, 'buy').
text(en, minenLaserNutzen, 'use mining laser').
text(en, pfluecken, 'pick').
text(en, raumSchuerfen, 'space prospecting').
text(en, terrainFormerNutzen, 'use terrain manipulator').
text(en, unterWasserErkaempfen, 'eke out under water').
text(en, verbessertenMinenLaserNutzen, 'use enhanced mining laser').
text(en, vonTierErhalten, 'receive from animal').
text(en, solarStrahlNutzen, 'use soolar ray').
text(en, gemuetsStrahlNutzen, 'use mood ray').
text(en, verdienen, 'earn').
text(en, vonBergbauEinheitGewinnen, 'get from mining facility').

/* Wandelaktionen */
text(en, bauen, 'build').
text(en, herstellen, 'produce').
text(en, installieren, 'install').
text(en, kochen, 'cook').
text(en, raffinieren, 'refine').
text(en, ausSauerStoffVearbeiterGewinnen, 'get from oxygen processor').
text(en, ausAtmosphaerenAnlageGewinnen, 'get from stmospher processor').
text(en, rezeptInAussenPostenErwerben, 'buy formula in outpost').
text(en, rezeptAmForschungsComputerErwerben, 'aquire formula at research computer').
text(en, rezeptInAnomalieErwerben, 'aquire formula in anomaly').
text(en, rezeptInAnomalieForschungsComputerErwerben, 'aquire formula in research computer of anomaly').
text(en, rezeptInFabrikErwerben, 'aquire formula in factory').
text(en, rezeptInFrachterErwerben, 'aquire formula in freighter').
text(en, modulInRaumstationErwerben, 'aquire module in space station').
text(en, zerlegen, 'disassemble').
text(en, inEinfacherRaffinerieRaffinieren, 'refine in simple refinery').

/* Stoffe */
text(en, aktiviertesCadmium, 'Activated Cadmium').
text(en, aktiviertesEmeril, 'Activated Emeril').
text(en, aktiviertesIndium, 'Activated Indium').
text(en, aktiviertesKupfer, 'Activated Copper').
text(en, ammoniak, 'Ammonia').
text(en, cadmium, 'Cadmium').
text(en, chlor, 'Chlorine').
text(en, deuterium, 'Deuterium').
text(en, dioxit, 'Dioxite').
text(en, diWasserStoff, 'Di-Hydrogen').
text(en, emeril, 'Emeril').
text(en, ferritStaub, 'Ferrite Dust').
text(en, gold, 'Gold').
text(en, indium, 'Indium').
text(en, ionisiertesKobalt, 'Ionisised Cobalt').
text(en, kobalt, 'Cobalt').
text(en, kupfer, 'Copper').
text(en, lebenderSchleim, 'Living Slime').
text(en, magnetisiertesFerrit, 'Magnetised Ferrite').
text(en, natrium, 'Sodium').
text(en, natriumNitrat, 'Sodium Nitrate').
text(en, paraffinium, 'Paraffinium').
text(en, phosphor, 'Phosphorus').
text(en, platin, 'Platinum').
text(en, pugneum, 'Pugneum').
text(en, pyrit, 'Pyrite').
text(en, radon, 'Radon').
text(en, reinesFerrit, 'Pure Ferrite').
text(en, restSubstanz, 'Residual Goop').
text(en, sauerStoff, 'Oxygen').
text(en, schwefelin, 'Sulfurine').
text(en, silber, 'Silver').
text(en, silikatPulver, 'Silicate Powder').
text(en, stickStoff, 'Nitrogen').
text(en, tritium, 'Tritium').
text(en, unkontrollierbarerSchimmel, 'Runaway Mould').
text(en, uran, 'Uranium').
text(en, verrostetesMetall, 'Rusted Metal').
text(en, zaeheFluessigkeiten, 'Viscous Fluids').
text(en, zytoPhosphat, 'Cyto-Phosphate').
text(en, hexit, 'Hexit').

text(en, tritiumHyperCluster, 'Tritium Hypercluster').
text(en, geodeLand, 'Geode (Land)').
text(en, geodeHoehle, 'Geode (Cave)').
text(en, kampfLaeuferGehirn, 'Walker Brain').
text(en, lebendePerle, 'Living Pearl').
text(en, goldKlumpen, 'Gold Nugget').
text(en, sturmKristall, 'Storm Crystal').
text(en, kristallSulfid, 'Crystal Sulphide').
text(en, kristallFragment, 'Crystal Fragment').
text(en, beutelGift, 'Sac Venom').
text(en, eiweissPerle, 'Albumen Pearl').
text(en, gravitinoBall, 'Gravitino Ball').
text(en, nipNipKnospen, 'Nip Nip Buds').
text(en, fluessigSonne, 'Liquid Sun').
text(en, lebendesWasser, 'Living Water').
text(en, fragmentierteQualia, 'Fragmented Qualia').
text(en, nanitHaufen, 'Nanite Cluster').
text(en, fabrikUeberschreibungsEinheit, 'Factory Override Unit').
text(en, verteidigungsBeleg, 'System Authority Payment Substitute').
text(en, geborgenesFregattenModul, 'Secured Frigate Module').
text(en, lagerErweiterung, 'Storage Expansion').
text(en, frachtSchott, 'Freighter Compartment').
text(en, reparaturEinheit, 'Repair Unit').
text(en, anomalieDetektor, 'Anomaly Detector').
text(en, antiMaterie, 'Antimatter').
text(en, antiMaterieGehaeuse, 'Antimatter Housing').
text(en, diWasserStoffGelee, 'Di-Hydrogen Jelly').
text(en, hermetischesSiegel, 'Hermetic Seal').
text(en, ionenAkku, 'Ion Battery').
text(en, kobaltSpiegel, 'Cobalt Mirror').
text(en, lebensErhaltungsGel, 'Life Support Gel').
text(en, metallPlatten, 'Metal Plating').
text(en, mikroProzessor, 'Microprocessor').
text(en, natriumDiode, 'Sodium Diode').
text(en, salzRefaktor, 'Salt Refractor').
text(en, sauerStoffFilter, 'Oxygen Filter').
text(en, sauerStoffKapsel, 'Oxygen Capsule').
text(en, raumSchiffStartTreibStoff, 'Starship Launch Fuel').
text(en, vierfachServo, 'Quad Servo').
text(en, angereicherterKohlenStoff, 'Enriched Carbon').
text(en, aronium, 'Aronium').
text(en, chlorGitter, 'Chloride Lattice').
text(en, fluessigSprengStoff, 'Liquid Explosive').
text(en, fortschrittlicherIonenAkku, 'Advanced Ion Battery').
text(en, fregattenTreibStoff100to, 'Frigate Fuel 100 tonnes').
text(en, fregattenTreibStoff200to, 'Frigate Fuel 200 tonnes').
text(en, fregattenTreibStoff50to, 'Frigate Fuel 50 tonnes').
text(en, fusionsBeschleuniger, 'Fusion Accelerant').
text(en, fusionsZuender, 'Fusion Ignitor').
text(en, geoDesit, 'Geodesite').
text(en, glas, 'Glass').
text(en, grantine, 'Grantine').
text(en, halbLeiter, 'Semiconductor').
text(en, heissesEis, 'Hot Ice').
text(en, herox, 'Herox').
text(en, hitzeKondensator, 'Heat Capacitor').
text(en, hydrothermaleTreibStoffZelle, 'Hydrothermal Fuel Cell').
text(en, instabilesGel, 'Unstable Gel').
text(en, instabilesNatrium, 'Destabilized Natrium').
text(en, instabilesPlasma, 'Unstable Plasma').
text(en, iridesit, 'Iridesite').
text(en, kabelBaum, 'Wiring Loom').
text(en, kohlenStoffKristall, 'Carbon Crystal').
text(en, kryogenKammer, 'Cryogenic Chamber').
text(en, kryoPumpe, 'Cryo-Pump').
text(en, lebendesGlas, 'Living Glass').
text(en, lemmium, 'Lemmium').
text(en, magnoGold, 'Magno-Gold').
text(en, organischerKatalysator, 'Organic Catalyst').
text(en, polyFaser, 'Poly Fiber').
text(en, projektilMunition, 'Projectile Ammunition').
text(en, quantumProzessor, 'Quantum Processor').
text(en, saeure, 'Acid').
text(en, schaltPlatte, 'Circuit Board').
text(en, schmierMittel, 'Lubricant').
text(en, seltenesMetallElement, 'Rare Metal Element').
text(en, staseGeraet, 'Stasis Device').
text(en, sternenSchildBatterie, 'Starshield Battery').
text(en, stickStoffSalz, 'Nitrogen Salt').
text(en, strassenKoeterBronze, 'Dirty Bronze').
text(en, superOxidKristall, 'Superoxide Crystal').
text(en, supraLeiter, 'Superconductor').
text(en, tetraKobalt, 'Tetra Cobalt').
text(en, thermischesKondensat, 'Thermic Condensate').
text(en, tragbarerReaktor, 'Portable Reactor').
text(en, warpZelle, 'Warp Cell').
text(en, warpHyperKern, 'Warp Hypercore').
text(en, herzDerSonne, 'Heart ot the Sun').
text(en, modifizierteQuanten, 'Modified Quanta').
text(en, novaeRegenerat, 'Novae Reclaiment').
text(en, zustandsPhase, 'State Phasure').
text(en, photischerJade, 'Photic Jade').
text(en, endeDerDaemmerung, 'Dawns End').
text(en, dunkleMaterie, 'Dark Matter').
text(en, nooSphaerischKugel, 'Noospheric Orb').
text(en, umhuellterSchatten, 'Englobed Schade').
text(en, gefangeneNanode, 'Captured Nanode').
text(en, seelenEngine, 'Soul Enengine').
text(en, sternenSamen, 'Star Seed').
text(en, gedankenBogen, 'Mind Arch').
text(en, pulsierenderKern, 'Pulsating Core').
text(en, bewusstseinsBruecke, 'Conscious Bridge').
text(en, unmoeglicheMembran, 'Impossible Membrane').
text(en, glasSamen, 'Seeds of Glass').
text(en, singularitaetsKern, 'Growing Singularity').
text(en, verhaertetesGehaeuse, 'Hardened Shell').
text(en, ausgewachsenerHerzKnotenPunkt, 'Mature Heart Node').
text(en, ausgewachsenerNervenStamm, 'Mature Neural Stem').
text(en, seelenKammer, 'Soul Chamber').
text(en, atlasPassV1, 'Atlas Pass V1').
text(en, atlasPassV2, 'Atlas Pass V2').
text(en, atlasPassV3, 'Atlas Pass V3').
text(en, belueftungsMembranB, 'Aeration Membrane B').
text(en, bewegungsModulA, 'Movement System Upgrade A').
text(en, bewegungsModulB, 'Movement System Upgrade B').
text(en, bewegungsModulC, 'Movement System Upgrade C').
text(en, bewegungsModulS, 'Movement System Upgrade S').
text(en, effizienteWasserDuesenA, 'Efficient Waterjets A').
text(en, einfacherUeberSetzerB, 'Simple Translator B').
text(en, gefahrenSchutz, 'Hazard Protection').
text(en, gefahrGutSchutzHandschuh, 'Haz-Mat Gauntlet').
text(en, giftSchutzModulA, 'Toxin Suppressor A').
text(en, giftSchutzModulB, 'Toxin Suppressor B').
text(en, jetPack, 'Jetpack').
text(en, kuehlMittelNetzwerkC, 'Coolant Network C').
text(en, lebensErhaltung, 'Life Support').
text(en, lebensErhaltungsModulA, 'Life Support A').
text(en, lebensErhaltungsModulB, 'Life Support B').
text(en, lebensErhaltungsModulS, 'Life Support S').
text(en, neuralStimulatorB, 'Neural Stimulator B').
text(en, perfektionierterUebersetzerS, 'Advanced Translator S').
text(en, raketenStiefelA, 'Rocket Boots A').
text(en, sauerStoffUmleiterA, 'Oxigen Recycler A').
text(en, sauerStoffWiederVerwerterC, 'Oxigen Recycler C').
text(en, schildGitterB, 'Shield Lattice B').
text(en, schildModulA, 'Deflector Shield A').
text(en, schildModulC, 'Deflector Shield C').
text(en, strahlungsDeflektorC, 'Radiation Deflector C').
text(en, strahlungsSchutzModulA, 'Radiation Protection A').
text(en, strahlungsSchutzModulB, 'Radiation Protection B').
text(en, strahlungsSchutzModulS, 'Radiation Protection S').
text(en, toxinDaempferC, 'Toxin Suppressor C').
text(en, verbesserterUebersetzerA, 'Superior Translator A').
text(en, waermeSchichtC, 'Thermic Layer C').
text(en, waermeSchutzModulA, 'Heat Protection A').
text(en, waermeSchutzModulB, 'Heat Protection B').
text(en, waermeSchutzModulKaelteB, 'Cold Protection B').
text(en, unterWasserSchutzModulB, 'Underwater Protection B').
text(en, persoenlicheRaffinerie, 'Personal Refiner').
text(en, luftSchubAntriebS, 'Airburst Engine S').
text(en, ablativePanzerungC, 'Ablative Armour C').
text(en, cadmiumAntriebB, 'Cadmium Drive B').
text(en, deflektorSchild, 'Deflektor Shield').
text(en, dysonPumpeB, 'Dyson Pump B').
text(en, effizienteDuesenB, 'Efficient Water Jets B').
text(en, emerilAntriebA, 'Emeril Drive A').
text(en, fourierBegrenzerB, 'Fourier-De-Limiter B').
text(en, fragmentSuperAufladerB, 'Fragment Supercharger B').
text(en, grosseRaketenRohreB, 'Large Rocket Tubes B').
text(en, hyperAntrieb, 'Hyperdrive').
text(en, hyperAntriebModulC, 'Hyperdrive Module C').
text(en, impulsAntrieb, 'Pulse Engine').
text(en, impulsAntriebModulC, 'Pulse Engine Module C').
text(en, impulsAntriebModulS, 'Pulse Engine Module S').
text(en, infraMesserBeschleuniger, 'Infra-Knife-Accelerator').
text(en, infraMesserModulC, 'Infra-Knife Module C').
text(en, infraMesserModulS, 'Infra-Knife Module S').
text(en, indiumAntriebS, 'Indium Drive S').
text(en, konfliktScanner, 'Conflict Scanner').
text(en, nichtlineareOptikB, 'Non-linear Optics B').
text(en, nichtlineareOptikC, 'Non-linear Optics C').
text(en, phasenStrahler, 'Phase Beam').
text(en, phasenStrahlerModulC, 'Phase Beam Module C').
text(en, phasenStrahlerModulS, 'Phase Beam Module S').
text(en, photonenKanone, 'Photon Cannon').
text(en, photonenKanonenModulC, 'Photon Cannon Module C').
text(en, photonenKanonenModulB, 'Photon Cannon Module B').
text(en, photonenKanonenModulS, 'Photon Cannon Module S').
text(en, positronenWerfer, 'Positron Ejector').
text(en, positronModulB, 'Positron Ejector Module B').
text(en, positronModulC, 'Positron Ejector Module C').
text(en, positronModulS, 'Positron Ejector Module S').
text(en, raketenWerfer, 'Rocket Launcher').
text(en, raumSchiffSchildModulB, 'Deflector Shield Module B').
text(en, raumSchiffSchildModulC, 'Deflector Shield Module C').
text(en, startSchubDuese, 'Launch Thruster').
text(en, startSystemLadeGeraetS, 'Launch System Recharger S').
text(en, teleportEmpfaenger, 'Teleport Receiver').
text(en, wirtschaftsScanner, 'Economy Scanner').
text(en, zyklotronBalliste, 'Cyclotron').
text(en, zyklotronModulB, 'Cyclotron Module B').
text(en, zyklotronModulC, 'Cyclotron Module C').
text(en, zyklotronModulS, 'Cyclotron Module S').
text(en, instabilitaetsAntriebA, 'Instability Drive A').
text(en, unterLichtVerstaerkerS, 'Sub-Light Amplifier S').
text(en, notFallWarpEinheitA, 'Emergency Warp Unit A').
text(en, poloFigur, 'Polo Figurine').
text(en, warpKernResonator, 'Warp Core Resonator').
text(en, verstraerkterWarpSchildC, 'Amlified Warp Shielding C').
text(en, chromatischerWarpSchildB, 'Chromatic Warp shielding B').
text(en, temporalerWarpComputerA, 'Temporal Warp Computer A').
text(en, plasmaWarpInjektorB, 'Plasmatic Warp Injector B').
text(en, realitaetsEntwirrer, 'Realitity De-threader').
text(en, materieStrahl, 'Matter Beam').
text(en, gedankenKontrollGeraet, 'Mind Control Device').
text(en, holografischerAnalysator, 'Holographic Analyser').
text(en, mineralKompressor, 'Mineral Compressor').
text(en, sprengDrohnen, 'Explosive Drones').
text(en, treibStoffOxidant, 'Fuel Oxidizer').
text(en, analyseVisier, 'Analysis Visor').
text(en, bergBauStrahlModulC, 'Mining Beam Module C').
text(en, blitzWerfer, 'Boltcaster').
text(en, blitzWerferModulC, 'Boltcaster Module C').
text(en, blitzWerferModulA, 'Boltcaster Module A').
text(en, blitzWerferModulS, 'Boltcaster Module S').
text(en, eigenesKraftFeld, 'Personal Forcefield').
text(en, fortgeschrittenerMinenLaserA, 'Advanced Mining Laser A').
text(en, geologieKanone, 'Geology Cannon').
text(en, geologieKanonenModulC, 'Geology Cannon Module C').
text(en, geologieKanonenModulB, 'Geology Cannon Module B').
text(en, geologieKanonenModulS, 'Geology Cannon Module S').
text(en, geschossSchmiererC, 'Shell Greaser C').
text(en, glutSpeer, 'Blaze Javelin').
text(en, glutSpeerModulC, 'Blaze Javelin Module C').
text(en, glutSpeerModulA, 'Blaze Javelin Module A').
text(en, glutSpeerModulS, 'Blaze Javelin Module S').
text(en, impulsWerfer, 'Pulse Splitter').
text(en, impulsWerferModulC, 'Pulse Splitter Module C').
text(en, impulsWerferModulB, 'Pulse Splitter Module B').
text(en, impulsWerferModulA, 'Pulse Splitter Module A').
text(en, kampfVisier, 'Combat Scope').
text(en, laufIonisatorC, 'Barrel Ionizer C').
text(en, masseBeschleunigerC, 'Mass Accelerator C').
text(en, minenLaser, 'Mining Beam').
text(en, minenLaserModulC, 'Mining Laser Module C').
text(en, minenLaserModulS, 'Mining Laser Module S').
text(en, optischerBohrerS, 'Optical Drill S').
text(en, plasmaWerfer, 'Plasma Resonator').
text(en, plasmaWerferModulC, 'Plasma Resonator Module C').
text(en, plasmaWerferModulB, 'Plasma Resonator Module B').
text(en, plasmaWerferModulS, 'Plasma Resonator Module S').
text(en, scanner, 'Scanner').
text(en, scannerModulC, 'Scanner Mdule C').
text(en, scannerModulA, 'Scanner Mdule A').
text(en, scannerModulS, 'Scanner Mdule S').
text(en, streuBlaster, 'Scatter Blaster').
text(en, streuBlasterModulC, 'Scatter Blaster Module C').
text(en, streuBlasterModulB, 'Scatter Blaster Module B').
text(en, terrainManipulator, 'Terrain Manipulator').
text(en, untersuchungsGeraetA, 'Survey Device A').
text(en, verstaerkteKartuschenC, 'Amplified Cartridges C').
text(en, wellenFormWiederVerwerterB, 'Waveform Recyler B').
text(en, solarStrahl, 'Solar Ray').
text(en, gemuetsStrahl, 'Mood Ray').
text(en, driftAufhaengungA, 'Drift Suspension A').
text(en, haftungsVerstaerkungsAufhaengungA, 'Grip Boost Suspension A').
text(en, rutschAufhaengungA, 'Hi-Slide Suspension A').
text(en, fusionsAntrieb, 'Fusion Engine').
text(en, humboldtAntrieb, 'Humboldt Drive').
text(en, megaWattHeizung, 'Megawatt Heater').
text(en, luftFilterEinheit, 'Air Filtration Unit').
text(en, neutronenAbschirmung, 'Neutron Shielding').
text(en, thermalPuffer, 'Thermal Buffer').
text(en, exoFahrzeugSignalBooster, 'Exocraft Signal Booster').
text(en, exoFahrzeugBeschleunigungsModul, 'Exocraft Acceleration Module').
text(en, exoFahrzeugMinenLaser, 'Exocraft Mining Laser').
text(en, daidalosAntrieb, 'Daidalos Drive').
text(en, hochleistungsSonar, 'High Power Sonar').
text(en, fortgeschrittenerSignalBoosterB, 'Advanced Signal Booster B').
text(en, ikarusTreibStoffSystem, 'Ikarus Fuel System').
text(en, exoFahrzeugMinenLaserUpgradeSigmaA, 'Exocraft Mining Laser Sigma A').
text(en, exoFahrzeugBordKanone, 'Exocraft Mounted Cannon').
text(en, umweltKontrollEinheit, 'Environment Control Unit').
text(en, minotaurusRadarAnlage, 'Minotaur Radar Array').
text(en, minotaurusLaser, 'Minotaur Laser').
text(en, ariadnesFlamme, 'Ariadnes Flame').
text(en, minotaurusPraezisionsLaser, 'Precision Minotaur Laser').
text(en, minotaurusKanone, 'Minotaur Cannon').
text(en, minotaurusBohrer, 'Minotaur Bore').
text(en, selbstSchmierendeServos, 'Self-Greasing Servos').
text(en, exoFahrzeugAntriebModulC, 'Exocraft Engine Module C').
text(en, exoFahrzeugAntriebModulS, 'Exocraft Engine Module S').
text(en, exoFahrzeugBoostModulB, 'Exocraft Boost Module B').
text(en, exoFahrzeugBoostModulC, 'Exocraft Boost Module C').
text(en, exoFahrzeugBoostModulS, 'Exocraft Boost Module S').
text(en, exoFahrzeugKanonenModulC, 'Exocraft Cannon Module C').
text(en, exoFahrzeugKanonenModulB, 'Exocraft Cannon Module B').
text(en, exoFahrzeugKanonenModulS, 'Exocraft Cannon Module S').
text(en, exoFahrzeugLaserModulC, 'Exocraft Laser Module C').
text(en, exoFahrzeugLaserModulB, 'Exocraft Laser Module B').
text(en, exoFahrzeugLaserModulS, 'Exocraft Laser Module S').
text(en, exoFahrzeugSignalBoosterUpgradeTauA, 'Exocraft Signal Booster Tau A').
text(en, humboldtAntriebsModulC, 'Humboldt Drive Module C').
text(en, humboldtAntriebsModulS, 'Humboldt Drive Module S').
text(en, nautilonKanone, 'Nautilon Cannon').
text(en, nautilonKanonenModulA, 'Nautilon Cannon Module A').
text(en, nautilonKanonenModulC, 'Nautilon Cannon Module C').
text(en, osmotischerGeneratorC, 'Osmotic Generator C').
text(en, tethysStrahl, 'Tethys Beam').
text(en, konstruktionsTerminal, 'Construction Terminal').
text(en, exoFahrzeugTerminal, 'Exocraft Terminal').
text(en, waffenTerminal, 'Weapon Terminal').
text(en, wissenschaftsTerminal, 'Research Terminal').
text(en, landwirtschaftsTerminal, 'Agricultural Terminal').
text(en, annaeherungsSchalter, 'Proximity Switch').
text(en, bodenSchalter, 'Floor Switch').
text(en, elektroMagnetischerGenerator, 'Electromagnetic Generator').
text(en, energieUmkehrer, 'Power Inverter').
text(en, gasExtraktor, 'Gas Extractor').
text(en, mineralienExtraktor, 'Mineral Extractor').
text(en, schalter, 'Button').
text(en, solarModul, 'Solar Panel').
text(en, versorgungsDepot, 'Supply Depot').
text(en, versorgungsRohr, 'Versorgungsrohr').
text(en, wandSchalter, 'Wall Switch').
text(en, echinoKaktus, 'Echinocactus').
text(en, eiweissPerlenKugel, 'Albumen Pearl Orb').
text(en, floraBehaelterHochBeet, 'Flora Containment Raised Bed').
text(en, floraBehaelterKasten, 'Flora Containment Box').
text(en, floraBehaelterTubus, 'Flora Containment Tube').
text(en, frostWurz, 'Frostwort').
text(en, gammaGras, 'Gamma Weed').
text(en, giftIgel, 'Venom Urchin').
text(en, gravitinoWirt, 'Gravitino Host').
text(en, grosserHydroKulturTrog, 'Large Hydroponic Tray').
text(en, hydroKulturTrog, 'Hydroponic Tray').
text(en, magenKrampfBlume, 'Gutrot Flower').
text(en, morditWurzel, 'Mordite Root').
text(en, nipNip, 'Nipnip').
text(en, pilzGeflecht, 'Fungal Cluster').
text(en, sonnenRebe, 'Solar Vine').
text(en, sternenDorn, 'Star Bramble').
text(en, topfPflanze, 'Potted Plant').
text(en, stehenderPflanzenBehaelter, 'Standing Planter').
text(en, lagerBehaelter0, 'Storage Container 0').
text(en, lagerBehaelter1, 'Storage Container 1').
text(en, lagerBehaelter2, 'Storage Container 2').
text(en, lagerBehaelter3, 'Storage Container 3').
text(en, lagerBehaelter4, 'Storage Container 4').
text(en, lagerBehaelter5, 'Storage Container 5').
text(en, lagerBehaelter6, 'Storage Container 6').
text(en, lagerBehaelter7, 'Storage Container 7').
text(en, lagerBehaelter8, 'Storage Container 8').
text(en, lagerBehaelter9, 'Storage Container 9').
text(en, verschlosseneKiste, 'Locked Crate').
text(en, roamerGeoBucht, 'Roamer Geobay').
text(en, nomadenGeoBucht, 'Nomaden Geobay').
text(en, exoFahrzeugRufStation, 'Exocraft Summoning Station').
text(en, nautilonKammer, 'Nautilon Chamber').
text(en, pilgerGeoBucht, 'Pilgrim Geobay').
text(en, kolossGeoBucht, 'Colossus Geobay').
text(en, minotaurusGeoBucht, 'Minotaur Geobay').
text(en, rennInitiator, 'Race Initiator').
text(en, rennHindernis, 'Race Obstacle').
text(en, rennKraftVerstaerker, 'Race Force Amplifier').
text(en, autonomeBergBauEinheit, 'Autonomous Mining Unit').
text(en, basisComputer, 'Base Computer').
text(en, batterie, 'Battery').
text(en, konstruktionsForschungsStation, 'Construction Research Station').
text(en, bioTreibStoffReaktor, 'Biofuel Reactor').
text(en, elektrischeTarneinheit, 'Electrical Cloaking Unit').
text(en, kommunikationsStation, 'Communications Station').
text(en, nachrichtenModul, 'Message Module').
text(en, naehrStoffProzessor, 'Nutrient Processor').
text(en, signalBooster, 'Signal Booster').
text(en, speicherPunkt, 'Save Point').
text(en, speicherSignal, 'Save Beacon').
text(en, tragbareRaffinerie, 'Portable Refinery').
text(en, antiMaterieReaktor, 'Antimatter Reaktor').
text(en, atmosphaerenVerarbeitungsAnlage, 'Atmosphere Harvester').
text(en, aussehenModifikator, 'Appearance Modifier').
text(en, automatischerFuetterer, 'Automatted Feeder').
text(en, basisBergungsKapsel, 'Base Salvage Capsule').
text(en, basisTelePorterModul, 'Base Teleporter Modul').
text(en, gefahrenSchutzEinheit, 'Hazard Protection Unit').
text(en, geraeuschBox, 'Noise Box').
text(en, gesundheitsStation, 'Health Station').
text(en, grosseRaffinerie, 'Large Refiner').
text(en, kurzStreckenTelePorter, 'Short Range Teleporter').
text(en, landeFeld, 'Landing Pad').
text(en, leuchtBoden, 'Light Floor').
text(en, lichtBox, 'Light Box').
text(en, mittlereRaffinerie, 'Medium Refinery').
text(en, nutzTierEinheit, 'Livestock Unit').
text(en, terminalDesGalaktischenMarktes, 'Galactic Trade Terminal').
text(en, kugelErzeuger, 'Sphere Creator').
text(en, sauerStoffVerarbeiter, 'Oxygen Harvester').
text(en, byteBeatGeraet, 'Bytebeat Device').
text(en, byteBeatSchaltung, 'Bytebeat Switch').
text(en, automatischerSchalter, 'Auto Switch').
text(en, motivStilisiertesR, 'Decal stylized R').
text(en, motivRundPipette, 'Decal Round Pipette').
text(en, motivBuegel, 'Decal Stirrup').
text(en, motivNo0, 'Decal No 0').
text(en, motivSchildErstochenerVogel, 'Decal Plate Stabbed Bird').
text(en, motivFaltungDuennDick, 'Decal Folding Thin Thick').
text(en, motivZiegelSteine, 'Decal Bricks').
text(en, motivRadioAktivGrau, 'Decal Radioactive Grey').
text(en, motivGrabStein, 'Decal Tumbstone').
text(en, motivHelloGames, 'Decal Hello Games').
text(en, motivNo1, 'Decal No 1').
text(en, motivNo2, 'Decal No 2').
text(en, motivSchildGrünerMann, 'Decal Shield Green Man').
text(en, motivSchildKorvax, 'Decal Shield Korvax').
text(en, motivNo3, 'Decal No 3').
text(en, motivNo5, 'Decal No 5').
text(en, motivNo7, 'Decal No 7').
text(en, motivNo9, 'Decal No 9').
text(en, motivNo4, 'Decal No 4').
text(en, motivNo6, 'Decal No 6').
text(en, motivNo8, 'Decal No 8').
text(en, motivFroschSack, 'Decal Frog Sac').
text(en, motivLaemmchen, 'Decal Lambkin').
text(en, wandBildSchirm, 'Wall Screen').
text(en, wandVentilator, 'Wall Ventilator').
text(en, gruenerWandBildSchirm, 'Green Wall Screen').
text(en, schubLadenSchrank, 'Drawers').
text(en, wandEinheit, 'Wall Unit').
text(en, lagerModulDeko, 'Storage Container Decorative').
text(en, deckenPaneel, 'Ceiling Panel').
text(en, techBedienFeld, 'Tech Panel').
text(en, server, 'Server').
text(en, kanisterRegal, 'Cannister Shelf').
text(en, kleineKiste, 'Small Crate').
text(en, schliessFach, 'Locker').
text(en, flachesModul, 'Flat Module').
text(en, seitenModul, 'Side Module').
text(en, lagerModul, 'Storage Module').
text(en, regalModul, 'Rack Module').
text(en, roboterArm, 'Roboter Arm').
text(en, waffenRegal, 'Weapon Shelf').
text(en, oszilloskop, 'Oscilloscope').
text(en, achtEckSchrank, 'Octagonal Corner Cupboard').
text(en, fassFoermigerFabrikator, 'Barrel Fabricator').
text(en, hoherSchrank, 'High Closet').
text(en, kistenFoermigerFabrikator, 'Krate Fabricator').
text(en, schalenSitzStuhl, 'Bucket Seat Chair').
text(en, stuhlEckig, 'Angled Chair').
text(en, flagge1, 'Flag 1').
text(en, tisch, 'Table').
text(en, bett, 'Bed').
text(en, stuhlFriseur, 'Hairdresser Chair').
text(en, sofa, 'Sofa').
text(en, flagge2, 'Flag 2').
text(en, wandFlagge1, 'Wall Flag 1').
text(en, tischSechsEckig, 'Hexagonal Table').
text(en, einfacherSchreibTisch, 'Simple Desk').
text(en, ergonomischesSofa, 'Ergonomic Sofa').
text(en, eckSofa, 'Corner Sofa').
text(en, flagge3, 'Flag 3').
text(en, flagge4, 'Flag 4').
text(en, wandFlagge3, 'Wall Flag 3').
text(en, wandFlagge2, 'Wall Flag 2').
text(en, bodenMatte, 'Floor Mat').
text(en, grosseMonitorStation, 'Large Monitor').
text(en, gewoelbterTisch, 'Curved Desk').
text(en, monitorStation, 'Monitor Station').
text(en, arbeitsPlatte, 'Worktop').
text(en, leichterTisch, 'Light Table').
text(en, lichtHandLampe, 'Hand Lamp').
text(en, weisseLeuchte, 'While Light').
text(en, lichtStehLampeEckig, 'Angled Foot Lamp').
text(en, laborLampe, 'Labor Light').
text(en, blaueLeuchte, 'Blue Light').
text(en, roteLeuchte, 'Red Light').
text(en, lichtStehLampeRund, 'Floor Light Round').
text(en, lichtStehLampeSchirm, 'Floor Light Shade').
text(en, deckenLeuchte, 'Ceiling Light').
text(en, gelbeLeuchte, 'Yellow Light').
text(en, grueneLeuchte, 'Green Light').
text(en, pinkeLeuchte, 'Pink Light').
text(en, holzWand, 'Wooden Wall').
text(en, holzBodenPlatte, 'Wood Floor Panel').
text(en, duenneHolzWand, 'Thin Wooden Wall').
text(en, holzTuerRahmen, 'Wooden Door Frame').
text(en, holzDach, 'Wooden Roof').
text(en, glasPlatteMitHolzRahmen, 'Wood Framed Glass').
text(en, holzRampe, 'Wooden Ramp').
text(en, kleineHolzPlatte, 'Small wooden Panel').
text(en, holzDreieck, 'Wooden Triangle').
text(en, schraegeHolzPlatte, 'Sloping Wood Panel').
text(en, kleineHolzWand, 'Small Wooden Wall').
text(en, holzFenster, 'Wooden Window').
text(en, holzTuer, 'Wooden Doorway').
text(en, elektrischeHolzTuer, 'Wooden Power Door').
text(en, holzDachPlatte, 'Wooden Roof Panel').
text(en, holzDachEckStueck, 'Wooden Roof Corner').
text(en, holzBogen, 'Wooden Arch').
text(en, halbeHolzRampe, 'Wooden Half Ramp').
text(en, kleinesHolzDreieck, 'Small Wooden Triangle').
text(en, kurzeHolzWand, 'Short Wooden Wall').
text(en, holzFassade, 'Wooden Frontage').
text(en, kleineHolzTuer, 'Small Doorway').
text(en, dachInnenEckteilAusHolz, 'Wooden Inner Roof Corner').
text(en, halberHolzBogen, 'Wooden Half Arch').
text(en, metallWand, 'Metal Wall').
text(en, metallBodenPlatte, 'Metal Floor Panel').
text(en, duenneMetallWand, 'Thin Metal Wall').
text(en, metallTuerRahmen, 'Metal Door Frame').
text(en, metallDach, 'Metal Roof').
text(en, glasPlatteMitMetallRahmen, 'Metal Framed Glass Panel').
text(en, metallRampe, 'Metal Ramp').
text(en, kleineMetallPlatte, 'Small Metal Panel').
text(en, metallDreieck, 'Metal Triangle').
text(en, schraegeMetallPlatte, 'Sloping Metal Panel').
text(en, kleineMetallWand, 'Small Metal walld').
text(en, metallFenster, 'Metal Window').
text(en, metallTuer, 'Metal Doorway').
text(en, elektrischeMetallTuer, 'Metal Power Door').
text(en, metallDachPlatte, 'Metal Roof Panel').
text(en, metallDachEckStueck, 'Metal Roof Corner').
text(en, metallBogen, 'Metal Arch').
text(en, halbeMetallRampe, 'Half Metal Ramp').
text(en, kleinesMetallDreieck, 'Small Metal Triangle').
text(en, kurzeMetallWand, 'Short Metal Wall').
text(en, metallFassade, 'Metal Frontage').
text(en, kleineMetallTuer, 'Small Metal Door').
text(en, dachInnenEckteilAusMetall, 'Metal Inner Roof Corner').
text(en, halberMetallBogen, 'Metal Half Arch').
text(en, betonWand, 'Concrete Wall').
text(en, betonBodenPlatte, 'Concrete Floor Panel').
text(en, duenneBetonWand, 'Thin Concrete Wall').
text(en, betonTuerRahmen, 'Concrete Door Frame').
text(en, betonDach, 'Concrete Roof').
text(en, glasPlatteMitBetonRahmen, 'Concrete Framed Glass Panel').
text(en, betonRampe, 'Concrete Ramp').
text(en, kleineBetonBodenPlatte, 'Small Concrete Panel').
text(en, betonDreieck, 'Concrete Traingle').
text(en, schraegeBetonPlatte, 'Sloping Concrete Panel').
text(en, kleineBetonWand, 'Small Concrete Wall').
text(en, betonFenster, 'Concrete Window').
text(en, betonTuer, 'Concrete Door').
text(en, elektrischeBetonTuer, 'Concrete Power Door').
text(en, betonDachPlatte, 'Concrete Roof Panel').
text(en, betonDachEckStueck, 'Concrete Roof Corner').
text(en, betonBogen, 'Concrete Arch').
text(en, halbeBetonRampe, 'Half Concrete Ramp').
text(en, kleinesBetonDreieck, 'Small Concrete Triangle').
text(en, kurzeBetonWand, 'Short Concrete Wall').
text(en, betonFassade, 'Concrete Frontage').
text(en, kleineBetonTuer, 'Small Concrete Door').
text(en, dachInnenEckteilAusBeton, 'Concrete Inner Roof Corner').
text(en, halberBetonBogen, 'Concrete Half Arch').
text(en, zylindrischerRaum, 'Cylindric Room').
text(en, quadratischerRaum, 'Square Room').
text(en, geraderKorridor, 'Straight Corridor').
text(en, tuer, 'Door').
text(en, fundament, 'Foundation').
text(en, lFoermigerKorridor, 'L Shaped Corridor').
text(en, korridorMitGlasDach, 'Glass Corridor').
text(en, holoTuer, 'Holo Door').
text(en, zugangsRampe, 'Access Ramp').
text(en, pflasterungVierFach, 'Quad Paving').
text(en, viererFundamentStrebe, 'Foundation Quad').
text(en, fundamentStrebe, 'Foundation Strut').
text(en, zylindrischerRaumRahmen, 'Cylindric Room Frame').
text(en, tFoermigerKorridor, 'T Shaped Corridor').
text(en, xFoermigerKorridor, 'X Shaped Corridor').
text(en, korridorFenster, 'Corridor Window').
text(en, bioKuppelRaum, 'Bio Dome').
text(en, gebogenerKorridor, 'Curved Corridor').
text(en, leiter, 'Climb Ladder').
text(en, pflasterung, 'Paving').
text(en, pflasterungPodest, 'Platform Paving').
text(en, grossesGlasPaneel, 'Large Glass Panel').
text(en, aussichtsKugel, 'Viewing Sphere').
text(en, wuerfelFoermigerRaum, 'Cuboid Room').
text(en, wuerfelRaumFundamentStrebe, 'Cuboid Foundation Strut').
text(en, gewoelbteWuerfelFoermigeWand, 'Curved Cuboid Wall').
text(en, wuerfelFoermigerGlasRaum, 'Cuboid Glass Room').
text(en, wuerfelFoermigerRaumRahmen, 'Cuboid Room Frame').
text(en, wuerfelFoermigerRaumBoden, 'Cuboid Flooring').
text(en, wuerfelRaumViererFundamentStrebe, 'Cuboid Room Strut Quad').
text(en, innenTreppen, 'Interior Stairs').
text(en, wuerfelFoermigeInnenWand, 'Cuboid Inner Wall').
text(en, wuerfelFoermigerDachAufsatz, 'Cuboid Cap').
text(en, gewoelbtesWuerfelFoermigesDach, 'Cuboid Curved Roof').
text(en, wuerfelFoermigesFensterEckig, 'Cuboid Window Angular').
text(en, wuerfelFoermigesFensterRund, 'Cuboid Window Round').
text(en, infraStrukturLeiter, 'Infrastructure Ladder').
text(en, wuerfelFoermigeInnenTuer, 'Cuboid Inner Door').
text(en, tiefSeeKammer, 'Deep Water Chamber').
text(en, meeresUnterSchlupf, 'Marine Shelter').
text(en, glasTunnel, 'Glass Tunnel').
text(en, quadratischeTiefSeeKammer, 'Quadratic Deepwater Chamber').
text(en, wasserDichteTuer, 'Watertight Door').
text(en, lFoermigerGlasTunnel, 'L Shaped Glass Tunnel').
text(en, vertikalerGlasTunnel, 'Vertical Glass Tunnel').
text(en, mondTeichBoden, 'Marine Pool Floor').
text(en, tFoermigerGlasTunnel, 'T Shaped Glass Tunnel').
text(en, xFoermigerGlasTunnel, 'X Shaped Glass Tunnel').
text(en, mineralBogen, 'Mineral Arch').
text(en, edelSteinFels, 'Gem-Encrusted Rock').
text(en, tentakelSpitze, 'Tentacle Spire').
text(en, wachsameWoelbung, 'Watchful Protrusion').
text(en, blasenBildenderPilz, 'Blistering Mushroom').
text(en, uraltesNadelGehoelz, 'Ancient Conifer').
text(en, gefrorenerPflanzenBehaelter, 'Frozen Planter').
text(en, robusterStrauch, 'Hardy Shrub').
text(en, meeresGestein, 'Marine Rock').
text(en, terrarium, 'Terrarium').
text(en, segelPalme, 'Sail Palm').
text(en, kugelBaum, 'Globe Tree').
text(en, steinGarten, 'Rock Garden').
text(en, taschenRealitaetsGenerator, 'Pocket Reality Generator').
text(en, krauseKoralle, 'Curly Coral').
text(en, wasserKristall, 'Aquatic Crystal').
text(en, kronLeuchterBluete, 'Candelabra Bloom').
text(en, rankenFuesser, 'Barnacle').
text(en, kleinesAquarium, 'Small Aquarium').
text(en, bronzeneAtlasStatue, 'Bronze Atlas Figurine').
text(en, silberneAtlasStatue, 'Silver Atlas Figurine').
text(en, goldeneAtlasStatue, 'Gold Atlas Figurine').
text(en, fleischFressenderStrauch, 'Carnivorous Bush').
text(en, zwergPalme, 'Dwarf Palm').
text(en, kurioserMais, 'Curious Corn').
text(en, bronzeneJaegerStatue, 'Bronze Fighter Figurine').
text(en, silberneJaegerStatue, 'Silver Fighter Figurine').
text(en, goldeneJaegerStatue, 'Gold Fighter Figurine').
text(en, expansionsWuerfelGeraet, 'Expanding Cuboid Device').
text(en, roboterBegleiter, 'Robotic Companion').
text(en, kugelHologrammGeraet, 'Holograpic Globe Gadged').
text(en, artemisMotiv, 'Artemis Decal').
text(en, nullMotiv, 'Null Decal').
text(en, fruechteBaum, 'Fruit Tree').
text(en, spindelBaum, 'Spindle Tree').
text(en, immerGruenBaum, 'Evergreen Tree').
text(en, apolloMotiv, 'Apollo Decal').
text(en, bronzeneDiploStatue, 'Bronzene Diplo Statue').
text(en, silberneDiploStatue, 'Silberne Diplo Statue').
text(en, goldeneDiploStatue, 'Goldene Diplo Statue').
text(en, nadaMotiv, 'Nada Decal').
text(en, poloMotiv, 'Polo Decal').
text(en, bronzeneKampfLaeuferStatue, 'Bronze Walker Figurine').
text(en, silberneKampfLaeuferStatue, 'Silver Walker Figurine').
text(en, goldeneKampfLaeuferStatue, 'Gold Walker Figurine').
text(en, bronzeneGekStatue, 'Bronze Gek Statue').
text(en, silberneGekStatue, 'Silver Gek Statue').
text(en, goldeneGekStatue, 'Gold Gek Statue').
text(en, anomalieMotiv, 'Anomaly Decal').
text(en, galaktischerHubMotiv, 'Galactic Hub Decal').
text(en, umschlingenderBaum, 'Entwining Tree').
text(en, regenSchirmBaum, 'Umbrella Tree').
text(en, windenderStrauch, 'Writhing Bush').
text(en, nadaFigur, 'Nada Figurine').
text(en, zustimmendeHandbewegungMotiv, 'Hand Of Approvement Decal').
text(en, bronzeneKreaturStatue, 'Bronze Blob Figurine').
text(en, silberneKreaturStatue, 'Silver Blob Figurine').
text(en, goldeneKreaturStatue, 'Gold Blob Figurine').
text(en, bronzeneAstronautenStatue, 'Bronze Astronaut Figurine').
text(en, silberneAstronautenStatue, 'Silver Astronaut Figurine').
text(en, goldeneAstronautenStatue, 'Gold Astronaut Figurine').
text(en, flottenKommandoRaum, 'Fleet Command Room').
text(en, grosserFrachterRaum, 'Large Freighter Room').
text(en, frachterKorridor, 'Freighter Corridor').
text(en, gebogenerFrachterKorridor, 'Curved Freighter Corridor').
text(en, frachterKreuzungDreiFach, 'Freighter Junction').
text(en, frachterKreuzungVierFach, 'Freighter Cross Junction').
text(en, frachterTreppe, 'Freighter Stairs').
text(en, gebogenesRohr, 'Curved Pipe').
text(en, grosserKeil, 'Large Wedge').
text(en, kleinerKeil, 'Small Wedge').
text(en, kugel, 'Sphere').
text(en, pyramide, 'Pyramid').
text(en, rohr, 'Pipe').
text(en, stabilerWuerfel, 'Solid Cube').
text(en, wuerfel, 'Cube').
text(en, zylinder, 'Cylinder').
text(en, zuckendesEi, 'Twitchy Egg').
text(en, absprungKapselKoordinaten, 'Drop Pod Coordinate Data').
text(en, protokollEntschluesselungsCode, 'Log Encryption Key').
text(en, geborgeneDaten, 'Salvaged Data').
text(en, queckSilber, 'Quicksilber').
text(en, navigationsDaten, 'Navigation Data').
text(en, antiHaftKolben, 'Non-Stick Piston').
text(en, ausrangierteSchaltPlatte, 'Decommisioned Circuit Board').
text(en, autonomePositionierungsEinheit, 'Autonomous Positioning Unit').
text(en, bromSalz, 'Bromide Salt').
text(en, entschluesselteBenutzerDaten, 'Decrypted User Data').
text(en, experimentelleEnergieFluessigkeit, 'Experimental Power Fluid').
text(en, fuenfDimensionalerTorus, 'Five Dimensional Torus').
text(en, funkenKanister, 'Spark Canister').
text(en, fusionsKern, 'Fusion Core').
text(en, gewaltigesMetallZahnRad, 'Enormous Metal Cog').
text(en, holographischeKurbelWelle, 'Holographic Crankshaft').
text(en, hochleistungsKompressor, 'High Capacity Vector Compressor').
text(en, industrieBatterie, 'Industrial-Grade Battery').
text(en, instabilitaetsInjektor, 'Instability Injektor').
text(en, ionenKugel, 'Ion Spheres').
text(en, ionenKondensator, 'Ion Capacitor').
text(en, kometenTroepfchen, 'Comet Droplets').
text(en, nanoRohrKiste, 'Nanotube Crate').
text(en, neuralLeitung, 'Neural Duct').
text(en, neutronenMikroskop, 'Neutron Mikroscope').
text(en, nichtMehrDuftendePheromonFlasche, 'De-Scented Pheromone Bottle').
text(en, ohmschesGel, 'Ohmic Gel').
text(en, optischesLoesungsMittel, 'Optical Solvent').
text(en, organischeRohre, 'Organic Piping').
text(en, polyChromesZirkonium, 'Polychromatic Zirconium').
text(en, quantumBeschleuniger, 'Quantum Accelerator').
text(en, schmutz, 'Dirt').
text(en, schweisserSeife, 'Welding Soap').
text(en, sechsZackigerEntKoppler, 'Six Pronged Mesh Decoupler').
text(en, sichSelbstReparierendesHeridium, 'Self Repairing Heridium').
text(en, sternenSeide, 'Star Silk').
text(en, supraleitendeFaser, 'Superconduction Fibre').
text(en, teleportKoordinatoren, 'Teleport Coordinators').
text(en, unraffiniertesPyritFett, 'Unrefined Pyrite Grease').
text(en, vergitterterBogenKristall, 'Re-Latticed Arc Crystal').
text(en, raumSchiffKiVentile, 'Starship AI Valves').
text(en, nanoKabelSpule, 'Spool Of Nano-Cables').
text(en, wiederVerwerterSchaltKreis, 'Recycled Circuitry').
text(en, verdichteteIndiumReste, 'Compressed Indium Scraps').
text(en, subatomareRegler, 'Subatomic Regulators').
text(en, thermalModule, 'Thermal Panels').
text(en, handvollZahnRaeder, 'Handful Of Cogs').
text(en, kuehlMittelTank, 'Tank Of Coolant').
text(en, verstaerkteRohre, 'Reinforced Piping').
text(en, ehemalsNuetzlicheFedern, 'Once-Useful Springs').

text(en, unmoeglicheSporen, 'unmögliche Sporen').
text(en, sichWindendeSpulen, 'sich windende Spulen').

text(en, blasenBallen, 'Bubble Cluster').
text(en, defekterSeparator, 'Glitching Separator').
text(en, elektrischerWuerfel, 'Electrc Cube').
text(en, kabelKapsel, 'Kable Pod').
text(en, kalziPilz, 'Calcishroom').
text(en, kappillarMuschel, 'Capilliary Shell').
text(en, klapperWirbleSaeule, 'Rattle Spine').
text(en, lichtBruch, 'Light Fissure').
text(en, terbiumWachstum, 'Terbium Growth').
text(en, verknoecherterStern, 'Ossified Star').
text(en, gekNip, 'Gek Nip').
text(en, gekRelikt, 'Gek Relic').
text(en, korvaxGehaeuse, 'Korvax Casing').
text(en, vyKeenBildnis, 'Vykeen Effigy').
text(en, vyKeenDolch, 'Vykeen Dagger').
text(en, divergenzWuerfel, 'Divergence Cube').
text(en, hadalKern, 'Hadal Core').
text(en, korvaxKonvergenzWuerfel, 'Korvax Convergence Cube').
text(en, vykenTafel, 'Vyken Tablet').

text(en, byteBeatGeraetRezept, 'Bytebeat Device Formula').
text(en, saeureRezept, 'Acid Formula').
text(en, schmierMittelRezept, 'Lubricant Formula').
text(en, thermischesKondensatRezept, 'Thermic Condensate Formula').
text(en, tragbarerReaktorRezept, 'Portable Reactor Formula').
text(en, instabilesGelRezept, 'nstable Gel Formula').
text(en, glasRezept, 'Glass Formula').
text(en, polyFaserRezept, 'Poly Fiber Formula').
text(en, angereicherterKohlenStoffRezept, 'Condensed Carbon Formula').
text(en, stickStoffSalzRezept, 'Nitrogen Salt Formula').
text(en, aroniumRezept, 'Aronium Formula').
text(en, quantumProzessorRezept, 'Quantum Processor Formula').
text(en, kryogenKammerRezept, 'Cryogenic Chamber Formula').
text(en, fluessigSprengStoffRezept, 'Liquid Explosive Formula').
text(en, lebendesGlasRezept, 'Living Glass Formula').
text(en, hitzeKondensatorRezept, 'Heat Capacitor Formula').
text(en, schaltPlatteRezept, 'Circuit Board Formula').
text(en, organischerKatalysatorRezept, 'Organic Catalyst Formula').
text(en, halbLeiterRezept, 'Semiconductor Formula').
text(en, heissesEisRezept, 'Hot Ice Formula').
text(en, strassenKoeterBronzeRezept, 'Dirty Bronze Formula').
text(en, heroxRezept, 'Herox Formula').
text(en, lemmiumRezept, 'Lemmium Formula').
text(en, magnoGoldRezept, 'Magno-Gold Formula').
text(en, grantineRezept, 'Grantine Formula').
text(en, fusionsZuenderRezept, 'Fusion Ignitor Formula').
text(en, staseGeraetRezept, 'Stasis Device Formula').
text(en, fusionsBeschleunigerRezept, 'Fusion Accelerant Formula').
text(en, supraLeiterRezept, 'Superconductor Formula').
text(en, kryoPumpeRezept, 'Cryo-Pump Formula').
text(en, iridesitRezept, 'Iridesite Formula').
text(en, geoDesitRezept, 'Geodesite Formula').
text(en, lebensErhaltungsGelRezept, 'Life Support Gel Formula').
text(en, diWasserStoffGeleeRezept, 'Di-Hydrogen Jelly Formula').
text(en, ionenAkkuRezept, 'Ion Battery Formula').
text(en, warpZelleRezept, 'Warp Cell Formula').
text(en, kohlenStoffKristallRezept, 'Carbon Crystal Formula').
text(en, seltenesMetallElementRezept, 'Rare Metal Element Formula').
text(en, tetraKobaltRezept, 'Tetra Cobalt Formula').
text(en, chlorGitterRezept, 'Chloride Lattice Formula').
text(en, instabilesNatriumRezept, 'Destabilized Natrium Formula').
text(en, superOxidKristallRezept, 'Superoxide Crystal Formula').
text(en, raumSchiffStartTreibStoffRezept, 'Starship Launch Fuel Formula').
text(en, fortschrittlicherIonenAkkuRezept, 'Advanced Ion Battery Formula').
text(en, atlasPassV1Rezept, 'Atlas Pass v1 Formula').
text(en, kobaltSpiegelRezept, 'Cobalt Mirror Formula').
text(en, salzRefaktorRezept, 'Salt Refractor Formula').
text(en, natriumDiodeRezept, 'Sodium Diode Formula').
text(en, sauerStoffFilterRezept, 'Oxygen Filter Formula').
text(en, sauerStoffKapselRezept, 'Oxygen Capsule Formula').
text(en, hydrothermaleTreibStoffZelleRezept, 'hHydrothermal Fuel Cell Formula').
text(en, instabilesPlasmaRezept, 'Unstable Plasma Formula').
text(en, sternenSchildBatterieRezept, 'Starshield Battery Formula').
text(en, atlasPassV2Rezept, 'Atlas Pass V2 Formula').
text(en, warpHyperKernRezept, 'Warp Hypercore Formula').
text(en, atlasPassV3Rezept, 'Atlas Pass V3 Formula').
text(en, hermetischesSiegelRezept, 'Hermetic Seal Formula').
text(en, kohlenStoffNanoRohrRezept, 'Carbon Nanotubes Formula').
text(en, metallPlattenRezept, 'Metal Plating Formula').
text(en, projektilMunitionRezept, 'Projectile Ammunition Formula').
text(en, antiMaterieRezept, 'Antimatter Formula').
text(en, antiMaterieGehaeuseRezept, 'Antimatter Housing Formula').
text(en, mikroProzessorRezept, 'Microprocessor Formula').
text(en, kreaturenKugelnRezept, 'Creature Pellets Formula').
text(en, fregattenTreibStoff50toRezept, 'Frigate Fuel 50 tonnes Formula').
text(en, fregattenTreibStoff100toRezept, 'Frigate Fuel 100 tonnes Formula').
text(en, fregattenTreibStoff200toRezept, 'Frigate Fuel 200 tonnes Formula').
text(en, treibStoffOxidantRezept, 'Fuel Oxidizer Formula').
text(en, gedankenKontrollGeraetRezept, 'Mind Control Device Formula').
text(en, holografischerAnalysatorRezept, 'Holographic Analyser Formula').
text(en, sprengDrohnenRezept, 'Explosive Drones Formula').
text(en, mineralKompressorRezept, 'Mineral Compressor Formula').
text(en, warpKernResonatorRezept, 'Warp Core Resonator Formula').
text(en, verstraerkterWarpSchildCRezept, 'Amlified Warp Shielding C Formula').
text(en, chromatischerWarpSchildBRezept, 'Chromatic Warp shielding B Formula').
text(en, temporalerWarpComputerARezept, 'Temporal Warp Computer A Formula').
text(en, plasmaWarpInjektorBRezept, 'Plasmatic Warp Injector B Formula').
text(en, realitaetsEntwirrerRezept, 'Realitity De-threader Formula').
text(en, materieStrahlRezept, 'Matter Beam Formula').
text(en, gefangeneNanodeRezept, 'Captured Nanode Formula').
text(en, umhuellterSchattenRezept, 'Englobed Schade Formula').
text(en, nooSphaerischKugelRezept, 'Noospheric Orb Formula').
text(en, dunkleMaterieRezept, 'Dark Matter Formula').
text(en, endeDerDaemmerungRezept, 'Dawns End Formula').
text(en, photischerJadeRezept, 'Photic Jade Formula').
text(en, zustandsPhaseRezept, 'State Phasure Formula').
text(en, novaeRegeneratRezept, 'Novae Reclaiment Formula').
text(en, modifizierteQuantenRezept, 'Modified Quanta Formula').
text(en, herzDerSonneRezept, 'Heart ot the Sun Formula').
text(en, sternenSamenRezept, 'Star Seed Formula').
text(en, seelenEngineRezept, 'Soul Enengine Formula').
text(en, gedankenBogenRezept, 'Mind Arch Formula').
text(en, bewusstseinsBrueckeRezept, 'Conscious Bridge Formula').
text(en, pulsierenderKernRezept, 'Pulsating Core Formula').
text(en, unmoeglicheMembranRezept, 'Impossible Membrane Formula').
text(en, glasSamenRezept, 'Seeds of Glass Formula').
text(en, lebensErhaltungRezept, 'Life Support Formula').
text(en, gefahrGutSchutzHandschuhRezept, 'Haz-Mat Gauntlet Formula').
text(en, gefahrenSchutzRezept, 'Hazard Protection Formula').
text(en, sauerStoffWiederVerwerterCRezept, 'Oxigen Recycler C Formula').
text(en, jetPackRezept, 'Jetpack Formula').
text(en, einfacherUeberSetzerBRezept, 'Simple Translator B Formula').
text(en, kuehlMittelNetzwerkCRezept, 'Coolant Network C Formula').
text(en, waermeSchichtCRezept, 'Thermic Layer C Formula').
text(en, toxinDaempferCRezept, 'Toxin Suppressor C Formula').
text(en, strahlungsDeflektorCRezept, 'Radiation Deflector C Formula').
text(en, belueftungsMembranBRezept, 'Aeration Membrane B Formula').
text(en, schildGitterBRezept, 'Shield Lattice B Formula').
text(en, sauerStoffUmleiterARezept, 'Oxigen Recycler A Formula').
text(en, neuralStimulatorBRezept, 'Neural Stimulator B Formula').
text(en, raketenStiefelARezept, 'Rocket Boots A Formula').
text(en, effizienteWasserDuesenARezept, 'Efficient Waterjets A Formula').
text(en, verbesserterUebersetzerARezept, 'Superior Translator A Formula').
text(en, perfektionierterUebersetzerSRezept, 'Advanced Translator S Formula').
text(en, persoenlicheRaffinerieRezept, 'Personal Refiner Formula').
text(en, luftSchubAntriebSRezept, 'Airburst Engine S Formula').
text(en, fusionsAntriebRezept, 'Fusion Engine Formula').
text(en, humboldtAntriebRezept, 'Humboldt Drive Formula').
text(en, megaWattHeizungRezept, 'Megawatt Heater Formula').
text(en, luftFilterEinheitRezept, 'Air Filtration Unit Formula').
text(en, neutronenAbschirmungRezept, 'Neutron Shielding Formula').
text(en, thermalPufferRezept, 'Thermal Buffer Formula').
text(en, exoFahrzeugSignalBoosterRezept, 'Exocraft Signal Booster Formula').
text(en, exoFahrzeugBeschleunigungsModulRezept, 'Exocraft Acceleration Formula').
text(en, exoFahrzeugMinenLaserRezept, 'Exocraft Mining Laser Formula').
text(en, daidalosAntriebRezept, 'Daidalos Drive Formula').
text(en, hochleistungsSonarRezept, 'High Power Sonar Formula').
text(en, fortgeschrittenerSignalBoosterBRezept, 'Advanced Signal Booster B Formula').
text(en, ikarusTreibStoffSystemRezept, 'Ikarus Fuel System Formula').
text(en, exoFahrzeugMinenLaserUpgradeSigmaARezept, 'Exocraft Mining Laser Sigma A Formula').
text(en, exoFahrzeugBordKanoneRezept, 'Exocraft Mounted Cannon Formula').
text(en, umweltKontrollEinheitRezept, 'Environment Control Unit Formula').
text(en, minotaurusRadarAnlageRezept, 'Minotaur Radar Array Formula').
text(en, minotaurusLaserRezept, 'Minotaur Laser Formula').
text(en, osmotischerGeneratorCRezept, 'Osmotic Generator C Formula').
text(en, tethysStrahlRezept, 'Tethys Beam Formula').
text(en, nautilonKanoneRezept, 'Nautilon Cannon Formula').
text(en, exoFahrzeugSignalBoosterUpgradeTauARezept, 'Exocraft Signal Booster Tau A Formula').
text(en, ariadnesFlammeRezept, 'Ariadnes Flame Formula').
text(en, minotaurusPraezisionsLaserRezept, 'Precision Minotaur Laser Formula').
text(en, minotaurusKanoneRezept, 'Minotaur Cannon Formula').
text(en, minotaurusBohrerRezept, 'Minotaur Bore Formula').
text(en, selbstSchmierendeServosRezept, 'Self-Greasing Servos Formula').
text(en, impulsAntriebRezept, 'Pulse Engine Formula').
text(en, teleportEmpfaengerRezept, 'Teleport Receiver Formula').
text(en, hyperAntriebRezept, 'Hyperdrive Formula').
text(en, startSchubDueseRezept, 'Launch Thruster Formula').
text(en, deflektorSchildRezept, 'Deflektor Shield Formula').
text(en, photonenKanoneRezept, 'Photon Cannon Formula').
text(en, konfliktScannerRezept, 'Conflict Scanner Formula').
text(en, wirtschaftsScannerRezept, 'Economy Scanner Formula').
text(en, cadmiumAntriebBRezept, 'Cadmium Drive B Formula').
text(en, effizienteDuesenBRezept, 'Efficient Water Jets B Formula').
text(en, ablativePanzerungCRezept, 'Ablative Armour C Formula').
text(en, nichtlineareOptikCRezept, 'Non-linear Optics C Formula').
text(en, raketenWerferRezept, 'Rocket Launcher Formula').
text(en, phasenStrahlerRezept, 'Phase Beam Formula').
text(en, positronenWerferRezept, 'Positron Ejector Formula').
text(en, infraMesserBeschleunigerRezept, 'Infra-Knife-Accelerator Formula').
text(en, zyklotronBallisteRezept, 'Cyclotron Formula').
text(en, emerilAntriebARezept, 'Emeril Drive A Formula').
text(en, startSystemLadeGeraetSRezept, 'Launch System Recharger S Formula').
text(en, grosseRaketenRohreBRezept, 'Large Rocket Tubes B Formula').
text(en, fourierBegrenzerBRezept, 'Fourier-De-Limiter B Formula').
text(en, fragmentSuperAufladerBRezept, 'Fragment Supercharger B Formula').
text(en, nichtlineareOptikBRezept, 'Non-linear Optics B Formula').
text(en, dysonPumpeBRezept, 'Dyson Pump B Formula').
text(en, indiumAntriebSRezept, 'Indium Drive S Formula').
text(en, analyseVisierRezept, 'Analysis Visor Formula').
text(en, scannerRezept, 'Scanner Formula').
text(en, terrainManipulatorRezept, 'Terrain Manipulator Formula').
text(en, minenLaserRezept, 'Mining Beam Formula').
text(en, blitzWerferRezept, 'Boltcaster Formula').
text(en, eigenesKraftFeldRezept, 'Personal Forcefield Formula').
text(en, fortgeschrittenerMinenLaserARezept, 'Advanced Mining Laser A Formula').
text(en, wellenFormWiederVerwerterBRezept, 'Waveform Recyler B Formula').
text(en, laufIonisatorCRezept, 'Barrel Ionizer C Formula').
text(en, plasmaWerferRezept, 'Plasma Resonator Formula').
text(en, glutSpeerRezept, 'Blaze Javelin Formula').
text(en, streuBlasterRezept, 'Scatter Blaster Formula').
text(en, impulsWerferRezept, 'Pulse Splitter Formula').
text(en, kampfVisierRezept, 'Combat Scope Formula').
text(en, optischerBohrerSRezept, 'Optical Drill S Formula').
text(en, untersuchungsGeraetARezept, 'Survey Device A Formula').
text(en, geologieKanoneRezept, 'Geology Cannon Formula').
text(en, masseBeschleunigerCRezept, 'Mass Accelerator C Formula').
text(en, geschossSchmiererCRezept, 'Shell Greaser C Formula').
text(en, verstaerkteKartuschenCRezept, 'Amplified Cartridges C Formula').
text(en, instabilitaetsAntriebARezept, 'Instability Drive A Formula').
text(en, unterLichtVerstaerkerSRezept, 'Sub-Light Amplifier S Formula').
text(en, notFallWarpEinheitARezept, 'Emergency Warp Unit A Formula').
text(en, solarStrahlRezept, 'solar Ray Formula').
text(en, gemuetsStrahlRezept, 'Gemütsstrahl Formula').
text(en, basisBergungsKapselRezept, 'Base Salvage Capsule Formula').
text(en, kommunikationsStationRezept, 'Communications Station Formula').
text(en, autonomeBergBauEinheitRezept, 'Autonomous Mining Unit formula').
text(en, atmosphaerenVerarbeitungsAnlageRezept, 'Atmosphere Harvester Formula').
text(en, nachrichtenModulRezept, 'Message Module Formula').
text(en, basisComputerRezept, 'Base Computer Formula').
text(en, konstruktionsForschungsStationRezept, 'Construction Research Station Formula').
text(en, tragbareRaffinerieRezept, 'Portable Refinery Formula').
text(en, speicherPunktRezept, 'Save Point Formula').
text(en, verschlosseneKisteRezept, 'Locked Crate Formula').
text(en, konstruktionsTerminalRezept, 'Construction Terminal Formula').
text(en, exoFahrzeugTerminalRezept, 'Exocraft Terminal Formula').
text(en, waffenTerminalRezept, 'Weapon Terminal Formula').
text(en, wissenschaftsTerminalRezept, 'Research Formula').
text(en, landwirtschaftsTerminalRezept, 'Agricultural Formula').
text(en, flottenKommandoRaumRezept, 'Fleet Command Room Formula').
text(en, grosserFrachterRaumRezept, 'Large Freighter Room Formula').
text(en, frachterKorridorRezept, 'Freighter Corridor Formula').
text(en, gebogenerFrachterKorridorRezept, 'Curved Freighter Corridor Formula').
text(en, frachterKreuzungDreiFachRezept, 'Freighter Junction Formula').
text(en, frachterTreppeRezept, 'Freighter Stairs Formula').
text(en, frachterKreuzungVierFachRezept, 'Freighter Cross Junction Formula').
text(en, zylindrischerRaumRezept, 'Cylindric Room Formula').
text(en, quadratischerRaumRezept, 'Square Room Formula').
text(en, geraderKorridorRezept, 'Straight Corridor Formula').
text(en, tuerRezept, 'Door Formula').
text(en, fundamentRezept, 'Foundation Formula').
text(en, lFoermigerKorridorRezept, 'L Shaped Corridor Formula').
text(en, korridorMitGlasDachRezept, 'Glass Corridor Formula').
text(en, holoTuerRezept, 'Holo Door Formula').
text(en, zugangsRampeRezept, 'Access Ramp Formula').
text(en, pflasterungVierFachRezept, 'Quad Paving Formula').
text(en, viererFundamentStrebeRezept, 'Foundation Quad Formula').
text(en, fundamentStrebeRezept, 'Foundation Strut Formula').
text(en, zylindrischerRaumRahmenRezept, 'Cylindric Room Frame Formula').
text(en, tFoermigerKorridorRezept, 'T Shaped Corridor Formula').
text(en, xFoermigerKorridorRezept, 'X Shaped Corridor Formula').
text(en, korridorFensterRezept, 'Corridor Window Formula').
text(en, bioKuppelRaumRezept, 'Bio Dome Formula').
text(en, gebogenerKorridorRezept, 'Curved Corridor Formula').
text(en, leiterRezept, 'Climb Ladder Formula').
text(en, pflasterungRezept, 'Paving Formula').
text(en, pflasterungPodestRezept, 'Platform Paving Formula').
text(en, grossesGlasPaneelRezept, 'Large Glass Panel Formula').
text(en, aussichtsKugelRezept, 'Viewing Sphere Formula').
text(en, wuerfelFoermigerRaumRezept, 'Cuboid Room Formula').
text(en, wuerfelRaumFundamentStrebeRezept, 'Cuboid Foundation Strut Formula').
text(en, gewoelbteWuerfelFoermigeWandRezept, 'Curved Cuboid Wall Formula').
text(en, wuerfelFoermigerGlasRaumRezept, 'Cuboid Glass Room Formula').
text(en, wuerfelFoermigerRaumRahmenRezept, 'Cuboid Room Frame Formula').
text(en, wuerfelFoermigerRaumBodenRezept, 'Cuboid Flooring Formula').
text(en, wuerfelRaumViererFundamentStrebeRezept, 'Cuboid Room Strut Quad Formula').
text(en, innenTreppenRezept, 'Interior Stairs Formula').
text(en, wuerfelFoermigeInnenWandRezept, 'Cuboid Inner Wall Formula').
text(en, wuerfelFoermigerDachAufsatzRezept, 'Cuboid Cap Formula').
text(en, gewoelbtesWuerfelFoermigesDachRezept, 'Cuboid Curved Roof Formula').
text(en, wuerfelFoermigesFensterEckigRezept, 'Cuboid Window Angular Formula').
text(en, wuerfelFoermigesFensterRundRezept, 'Cuboid Window Round Formula').
text(en, infraStrukturLeiterRezept, 'Infrastructure Ladder Formula').
text(en, wuerfelFoermigeInnenTuerRezept, 'Cuboid Inner Door Formula').
text(en, basisTelePorterModulRezept, 'Base Teleporter Modul Formula').
text(en, bioTreibStoffReaktorRezept, 'Biofuel Reactor Formula').
text(en, elektrischeTarneinheitRezept, 'Electrical Cloaking Unit Formula').
text(en, speicherSignalRezept, 'Save Beacon Formula').
text(en, gesundheitsStationRezept, 'Health Station Formula').
text(en, signalBoosterRezept, 'Signal Booster Formula').
text(en, gefahrenSchutzEinheitRezept, 'Hazard Protection Unit Formula').
text(en, naehrStoffProzessorRezept, 'Nutrient Processor Formula').
text(en, lagerBehaelter0Rezept, 'Storage Container 0 Formula').
text(en, lagerBehaelter1Rezept, 'Storage Container 1 Formula').
text(en, lagerBehaelter2Rezept, 'Storage Container 2 Formula').
text(en, lagerBehaelter3Rezept, 'Storage Container 3 Formula').
text(en, lagerBehaelter4Rezept, 'Storage Container 4 Formula').
text(en, lagerBehaelter5Rezept, 'Storage Container 5 Formula').
text(en, lagerBehaelter6Rezept, 'Storage Container 6 Formula').
text(en, lagerBehaelter7Rezept, 'Storage Container 7 Formula').
text(en, lagerBehaelter8Rezept, 'Storage Container 8 Formula').
text(en, lagerBehaelter9Rezept, 'Storage Container 9 Formula').
text(en, aussehenModifikatorRezept, 'Appearance Modifier Formula').
text(en, landeFeldRezept, 'Landing Pad Formula').
text(en, nutzTierEinheitRezept, 'Livestock Unit Formula').
text(en, automatischerFuettererRezept, 'Automatted Feeder Formula').
text(en, terminalDesGalaktischenMarktesRezept, 'Galactic Trade Terminal Formula').
text(en, kurzStreckenTelePorterRezept, 'Short Range Teleporter Formula').
text(en, mittlereRaffinerieRezept, 'Medium Refinery Formula').
text(en, grosseRaffinerieRezept, 'Large Refiner Formula').
text(en, antiMaterieReaktorRezept, 'Antimatter Reaktor Formula').
text(en, roamerGeoBuchtRezept, 'Roamer Geobay Formula').
text(en, nomadenGeoBuchtRezept, 'Nomaden Geobay Formula').
text(en, exoFahrzeugRufStationRezept, 'Exocraft Summoning Station Formula').
text(en, nautilonKammerRezept, 'Nautilon Chamber Formula').
text(en, pilgerGeoBuchtRezept, 'Pilgrim Geobay Formula').
text(en, kolossGeoBuchtRezept, 'Colossus Geobay Formula').
text(en, minotaurusGeoBuchtRezept, 'Minotaur Geobay Formula').
text(en, rennInitiatorRezept, 'Race Initiator Formula').
text(en, rennHindernisRezept, 'Race Obstacle Formula').
text(en, rennKraftVerstaerkerRezept, 'Race Force Amplifier Formula').
text(en, tiefSeeKammerRezept, 'Deep Water Chamber Formula').
text(en, meeresUnterSchlupfRezept, 'Marine Shelter Formula').
text(en, glasTunnelRezept, 'Glass Tunnel Formula').
text(en, quadratischeTiefSeeKammerRezept, 'Quadratic Deepwater Chamber Formula').
text(en, wasserDichteTuerRezept, 'Watertight Door Formula').
text(en, lFoermigerGlasTunnelRezept, 'L Shaped Glass Tunnel Formula').
text(en, vertikalerGlasTunnelRezept, 'Vertical Glass Tunnel Formula').
text(en, mondTeichBodenRezept, 'Marine Pool Floor Formula').
text(en, tFoermigerGlasTunnelRezept, 'T Shaped Glass Tunnel Formula').
text(en, xFoermigerGlasTunnelRezept, 'X Shaped Glass Tunnel Formula').
text(en, motivStilisiertesRRezept, 'Decal stylized R Formula').
text(en, motivRundPipetteRezept, 'Decal Round Pipette Formula').
text(en, motivFaltungDuennDickRezept, 'Decal Folding Thin Thick Formula').
text(en, motivZiegelSteineRezept, 'Decal Bricks Formula').
text(en, motivRadioAktivGrauRezept, 'Decal Radioactive Grey Formula').
text(en, motivGrabSteinRezept, 'Decal Tumbstone Formula').
text(en, motivHelloGamesRezept, 'Decal Hello Games Formula').
text(en, motivBuegelRezept, 'Decal Stirrup Formula').
text(en, motivNo0Rezept, 'Decal No 0 Formula').
text(en, motivNo1Rezept, 'Decal No 1 Formula').
text(en, motivNo2Rezept, 'Decal No 2 Formula').
text(en, motivNo3Rezept, 'Decal No 3 Formula').
text(en, motivNo4Rezept, 'Decal No 4 Formula').
text(en, motivNo5Rezept, 'Decal No 5 Formula').
text(en, motivNo6Rezept, 'Decal No 6 Formula').
text(en, motivNo7Rezept, 'Decal No 7 Formula').
text(en, motivNo8Rezept, 'Decal No 8 Formula').
text(en, motivNo9Rezept, 'Decal No 9 Formula').
text(en, motivSchildErstochenerVogelRezept, 'Decal Plate Stabbed Bird Formula').
text(en, motivSchildGrünerMannRezept, 'Decal Shield Green Man Formula').
text(en, motivSchildKorvaxRezept, 'Decal Shield KorvaxFormula').
text(en, motivFroschSackRezept, 'Decal Frog Sac Formula').
text(en, motivLaemmchenRezept, 'Decal Lambkin Formula').
text(en, wandBildSchirmRezept, 'Wall Screen Formula').
text(en, wandVentilatorRezept, 'Wall Ventilator Formula').
text(en, gruenerWandBildSchirmRezept, 'Green Wall Screen Formula').
text(en, schubLadenSchrankRezept, 'Drawers Formula').
text(en, wandEinheitRezept, 'Wall Unit Formula').
text(en, lagerModulDekoRezept, 'Storage Container Formula').
text(en, deckenPaneelRezept, 'Ceiling Panel Formula').
text(en, techBedienFeldRezept, 'Tech Panel Formula').
text(en, serverRezept, 'Server Formula').
text(en, kanisterRegalRezept, 'Cannister Shelf Formula').
text(en, kleineKisteRezept, 'Small Crate Formula').
text(en, schliessFachRezept, 'Locker Formula').
text(en, flachesModulRezept, 'Flat Module Formula').
text(en, seitenModulRezept, 'Side Module Formula').
text(en, regalModulRezept, 'Rack Module Formula').
text(en, roboterArmRezept, 'Roboterarm Formula').
text(en, waffenRegalRezept, 'Weapon Shelf Formula').
text(en, oszilloskopRezept, 'Oscilloscope Formula').
text(en, achtEckSchrankRezept, 'Octagonal Corner Cupboard Formula').
text(en, fassFoermigerFabrikatorRezept, 'Barrel Fabricator Formula').
text(en, hoherSchrankRezept, 'High Closet Formula').
text(en, kistenFoermigerFabrikatorRezept, 'Krate Fabricator Formula').
text(en, schalenSitzStuhlRezept, 'Bucket Seat Chair Formula').
text(en, stuhlFriseurRezept, 'Hairdresser Chair Formula').
text(en, stuhlEckigRezept, 'Angled Chair Formula').
text(en, flagge1Rezept, 'Flag 1 Formula').
text(en, tischRezept, 'Table Formula').
text(en, tischSechsEckigRezept, 'Hexagonal Table Formula').
text(en, bettRezept, 'Bed Formula').
text(en, sofaRezept, 'Sofa Formula').
text(en, flagge2Rezept, 'Flag 2 Formula').
text(en, wandFlagge1Rezept, 'Wall Flag 1 Formula').
text(en, einfacherSchreibTischRezept, 'Simple Desk Formula').
text(en, ergonomischesSofaRezept, 'Ergonomic Sofa Formula').
text(en, eckSofaRezept, 'Corner Sofa Formula').
text(en, flagge3Rezept, 'Flag 3 Formula').
text(en, flagge4Rezept, 'Flag 4 Formula').
text(en, wandFlagge3Rezept, 'Wall Flag 3 Formula').
text(en, wandFlagge2Rezept, 'Wall Flag 2 Formula').
text(en, bodenMatteRezept, 'Floor Mat Formula').
text(en, grosseMonitorStationRezept, 'Large Monitor Formula').
text(en, gewoelbterTischRezept, 'Curved Desk Formula').
text(en, monitorStationRezept, 'Monitor Station Formula').
text(en, arbeitsPlatteRezept, 'Worktop Formula').
text(en, leichterTischRezept, 'Light Table Formula').
text(en, lichtHandLampeRezept, 'Hand Lamp Formula').
text(en, weisseLeuchteRezept, 'While Light Formula').
text(en, lichtStehLampeEckigRezept, 'Angled Foot Lamp Formula').
text(en, laborLampeRezept, 'Labor Light Formula').
text(en, blaueLeuchteRezept, 'Blue Light Formula').
text(en, pinkeLeuchteRezept, 'Pink Light Formula').
text(en, lichtStehLampeRundRezept, 'Floor Light Round Formula').
text(en, lichtStehLampeSchirmRezept, 'Floor Light Shade Formula').
text(en, deckenLeuchteRezept, 'Ceiling Light Formula').
text(en, gelbeLeuchteRezept, 'Yellow Light Formula').
text(en, grueneLeuchteRezept, 'Green Light Formula').
text(en, roteLeuchteRezept, 'Red Light Formula').
text(en, byteBeatSchaltungRezept, 'Bytebeat Switch Formula').
text(en, mineralienExtraktorRezept, 'Mineral Extractor Formula').
text(en, wandSchalterRezept, 'Wall Switch Formula').
text(en, solarModulRezept, 'Solar Panel Formula').
text(en, batterieRezept, 'Battery Formula').
text(en, gasExtraktorRezept, 'Gas Extractor Formula').
text(en, versorgungsDepotRezept, 'Supply Depot Formula').
text(en, versorgungsRohrRezept, 'Versorgungsrohr Formula').
text(en, bodenSchalterRezept, 'Floor Switch Formula').
text(en, annaeherungsSchalterRezept, 'Proximity Switch Formula').
text(en, schalterRezept, 'Switch Formula').
text(en, energieUmkehrerRezept, 'Power Inverter Formula').
text(en, elektroMagnetischerGeneratorRezept, 'Electromagnetic Generator Formula').
text(en, hydroKulturTrogRezept, 'Hydroponic Tray Formula').
text(en, topfPflanzeRezept, 'Potted Plant Formula').
text(en, grosserHydroKulturTrogRezept, 'Large Hydroponic Tray Formula').
text(en, pilzGeflechtRezept, 'Fungal Cluster Formula').
text(en, frostWurzRezept, 'Frostwort Formula').
text(en, gammaGrasRezept, 'Gamma Weed Formula').
text(en, echinoKaktusRezept, 'Echinocactus Formula').
text(en, sternenDornRezept, 'Star Bramble Formula').
text(en, sonnenRebeRezept, 'Solar Vine Formula').
text(en, floraBehaelterHochBeetRezept, 'Flora Containment Raised Formula').
text(en, floraBehaelterKastenRezept, 'Flora Containment Box Formula').
text(en, floraBehaelterTubusRezept, 'Flora Containment Tube Formula').
text(en, giftIgelRezept, 'Venom Urchin Formula').
text(en, gravitinoWirtRezept, 'Gravitino Host Formula').
text(en, magenKrampfBlumeRezept, 'Gutrot Flower Formula').
text(en, morditWurzelRezept, 'Mordite Root Formula').
text(en, eiweissPerlenKugelRezept, 'Albumen Pearl Orb Formula').
text(en, nipNipRezept, 'Nipnip Formula').
text(en, holzWandRezept, 'Wooden Wall Formula').
text(en, holzBodenPlatteRezept, 'Wood Floor Panel Formula').
text(en, duenneHolzWandRezept, 'Thin Wooden Wall Formula').
text(en, holzTuerRahmenRezept, 'Wooden Door Frame Formula').
text(en, holzDachRezept, 'Wooden Roof Formula').
text(en, glasPlatteMitHolzRahmenRezept, 'Wood Framed Glass Formula').
text(en, holzRampeRezept, 'Wooden Ramp Formula').
text(en, kleineHolzPlatteRezept, 'Small wooden Panel Formula').
text(en, schraegeHolzPlatteRezept, 'Sloping Wood Panel Formula').
text(en, kleineHolzWandRezept, 'Small Wooden Wall Formula').
text(en, holzFensterRezept, 'Wooden Window Formula').
text(en, holzTuerRezept, 'Wooden Doorway Formula').
text(en, elektrischeHolzTuerRezept, 'Wooden Power Door Formula').
text(en, holzDachPlatteRezept, 'Wooden Roof Panel Formula').
text(en, holzDachEckStueckRezept, 'Wooden Roof Corner Formula').
text(en, holzBogenRezept, 'Wooden Arch Formula').
text(en, halbeHolzRampeRezept, 'Wooden Half Ramp Formula').
text(en, kurzeHolzWandRezept, 'Short Wooden Wall Formula').
text(en, holzFassadeRezept, 'Wooden Frontage Formula').
text(en, kleineHolzTuerRezept, 'Small Doorway Formula').
text(en, dachInnenEckteilAusHolzRezept, 'Wooden Inner Roof Corner Formula').
text(en, halberHolzBogenRezept, 'ooden Half Arch Formula').
text(en, metallWandRezept, 'Metal Wall Formula').
text(en, metallBodenPlatteRezept, 'Metal Floor Formula').
text(en, duenneMetallWandRezept, 'Thin Metal Formula').
text(en, metallTuerRahmenRezept, 'Metal Door Frame Formula').
text(en, metallDachRezept, 'Metal Roof Formula').
text(en, glasPlatteMitMetallRahmenRezept, 'Metal Framed Glass Panel Formula').
text(en, metallRampeRezept, 'Metal Ramp Formula').
text(en, kleineMetallPlatteRezept, 'Small Metal Panel Formula').
text(en, schraegeMetallPlatteRezept, 'Sloping Metal Panel Formula').
text(en, kleineMetallWandRezept, 'Small Metal walld Formula').
text(en, metallFensterRezept, 'Metal Window Formula').
text(en, metallTuerRezept, 'Metal Doorway Formula').
text(en, elektrischeMetallTuerRezept, 'Metal Power Door Formula').
text(en, metallDachPlatteRezept, 'Metal Roof Panel Formula').
text(en, metallDachEckStueckRezept, 'Metal Roof Corner Formula').
text(en, metallBogenRezept, 'Metal Arch Formula').
text(en, halbeMetallRampeRezept, 'Half Metal Ramp Formula').
text(en, kurzeMetallWandRezept, 'Short Metal Wall Formula').
text(en, metallFassadeRezept, 'Metal Frontage Formula').
text(en, kleineMetallTuerRezept, 'Small Metal Door Formula').
text(en, dachInnenEckteilAusMetallRezept, 'Metal Inner Roof Corner Formula').
text(en, halberMetallBogenRezept, 'Metal Half Arch Formula').
text(en, betonWandRezept, 'Concrete Wall Formula').
text(en, betonBodenPlatteRezept, 'Concrete Floor Panel Formula').
text(en, duenneBetonWandRezept, 'Thin Concrete Wall Formula').
text(en, betonTuerRahmenRezept, 'Concrete Door Frame Formula').
text(en, betonDachRezept, 'Concrete Roof Formula').
text(en, glasPlatteMitBetonRahmenRezept, 'Concrete Framed Glass Panel Formula').
text(en, betonRampeRezept, 'Concrete Ramp Formula').
text(en, kleineBetonBodenPlatteRezept, 'Small Concrete Panel Formula').
text(en, schraegeBetonPlatteRezept, 'Sloping Concrete Panel Formula').
text(en, kleineBetonWandRezept, 'Small Concrete Wall Formula').
text(en, betonFensterRezept, 'Concrete Window Formula').
text(en, betonTuerRezept, 'Concrete Door Formula').
text(en, elektrischeBetonTuerRezept, 'Concrete Power Door Formula').
text(en, betonDachPlatteRezept, 'Concrete Roof Panel Formula').
text(en, betonDachEckStueckRezept, 'Concrete Roof Corner Formula').
text(en, betonBogenRezept, 'Concrete Arch Formula').
text(en, halbeBetonRampeRezept, 'Half Concrete Ramp Formula').
text(en, kurzeBetonWandRezept, 'Short Concrete Wall Formula').
text(en, betonFassadeRezept, 'Concrete Frontage Formula').
text(en, kleineBetonTuerRezept, 'Small Concrete Door Formula').
text(en, dachInnenEckteilAusBetonRezept, 'Concrete Inner Roof Corner Formula').
text(en, halberBetonBogenRezept, 'Concrete Half Arch Formula').
text(en, grosserKeilRezept, 'Large Wedge Formula').
text(en, kleinerKeilRezept, 'Small Wedge Formula').
text(en, rohrRezept, 'Pipe Formula').
text(en, pyramideRezept, 'Pyramid Formula').
text(en, gebogenesRohrRezept, 'Curved Pipe Formula').
text(en, stabilerWuerfelRezept, 'Solid Cube Formula').
text(en, zylinderRezept, 'Cylinder Formula').
text(en, wuerfelRezept, 'Cube Formula').
text(en, kugelRezept, 'Sphere Formula').
text(en, holzDreieckRezept, 'Wooden Triangle Formula').
text(en, kleinesHolzDreieckRezept, 'Small Wooden Triangle Formula').
text(en, metallDreieckRezept, 'Metal Triangle Formula').
text(en, kleinesMetallDreieckRezept, 'Small Metal Triangle Formula').
text(en, betonDreieckRezept, 'Concrete Traingle Formula').
text(en, kleinesBetonDreieckRezept, 'Small Concrete Triangle Formula').
text(en, lichtBoxRezept, 'Light Box Formula').
text(en, leuchtBodenRezept, 'Light Floor Formula').
text(en, geraeuschBoxRezept, 'Noise Box Formula').
text(en, kugelErzeugerRezept, 'Sphere Creator Formula').
text(en, lagerModulRezept, 'Storage Module Formula').
text(en, automatischerSchalterRezept, 'Auto Switch Formula').
text(en, stehenderPflanzenBehaelterRezept, 'Standing Planter Formula').
text(en, sauerStoffVerarbeiterRezept, 'Oxygen Harvester Formula').
text(en, tentakelSpitzeRezept, 'Tentacle Spire Formula').
text(en, wachsameWoelbungRezept, 'Watchful Protrusion Formula').
text(en, blasenBildenderPilzRezept, 'Blistering Mushroom Formula').
text(en, uraltesNadelGehoelzRezept, 'Ancient Conifer Formula').
text(en, gefrorenerPflanzenBehaelterRezept, 'Frozen Planter Formula').
text(en, robusterStrauchRezept, 'Hardy Shrub Formula').
text(en, mineralBogenRezept, 'Mineral Arch Formula').
text(en, edelSteinFelsRezept, 'Gem-Encrusted Rock Formula').
text(en, meeresGesteinRezept, 'Marine Rock Formula').
text(en, terrariumRezept, 'Terrarium Formula').
text(en, segelPalmeRezept, 'Sail Palm Formula').
text(en, kugelBaumRezept, 'Globe Tree Formula').
text(en, steinGartenRezept, 'Rock Garden Formula').
text(en, taschenRealitaetsGeneratorRezept, 'Pocket Reality Generator Formula').
text(en, krauseKoralleRezept, 'Curly Coral Formula').
text(en, wasserKristallRezept, 'Aquatic Crystal Formula').
text(en, kronLeuchterBlueteRezept, 'Candelabra Bloom Formula').
text(en, rankenFuesserRezept, 'Barnacle Formula').
text(en, kleinesAquariumRezept, 'Small Aquarium Formula').
text(en, bronzeneAtlasStatueRezept, 'Bronze Atlas Figurine Formula').
text(en, silberneAtlasStatueRezept, 'Silver Atlas Figurine Formula').
text(en, goldeneAtlasStatueRezept, 'Gold Atlas Figurine Formula').
text(en, fleischFressenderStrauchRezept, 'Carnivorous Bush Formula').
text(en, zwergPalmeRezept, 'Dwarf Palm Formula').
text(en, kurioserMaisRezept, 'Curious Corn Formula').
text(en, bronzeneJaegerStatueRezept, 'Bronze Fighter Figurine Formula').
text(en, silberneJaegerStatueRezept, 'Silver Fighter Figurine Formula').
text(en, goldeneJaegerStatueRezept, 'Gold Fighter Figurine Formula').
text(en, expansionsWuerfelGeraetRezept, 'Expanding Cuboid Device Formula').
text(en, roboterBegleiterRezept, 'Robotic Companion Formula').
text(en, kugelHologrammGeraetRezept, 'Holograpic Globe Gadged Formula').
text(en, artemisMotivRezept, 'Artemis Decal Formula').
text(en, nullMotivRezept, 'Null Decal Formula').
text(en, fruechteBaumRezept, 'Fruit Tree Formula').
text(en, spindelBaumRezept, 'Spindle Tree Formula').
text(en, immerGruenBaumRezept, 'Evergreen Tree Formula').
text(en, apolloMotivRezept, 'Apollo Decal Formula').
text(en, bronzeneDiploStatueRezept, 'Bronze Diplo Statue Formula').
text(en, silberneDiploStatueRezept, 'Silver Diplo Statue Formula').
text(en, goldeneDiploStatueRezept, 'Gold Diplo Statue Formula').
text(en, nadaMotivRezept, 'Nada Decal Formula').
text(en, poloMotivRezept, 'Polo Decal Formula').
text(en, bronzeneKampfLaeuferStatueRezept, 'Bronze Walker Figurine Formula').
text(en, silberneKampfLaeuferStatueRezept, 'Silver Walker Figurine Formula').
text(en, goldeneKampfLaeuferStatueRezept, 'Gold Walker Figurine Formula').
text(en, bronzeneGekStatueRezept, 'Bronze Gek Statue Formula').
text(en, silberneGekStatueRezept, 'Silver Gek Statue Formula').
text(en, goldeneGekStatueRezept, 'Gold Gek Statue Formula').
text(en, anomalieMotivRezept, 'Anomaly Decal Formula').
text(en, galaktischerHubMotivRezept, 'Galactic Hub Decal Formula').
text(en, umschlingenderBaumRezept, 'Entwining Tree Formula').
text(en, regenSchirmBaumRezept, 'Umbrella Tree Formula').
text(en, windenderStrauchRezept, 'Writhing Bush Formula').
text(en, nadaFigurRezept, 'Nada Figurine Formula').
text(en, poloFigurRezept, 'Polo Figurine Formula').
text(en, zustimmendeHandbewegungMotivRezept, 'Hand Of Approvement Decal Formula').
text(en, bronzeneKreaturStatueRezept, 'Bronze Blob Formula').
text(en, silberneKreaturStatueRezept, 'Silver Blob Formula').
text(en, goldeneKreaturStatueRezept, 'Gold Blob Formula').
text(en, bronzeneAstronautenStatueRezept, 'Bronze Astronaut Figurine Formula').
text(en, silberneAstronautenStatueRezept, 'Silver Astronaut Figurine Formula').
text(en, goldeneAstronautenStatueRezept, 'Gold Astronaut Figurine Formula').
text(en, erinnerungRezept, 'Memory Formula').


text(en, chromatischesMetall, 'Chromatic Metal').
text(en, faecium, 'Faecium').
text(en, frostKristall, 'Frost Crystal').
text(en, gammaWurzel, 'Gamma Root').
text(en, hypnotischesAuge, 'Hypnotic eye').
text(en, kaktusFleisch, 'Cactus Flesh').
text(en, kelpBeutel, 'Kelp sac').
text(en, kohlenStoff, 'Carbon').
text(en, kuerbisKnolle, 'Marrow Bulb').
text(en, mordit, 'Mordit').
text(en, pilzSchimmel, 'Fungal Mould').
text(en, salz, 'Salt').
text(en, solanium, 'Solanium').
text(en, sternenKnolle, 'Star Bulb').
text(en, verdichteterKohlenStoff, 'Condensed Carbon').
text(en, kohlenStoffNanoRohr, 'Carbon Nanotubes').
text(en, kreaturenKugeln, 'Creature Pellets').
text(en, abgruendigerEintopf, 'Abyssal Stew').
text(en, alarmierendeTorte, 'Alarming Tart').
text(en, aloeFleisch, 'Aloe Flesh').
text(en, anormaleMarmelade, 'Anomalous Jam').
text(en, anormaleTorte, 'Anomalous Tart').
text(en, anormalerDonut, 'Anomalous Doughnut').
text(en, apfelEisCreme, 'Apple Ice Cream').
text(en, apfelKuchenVerlorenerSeelen, 'Apple Cake of Lost Souls').
text(en, apfelKuriositaet, 'Apple Curiosity').
text(en, balastStoffReichePastete, 'High-Fibre Pie').
text(en, beinFleisch, 'Leg Meat').
text(en, beineImTeigMantel, 'Legs-in-Pastry').
text(en, bitterSuesserKakao, 'Bittersweet Cocoa').
text(en, blutigesOrgan, 'Bloody Organ').
text(en, brandKuchenDesGrauens, 'Cake of Burning Dread').
text(en, bratOel, 'Clarified Oil').
text(en, brot, 'Bread').
text(en, brueterTorte, 'The Spawning Pie').
text(en, cremigeSosse, 'Creamy Sauce').
text(en, delikatessBaiser, 'Delicate Meringue').
text(en, derMerkWuerdigsteKuchen, 'Most Curious Cake').
text(en, derStellarator, 'The Stellarator').
text(en, dickerFleischEintopf, 'Thick Meat Stew').
text(en, dickerSuesserTeig, 'Thick Sweet Batter').
text(en, diploStuecke, 'Diplo Chunks').
text(en, duftendeKraeuter, 'Scented Herbs').
text(en, eisCreme, 'Ice Cream').
text(en, eisSchreie, 'Iced Screams').
text(en, engelsObstKuchen, 'Angelic Fruit Cake').
text(en, entfesselteMonstrositaet, 'Unbound Monstrousity').
text(en, entfesseltesSahneHorn, 'Unbound Cream Horn').
text(en, entsetzlicherMarmeladenSchwamm, 'Appalling Jam Sponge').
text(en, enzymFluessigkeit, 'Enzyme Fluid').
text(en, erfrischungsGetraenk, 'Refreshing Drink').
text(en, ewigSiedenderKuchen, 'Ever Boiling Cake').
text(en, ewigeEisCreme, 'Perpetual Ice Cream').
text(en, ewigerHonigKuchen, 'Perpetual Honey Cake').
text(en, ewigerKuchen, 'Perpetual Cake').
text(en, ewigesMarmeladenBiskuit, 'Perpetual Jam Fluffer').
text(en, extraFluffigerTeig, 'Extra Fluffy Batter').
text(en, fasrigerEintopf, 'Fibrous Stew').
text(en, fellKnaeuelGelee, 'Furball Jelly').
text(en, fellTorteInAspik, 'Fur Tart in Aspik').
text(en, fermentierteFruechte, 'Fermented Fruit').
text(en, festerFettKuchen, 'Solidified Grease Cake').
text(en, feuerBeere, 'Fireberry').
text(en, feuerWasser, 'Fire Water').
text(en, feurigeMarmeladenUeberraschung, 'feurige Marmeladenüberraschung').
text(en, feurigesMarmeladenBiskuit, 'Burning Jam Fluffer').
text(en, fischPastete, 'Fish Pie').
text(en, fleischFlocken, 'Meat Flakes').
text(en, fleischMitGewurzKruste, 'Herb-Encrusted Meat').
text(en, fleischigeFluegel, 'Meaty Wings').
text(en, fleischigeStuecke, 'Meaty Chunks').
text(en, fleischigeWurzeln, 'Pulpy Roots').
text(en, fluechtigeSchokoTorte, 'Volatile Chocolate Fancy').
text(en, fluesterndesOmelett, 'Whispering Omelette').
text(en, fluffigeKaramellFreude, 'Fluffy Caramel Delight').
text(en, fluffigerRachenSpalter, 'Fluffy Throatripper').
text(en, fragwuerdigerSuesserKuchen, 'Questionably sweet cake').
text(en, frischeMilch, 'Fresh Milk').
text(en, fruchtEisCreme, 'Fruity Ice Cream').
text(en, fruchtigerPudding, 'Fruity Pudding').
text(en, funkelnderHonigKuchen, 'Glittering Honey Cake').
text(en, gebackeneEier, 'Baked Eggs').
text(en, gebaeck, 'Pastry').
text(en, geduenstetesGemuese, 'Steamed Vegetables').
text(en, gefroreneKnollen, 'Frozen Tubers').
text(en, gefuellteOrgane, 'Stewed Organs').
text(en, geheimnisVolleFleischPastete, 'Mystery Meat Pie').
text(en, geheimnisVollerFleischEintopf, 'Mystery Meat Stew').
text(en, gemueseCremeSuppe, 'Cream of Vegetable Soup').
text(en, gequaelterHonigKuchen, 'Tortured Honey Cake').
text(en, geraeucherteFleischPastete, 'Smokey Meat Pie').
text(en, geraeuchertesFleisch, 'Smoked Meat').
text(en, geschlageneButter, 'Churned Butter').
text(en, geschmorteOrgane, 'Devilled Organs').
text(en, gestampfteWurzelPastete, 'Mushed Root Pie').
text(en, gesuessteButter, 'Sweetened Butter').
text(en, gesuessteProtoButter, 'Sweetened Proto-Butter').
text(en, gesuessterKompost, 'Sweetened Compost').
text(en, gewuerzterApfelKuchen, 'Spiced Apple Cake').
text(en, glasKoerner, 'Glass Grains').
text(en, glasKuchen, 'Cake of Glass').
text(en, grahBeere, 'Grahberry').
text(en, grahmeLade, 'Grah Jam').
text(en, grosseEier, 'Tall Eggs').
text(en, hackFleisch, 'Ground Meat').
text(en, halbFluessigerKaese, 'Partially-liquid Cheese').
text(en, heimgesuchtePastete, 'heimgesuchte Pastete').
text(en, heimgesuchteSchokoTraeume, 'heimgesuchte Schokoträume').
text(en, heisseSosse, 'Scorching Sauce').
text(en, heptaploidWeizen, 'Heptaploid Wheat').
text(en, heulenderKaramellKuchen, 'Wailing Caramel Cake').
text(en, heulenderTeig, 'Wailing Batter').
text(en, hexaBeere, 'Hexaberry').
text(en, holzApfel, 'Crab Apple').
text(en, honigButter, 'Honey Butter').
text(en, honigButterDonut, 'Honeybutter Doughnut').
text(en, honigDonut, 'Honey Doughnut').
text(en, honigEisCreme, 'Honey Ice Cream').
text(en, honigEngelKuchen, 'Honied Angel Cake').
text(en, honigKuchenMitSalz, 'Salt-laced Honey Cake').
text(en, honigTorte, 'Honey Tart').
text(en, immerBrennendeMarmelade, 'Ever-burning Jam').
text(en, impulsBohnen, 'Impulse Beans').
text(en, innereienBeutel, 'Offal Sac').
text(en, interStellareKuriositaet, 'Interstellar Curiosity').
text(en, interStellareTorte, 'Interstellar Fancy').
text(en, jadeErbsen, 'Jade Peas').
text(en, kaeseFleischEintopf, 'Cheese-and-Flesh Stew').
text(en, kaeseGemuesePastete, 'Cheesy Vegetable Pie').
text(en, kaeseTorte, 'Baked Cheese Tart').
text(en, kakaoDonut, 'Cocoa Doughnut').
text(en, kakaoTorte, 'Cocoa Tart').
text(en, kaktusGelee, 'Cactus Jelly').
text(en, kaktusNektar, 'Caktus Nectar').
text(en, karamellDonut, 'Caramel Doughnut').
text(en, karamellEisCreme, 'Caramel Ice Cream').
text(en, karamellKuriositaet, 'Caramel Curiosity').
text(en, karamellTorte, 'Caramel Tart').
text(en, karamellisierterAlbTraum, 'Caramelised Nightmare').
text(en, katzenLeber, 'Feline Liver').
text(en, kelpReis, 'Kelp Rice').
text(en, klebrigeButter, 'Gooey Butter').
text(en, klebrigeFruchtUeberraschung, 'Gooey Fruit Surprise').
text(en, klebrigeProtoButter, 'Gooey Protobutter').
text(en, klebrigePuddingTorte, 'Gooey Custard Fancy').
text(en, klebrigerBrueller, 'Gooey Screamer').
text(en, klebrigerHonig, 'Sticky Honey').
text(en, klebrigerKaramellKuchen, 'Gooey Caramel Cake').
text(en, klebrigerProtoDonut, 'Gooey Protodoughnut').
text(en, klebrigerPudding, 'Viscous Custard').
text(en, klebrigerSchokoladenKuchen, 'Gooey Chocolate Cake').
text(en, klebrigesHonigKuechlein, 'Gooey Honey Puff').
text(en, klebrigesMundFeuer, 'Gooey Mouthburner').
text(en, klobigerDonut, 'Gooey Doughnut').
text(en, knusperKaramell, 'Crunchy Caramel').
text(en, koestlicherGemueseEintopf, 'Delicious Vegetable Stew').
text(en, kreaturenEi, 'Creature Egg').
text(en, kriechendesJuckHonigBiskuit, 'Itching creeping honey sponge').
text(en, kuchenDerSuende, 'Cake of Sin').
text(en, kuchenDerVerlorenen, 'Cake of the Lost').
text(en, kuchenMitKaramellKruste, 'Caramel-encrusted Cake').
text(en, kuchenTeig, 'Cake Batter').
text(en, kuenstlicheWuermer, 'Synthetic Worms').
text(en, kuerbisFleisch, 'Marrow Flesh').
text(en, larvenKern, 'Larval Core').
text(en, leopardenFrucht, 'Leopard-Fruit').
text(en, leuchtPastete, 'Glowing Pie').
text(en, marmeladenBiskuit, 'Jam Fluffer').
text(en, marmeladenDonut, 'Jam Doughnut').
text(en, marmeladenKuriositaet, 'Jam Curiosity').
text(en, marmeladenSchleimer, 'Jam Oozers').
text(en, marmeladenTorte, 'Jam Tart').
text(en, monstroeserDonut, 'Monstrous Doughnut').
text(en, monstroeserHonigKuchen, 'Monstrous Honey Cake').
text(en, monstroeserPudding, 'Monstrous Custard').
text(en, omelett, 'Omelette').
text(en, parasitenOmelett, 'Parasitic Omelette').
text(en, pheromonBeutel, 'Pheromone Sac').
text(en, pikanteFleischBaellchen, 'Spicy Fleshballs').
text(en, pilgerBeere, 'Pilgrimberry').
text(en, pilgerElixier, 'Pilgrims Tonic').
text(en, pilzTorte, 'Fungal Tart').
text(en, proteinReicherDonut, 'proteinreicher Doughnut').
text(en, protoButter, 'Proto-Butter').
text(en, protoButterMitHonig, 'Proteinous Doughnut').
text(en, protoKaese, 'Protocheese').
text(en, protoKrapfen, 'Proto Beignet').
text(en, protoKuchenMitHonig, 'Honied Proto-Cake').
text(en, protoOel, 'Proto-Oil').
text(en, protoOmelett, 'Proto-omelette').
text(en, protoSahne, 'Proto-Cream').
text(en, protoTeig, 'Proto-batter').
text(en, protoWurst, 'Proto-sausage').
text(en, protoWurstPastete, 'Proto-sausage pie').
text(en, puddingDonut, 'Custard Doughnut').
text(en, puddingKuriositaet, 'Custard Curiosity').
text(en, puddingTorte, 'Custard Tart').
text(en, rachenKleberMitHonig, 'Honied Throat-sticker').
text(en, rahmOrganSuppe, 'Creamed Organ Soup').
text(en, regisFett, 'Regis Grease').
text(en, riesenEi, 'Giant Egg').
text(en, rohesSteak, 'Raw Steak').
text(en, sahne, 'Cream').
text(en, sahneBroetchen, 'Cream Buns').
text(en, sahneHaeppchen, 'Creamy Treat').
text(en, sahneKuchenDesUntergangs, 'Doomed Cream Cake').
text(en, sahneKuriositaet, 'Cream Curiosity').
text(en, salzigeFischFilets, 'Salty Fingers').
text(en, salzigeKoestlichkeit, 'Briney Delight').
text(en, salzigeUeberraschung, 'Salty Surprise').
text(en, salzigerDonut, 'Salty Doughnut').
text(en, salzigerPudding, 'Salty Custard').
text(en, salzigerRauReif, 'Briney Rime').
text(en, sanfteStachelUeberraschung, 'Soft and Spiky Surprise').
text(en, scharferGemueseEintopf, 'Fiery Vegetable Stew').
text(en, schlaengelndeMarmelade, 'Wriggling Jam').
text(en, schlaengelndeTorte, 'Wriggling Tart').
text(en, schlaengelnderDonut, 'Wriggling Doughnut').
text(en, schokoTraum, 'Chocolate Dream').
text(en, schokoladenEisCreme, 'Chocolate Ice Cream').
text(en, schokoladenKuchen, 'Chocolate Cake').
text(en, schokoladenKuriositaet, 'Chocolate Curiosity').
text(en, schrecklicheklebrigeKoestlichkeit, 'Horryfying gooey Delight').
text(en, schrecklicherBrei, 'Horrifying Mush').
text(en, schreiterWurst, 'Strider Sausage').
text(en, schuppigesFleisch, 'Scaly Meat').
text(en, sievertBohnen, 'Sievert Beans').
text(en, silikonEi, 'Silikon Egg').
text(en, softePuddingTorte, 'Soft Custard Fancy').
text(en, solartillo, 'Solartillo').
text(en, speiseRoehrenUeberraschung, 'Esophageal Surprise').
text(en, stacheligeKuriositaet, 'Prickly Curiosity').
text(en, stacheligeTorte, 'Spikey Tart').
text(en, sternenEisCreme, 'Stellar Ice Cream').
text(en, sternenGeburtKoestlichkeit, 'Starbirth Delight').
text(en, sternenPudding, 'Stellar Custard').
text(en, sternenPuddingTorte, 'Stellar Custard Tart').
text(en, suessWurzel, 'Sweetroot').
text(en, suesseSahneTraeume, 'Sweet Cream Dreams').
text(en, superLeichterSahneKuchen, 'Extra Fluffy Cream Cake').
text(en, synthetischerHonig, 'Synthetic Honey').
text(en, teig, 'Dough').
text(en, toedlichKalteEisCreme, 'Deathly Cold Ice Cream').
text(en, tortenBoden, 'Pie Case').
text(en, traditionsKuchen, 'Traditional Cake').
text(en, ueppigeHonigTorte, 'Honey-soaked Fancy').
text(en, ungiftigerPilz, 'Non-Toxic Mushroom').
text(en, unholdRogen, 'Fiendish Roe').
text(en, unloesbarerMarmeladenSturz, 'Unsolvable Jam Turnover').
text(en, verarbeiteterZucker, 'Processed Sugar').
text(en, verarbeitetesFleisch, 'Processed Meat').
text(en, verfeinertesMehl, 'Refined Flour').
text(en, vyEisCreme, 'Vy Ice Cream').
text(en, warmeProtoMilch, 'Warm Proto-Milk').
text(en, wildeHefe, 'Wild Yeast').
text(en, wildeMilch, 'Wild Milk').
text(en, windenderAufgewuehlterTeig, 'Writhing Roiling Batter').
text(en, windendesMarmeladenKuechlein, 'Writhing Jam Puff').
text(en, wohlSchmeckendeSosse, 'Flavoursome Sauce').
text(en, wuergendesKuchenMonster, 'Choking Monstrosity Cake').
text(en, wuerzigeOrganUeberraschung, 'Tangy Organ Surprise').
text(en, wuerzigerGemueseEintopf, 'Tangy Vegetable Stew').
text(en, wuerzigerKaese, 'Tangy Cheese').
text(en, wuerzigesEis, 'Spiced Ice').
text(en, wurzelSaft, 'Root Juice').
text(en, zaeheOrganPaste, 'Chewy Organ Pie').
text(en, erinnerung, 'Memory').

/* Orte */
text(en, ortNil, 'anywhere').
text(en, ortHauptBasis, 'main base').
text(en, ortWald, 'forest').
text(en, ortBasisTerminus, 'base terminus').
text(en, ortWeltRaum, 'space').
text(en, ortAnomalie, 'anomaly').
text(en, ortRaumStation, 'space station').
text(en, ortWasser, 'water').
text(en, ortAussenPosten, 'outpost').
text(en, ortHandelsStation, 'trade outpost').
text(en, ortNahrungsProzessor, 'food prozessor').
text(en, ortKleineRaffinerie, 'small refinery').
text(en, ortMittlereRaffinerie, 'medium refinery').
text(en, ortGrosseRaffinerie, 'big refinery').
text(en, ortHandelsTerminal, 'trade terminal').
text(en, ortForschungsTerminal, 'research terminal').
text(en, ortFrachter, 'freighter').
text(en, ortSpieler, 'place of player').
text(en, ortBasis, 'base').
text(en, ortSauerStoffVerarbeiter, 'oxigen harvester plant').
text(en, ortAtmosphaerenAnlage, 'atmosphere harvester plant').
text(en, ortBergbauEinheit, 'mining facility').
text(en, ortPlantage, 'plantation').


doppelteSchluesselInText :-
	spielStatus:moeglicheSprache(Sprache),
	findall([Sprache, TextSchluessel], text(Sprache, TextSchluessel, _), TextSchluesselListe),
	sort(TextSchluesselListe, SortedTextSchluesselListe),
	dubChk(TextSchluesselListe, SortedTextSchluesselListe, Doppelte),
	Doppelte \= [],
	format('~nSchlüssel ~k sind doppelt~n', [Doppelte]).

doppelteTexteInText :-
	spielStatus:moeglicheSprache(Sprache),
	findall([Sprache, Text], text(Sprache, _, Text), TextListe),
	sort(TextListe, SortedTextListe),
	dubChk(TextListe, SortedTextListe, Doppelte),
	Doppelte \= [],
	format('~nTexte ~k sind doppelt~n', [Doppelte]).
	
dubChk(List, SortedList, Doppelte) :-
	SortedList = [],
	Doppelte = List.

dubChk(List, SortedList, Doppelte) :-
	SortedList = [ Kopf | SortedRest ],
	selectchk(Kopf, List, RestList),
	dubChk(RestList, SortedRest, Doppelte). 

fehlendeStoffKlassenDa :-
	spielStatus:moeglicheSprache(Sprache),
	findall([Sprache, StoffKlasse], stoffKlasse:stoffKlasse(StoffKlasse, _, _, _, _), StoffKlasseListe),
	list_to_set(StoffKlasseListe, StoffKlasseSet),
	findall([Sprache, TextSchluessel], text(Sprache, TextSchluessel, _), TextSchluesselListe),
	subtract(StoffKlasseSet, TextSchluesselListe, Fehlende),
	Fehlende \= [],
	format('~nSprache: ~k Fehlende Stoffklassen ~k~n', [Sprache, Fehlende]).

fehlendeSammelAktionDa :-
	spielStatus:moeglicheSprache(Sprache),
	findall([Sprache, SammelAktion], sammelAktion:sammelAktion(SammelAktion), SammelAktionListe),
	list_to_set(SammelAktionListe, SammelAktionSet),
	findall([Sprache, TextSchluessel], text(Sprache, TextSchluessel, _), TextSchluesselListe),
	subtract(SammelAktionSet, TextSchluesselListe, Fehlende),
	Fehlende \= [],
	format('~nSprache: ~k Fehlende SammelAktion ~k~n', [Sprache, Fehlende]).

fehlendeWandelAktionDa :-
	spielStatus:moeglicheSprache(Sprache),
	findall([Sprache, WandelAktion], wandelAktion:wandelAktion(WandelAktion,_), WandelAktionListe),
	list_to_set(WandelAktionListe, WandelAktionSet),
	findall([Sprache, TextSchluessel], text(Sprache, TextSchluessel, _), TextSchluesselListe),
	subtract(WandelAktionSet, TextSchluesselListe, Fehlende),
	Fehlende \= [],
	format('~nSprache: ~k Fehlende Wandel ~k~n', [Sprache, Fehlende]).

fehlendeStoffeDa :-
	spielStatus:moeglicheSprache(Sprache),
	findall([Sprache, Stoff], stoff:stoff(_, Stoff, _), StoffListe),
	list_to_set(StoffListe, StoffSet),
	findall([Sprache, TextSchluessel], text(Sprache, TextSchluessel, _), TextSchluesselListe),
	subtract(StoffSet, TextSchluesselListe, Fehlende),
	Fehlende \= [],
	format('~nSprache: ~k Fehlende Stoffe ~k~n', [Sprache, Fehlende]).

fehlendeOrteDa :-
	spielStatus:moeglicheSprache(Sprache),
	findall([Sprache, Ort], ort:ort(Ort), OrtListe),
	list_to_set(OrtListe, OrtSet),
	findall([Sprache, TextSchluessel], text(Sprache, TextSchluessel, _), TextSchluesselListe),
	subtract(OrtSet, TextSchluesselListe, Fehlende),
	Fehlende \= [],
	format('~nSprache: ~k Fehlende Orte ~k~n', [Sprache, Fehlende]).

testAll :-
	format('Test Dupletten in Schlüsseln~n', []),
	\+doppelteSchluesselInText,
	format('Test Dupletten in Text~n', []),
	\+doppelteTexteInText,
	format('Test fehlende Stoffklassen~n', []),
	\+fehlendeStoffKlassenDa,
	format('Test fehlende SammelAktionen~n', []),
	\+fehlendeSammelAktionDa,
	format('Test fehlende WandelAktionen~n', []),
	\+fehlendeWandelAktionDa,
	format('Test fehlende Stoffe~n', []),
	\+fehlendeStoffeDa,
	format('Test fehlende Orte~n', []),
	\+fehlendeOrteDa,
	format('fertig~n', []).
	