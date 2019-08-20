:- module(main, [minimaleSammlungLoesung/2]).

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

server(Port) :-
        http_server(http_dispatch, [port(Port)]),
        load.

:- http_handler('/', web_form, []).
:- http_handler('/minimaleSammlung', landing_pad, []).

web_form(_Request) :-
	reply_html_page(
	title('MinimaleSammlungDialog'), 
	[
	  form([action='/minimaleSammlung', method='post'], [
	  	h1(['Empfohlene Handlungen um bestimmten Stoff zu erhalten']),
	    p([], [input([name='anzahl', type='text', value='', size='24'])]),
        p([], [\['<select name="stoffAuswahl" size="1" id="StoffAuswahl">
    <option>absprungKapselKoordinaten
    <option>angereicherterKohlenStoff
    <option>aktiviertesCadmium
    <option>aktiviertesEmeril
    <option>aktiviertesIndium
    <option>aktiviertesKupfer
    <option>ammoniak
    <option>antiHaftKolben
    <option>antiMaterie
    <option>antiMaterieGehaeuse
    <option>aronium
    <option>ausrangierteSchaltPlatte
    <option>autonomePositionierungsEinheit
    <option>beutelGift
    <option>bromSalz
    <option>cadmium
    <option>chlor
    <option>chlorGitter
    <option>chromatischesMetall
    <option>coprit
    <option>deuterium
    <option>dioxit
    <option>diWasserStoff
    <option>diWasserStoffGelee
    <option>dunkleMaterie
    <option>eiweissPerle
    <option>emeril
    <option>endeDerDaemmerung
    <option>entschluesselteBenutzerDaten
    <option>erstGebruetetenHelm
    <option>experimentelleEnergieFluessigkeit
    <option>ferritStaub
    <option>frischeFlutPalmenSprossen
    <option>frostKristall
    <option>fluessigSprengStoff
    <option>fortschrittlicherIonenAkku
    <option>fregattenTreibStoff100to
    <option>fregattenTreibStoff200to
    <option>fregattenTreibStoff50to
    <option>fuenfDimensionalerTorus
    <option>funkenKanister
    <option>fusionsBeschleuniger
    <option>fusionsZuender
    <option>gammaWurzel
    <option>gefangeneNanode
    <option>gekNip
    <option>gekRelikt
    <option>geoDesit
    <option>gewaltigesMetallZahnRad
    <option>glas
    <option>gold
    <option>grantine
    <option>gravitinoBall
    <option>halbLeiter
    <option>heissesEis
    <option>hermetischesSiegel
    <option>herox
    <option>herzDerSonne
    <option>hitzeKondensator
    <option>holografischerAnalysator
    <option>holographischeKurbelWelle
    <option>hypnotischenTraenken
    <option>hydrothermaleTreibStoffZelle
    <option>indium
    <option>industrieBatterie
    <option>instabilesGel
    <option>instabilesNatrium
    <option>instabilesPlasma
    <option>instabilitaetsInjektor
    <option>ionenAkku
    <option>ionenKugel
    <option>ionenKondensator
    <option>ionisiertesKobalt
    <option>iridesit
    <option>kaktusFleisch
    <option>kampfLaeuferGehirn
    <option>kelpBeutel
    <option>kobalt
    <option>kobaltSpiegel
    <option>kohlenStoff
    <option>kohlenStoffKristall
    <option>kohlenStoffNanoRohr
    <option>kometenTroepfchen
    <option>korvaxGehaeuse
    <option>korvaxKonvergenzWuerfel
    <option>kristallSulfid
    <option>kryogenKammer
    <option>kryoPumpe
    <option>kuerbisKnolle
    <option>kupfer
    <option>lebendePerle
    <option>lebenderSchleim
    <option>lebendesGlas
    <option>lebensErhaltungsGel
    <option>lemmium
    <option>magnetisiertesFerrit
    <option>magnoGold
    <option>metallPlatten
    <option>mikroProzessor
    <option>modifizierteQuanten
    <option>mordit
    <option>nanitHaufen
    <option>nanoRohrKiste
    <option>natrium
    <option>natriumDiode
    <option>natriumNitrat
    <option>navigationsDaten
    <option>neuralLeitung
    <option>neutronenMikroskop
    <option>nichtMehrDuftendePheromonFlasche
    <option>nipNipKnospen
    <option>nooSpaerischKugel
    <option>novaeRegenerat
    <option>organischerKatalysator
    <option>ohmschesGel
    <option>optischesLoesungsMittel
    <option>organischeRohre
    <option>paraffinium
    <option>phasenStrahler
    <option>phosphor
    <option>photischerJade
    <option>pilzSchimmel
    <option>platin
    <option>polyFaser
    <option>polyChronesZirkonium
    <option>projektilMunition
    <option>pugneum
    <option>pyrit
    <option>quantumBeschleuniger
    <option>quantumProzessor
    <option>radon
    <option>raumSchiffStartTreibStoff
    <option>reinesFerrit
    <option>restSubstanz
    <option>saeure
    <option>salz
    <option>salzRefaktor
    <option>sauerStoff
    <option>sauerStoffFilter
    <option>sauerStoffKapsel
    <option>schaltPlatte
    <option>schmierMittel
    <option>schmutz
    <option>schwefelin
    <option>schweisserSeife
    <option>silber
    <option>solanium
    <option>sternenKnolle
    <option>stickStoff
    <option>sechsZackigerEntKoppler
    <option>seltenesMetallElement
    <option>sichSelbsReparierendesHeridium
    <option>sternenSeide
    <option>stickStoffSalz
    <option>strassenKoeterBronze
    <option>superOxidKristall
    <option>supraLeiter
    <option>supraleitendeFaser
    <option>technologieModul
    <option>teleportKoordinaten
    <option>tetraKobalt
    <option>thermischesKondensat
    <option>tragbarerReaktor
    <option>tritium
    <option>umhuellterSchatten
    <option>unkontrollierbarerSchimmel
    <option>unraffiniertesPyritFett
    <option>uran
    <option>verdichteterKohlenStoff
    <option>vergitterterBogenKristall
    <option>verrostetesMetall
    <option>vierfachServo
    <option>vyKeenBildnis
    <option>vyKeenDolch
    <option>warpZelle
    <option>waermeSchutzModulS
    <option>wirbelWuerfel
    <option>wiederhergestellteTechnologie
    <option>zaeheFluessigkeiten
    <option>zustandsPhase
    <option>zytoPhosphat
    <option>atlasPassV1
    <option>atlasPassV2
    <option>atlasPassV3
    <option>sternenSamen
    <option>ammoniumHaltigeVerarbeitungsAnlagen
    <option>effizienteWasserduesenA
    <option>effizienteWasserduesenB
    <option>effizienteWasserduesenC
    <option>effizienteWasserduesenS
    <option>gefahrenSchutz
    <option>gefahrGutSchutzHandschuh
    <option>jetPack
    <option>neuralStimulator
    <option>qFeldInternePolsterung
    <option>raketenStiefel
    <option>sauerstoffHaltigeStabilisatoren
    <option>sauerstoffUmleiterA
    <option>sauerstoffUmleiterB
    <option>sauerstoffUmleiterC
    <option>sauerstoffUmleiterS
    <option>sauerstoffWiederVerwerter
    <option>selbstReinigendeKiemenEinheit
    <option>schildGitter
    <option>unterHyperDruckStehendeKreislaufAtmungsHilfe
    <option>frachterHyperAntrieb
    <option>infraMesser
    <option>asymetrischeRefraktoren
    <option>chromatischeSplitter
    <option>dauerwelligePolarisatoren
    <option>freiElektronischeOszillatoren
    <option>glorreicheNeutrinoInjektoren
    <option>gyroskopischeEntfernungsPolarisatoren
    <option>gyroskopischePlasmaAuspuffRohre
    <option>hypersonischeNeutrinoInjektoren
    <option>induktiveResonatoren
    <option>nuklearePolarisatoren
    <option>resonanteReflektorGlaeser
    <option>spezialisierteSuperLuminare
    <option>supraleitendeReflektorGlaeser
    <option>unvergleichlicheReflektorGlaeser
    <option>ultraHochfrequenteOszillatoren
    <option>gedankenKontrollGeraet
    <option>holographischerAnalysator
    <option>mineralKompressor
    <option>sprengDrohnen
    <option>treibStoffOxidant
    <option>analyseVisier
    <option>gammaStrahlendeBegrenzer
    <option>scanner
    <option>wellenFormWiederVerwerter
    <option>terrainManipulator
    <option>eigenesKraftFeld
    <option>kampfVisier
    <option>minenLaser
    <option>fortgeschrittenerMinenLaser
    <option>blitzWerfer
    <option>laufIonisator
    <option>plasmaWerfer
    <option>geologieKanone
    <option>glutSpeer
    <option>masseBeschleuniger
    <option>streuBlaster
    <option>geschossSchmierer
    <option>impulsWerfer
    <option>verstaerkteKartuschen
    <option>fusionsAntrieb
    <option>humboldtAntrieb
    <option>driftAufhaengung
    <option>haftungsVerstaerkungsAufhaengung
    <option>rutschAufhaengung
    <option>exoFahrzeugBordKanonenUpgrade
    <option>exoFahrzeugMinenLaserUpgrade
    <option>exoFahrzeugSignalBooster
    <option>exoFahrzeugSignalBoosterUpgradeSigma
    <option>exoFahrzeugSignalBoosterUpgradeTau
    <option>exoFahrzeugBeschleunigungsModul
    <option>exoFahrzeugMinenLaser
    <option>exoFahrzeugMinenLaserUpgradeSigma
    <option>exoFahrzeugBordKanone
    <option>nautilonKanone
    <option>tethysStrahl
    <option>osmotischerGenerator
    <option>konstruktionsTerminal
    <option>exoFahrzeugTerminal
    <option>waffenTerminal
    <option>wissenschaftsTerminal
    <option>landwirtschaftsTerminal
    <option>lagerBehaelter1
    <option>verschlosseneKiste
    <option>floraBehaelter
    <option>hydroKulturTrog
    <option>grosserHydroKulturTrog
    <option>copritBlume
    <option>echinoKaktus
    <option>frostWurz
    <option>gammaGras
    <option>giftIgel
    <option>gravitinoWirt
    <option>morditWurzel
    <option>pilzGeflecht
    <option>sonnenRebe
    <option>sternenDorn
    <option>kollossGeoBucht
    <option>nomadenGeoBucht
    <option>roamerGeoBucht
    <option>atmosphaerenVerarbeitungsAnlage
    <option>autonomeBergBauEinheit
    <option>basisComputer
    <option>bauplanAnalysator
    <option>kommunikationsStation
    <option>nachrichtenModul
    <option>signal
    <option>signalBooster
    <option>speicherPunkt
    <option>tragbareRaffinerie
    <option>basisBergungsKapsel
    <option>basisTelePorterModul
    <option>terminalDesGalaktischenMarktes
    <option>gefahrenSchutzEinheit
    <option>gesundheitsStation
    <option>grosseRaffinerie
    <option>bett
    <option>licht
    <option>farbigeLeuchte
    <option>farbigeLeuchteGruen
    <option>farbigeLeuchteRot
    <option>farbigeLeuchteWeiss
    <option>flagge
    <option>tiefSeeKammer
    <option>glasPlatteMitHolzRahmen
    <option>holzBodenPlatte
    <option>holzDach
    <option>holzFenster
    <option>holzRampe
    <option>holzTuerRahmen
    <option>holzWand
    <option>betonWand
    <option>metallFenster
    <option>metallWand
    <option>zylindrischerRaum
    <option>achtEckSchrank
    <option>arbeitsPlatte
    <option>aussehenModifikator
    <option>betonBodenPlatte
    <option>betonBogen
    <option>betonDach
    <option>betonDachEndStueck
    <option>betonDachPlatte
    <option>betonTuer
    <option>betonTuerRahmen
    <option>duenneBetonWand
    <option>duenneMetallWand
    <option>dekor
    <option>eckSofa
    <option>ergonomischesSofa
    <option>einfacherSchreibTisch
    <option>fundament
    <option>gebogenerKorridor
    <option>gebogenesRohr
    <option>geraderKorridor
    <option>gewoelbteWuerfelFoermigeWand
    <option>glasPlatteMitBetonRahmen
    <option>glasPlatteMitMetallRahmen
    <option>grossesGlasPaneel
    <option>grosserKeil
    <option>gruenerWandBildSchirm
    <option>halberBetonBogen
    <option>halberHolzBogen
    <option>halberMetallBogen
    <option>hoherSchrank
    <option>infraStrukturLeiter
    <option>kanisterRegal
    <option>kleineBetonBodenPlatte
    <option>kleineBetonWand
    <option>kleineHolzWand
    <option>kleineHolzPlatte
    <option>kleineMetallPlatte
    <option>kleineMetallWand
    <option>kleineKiste
    <option>kleinerKeil
    <option>kurzeBetonWand
    <option>kurzeHolzWand
    <option>kurzeMetallWand
    <option>kugel
    <option>laborLampe
    <option>lagerModulDeko
    <option>leiter
    <option>lFoermigerKorridor
    <option>metallBodenPlatte
    <option>metallBogen
    <option>metallTuer
    <option>orangeFarbenerWandBildSchirm
    <option>oszilloskop
    <option>pflasterung1
    <option>pflasterung2
    <option>pflasterung3
    <option>pyramide
    <option>quadratischerRaum
    <option>quadratischeTiefSeeKammer
    <option>regalModul
    <option>rennHindernis
    <option>roboterArm
    <option>rohr
    <option>schliessFach
    <option>schraegeBetonPlatte
    <option>schraegeHolzPlatte
    <option>schraegeMetallPlatte
    <option>schubLadenSchrank
    <option>sofa
    <option>stabilerWuerfel
    <option>stuhl1
    <option>stuhl2
    <option>stuhl3
    <option>tFoermigerKorridor
    <option>tisch1
    <option>tisch2
    <option>topfPflanze
    <option>tuer
    <option>wuerfel
    <option>wuerfelFoermigeInnenTuer
    <option>wuerfelFoermigerDachAufsatz
    <option>wuerfelFoermigerRaum
    <option>wuerfelFoermigerRaumBoden
    <option>wuerfelFoermigerRaumRahmen
    <option>wuerfelRaumFundamentStrebe
    <option>wuerfelRaumViererFundametStrebe
    <option>xFoermigerKorridor
    <option>zylinder
    <option>zylindrischerRaumRahmen
    <option>aussichtsKugel
    <option>betonFassade
    <option>betonFenster
    <option>betonRampe
    <option>bioKuppelRaum
    <option>bodenMatte
    <option>deckenLeuchte
    <option>deckenPaneel
    <option>fassFoermigerFabrikator
    <option>fenster
    <option>flachesModul
    <option>gewoelbtesWuerfelFoermigesDach
    <option>grosseMonitorStation
    <option>halbeBetonRampe
    <option>halbeHolzRampe
    <option>halbeMetallRampe
    <option>holoTuer
    <option>holzDachEndStueck
    <option>holzDachPlatte
    <option>holzFassade
    <option>innenTreppen
    <option>kistenFoermigerFabrikator
    <option>korridorMitGlasDach
    <option>lagerBehaelter
    <option>leichterTisch
    <option>metallDach
    <option>metallDachEndStueck
    <option>metallDachPlatte
    <option>metallFassade
    <option>metallRampe
    <option>mittlereRaffinerie
    <option>monitorStation
    <option>rennKraftVerstaerker
    <option>seitenModul
    <option>server
    <option>techBedienFeld
    <option>waffenRegal
    <option>wandBildSchirm
    <option>wandEinheit
    <option>wandVentilator
    <option>wasserDichteTuer2
    <option>wuerfelFoermigerGlasRaum
    <option>zugangsRampe
    <option>exoFahrzeugBeschleunigungsModulA
    <option>exoFahrzeugBeschleunigungsModulB
    <option>exoFahrzeugSignalBoosterUpgrade
    <option>exoFahrzeugSignalBoosterUpgradeA
    <option>glasTunnel
    <option>kolossGeoBucht
    <option>landeFeld
    <option>lFoermigerGlasTunnel
    <option>meeresUnterSchlupf
    <option>nautilonKammer
    <option>sauerStoffVerarbeiter
    <option>tFoermigerGlasTunnel
    <option>vertikalerGlasTunnel
    <option>wasserDichteTuer1
  </select>']]),
        p([], [input([name='Submit', type='submit', value='OK'])])
	  ])
	]).


landing_pad(Request) :-
        member(method(post), Request), !,
        /*http_read_data(Request, Data, []),*/
        format('Content-type: text/html~n~n', []),
		/*portray_clause(Data),*/
		/* portray_clause(Request), */
		http_parameters(Request, [
          anzahl(AtomAnzahl, [default('1')]),
          stoffAuswahl(Stoff, [length > 1])
        ]),
        atom_number(AtomAnzahl, Anzahl),
        format('<table width="20%" border="1">
			  <caption>
			    <h2>Eingaben</h2>
			  </caption>
			  <tr>
			    <th scope="col">Anzahl&nbsp;</th>
			    <th scope="col">Gesuchter Stoff&nbsp;</th>
			  </tr>~n'
			),
        format('<tr>~n<td>~k</td>~n', Anzahl),
        format('<td>~k</td>~n<tr>~n', Stoff),
        format('</table>'),
	    format('<hr>~n', []),
	    \+minimaleSammlungLoesung(Anzahl, Stoff) -> format('<h4>Stoff kann nicht hergestellt werden</h4>'); true/* */
        .

/* Declarationen */
/* :- dynamic stoffBestLoesung/2.

Benutzerprädikate 
produktMit(Stoff, Komponenten, Anzahl, Produkt, Wert) :-
	rezept:rezept(_, Komponenten, [Anzahl, Produkt], _),
	ausgangsStoff:stoff(Produkt, EinzelWert),
	Wert is EinzelWert * Anzahl,
	memberchk([_, Stoff], Komponenten).

raffinierRezepteFuer(Stoff, Komponenten, Anzahl) :-
	rezept:rezept(raffinieren, Komponenten, [Anzahl, Stoff], _).

schnellsteLoesung(Anzahl, Stoff) :-
	\+suchAlgorithmus:baue(Anzahl, Stoff),
	findall(ZeitSammlung, suchAlgorithmus:loesung(Stoff, _, _, _, _, ZeitSammlung, _, _), ZeitSammlungListe),
	min_member(MinimalZeit, ZeitSammlungListe),
	suchAlgorithmus:loesung(Stoff, Vorgaenge, SammelSet, GesamtZahl, GesamtWertSammlung, MinimalZeit, GesamtKosten, Erloes),
	!,
	ausgabe:ausgabe(Vorgaenge),
	ausgabe:ausgabeSummen(SammelSet, GesamtZahl, GesamtWertSammlung, MinimalZeit, GesamtKosten, Erloes).

billigsteLoesung(Anzahl, Stoff) :-
	\+suchAlgorithmus:baue(Anzahl, Stoff),
	findall(GesamtAufwand, suchAlgorithmus:loesung(Stoff, _, _, _, _, _, GesamtAufwand, _), GesamtAufwandListe),
	min_member(MinimalKosten, GesamtAufwandListe),
	suchAlgorithmus:loesung(Stoff, Vorgaenge, SammelSet, GesamtZahl, GesamtWertSammlung, GesamtZeitSammlung, MinimalKosten, Erloes),
	!,
	ausgabe:ausgabe(Vorgaenge),
	ausgabe:ausgabeSummen(SammelSet, GesamtZahl, GesamtWertSammlung, GesamtZeitSammlung, MinimalKosten, Erloes).
*/

minimaleSammlungLoesung(Anzahl, Stoff) :- 
	\+suchAlgorithmus:baue(Anzahl, Stoff),
	findall(GesamtZahlSammlung, (suchAlgorithmus:loesung(Stoff, _, _, GesamtZahlSammlung, _, _, _, _), GesamtZahlSammlung > 0), GesamtZahlListe),
	min_member(MinimalSammelZahl, GesamtZahlListe),
	findall(ZeitSammlung, suchAlgorithmus:loesung(Stoff, _, _, MinimalSammelZahl, _, ZeitSammlung, _, _), ZeitSammlungListe),
	min_member(MinimalZeit, ZeitSammlungListe),
	suchAlgorithmus:loesung(Stoff, Vorgaenge, SammelSet, MinimalSammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes),
	!,
	format('<table width="55%" border="1">
			  <caption>
			    <h2>Sammelaktionen</h2>
			  </caption>
			  <tr>
			    <th scope="col">&nbsp;</th>
			    <th scope="col">Anzahl&nbsp;</th>
			    <th scope="col">Stoff&nbsp;</th>
			    <th scope="col">&nbsp;</th>
			    <th scope="col">Aktion&nbsp;</th>
			  </tr>~n'
			),
	ausgabe:ausgabeSammlung(SammelSet),
	format('</table>~n'),
	format('<hr>~n', []),
	format('<table width="100%" border="1">
			  <caption>
			    <h2>Herstellungsaktionen</h2>
			  </caption>
			  <tr>
			    <th scope="col">&nbsp;</th>
			    <th scope="col">Anzahl&nbsp;</th>
			    <th scope="col">&nbsp;</th>
			    <th scope="col">Operation&nbsp;</th>
			    <th scope="col">&nbsp;</th>
			    <th scope="col">Stoff&nbsp;</th>
			    <th scope="col">&nbsp;</th>
			    <th scope="col">Komponenten&nbsp;</th>
			    <th scope="col">&nbsp;</th>
			  </tr>~n'),
	ausgabe:ausgabeVorgaenge(Vorgaenge),
	format('</table>~n'),
	format('<hr>~n', []),
	format('<table width="35%" border="1">
			  <caption>
			    <h2>Summenwerte</h2>
			  </caption>
			  <tr>
			    <th scope="col">Summenwert&nbsp;</th>
			    <th scope="col">Anzahl&nbsp;</th>
			    <th scope="col">Einheit&nbsp;</th>
			  </tr>~n'),
	ausgabe:ausgabeSummen(MinimalSammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes),
	format('</table>~n').

load :-
	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/ausgabe'),
	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/ausgangsStoff'),
	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/rezept'),
	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/spielStatus'),
	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/sammeln'),
	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/kaufen'),
	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/reisen'),
	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/statistik'),
	consult('D:/Andi/Documents/Projekte/Prolog/NoMansSkyTrainer/suchAlgorithmus'),
	sammeln:sammelbarInit.

testMinimaleSammlung :-
	ausgangsStoff:stoff(Stoff, _),
	minimaleSammlungLoesung(1, Stoff),
	fail.

testRezepte(FehlOperation, FehlOpProdukt, 
			FehlKomponente,
			FehlProdukt,
			FertigungsZeitFehlStoff, FertigungsZeitFehlKomponenten) :-
	\+rezept:fehlerOperation(FehlOperation, FehlOpProdukt),
	format('Operationen ok~n'),
	\+rezept:komponenteIstKeinStoff(FehlKomponente),
	format('Komponenten ok~n'),
	\+rezept:produktIstKeinStoff(FehlProdukt),
	format('Produkte ok~n'),
	\+rezept:raffinerieRezeptHatKeineFertigungsZeit(FertigungsZeitFehlStoff,FertigungsZeitFehlKomponenten),
	format('Fertigungszeiten ok~n').
	
testStoff :-
	format('Eingangsstoffe testen '),
	\+ausgangsStoff:fehlerInputStoffNichtDefiniert(_),
	format('ok~n'),
	format('Ausgangsstoffe testen '),
	\+ausgangsStoff:fehlerOutputStoffNichtDefiniert(_),
	format('ok~n'),
	format('Wertangaben testen '),
	\+ausgangsStoff:produktNichtBewertet(_),
	format('ok~n'),
	format('Doppelte testen '),
	\+ausgangsStoff:keineDoppeltenInStoff,
	format('ok~n').
	