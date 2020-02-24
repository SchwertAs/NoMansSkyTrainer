:- module(rezept, [rezept/4, testAll/6]).

/* Komponenten, AusgabeBestand, Dauer
[[Anzahl, Stoff]], [Anzahl, Produkt], Dauer in 1/100 pro Ergebnis-St�ck */

/* ---------------------  Raffinerie-Rezepte --------------------------------------- */
/* Eine Komponente */
rezept(raffinieren, [[1, diWasserStoffGelee]], [50, diWasserStoff], 1.6 ).
rezept(raffinieren, [[5, tritium]], [1, diWasserStoff], 37.7 ).
rezept(raffinieren, [[30, diWasserStoff]], [1, diWasserStoffGelee], 6000 ).
rezept(raffinieren, [[1, chlorGitter]], [150, chlor], 0.00025 ).
rezept(raffinieren, [[2, salz]], [1, chlor], 36.6 ).
rezept(raffinieren, [[1, aktiviertesCadmium]], [2, chromatischesMetall], 10.0 ).
rezept(raffinieren, [[1, aktiviertesEmeril]], [3, chromatischesMetall], 5.77 ).
rezept(raffinieren, [[1, aktiviertesIndium]], [4, chromatischesMetall], 3.165 ).
rezept(raffinieren, [[1, aktiviertesKupfer]], [1, chromatischesMetall], 24.7 ).
rezept(raffinieren, [[1, cadmium]], [1, chromatischesMetall], 28.46 ).
rezept(raffinieren, [[2, emeril]], [3, chromatischesMetall], 5.51 ).
rezept(raffinieren, [[2, indium]], [4, chromatischesMetall], 2.67 ).
rezept(raffinieren, [[2, kupfer]], [1, chromatischesMetall], 36.48 ).
rezept(raffinieren, [[3, mordit]], [1, faecium], 24.7 ).
rezept(raffinieren, [[1, ammoniak]], [1, ferritStaub], 36.4 ).
rezept(raffinieren, [[1, dioxit]], [2, ferritStaub], 36.9 ).
rezept(raffinieren, [[1, paraffinium]], [1, ferritStaub], 36.9 ).
rezept(raffinieren, [[1, phosphor]], [1, ferritStaub], 37.8 ).
rezept(raffinieren, [[1, pyrit]], [1, ferritStaub], 36.7 ).
rezept(raffinieren, [[1, uran]], [1, ferritStaub], 37.3 ).
rezept(raffinieren, [[1, verrostetesMetall]], [2, ferritStaub], 33.1 ).
rezept(raffinieren, [[40, silikatPulver]], [1, glas], 524 ).
rezept(raffinieren, [[1, grantine]], [125, gold], 1.00 ).
rezept(raffinieren, [[1, lebendePerle]], [100, gold], 0.10 ).
rezept(raffinieren, [[1, lemmium]], [125, gold], 1.01 ).
rezept(raffinieren, [[1, magnoGold]], [125, gold], 1.00 ).
rezept(raffinieren, [[2, kobalt]], [1, ionisiertesKobalt], 37.1 ).
rezept(raffinieren, [[1, tetraKobalt]], [150, ionisiertesKobalt], 0.536 ).
rezept(raffinieren, [[1, ionisiertesKobalt]], [2, kobalt], 6.22 ).
rezept(raffinieren, [[40, frostKristall]], [1, glas], 3030 ).
rezept(raffinieren, [[1, gammaWurzel]], [2, kohlenStoff], 6.14 ).
rezept(raffinieren, [[1, kaktusFleisch]], [2, kohlenStoff], 6.00 ).
rezept(raffinieren, [[1, pilzSchimmel]], [2, kohlenStoff], 6.00 ).
rezept(raffinieren, [[1, sauerStoff]], [1, kohlenStoff], 8.31 ).
rezept(raffinieren, [[1, sternenKnolle]], [2, kohlenStoff], 6.00 ).
rezept(raffinieren, [[1, solanium]], [2, kohlenStoff], 6.00 ).
rezept(raffinieren, [[1, zaeheFluessigkeiten]], [1, lebenderSchleim], 60.0 ).
rezept(raffinieren, [[1, hypnotischesAuge]], [1, lebenderSchleim], 0.30 ).
rezept(raffinieren, [[2, reinesFerrit]], [1, magnetisiertesFerrit], 24.27 ).
rezept(raffinieren, [[3, faecium]], [2, mordit], 36.0 ).
rezept(raffinieren, [[35, platin]], [1, nanitHaufen], 24.0 ).
rezept(raffinieren, [[25, pugneum]], [1, nanitHaufen], 12.0 ).
rezept(raffinieren, [[5, unkontrollierbarerSchimmel]], [1, nanitHaufen], 60.0 ).
rezept(raffinieren, [[1, kuerbisKnolle]], [1, natrium], 24.0 ).
rezept(raffinieren, [[1, natriumNitrat]], [2, natrium], 12.1 ).
rezept(raffinieren, [[1, instabilesNatrium]], [150, natriumNitrat], 0.567 ).
rezept(raffinieren, [[1, kristallSulfid]], [50, natriumNitrat], 0.78 ).
rezept(raffinieren, [[2, natrium]], [1, natriumNitrat], 40.0 ).
rezept(raffinieren, [[1, iridesit]], [250, platin], 0.50 ).
rezept(raffinieren, [[1, geoDesit]], [250, platin], 0.50 ).
rezept(raffinieren, [[1, gold]], [1, pyrit], 24.0 ).
rezept(raffinieren, [[3, schwefelin]], [1, radon], 33.3 ).
rezept(raffinieren, [[1, ferritStaub]], [1, reinesFerrit], 12.0 ).
rezept(raffinieren, [[1, magnetisiertesFerrit]], [2, reinesFerrit], 7.99 ).
rezept(raffinieren, [[1, seltenesMetallElement]], [150, reinesFerrit], 0.569 ).
rezept(raffinieren, [[1, chlor]], [2, salz], 11.99 ).
rezept(raffinieren, [[1, kelpBeutel]], [1, sauerStoff], 23.9 ).
rezept(raffinieren, [[1, superOxidKristall]], [150, sauerStoff], 0.56 ).
rezept(raffinieren, [[3, stickStoff]], [1, schwefelin], 36.0 ).
rezept(raffinieren, [[1, aronium]], [250, silber], 0.50 ).
rezept(raffinieren, [[1, herox]], [250, silber], 0.42 ).
rezept(raffinieren, [[1, strassenKoeterBronze]], [250, silber], 0.50 ).
rezept(raffinieren, [[3, radon]], [1, stickStoff], 38.1 ).
rezept(raffinieren, [[1, lebenderSchleim]], [1, unkontrollierbarerSchimmel], 60.0 ).
rezept(raffinieren, [[2, kohlenStoff]], [1, verdichteterKohlenStoff], 18.0 ).
rezept(raffinieren, [[1, kohlenStoffKristall]], [150, verdichteterKohlenStoff], 0.57 ).
rezept(raffinieren, [[1, restSubstanz]], [1, zaeheFluessigkeiten], 60.0 ).

rezept(ausAtmosphaerenAnlageGewinnen, [[1, verdichteterKohlenStoff]], [5, stickStoff], 722.5 ). /* lush and toxic planets */
rezept(ausAtmosphaerenAnlageGewinnen, [[3, kohlenStoff]], [5, stickStoff], 722.5 ).
rezept(ausAtmosphaerenAnlageGewinnen, [[1, verdichteterKohlenStoff]], [5, radon], 722.5 ).      /* irradiated and frozen planets */
rezept(ausAtmosphaerenAnlageGewinnen, [[3, kohlenStoff]], [5, radon], 722.5 ).
rezept(ausAtmosphaerenAnlageGewinnen, [[1, verdichteterKohlenStoff]], [5, sauerStoff], 722.5 ). /* exotic planets */
rezept(ausAtmosphaerenAnlageGewinnen, [[3, kohlenStoff]], [5, sauerStoff], 722.5 ).
rezept(ausAtmosphaerenAnlageGewinnen, [[1, verdichteterKohlenStoff]], [5, schwefelin], 722.5 ). /* hot and barren planets */
rezept(ausAtmosphaerenAnlageGewinnen, [[3, kohlenStoff]], [5, schwefelin], 722.5 ).
rezept(ausSauerStoffVearbeiterGewinnen, [[3, verdichteterKohlenStoff]], [5, sauerStoff], 288.2 ).
rezept(ausSauerStoffVearbeiterGewinnen, [[3, kohlenStoff]], [5, sauerStoff], 288.2 ).

/* Zwei Komponenten */
rezept(raffinieren, [[2, pilzSchimmel], [1, salz]], [1, ammoniak], 37.0 ).
rezept(raffinieren, [[2, paraffinium], [1, ferritStaub]], [1, ammoniak], 37.3 ).
rezept(raffinieren, [[1, diWasserStoff], [1, stickStoff]], [1, ammoniak], 16.0 ).
rezept(raffinieren, [[1, chromatischesMetall], [1, cadmium]], [4, cadmium], 10.5 ).
rezept(raffinieren, [[2, sauerStoff], [2, salz]], [5, chlor], 7.2).
rezept(raffinieren, [[1, kelpBeutel], [1, salz]], [2, chlor], 18 ).
rezept(raffinieren, [[1, kelpBeutel], [1, pugneum]], [2, chlor], 17.0 ).
rezept(raffinieren, [[1, kelpBeutel], [1, sauerStoff]], [2, chlor], 18.0 ).
rezept(raffinieren, [[1, kelpBeutel], [1, chlor]], [2, chlor], 18.0 ).
rezept(raffinieren, [[2, sauerStoff], [1, chlor]], [6, chlor], 6.0 ).
rezept(raffinieren, [[50, chlor], [50, salz]], [1, chlorGitter], 6000 ).
rezept(raffinieren, [[1, reinesFerrit], [1, aktiviertesCadmium]], [4, chromatischesMetall], 9.0).
rezept(raffinieren, [[1, reinesFerrit], [1, aktiviertesEmeril]], [6, chromatischesMetall], 6.0 ).
rezept(raffinieren, [[1, reinesFerrit], [1, aktiviertesIndium]], [8, chromatischesMetall], 4.5 ).
rezept(raffinieren, [[1, reinesFerrit], [1, aktiviertesKupfer]], [2, chromatischesMetall], 18.0 ).
rezept(raffinieren, [[1, reinesFerrit], [1, indium]], [4, chromatischesMetall], 7.4 ).
rezept(raffinieren, [[1, reinesFerrit], [1, emeril]], [3, chromatischesMetall], 12.0 ).
rezept(raffinieren, [[1, reinesFerrit], [1, kupfer]], [1, chromatischesMetall], 36.0 ).
rezept(raffinieren, [[1, reinesFerrit], [1, cadmium]], [2, chromatischesMetall], 18.0 ).
rezept(raffinieren, [[1, diWasserStoff], [1, tritium]], [1, deuterium], 24.0 ).
rezept(raffinieren, [[1, stickStoff], [1, schwefelin]], [1, faecium], 24.0 ).
rezept(raffinieren, [[1, verdichteterKohlenStoff], [1, mordit]], [4, faecium], 9.0 ).
rezept(raffinieren, [[2, kohlenStoff], [1, mordit]], [3, faecium], 12.0 ).
rezept(raffinieren, [[1, faecium], [1, sauerStoff]], [3, faecium], 12.0 ).
rezept(raffinieren, [[2, frostKristall], [1, salz]], [1, dioxit], 36.0 ).
rezept(raffinieren, [[1, verdichteterKohlenStoff], [1, natriumNitrat]], [2, dioxit], 18.0 ).
rezept(raffinieren, [[1, kohlenStoff], [1, natriumNitrat]], [1, dioxit], 36.0 ).
rezept(raffinieren, [[2, ammoniak], [1, ferritStaub]], [1, dioxit], 36.0 ).
rezept(raffinieren, [[1, chromatischesMetall], [1, emeril]], [4, emeril], 18.0 ).
rezept(raffinieren, [[1, dioxit], [1, frostKristall]], [2, frostKristall], 18.0 ).
rezept(raffinieren, [[2, dioxit], [1, sauerStoff]], [1, frostKristall], 36.0 ).
rezept(raffinieren, [[2, uran], [1, sauerStoff]], [1, gammaWurzel], 35.0 ).
rezept(raffinieren, [[1, gammaWurzel], [1, uran]], [2, gammaWurzel], 18.0 ).
rezept(raffinieren, [[1, mordit], [1, pugneum]], [1, gold], 36.0 ).
rezept(raffinieren, [[1, faecium], [1, pugneum]], [2, gold], 18.0 ).
rezept(raffinieren, [[1, chromatischesMetall], [1, indium]], [4, indium], 18.0 ).
rezept(raffinieren, [[50, natriumNitrat], [50, natrium]], [1, instabilesNatrium], 600 ).
rezept(raffinieren, [[1, kuerbisKnolle], [1, pugneum]], [2, ionisiertesKobalt], 18.0 ).
rezept(raffinieren, [[1, kuerbisKnolle], [1, sauerStoff]], [2, ionisiertesKobalt], 18.0 ).
rezept(raffinieren, [[2, sauerStoff], [1, ionisiertesKobalt]], [6, ionisiertesKobalt], 6.0 ).
rezept(raffinieren, [[1, kuerbisKnolle], [1, ionisiertesKobalt]], [2, ionisiertesKobalt], 18.0 ).
rezept(raffinieren, [[2, sauerStoff], [2, kobalt]], [5, ionisiertesKobalt], 7.2 ).
rezept(raffinieren, [[2, pyrit], [1, sauerStoff]], [1, kaktusFleisch], 36.0 ).
rezept(raffinieren, [[1, kaktusFleisch], [1, pyrit]], [2, kaktusFleisch], 18.0 ).
rezept(raffinieren, [[50, kohlenStoff], [50, verdichteterKohlenStoff]], [1, kohlenStoffKristall], 600 ).
rezept(raffinieren, [[1, mordit], [2, natrium]], [1, kuerbisKnolle], 12.0 ).
rezept(raffinieren, [[1, mordit], [1, natriumNitrat]], [4, kuerbisKnolle], 9.0 ).
rezept(raffinieren, [[1, kupfer], [1, chromatischesMetall]], [4, kupfer], 18.0 ).
rezept(raffinieren, [[1, ferritStaub], [1, aktiviertesCadmium]], [4, magnetisiertesFerrit], 9.0 ).
rezept(raffinieren, [[1, ferritStaub], [1, aktiviertesEmeril]], [6, magnetisiertesFerrit], 6.0 ).
rezept(raffinieren, [[1, ferritStaub], [1, aktiviertesIndium]], [8, magnetisiertesFerrit], 6.0 ).
rezept(raffinieren, [[1, ferritStaub], [1, aktiviertesKupfer]], [2, magnetisiertesFerrit], 18.0 ).
rezept(raffinieren, [[2, reinesFerrit], [1, pugneum]], [3, magnetisiertesFerrit], 12.0 ).
rezept(raffinieren, [[1, platin], [1, sauerStoff]], [10, magnetisiertesFerrit], 3.6 ).
rezept(raffinieren, [[3, magnetisiertesFerrit], [1, pugneum]], [4, magnetisiertesFerrit], 9.0 ).
rezept(raffinieren, [[1, ferritStaub], [1, indium]], [4, magnetisiertesFerrit], 9.0 ).
rezept(raffinieren, [[1, ferritStaub], [1, emeril]], [3, magnetisiertesFerrit], 12.0 ).
rezept(raffinieren, [[1, ferritStaub], [1, kupfer]], [1, magnetisiertesFerrit], 36.0 ).
rezept(raffinieren, [[1, ferritStaub], [1, cadmium]], [2, magnetisiertesFerrit], 9.0 ).
rezept(raffinieren, [[1, verdichteterKohlenStoff], [1, pugneum]], [2, mordit], 18.0 ).
rezept(raffinieren, [[1, kohlenStoff], [1, pugneum]], [1, mordit], 36.0 ).
rezept(raffinieren, [[1, kohlenStoff], [1, kuerbisKnolle]], [2, natrium], 18.0 ).
rezept(raffinieren, [[1, natrium], [1, stickStoff]], [1, natriumNitrat], 36.0 ).
rezept(raffinieren, [[1, natrium], [1, verdichteterKohlenStoff]], [2, natriumNitrat], 18.0 ).
rezept(raffinieren, [[1, natrium], [1, kohlenStoff]], [1, natriumNitrat], 36.0 ).
rezept(raffinieren, [[1, natriumNitrat], [1, sauerStoff]], [2, natriumNitrat], 18.0 ).
rezept(raffinieren, [[1, natriumNitrat], [1, stickStoff]], [2, natriumNitrat], 18.0 ).
rezept(raffinieren, [[1, natrium], [1, pugneum]], [1, natriumNitrat], 36.0 ).
rezept(raffinieren, [[1, natrium], [1, sauerStoff]], [1, natriumNitrat], 36.0 ).
rezept(raffinieren, [[1, natrium], [1, faecium]], [2, natriumNitrat], 18.0 ).
rezept(raffinieren, [[1, natriumNitrat], [1, pugneum]], [3, natriumNitrat], 12.0 ).
rezept(raffinieren, [[1, natriumNitrat], [1, faecium]], [2, natriumNitrat], 18.0 ).
rezept(raffinieren, [[2, sternenKnolle], [1, salz]], [1, paraffinium], 36.0 ).
rezept(raffinieren, [[1, sauerStoff], [1, silber]], [2, paraffinium], 18.0 ).
rezept(raffinieren, [[2, pyrit], [1, ferritStaub]], [1, paraffinium], 36.0 ).
rezept(raffinieren, [[2, solanium], [1, salz]], [1, phosphor], 36.0 ).
rezept(raffinieren, [[2, dioxit], [1, ferritStaub]], [1, phosphor], 36.0 ).
rezept(raffinieren, [[1, ammoniak], [1, pilzSchimmel]], [2, pilzSchimmel], 18.0 ).
rezept(raffinieren, [[2, ammoniak], [1, sauerStoff]], [1, pilzSchimmel], 36.0 ).
rezept(raffinieren, [[1, gold], [1, silber]], [1, platin], 24.0 ).
rezept(raffinieren, [[2, uran], [1, ferritStaub]], [1, pyrit], 36.0 ).
rezept(raffinieren, [[1, sauerStoff], [1, gold]], [2, pyrit], 18.0 ).
rezept(raffinieren, [[2, kaktusFleisch], [1, salz]], [1, pyrit], 36.0 ).
rezept(raffinieren, [[1, schwefelin], [1, sauerStoff]], [1, radon], 36.0 ).
rezept(raffinieren, [[2, ferritStaub], [1, pugneum]], [3, reinesFerrit], 12.0 ).
rezept(raffinieren, [[1, diWasserStoff], [1, sauerStoff]], [1, salz], 7.9 ).
rezept(raffinieren, [[1, kohlenStoff], [1, kelpBeutel]], [2, sauerStoff], 18.0 ).
rezept(raffinieren, [[1, sauerStoff], [1, stickStoff]], [1, schwefelin], 36.0 ).
rezept(raffinieren, [[50, sauerStoff], [25, magnetisiertesFerrit]], [1, seltenesMetallElement], 6000).
rezept(raffinieren, [[1, solanium], [1, phosphor]], [2, solanium], 18.0 ).
rezept(raffinieren, [[2, phosphor], [1, sauerStoff]], [1, solanium], 36.0 ).
rezept(raffinieren, [[1, diWasserStoff], [1, schwefelin]], [1, solanium], 16.0 ).
rezept(raffinieren, [[1, paraffinium], [1, sternenKnolle]], [2, sternenKnolle], 18.0 ).
rezept(raffinieren, [[2, paraffinium], [1, sauerStoff]], [1, sternenKnolle], 36.0 ).
rezept(raffinieren, [[1, radon], [1, sauerStoff]], [1, stickStoff], 36.0 ).
rezept(raffinieren, [[100, sauerStoff], [50, tritium]], [1, superOxidKristall], 10000 ).
rezept(raffinieren, [[50, kobalt], [50, ionisiertesKobalt]], [1, tetraKobalt], 6000 ).
rezept(raffinieren, [[2, phosphor], [1, ferritStaub]], [1, uran], 36.0 ).
rezept(raffinieren, [[2, phosphor], [1, reinesFerrit]], [1, uran], 36.0 ).
rezept(raffinieren, [[1, radon], [1, diWasserStoff]], [1, uran], 16.0 ).
rezept(raffinieren, [[1, radon], [1, ferritStaub]], [1, uran], 36.0 ).
rezept(raffinieren, [[1, radon], [1, reinesFerrit]], [2, uran], 18.0 ).
rezept(raffinieren, [[1, radon], [1, magnetisiertesFerrit]], [3, uran], 12.0 ).
rezept(raffinieren, [[1, faecium], [1, mordit]], [2, verdichteterKohlenStoff], 18.0 ).
rezept(raffinieren, [[1, faecium], [1, verdichteterKohlenStoff]], [3, verdichteterKohlenStoff], 12.0 ).
rezept(raffinieren, [[1, faecium], [2, kohlenStoff]], [2, verdichteterKohlenStoff], 18.0 ).
rezept(raffinieren, [[2, sauerStoff], [1, verdichteterKohlenStoff]], [6, verdichteterKohlenStoff], 6.0 ).
rezept(raffinieren, [[2, sauerStoff], [2, kohlenStoff]], [5, verdichteterKohlenStoff], 7.2 ).
rezept(raffinieren, [[1, sauerStoff], [1, reinesFerrit]], [2, verrostetesMetall], 20.0 ).
rezept(raffinieren, [[1, sauerStoff], [1, ferritStaub]], [1, verrostetesMetall], 40.0 ).

/* Drei Komponenten */
rezept(raffinieren, [[60, kobalt], [30, paraffinium], [20, tritium]], [1, aronium], 4500.0 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, paraffinium], [20, tritium]], [1, aronium], 4500.0 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, paraffinium], [20, silber]], [1, aronium], 4500.0 ).
rezept(raffinieren, [[60, kobalt], [30, paraffinium], [20, silber]], [1, aronium], 4500.0 ).
rezept(raffinieren, [[60, kobalt], [30, paraffinium], [5, platin]], [1, aronium], 4500.0 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, paraffinium], [5, platin]], [1, aronium], 4500.0 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, paraffinium], [10, gold]], [1, aronium], 4500.0 ).
rezept(raffinieren, [[60, kobalt], [30, paraffinium], [10, gold]], [1, aronium], 4500.0 ).
rezept(raffinieren, [[100, radon], [10, verdichteterKohlenStoff], [5, chlor]], [1, angereicherterKohlenStoff], 4500.0 ).
rezept(raffinieren, [[100, radon], [10, verdichteterKohlenStoff], [10, salz]], [1, angereicherterKohlenStoff], 4500.0 ).
rezept(raffinieren, [[100, radon], [20, kohlenStoff], [10, salz]], [1, angereicherterKohlenStoff], 4500.0 ).
rezept(raffinieren, [[100, radon], [20, kohlenStoff], [5, chlor]], [1, angereicherterKohlenStoff], 4500.0 ).
rezept(raffinieren, [[50, tritium], [40, salz], [40, chlor]], [1, chlorGitter], 10000.0 ).
rezept(raffinieren, [[1, gold], [1, silber], [1, indium]], [30, chromatischesMetall], 16.0 ).
rezept(raffinieren, [[1, gold], [1, silber], [1, emeril]], [20, chromatischesMetall], 24.0 ).
rezept(raffinieren, [[1, silber], [1, gold], [1, cadmium]], [10, chromatischesMetall], 48.0 ).
rezept(raffinieren, [[1, silber], [1, gold], [1, kupfer]], [5, chromatischesMetall], 96.0 ).
rezept(raffinieren, [[1, ferritStaub], [1, sauerStoff], [1, emeril]], [1, gold], 48.0 ).
rezept(raffinieren, [[60, kobalt], [30, dioxit], [20, tritium]], [1, grantine], 4500.0 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, dioxit], [20, tritium]], [1, grantine], 4500.0 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, dioxit], [20, silber]], [1, grantine], 4500.0 ).
rezept(raffinieren, [[60, kobalt], [30, dioxit], [20, silber]], [1, grantine], 4500.0 ).
rezept(raffinieren, [[60, kobalt], [30, dioxit], [5, platin]], [1, grantine], 4500.0 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, dioxit], [5, platin]], [1, grantine], 4500.0 ).
rezept(raffinieren, [[30, kobalt], [30, dioxit], [10, gold]], [1, grantine], 4500.0 ).
rezept(raffinieren, [[60, ionisiertesKobalt], [30, dioxit], [10, gold]], [1, grantine], 4500.0 ).
rezept(raffinieren, [[60, kobalt], [30, ammoniak], [20, tritium]], [1, herox], 4500.0 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, ammoniak], [20, tritium]], [1, herox], 4500.0 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, ammoniak], [20, silber]], [1, herox], 4500.0 ).
rezept(raffinieren, [[60, kobalt], [30, ammoniak], [20, silber]], [1, herox], 4500.0 ).
rezept(raffinieren, [[60, kobalt], [30, ammoniak], [5, platin]], [1, herox], 4500.0 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, ammoniak], [5, platin]], [1, herox], 4500.0 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, ammoniak], [10, gold]], [1, herox], 4500.0 ).
rezept(raffinieren, [[60, kobalt], [30, ammoniak], [10, gold]], [1, herox], 4500.0 ).
rezept(raffinieren, [[50, tritium], [40, natrium], [40, natriumNitrat]], [1, instabilesNatrium], 10000.0 ).
rezept(raffinieren, [[50, tritium], [40, kohlenStoff], [40, verdichteterKohlenStoff]], [1, kohlenStoffKristall], 10000.0 ).
rezept(raffinieren, [[120, ferritStaub], [30, uran], [20, tritium]], [1, lemmium], 4500.0 ).
rezept(raffinieren, [[60, reinesFerrit], [30, uran], [20, tritium]], [1, lemmium], 4500.0 ).
rezept(raffinieren, [[60, reinesFerrit], [30, uran], [20, silber]], [1, lemmium], 4500.0 ).
rezept(raffinieren, [[120, ferritStaub], [30, uran], [20, silber]], [1, lemmium], 4500.0 ).
rezept(raffinieren, [[120, ferritStaub], [30, uran], [5, platin]], [1, lemmium], 4500.0 ).
rezept(raffinieren, [[60, reinesFerrit], [30, uran], [5, platin]], [1, lemmium], 4500.0 ).
rezept(raffinieren, [[60, reinesFerrit], [30, uran], [10, gold]], [1, lemmium], 4500.0 ).
rezept(raffinieren, [[120, ferritStaub], [30, uran], [10, gold]], [1, lemmium], 4500.0 ).
rezept(raffinieren, [[60, kobalt], [30, phosphor], [20, tritium]], [1, magnoGold], 4500.0 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, phosphor], [20, tritium]], [1, magnoGold], 4500.0 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, phosphor], [20, silber]], [1, magnoGold], 4500.0 ).
rezept(raffinieren, [[60, kobalt], [30, phosphor], [20, silber]], [1, magnoGold], 4500.0 ).
rezept(raffinieren, [[60, kobalt], [30, phosphor], [5, platin]], [1, magnoGold], 4500.0 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, phosphor], [5, platin]], [1, magnoGold], 4500.0 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, phosphor], [10, gold]], [1, magnoGold], 4500.0 ).
rezept(raffinieren, [[60, kobalt], [30, phosphor], [10, gold]], [1, magnoGold], 4500.0 ).
rezept(raffinieren, [[250, chromatischesMetall], [1, ferritStaub], [1, sauerStoff]], [10, platin], 47.5 ).
rezept(raffinieren, [[35, ferritStaub], [35, reinesFerrit], [35, magnetisiertesFerrit]], [1, seltenesMetallElement], 6000.0 ).
rezept(raffinieren, [[25, tritium], [20, sauerStoff], [20, magnetisiertesFerrit]], [1, seltenesMetallElement], 6000.0 ).
rezept(raffinieren, [[100, stickStoff], [10, verdichteterKohlenStoff], [5, chlor]], [1, stickStoffSalz], 1000.0 ).
rezept(raffinieren, [[100, stickStoff], [10, verdichteterKohlenStoff], [10, salz]], [1, stickStoffSalz], 1000.0 ).
rezept(raffinieren, [[100, stickStoff], [20, kohlenStoff], [10, salz]], [1, stickStoffSalz], 1000.0 ).
rezept(raffinieren, [[100, stickStoff], [20, kohlenStoff], [5, chlor]], [1, stickStoffSalz], 1000.0 ).
rezept(raffinieren, [[120, ferritStaub], [30, pyrit], [30, tritium]], [1, strassenKoeterBronze], 4500.0 ).
rezept(raffinieren, [[60, reinesFerrit], [30, pyrit], [20, tritium]], [1, strassenKoeterBronze], 4500.0 ).
rezept(raffinieren, [[60, reinesFerrit], [30, pyrit], [20, silber]], [1, strassenKoeterBronze], 4500.0 ).
rezept(raffinieren, [[120, ferritStaub], [30, pyrit], [20, silber]], [1, strassenKoeterBronze], 4500.0 ).
rezept(raffinieren, [[120, ferritStaub], [30, pyrit], [5, platin]], [1, strassenKoeterBronze], 4500.0 ).
rezept(raffinieren, [[60, reinesFerrit], [30, pyrit], [5, platin]], [1, strassenKoeterBronze], 4500.0 ).
rezept(raffinieren, [[60, reinesFerrit], [30, pyrit], [10, gold]], [1, strassenKoeterBronze], 4500.0 ).
rezept(raffinieren, [[120, ferritStaub], [30, pyrit], [10, gold]], [1, strassenKoeterBronze], 4500.0 ).
rezept(raffinieren, [[50, tritium], [40, sauerStoff], [40, uran]], [1, superOxidKristall], 10000.0 ).
rezept(raffinieren, [[100, schwefelin], [10, verdichteterKohlenStoff], [10, salz]], [1, thermischesKondensat], 4500.0 ).
rezept(raffinieren, [[100, schwefelin], [10, verdichteterKohlenStoff], [5, chlor]], [1, thermischesKondensat], 4500.0 ).
rezept(raffinieren, [[50, tritium], [40, kobalt], [40, ionisiertesKobalt]], [1, tetraKobalt], 10000.0 ).
rezept(raffinieren, [[100, schwefelin], [20, kohlenStoff], [5, chlor]], [1, thermischesKondensat], 4500.0 ).
rezept(raffinieren, [[100, schwefelin], [20, kohlenStoff], [10, salz]], [1, thermischesKondensat], 4500.0 ).
rezept(raffinieren, [[250, chromatischesMetall], [25, verdichteterKohlenStoff], [10, natrium]], [1, warpZelle], 30000.0 ).
rezept(raffinieren, [[250, chromatischesMetall], [25, verdichteterKohlenStoff], [5, natriumNitrat]], [1, warpZelle], 30000.0 ).
rezept(raffinieren, [[250, chromatischesMetall], [50, kohlenStoff], [5, natriumNitrat]], [1, warpZelle], 30000.0 ).

/* =====================  Fabrikrezepte ------------------------------------------- */
/* ---------------------  Wertvolle Dinge ----------------------------------------- */
rezept(herstellen, [[25, mordit], [600, pilzSchimmel], [1, saeureRezept]], [1, saeure], 0).
rezept(herstellen, [[50, faecium], [400, gammaWurzel], [1, schmierMittelRezept]], [1, schmierMittel], 0).
rezept(herstellen, [[250, schwefelin], [50, verdichteterKohlenStoff], [1, thermischesKondensatRezept]], [1, thermischesKondensat], 0).
rezept(herstellen, [[1, fluessigSprengStoff], [1, fusionsBeschleuniger], [1, tragbarerReaktorRezept]], [1, tragbarerReaktor], 0).
rezept(herstellen, [[200, kaktusFleisch], [1, instabilesGelRezept]], [1, instabilesGel], 0 ).
rezept(herstellen, [[40, frostKristall], [1, glasRezept]], [1, glas], 0).
rezept(herstellen, [[100, kaktusFleisch], [200, sternenKnolle], [1, polyFaserRezept]], [1, polyFaser], 0 ).
rezept(herstellen, [[250, radon], [50, verdichteterKohlenStoff], [1, angereicherterKohlenStoffRezept]], [1, angereicherterKohlenStoff], 0 ).
rezept(herstellen, [[250, stickStoff], [50, verdichteterKohlenStoff], [1, stickStoffSalzRezept]], [1, stickStoffSalz], 0 ).
rezept(herstellen, [[50, paraffinium], [50, ionisiertesKobalt], [1, aroniumRezept]], [1, aronium], 0 ).
rezept(herstellen, [[1, schaltPlatte], [1, supraLeiter], [1, quantumProzessorRezept]], [1, quantumProzessor], 0 ).
rezept(herstellen, [[1, lebendesGlas], [1, kryoPumpe], [1, kryogenKammerRezept]], [1, kryogenKammer], 0 ).
rezept(herstellen, [[1, saeure], [1, instabilesGel], [1, fluessigSprengStoffRezept]], [1, fluessigSprengStoff], 0).
rezept(herstellen, [[1, schmierMittel], [5, glas], [1, lebendesGlasRezept]], [1, lebendesGlas], 0).
rezept(herstellen, [[100, frostKristall], [200, solanium], [1, hitzeKondensatorRezept]], [1, hitzeKondensator], 0).
rezept(herstellen, [[1, hitzeKondensator], [1, polyFaser], [1, schaltPlatteRezept]], [1, schaltPlatte], 0).
rezept(herstellen, [[1, thermischesKondensat], [1, angereicherterKohlenStoff], [1, organischerKatalysatorRezept]], [1, organischerKatalysator], 0 ).
rezept(herstellen, [[1, thermischesKondensat], [1, stickStoffSalz], [1, halbLeiterRezept]], [1, halbLeiter], 0 ).
rezept(herstellen, [[1, angereicherterKohlenStoff], [1, stickStoffSalz], [1, heissesEisRezept]], [1, heissesEis], 0 ).
rezept(herstellen, [[50, pyrit], [100, reinesFerrit], [1, strassenKoeterBronzeRezept]], [1, strassenKoeterBronze], 0 ).
rezept(herstellen, [[50, ammoniak], [50, ionisiertesKobalt], [1, heroxRezept]], [1, herox], 0 ).
rezept(herstellen, [[100, reinesFerrit], [50, uran], [1, lemmiumRezept]], [1, lemmium], 0 ).
rezept(herstellen, [[50, ionisiertesKobalt], [50, phosphor], [1, magnoGoldRezept]], [1, magnoGold], 0 ).
rezept(herstellen, [[50, dioxit], [50, ionisiertesKobalt], [1, grantineRezept]], [1, grantine], 0 ).
rezept(herstellen, [[1, tragbarerReaktor], [1, quantumProzessor], [1, geoDesit], [1, fusionsZuenderRezept]], [1, fusionsZuender], 0 ).
rezept(herstellen, [[1, quantumProzessor], [1, kryogenKammer], [1, iridesit], [1, staseGeraetRezept]], [1, staseGeraet], 0 ).
rezept(herstellen, [[1, organischerKatalysator], [1, stickStoffSalz], [1, fusionsBeschleunigerRezept]], [1, fusionsBeschleuniger], 0 ).
rezept(herstellen, [[1, halbLeiter], [1, angereicherterKohlenStoff], [1, supraLeiterRezept]], [1, supraLeiter], 0 ).
rezept(herstellen, [[1, heissesEis], [1, thermischesKondensat], [1, kryoPumpeRezept]], [1, kryoPumpe], 0 ).
rezept(herstellen, [[1, aronium], [1, magnoGold], [1, grantine], [1, iridesitRezept]], [1, iridesit], 0 ).
rezept(herstellen, [[1, strassenKoeterBronze], [1, herox], [1, lemmium], [1, geoDesitRezept]], [1, geoDesit], 0 ).

/* ---------------------  Komponenten & Ger�te ------------------------------------ */
rezept(herstellen, [[1, diWasserStoffGelee], [20, kohlenStoff], [1, lebensErhaltungsGelRezept]], [1, lebensErhaltungsGel], 0).
rezept(herstellen, [[40, diWasserStoff], [1, diWasserStoffGeleeRezept]], [1, diWasserStoffGelee], 0).
rezept(herstellen, [[25, kobalt], [20, ferritStaub], [1, ionenAkkuRezept]], [1, ionenAkku], 0).
rezept(herstellen, [[1, antiMaterieGehaeuse], [1, antiMaterie], [1, warpZelleRezept]], [1, warpZelle], 0).
rezept(herstellen, [[150, verdichteterKohlenStoff], [1, kohlenStoffKristallRezept]], [1, kohlenStoffKristall], 0 ).
rezept(herstellen, [[150, reinesFerrit], [1, seltenesMetallElementRezept]], [1, seltenesMetallElement], 0 ).
rezept(herstellen, [[150, ionisiertesKobalt], [1, tetraKobaltRezept]], [1, tetraKobalt], 0 ).
rezept(herstellen, [[150, chlor], [1, chlorGitterRezept]], [1, chlorGitter], 0 ).
rezept(herstellen, [[150, natriumNitrat], [1, instabilesNatriumRezept]], [1, instabilesNatrium], 0 ).
rezept(herstellen, [[150, sauerStoff], [1, superOxidKristallRezept]], [1, superOxidKristall], 0 ).
rezept(herstellen, [[1, metallPlatten], [40, diWasserStoff], [1, raumSchiffStartTreibStoffRezept]], [1, raumSchiffStartTreibStoff], 0).
rezept(herstellen, [[25, ionisiertesKobalt], [20, reinesFerrit], [1, fortschrittlicherIonenAkkuRezept]], [1, fortschrittlicherIonenAkku], 0).
rezept(herstellen, [[200, kupfer], [1, mikroProzessor], [1, atlasPassV1Rezept]], [1, atlasPassV1], 0).
rezept(herstellen, [[50, ionisiertesKobalt], [1, kobaltSpiegelRezept]], [1, kobaltSpiegel], 0 ).
rezept(herstellen, [[50, chlor], [1, salzRefaktorRezept]], [1, salzRefaktor], 0 ).
rezept(herstellen, [[40, natriumNitrat], [40, ferritStaub], [1, natriumDiodeRezept]], [1, natriumDiode], 0 ).
rezept(herstellen, [[90, sauerStoff], [30, reinesFerrit], [1, sauerStoffFilterRezept]], [1, sauerStoffFilter], 0 ).
rezept(herstellen, [[25, sauerStoff], [20, ferritStaub], [1, sauerStoffKapselRezept]], [1, sauerStoffKapsel], 0).
rezept(herstellen, [[40, salz], [40, zytoPhosphat], [40, kohlenStoff], [1, hydrothermaleTreibStoffZelleRezept]], [1, hydrothermaleTreibStoffZelle], 0).
rezept(herstellen, [[50, sauerStoff], [1, metallPlatten], [1, instabilesPlasmaRezept]], [1, instabilesPlasma], 0).
rezept(herstellen, [[50, tritium], [20, gold], [1, sternenSchildBatterieRezept]], [1, sternenSchildBatterie], 0).
rezept(herstellen, [[200, cadmium], [1, mikroProzessor], [1, atlasPassV2Rezept]], [1, atlasPassV2], 0).
rezept(herstellen, [[1, antiMaterie], [1, sturmKristall], [1, warpHyperKernRezept]], [1, warpHyperKern], 0).
rezept(herstellen, [[200, emeril], [1, mikroProzessor], [1, atlasPassV3Rezept]], [1, atlasPassV3], 0).

/* ---------------------  Anzug-Bau-Rezepte --------------------------------------- */
rezept(herstellen, [[30, verdichteterKohlenStoff], [1, hermetischesSiegelRezept]], [1, hermetischesSiegel], 0 ).
rezept(herstellen, [[50, kohlenStoff], [1, kohlenStoffNanoRohrRezept]], [1, kohlenStoffNanoRohr], 0).
rezept(herstellen, [[50, ferritStaub], [1, metallPlattenRezept]], [1, metallPlatten], 0).
rezept(herstellen, [[60, ferritStaub], [1, projektilMunitionRezept]], [1, projektilMunition], 0).
rezept(herstellen, [[25, chromatischesMetall], [20, verdichteterKohlenStoff], [1, antiMaterieRezept]], [1, antiMaterie], 0).
rezept(herstellen, [[30, sauerStoff], [50, ferritStaub], [1, antiMaterieGehaeuseRezept]], [1, antiMaterieGehaeuse], 0).
rezept(herstellen, [[1, kohlenStoffNanoRohr], [40, chromatischesMetall], [1, mikroProzessorRezept]], [1, mikroProzessor], 0).
rezept(herstellen, [[10, kohlenStoff], [1, kreaturenKugelnRezept]], [1, kreaturenKugeln], 0).

/* mit erstem Frachter gelernt */
rezept(herstellen, [[50, diWasserStoff], [50, tritium], [1, fregattenTreibStoff50toRezept]], [1, fregattenTreibStoff50to], 0).
rezept(herstellen, [[100, diWasserStoff], [100, tritium], [1, fregattenTreibStoff100toRezept]], [1, fregattenTreibStoff100to], 0).
rezept(herstellen, [[200, diWasserStoff], [200, tritium], [1, fregattenTreibStoff200toRezept]], [1, fregattenTreibStoff200to], 0).

/* %%%%%%%%%%%%%%%%%%%%%  verbrauchbare Fregatten Upgrade-Rezepte %%%%%%%%%%%%%%%%%%%% */
rezept(herstellen, [[2, vierfachServo], [50, gold], [1, treibStoffOxidantRezept]], [1, treibStoffOxidant], 0).
rezept(herstellen, [[1, natriumDiode], [50, gold], [1, gedankenKontrollGeraetRezept]], [1, gedankenKontrollGeraet], 0 ).
rezept(herstellen, [[1, sauerStoffFilter], [50, gold], [1, holografischerAnalysatorRezept]], [1, holografischerAnalysator], 0).
rezept(herstellen, [[1, kobaltSpiegel], [50, gold], [1, mineralKompressorRezept]], [1, mineralKompressor], 0).
rezept(herstellen, [[1, kampfLaeuferGehirn], [50, gold], [1, sprengDrohnenRezept]], [1, sprengDrohnen], 0 ). 

/* =====================  Questrezepte -------------------------------------------- */
rezept(herstellen, [[100, chromatischesMetall], [1, gefangeneNanodeRezept]], [1, gefangeneNanode], 0 ).
rezept(herstellen, [[1, gefangeneNanode], [100, reinesFerrit], [1, umhuellterSchattenRezept]], [1, umhuellterSchatten], 0).
rezept(herstellen, [[1, umhuellterSchatten], [100, ionisiertesKobalt], [1, nooSphaerischKugelRezept]], [1, nooSphaerischKugel], 0).
rezept(herstellen, [[1, nooSphaerischKugel], [100, magnetisiertesFerrit], [1, dunkleMaterieRezept]], [1, dunkleMaterie], 0).
rezept(herstellen, [[1, dunkleMaterie], [100, chromatischesMetall], [1, endeDerDaemmerungRezept]], [1, endeDerDaemmerung], 0).
rezept(herstellen, [[1, endeDerDaemmerung], [100, kupfer], [1, photischerJadeRezept]], [1, photischerJade], 0 ).
rezept(herstellen, [[1, photischerJade], [100, cadmium], [1, zustandsPhaseRezept]], [1, zustandsPhase], 0).
rezept(herstellen, [[1, zustandsPhase], [100, emeril], [1, novaeRegeneratRezept]], [1, novaeRegenerat], 0).
rezept(herstellen, [[1, novaeRegenerat], [100, indium], [1, modifizierteQuantenRezept]], [1, modifizierteQuanten], 0).
rezept(herstellen, [[1, modifizierteQuanten], [100, gold], [1, herzDerSonneRezept]], [1, herzDerSonne], 0).
rezept(herstellen, [[16, platin], [16, tritium], [16, gold], [1, sternenSamenRezept]], [1, sternenSamen], 0 ).

rezept(herstellen, [[3, metallPlatten], [1, lebendePerle], [120, cadmium], [1, seelenEngineRezept]], [1, seelenEngine], 0).
rezept(herstellen, [[1, seelenEngine], [3, kabelBaum], [3, glas], [1, gedankenBogenRezept]], [1, gedankenBogen], 0 ).


/* %%%%%%%%%%%%%%%%%%%%%  Anzugmodule erforschbar %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
rezept(installieren, [[100, ferritStaub], [1, lebensErhaltungRezept]], [1, lebensErhaltung], 0 ).
rezept(installieren, [[50, chromatischesMetall], [20, natriumNitrat], [1, gefahrGutSchutzHandschuhRezept]], [1, gefahrGutSchutzHandschuh], 0).
rezept(installieren, [[150, sauerStoff], [100, chromatischesMetall], [1, persoenlicheRaffinerieRezept]], [1, persoenlicheRaffinerie], 0).
rezept(installieren, [[100, ferritStaub], [1, gefahrenSchutzRezept]], [1, gefahrenSchutz], 0 ).
rezept(installieren, [[60, sauerStoff], [1, sauerStoffWiederVerwerterCRezept]], [1, sauerStoffWiederVerwerterC], 0 ).
rezept(installieren, [[100, ferritStaub], [1, jetPackRezept]], [1, jetPack], 0 ).
rezept(installieren, [[1, kabelBaum], [1, einfacherUeberSetzerBRezept]], [1, einfacherUeberSetzerB], 0 ).
rezept(installieren, [[150, phosphor],[60, silber],[75, kupfer], [1, kuehlMittelNetzwerkCRezept]], [1, kuehlMittelNetzwerkC], 0 ).
rezept(installieren, [[150, dioxit],[60, silber],[75, kupfer], [1, waermeSchichtCRezept]], [1, waermeSchichtC], 0 ).
rezept(installieren, [[150, ammoniak],[60, silber],[75, kupfer], [1, toxinDaempferCRezept]], [1, toxinDaempferC], 0 ).
rezept(installieren, [[150, uran],[60, silber],[75, kupfer], [1, strahlungsDeflektorCRezept]], [1, strahlungsDeflektorC], 0 ).
rezept(installieren, [[150, sauerStoff],[60, silber],[75, kupfer], [1, belueftungsMembranBRezept]], [1, belueftungsMembranB], 0 ).
rezept(installieren, [[1, natriumDiode], [1, antiMaterie], [1, schildGitterBRezept]], [1, schildGitterB], 0).
rezept(installieren, [[100, chromatischesMetall],[1, salzRefaktor],[6, kristallSulfid], [1, sauerStoffUmleiterARezept]], [1, sauerStoffUmleiterA], 0 ).
rezept(installieren, [[100, chromatischesMetall], [100, verdichteterKohlenStoff], [1, neuralStimulatorBRezept]], [1, neuralStimulatorB], 0 ).
rezept(installieren, [[150, chromatischesMetall], [150, phosphor], [150, sauerStoff], [1, luftSchubAntriebSRezept]], [1, luftSchubAntriebS], 0 ).
rezept(installieren, [[100, tritium], [1, salzRefaktor], [1, raketenStiefelARezept]], [1, raketenStiefelA], 0).
rezept(installieren, [[100, chromatischesMetall],[100, sauerStoff],[6, lebendePerle], [1, effizienteWasserDuesenARezept]], [1, effizienteWasserDuesenA], 0 ).
rezept(installieren, [[2, kabelBaum],[1, natriumDiode],[50, chromatischesMetall], [1, verbesserterUebersetzerARezept]], [1, verbesserterUebersetzerA], 0 ).
rezept(installieren, [[3, kabelBaum],[2, korvaxKonvergenzWuerfel],[50, platin], [1, perfektionierterUebersetzerSRezept]], [1, perfektionierterUebersetzerS], 0 ).


/* %%%%%%%%%%%%%%%%%%%%%  Fahrzeugmodule %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
rezept(installieren, [[25, magnetisiertesFerrit], [2, sauerStoffKapsel], [1, fusionsAntriebRezept]], [1, fusionsAntrieb], 0).
rezept(installieren, [[25, magnetisiertesFerrit], [2, sauerStoffKapsel], [1, humboldtAntriebRezept]], [1, humboldtAntrieb], 0).
rezept(installieren, [[50, chromatischesMetall], [1, mikroProzessor], [1, exoFahrzeugSignalBoosterRezept]], [1, exoFahrzeugSignalBooster], 0).
rezept(installieren, [[50, chromatischesMetall], [15, magnetisiertesFerrit], [2, kohlenStoffNanoRohr], [1, exoFahrzeugBeschleunigungsModulRezept]], [1, exoFahrzeugBeschleunigungsModul], 0).
rezept(installieren, [[100, chromatischesMetall], [25, magnetisiertesFerrit], [2, sauerStoffKapsel]], [1, exoFahrzeugMinenLaser], 0).
rezept(installieren, [[150, chromatischesMetall], [6, lebendePerle], [2, chlorGitter], [1, osmotischerGeneratorCRezept]], [1, osmotischerGeneratorC], 0).
rezept(installieren, [[1, salzRefaktor], [3, kristallSulfid], [50, ferritStaub], [1, hochleistungsSonarRezept]], [1, hochleistungsSonar], 0).
rezept(installieren, [[50, magnetisiertesFerrit], [100, chlor], [10, lebendePerle], [1, tethysStrahlRezept]], [1, tethysStrahl], 0).
rezept(installieren, [[100, chlor], [6, kristallSulfid], [2, lebendePerle], [1, nautilonKanoneRezept]], [1, nautilonKanone], 0).
rezept(installieren, [[100, chromatischesMetall], [2, ionenAkku], [2, mikroProzessor], [1, exoFahrzeugSignalBoosterUpgradeSigmaBRezept]], [1, exoFahrzeugSignalBoosterUpgradeSigmaB], 0).
rezept(installieren, [[50, chromatischesMetall], [50, pugneum], [1, exoFahrzeugMinenLaserUpgradeSigmaARezept]], [1, exoFahrzeugMinenLaserUpgradeSigmaA], 0).
rezept(installieren, [[50, pugneum], [100, kupfer], [1, exoFahrzeugBordKanoneRezept]], [1, exoFahrzeugBordKanone], 0).
rezept(installieren, [[150, chromatischesMetall], [2, ionenAkku], [50, gold], [1, exoFahrzeugSignalBoosterUpgradeTauARezept]], [1, exoFahrzeugSignalBoosterUpgradeTauA], 0).


/* %%%%%%%%%%%%%%%%%%%%%  Raumschiff-Module %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
rezept(installieren, [[1, warpZelle], [3, tritiumHyperCluster], [100, chromatischesMetall],[1,instabilitaetsAntriebARezept]], [1, instabilitaetsAntriebA], 0 ).
rezept(installieren, [[3, kohlenStoffKristall], [100, platin], [200, tritium], [1, unterLichtVerstaerkerSRezept]], [1, unterLichtVerstaerkerS], 0 ).
rezept(installieren, [[1, warpZelle], [220, gold], [4, mikroProzessor], [1, notFallWarpEinheitARezept]], [1, notFallWarpEinheitA], 0 ).
rezept(installieren, [[1, hermetischesSiegel], [1, metallPlatten], [1, impulsAntriebRezept]], [1, impulsAntrieb], 0 ).
rezept(installieren, [[1, antiMaterie], [3, kabelBaum], [1, teleportEmpfaengerRezept]], [1, teleportEmpfaenger], 0 ).
rezept(installieren, [[125, chromatischesMetall], [5, mikroProzessor], [1, hyperAntriebRezept]], [1, hyperAntrieb], 0 ).
rezept(installieren, [[100, reinesFerrit], [1, diWasserStoffGelee], [1, startSchubDueseRezept]], [1, startSchubDuese], 0 ).
rezept(installieren, [[100, chromatischesMetall], [25, natriumNitrat], [1, deflektorSchildRezept]], [1, deflektorSchild], 0 ).
rezept(installieren, [[100, reinesFerrit], [60, natriumNitrat], [1, photonenKanoneRezept]], [1, photonenKanone], 0 ).
rezept(installieren, [[1, kampfLaeuferGehirn], [1, kabelBaum], [1, konfliktScannerRezept]], [1, konfliktScanner], 0 ).
rezept(installieren, [[5, mikroProzessor], [1, kabelBaum], [1, wirtschaftsScannerRezept]], [1, wirtschaftsScanner], 0 ).
rezept(installieren, [[250, chromatischesMetall], [1, kabelBaum], [1, cadmiumAntriebBRezept]], [1, cadmiumAntriebB], 0 ).
rezept(installieren, [[1, diWasserStoffGelee], [100, tritium], [2, kabelBaum], [1, effizienteDuesenBRezept]], [1, effizienteDuesenB], 0).
rezept(installieren, [[1, kabelBaum], [100, gold], [50, natriumNitrat], [1, ablativePanzerungCRezept]], [1, ablativePanzerungC], 0).
rezept(installieren, [[1, hermetischesSiegel], [1, kabelBaum], [100, tritium], [1, nichtlineareOptikCRezept]], [1, nichtlineareOptikC], 0).
rezept(installieren, [[200, kupfer], [100, verdichteterKohlenStoff], [1, raketenWerferRezept]], [1, raketenWerfer], 0 ).
rezept(installieren, [[100, tritium], [1, kabelBaum], [1, phasenStrahlerRezept]], [1, phasenStrahler], 0 ).
rezept(installieren, [[200, uran], [1, kabelBaum], [1, positronenWerferRezept]], [1, positronenWerfer], 0 ).
rezept(installieren, [[200, phosphor], [2, kabelBaum], [1, infraMesserBeschleunigerRezept]], [1, infraMesserBeschleuniger], 0 ).
rezept(installieren, [[200, dioxit], [1, kabelBaum], [1, zyklotronBallisteRezept]], [1, zyklotronBalliste], 0 ).
rezept(installieren, [[250, cadmium], [1, kabelBaum], [1, emerilAntriebARezept]], [1, emerilAntriebA], 0 ).
rezept(installieren, [[5, antiMaterie], [2, kobaltSpiegel], [2, kabelBaum], [1, startSystemLadeGeraetSRezept]], [1, startSystemLadeGeraetS], 0).
rezept(installieren, [[2, kabelBaum], [4, instabilesPlasma], [1, grosseRaketenRohreBRezept]], [1, grosseRaketenRohreB], 0 ).
rezept(installieren, [[1, salzRefaktor], [2, kabelBaum], [1, fourierBegrenzerBRezept]], [1, fourierBegrenzerB], 0 ).
rezept(installieren, [[3, seltenesMetallElement], [2, kabelBaum], [1, fragmentSuperAufladerBRezept]], [1, fragmentSuperAufladerB], 0 ).
rezept(installieren, [[1, instabilesNatrium], [2, kabelBaum], [1, nichtlineareOptikBRezept]], [1, nichtlineareOptikB], 0).
rezept(installieren, [[3, tetraKobalt], [2, kabelBaum], [1, dysonPumpeBRezept]], [1, dysonPumpeB], 0).
rezept(installieren, [[250, emeril], [1, kabelBaum], [1, indiumAntriebSRezept]], [1, indiumAntriebS], 0 ).

/* %%%%%%%%%%%%%%%%%%%%%  Frachter-Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
rezept(installieren, [[250, cadmium], [1, sauerStoffFilter], [4, antiMaterieGehaeuse], [1, warpKernResonatorRezept]], [1, warpKernResonator], 0).
rezept(installieren, [[1, warpHyperKern], [2, superOxidKristall], [250, cadmium], [1, verstraerkterWarpSchildCRezept]], [1, verstraerkterWarpSchildC], 0).
rezept(installieren, [[1, warpHyperKern], [2, chlorGitter], [250, emeril], [1, chromatischerWarpSchildBRezept]], [1, chromatischerWarpSchildB], 0).
rezept(installieren, [[1, warpHyperKern], [2, tetraKobalt], [250, indium], [1, temporalerWarpComputerARezept]], [1, temporalerWarpComputerA], 0).
rezept(installieren, [[250, emeril], [1, natriumDiode], [5, antiMaterieGehaeuse], [1, plasmaWarpInjektorBRezept]], [1, plasmaWarpInjektorB], 0).
rezept(installieren, [[250, indium], [1, salzRefaktor], [6, antiMaterieGehaeuse], [1, realitaetsEntwirrerRezept]], [1, realitaetsEntwirrer], 0).
rezept(installieren, [[5, antiMaterie], [3, natriumDiode], [10, kabelBaum], [1, materieStrahlRezept]], [1, materieStrahl], 0).

/* %%%%%%%%%%%%%%%%%%%%%  Multiwerkzeug-Module %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
/* von Anfang bekannt */
rezept(installieren, [[1, kohlenStoffNanoRohr], [1, analyseVisierRezept]], [1, analyseVisier], 0 ).
rezept(installieren, [[150, ferritStaub], [1, scannerRezept]], [1, scanner], 0 ).
rezept(installieren, [[2, kohlenStoffNanoRohr], [1, diWasserStoffGelee], [1, terrainManipulatorRezept]], [1, terrainManipulator], 0 ).

rezept(installieren, [[60, ferritStaub], [1, minenLaserRezept]], [1, minenLaser], 0 ).
rezept(installieren, [[100, chromatischesMetall], [3, kohlenStoffNanoRohr], [1, blitzWerferRezept]], [1, blitzWerfer], 0 ).
rezept(installieren, [[2, ionenAkku], [1, kabelBaum], [1, eigenesKraftFeldRezept]], [1, eigenesKraftFeld], 0 ).
rezept(installieren, [[1, kohlenStoffNanoRohr], [1, hermetischesSiegel], [2, kabelBaum], [1, fortgeschrittenerMinenLaserARezept]], [1, fortgeschrittenerMinenLaserA], 0).
rezept(installieren, [[100, magnetisiertesFerrit], [1, ionenAkku], [1, wellenFormWiederVerwerterBRezept]], [1, wellenFormWiederVerwerterB], 0 ).
rezept(installieren, [[4, glas], [1, kabelBaum], [1, laufIonisatorCRezept]], [1, laufIonisatorC], 0 ).
rezept(installieren, [[1, superOxidKristall], [1, kabelBaum], [1, plasmaWerferRezept]], [1, plasmaWerfer], 0 ).
rezept(installieren, [[200, chromatischesMetall], [150, verdichteterKohlenStoff], [1, kabelBaum], [1, glutSpeerRezept]], [1, glutSpeer], 0 ).
rezept(installieren, [[200, pugneum], [1, kabelBaum], [1, streuBlasterRezept]], [1, streuBlaster], 0 ).
rezept(installieren, [[200, deuterium], [1, kabelBaum], [1, impulsWerferRezept]], [1, impulsWerfer], 0 ).
rezept(installieren, [[2, ionenAkku], [1, kabelBaum], [1, kampfVisierRezept]], [1, kampfVisier], 0 ).
rezept(installieren, [[3, natriumDiode], [3, salzRefaktor], [5, kabelBaum], [1, optischerBohrerSRezept]], [1, optischerBohrerS], 0 ).
rezept(installieren, [[3, natriumDiode], [1, kobaltSpiegel], [2, kabelBaum], [1, untersuchungsGeraetARezept]], [1, untersuchungsGeraetA], 0 ).
rezept(installieren, [[1, seltenesMetallElement], [1, kabelBaum], [1, geologieKanoneRezept]], [1, geologieKanone], 0 ).
rezept(installieren, [[1, superOxidKristall], [1, kabelBaum], [1, masseBeschleunigerCRezept]], [1, masseBeschleunigerC], 0 ).
rezept(installieren, [[1, chlorGitter], [1, kabelBaum], [1, geschossSchmiererCRezept]], [1, geschossSchmiererC], 0 ).
rezept(installieren, [[1, tetraKobalt], [1, kabelBaum], [1, verstaerkteKartuschenCRezept]], [1, verstaerkteKartuschenC], 0 ).

/* %%%%%%%%%%%%%%%%%%%%%  Siedlung-Bau-Rezepte nicht erforschbar %%%%%%%%%%%%%%%%%%%%% */
/* =====================  allgemein ================================================== */
rezept(bauen, [[3, metallPlatten], [50, gold], [1, antiMaterie], [1, byteBeatGeraetRezept]], [1, byteBeatGeraet], 0 ).
rezept(bauen, [[25, ferritStaub], [15, ionisiertesKobalt], [1, byteBeatSchaltungRezept]], [1, byteBeatSchaltung], 0 ).
rezept(bauen, [[50, reinesFerrit], [1, basisBergungsKapselRezept]], [1, basisBergungsKapsel], 0 ).
rezept(bauen, [[20, reinesFerrit], [1, kommunikationsStationRezept]], [1, kommunikationsStation], 0 ).
rezept(bauen, [[100, uran], [2, metallPlatten], [1, fortschrittlicherIonenAkku], [1, autonomeBergBauEinheitRezept]], [1, autonomeBergBauEinheit], 0).
rezept(bauen, [[5, ammoniak], [2, metallPlatten], [2, hermetischesSiegel], [1, atmosphaerenVerarbeitungsAnlageRezept]], [1, atmosphaerenVerarbeitungsAnlage], 0).
rezept(bauen, [[1, metallPlatten], [1, kohlenStoffNanoRohr], [1, nachrichtenModulRezept]], [1, nachrichtenModul], 0).
rezept(bauen, [[5, metallPlatten], [5, sauerStoffKapsel], [3, diWasserStoffGelee], [1, sauerStoffVerarbeiterRezept]], [1, sauerStoffVerarbeiter], 0).

/* =====================  tragbar ==================================================== */
rezept(bauen, [[40, chromatischesMetall], [1, basisComputerRezept]], [1, basisComputer], 0 ).
rezept(bauen, [[20, magnetisiertesFerrit], [1, kohlenStoffNanoRohr], [1, konstruktionsForschungsStationRezept]], [1, konstruktionsForschungsStation], 0).
rezept(bauen, [[1, metallPlatten], [30, sauerStoff], [1, tragbareRaffinerieRezept]], [1, tragbareRaffinerie], 0).
rezept(bauen, [[2, metallPlatten], [1, diWasserStoffGelee], [1, speicherPunktRezept]], [1, speicherPunkt], 0).

/* =====================  Lager ====================================================== */
rezept(bauen, [[10, reinesFerrit], [1, verschlosseneKisteRezept]], [1, verschlosseneKiste], 0 ).

/* =====================  Terminals ================================================== */
rezept(bauen, [[40, chromatischesMetall], [25, reinesFerrit], [1, konstruktionsTerminalRezept]], [1, konstruktionsTerminal], 0).
rezept(bauen, [[40, chromatischesMetall], [25, diWasserStoff], [1, exoFahrzeugTerminalRezept]], [1, exoFahrzeugTerminal], 0).
rezept(bauen, [[40, chromatischesMetall], [25, pugneum], [1, waffenTerminalRezept]], [1, waffenTerminal], 0).
rezept(bauen, [[40, chromatischesMetall], [25, magnetisiertesFerrit], [1, wissenschaftsTerminalRezept]], [1, wissenschaftsTerminal], 0).
rezept(bauen, [[40, chromatischesMetall], [25, verdichteterKohlenStoff], [1, landwirtschaftsTerminalRezept]], [1, landwirtschaftsTerminal], 0).

/* =====================  Frachter =================================================== */
rezept(bauen, [[120, silber], [40, gold], [10, tritium], [1, flottenKommandoRaumRezept]], [1, flottenKommandoRaum], 0).
rezept(bauen, [[120, silber], [20, tritium], [1, grosserFrachterRaumRezept]], [1, grosserFrachterRaum], 0).
rezept(bauen, [[80, silber], [10, tritium], [1, frachterKorridorRezept]], [1, frachterKorridor], 0).
rezept(bauen, [[80, silber], [10, tritium], [1, gebogenerFrachterKorridorRezept]], [1, gebogenerFrachterKorridor], 0).
rezept(bauen, [[80, silber], [10, tritium], [1, frachterKreuzungDreiFachRezept]], [1, frachterKreuzungDreiFach], 0).
rezept(bauen, [[50, silber], [1, frachterTreppeRezept]], [1, frachterTreppe], 0).
rezept(bauen, [[80, silber], [10, tritium], [1, frachterKreuzungVierFachRezept]], [1, frachterKreuzungVierFach], 0).


/* %%%%%%%%%%%%%%%%%%%%%  Siedlung-Bau-Rezepte erforschbar %%%%%%%%%%%%%%%%%%%%%%%%%%% */
/* =====================  gross vorgefertigt ========================================= */
rezept(bauen, [[350, reinesFerrit], [1, zylindrischerRaumRezept]], [1, zylindrischerRaum], 0 ).
rezept(bauen, [[350, reinesFerrit], [1, quadratischerRaumRezept]], [1, quadratischerRaum], 0 ).
rezept(bauen, [[100, reinesFerrit], [1, geraderKorridorRezept]], [1, geraderKorridor], 0 ).
rezept(bauen, [[50, reinesFerrit], [1, tuerRezept]], [1, tuer], 0 ).
rezept(bauen, [[350, reinesFerrit], [1, fundamentRezept]], [1, fundament], 0 ).
rezept(bauen, [[100, reinesFerrit], [1, lFoermigerKorridorRezept]], [1, lFoermigerKorridor], 0 ).
rezept(bauen, [[100, reinesFerrit], [1, glas], [1, korridorMitGlasDachRezept]], [1, korridorMitGlasDach], 0 ).
rezept(bauen, [[50, gold], [40, reinesFerrit], [40, silikatPulver], [1, holoTuerRezept]], [1, holoTuer], 0 ).
rezept(bauen, [[50, kohlenStoff], [50, reinesFerrit], [1, zugangsRampeRezept]], [1, zugangsRampe], 0).
rezept(bauen, [[5, reinesFerrit], [1, pflasterungVierFachRezept]], [1, pflasterungVierFach], 0 ).
rezept(bauen, [[50, reinesFerrit], [1, viererFundamentStrebeRezept]], [1, viererFundamentStrebe], 0 ).
rezept(bauen, [[80, reinesFerrit], [1, fundamentStrebeRezept]], [1, fundamentStrebe], 0 ).
rezept(bauen, [[200, reinesFerrit], [1, zylindrischerRaumRahmenRezept]], [1, zylindrischerRaumRahmen], 0 ).
rezept(bauen, [[100, reinesFerrit], [1, tFoermigerKorridorRezept]], [1, tFoermigerKorridor], 0 ).
rezept(bauen, [[100, reinesFerrit], [1, xFoermigerKorridorRezept]], [1, xFoermigerKorridor], 0 ).
rezept(bauen, [[25, silber], [1, glas], [1, korridorFensterRezept]], [1, korridorFenster], 0).
rezept(bauen, [[25, magnetisiertesFerrit], [5, glas], [1, bioKuppelRaumRezept]], [1, bioKuppelRaum], 0).
rezept(bauen, [[100, reinesFerrit], [1, gebogenerKorridorRezept]], [1, gebogenerKorridor], 0 ).
rezept(bauen, [[30, reinesFerrit], [1, leiterRezept]], [1, leiter], 0 ).
rezept(bauen, [[5, reinesFerrit], [1, pflasterungRezept]], [1, pflasterung], 0 ).
rezept(bauen, [[25, reinesFerrit], [1, pflasterungPodestRezept]], [1, pflasterungPodest], 0 ).
rezept(bauen, [[1, glas], [1, grossesGlasPaneelRezept]], [1, grossesGlasPaneel], 0 ).
rezept(bauen, [[10, magnetisiertesFerrit], [3, glas], [1, aussichtsKugelRezept]], [1, aussichtsKugel], 0).

/* =====================  klein vorgefertigt ========================================= */
rezept(bauen, [[200, reinesFerrit], [1, wuerfelFoermigerRaumRezept]], [1, wuerfelFoermigerRaum], 0 ).
rezept(bauen, [[80, reinesFerrit], [1, wuerfelRaumFundamentStrebeRezept]], [1, wuerfelRaumFundamentStrebe], 0 ).
rezept(bauen, [[100, reinesFerrit], [1, gewoelbteWuerfelFoermigeWandRezept]], [1, gewoelbteWuerfelFoermigeWand], 0 ).
rezept(bauen, [[100, silber], [2, glas], [1, wuerfelFoermigerGlasRaumRezept]], [1, wuerfelFoermigerGlasRaum], 0 ).
rezept(bauen, [[80, reinesFerrit], [1, wuerfelFoermigerRaumRahmenRezept]], [1, wuerfelFoermigerRaumRahmen], 0 ).
rezept(bauen, [[80, reinesFerrit], [1, wuerfelFoermigerRaumBodenRezept]], [1, wuerfelFoermigerRaumBoden], 0 ).
rezept(bauen, [[80, reinesFerrit], [1, wuerfelRaumViererFundamentStrebeRezept]], [1, wuerfelRaumViererFundamentStrebe], 0 ).
rezept(bauen, [[50, reinesFerrit], [30, kohlenStoff], [1, innenTreppenRezept]], [1, innenTreppen], 0).
rezept(bauen, [[80, reinesFerrit], [1, wuerfelFoermigeInnenWandRezept]], [1, wuerfelFoermigeInnenWand], 0 ).
rezept(bauen, [[80, reinesFerrit], [1, wuerfelFoermigerDachAufsatzRezept]], [1, wuerfelFoermigerDachAufsatz], 0 ).
rezept(bauen, [[100, reinesFerrit], [1, glas], [1, gewoelbtesWuerfelFoermigesDachRezept]], [1, gewoelbtesWuerfelFoermigesDach], 0 ).
rezept(bauen, [[25, silber], [1, glas], [1, wuerfelFoermigesFensterEckigRezept]], [1, wuerfelFoermigesFensterEckig], 0 ).
rezept(bauen, [[25, silber], [1, glas], [1, wuerfelFoermigesFensterRundRezept]], [1, wuerfelFoermigesFensterRund], 0 ).
rezept(bauen, [[20, ferritStaub], [1, infraStrukturLeiterRezept]], [1, infraStrukturLeiter], 0 ).
rezept(bauen, [[50, reinesFerrit], [1, wuerfelFoermigeInnenTuerRezept]], [1, wuerfelFoermigeInnenTuer], 0 ).

/* =====================  Technologiemodule ========================================== */
/* ---------------------  Konstruktionsforschungsstation ----------------------------- */
rezept(bauen, [[4, metallPlatten], [2, kohlenStoffNanoRohr], [40, natrium], [1, basisTelePorterModulRezept]], [1, basisTelePorterModul], 0).
rezept(bauen, [[1, metallPlatten], [40, sauerStoff], [1, bioTreibStoffReaktorRezept]], [1, bioTreibStoffReaktor], 0).
rezept(bauen, [[2, metallPlatten], [15, natriumNitrat], [1, speicherSignalRezept]], [1, speicherSignal], 0).
rezept(bauen, [[1, metallPlatten], [20, ionisiertesKobalt], [50, uran], [1, gesundheitsStationRezept]], [1, gesundheitsStation], 0).
rezept(bauen, [[1, metallPlatten], [1, kohlenStoffNanoRohr], [15, natrium], [1, signalBoosterRezept]], [1, signalBooster], 0).
rezept(bauen, [[60, magnetisiertesFerrit], [100, verdichteterKohlenStoff], [1, batterieRezept]], [1, batterie], 0).
rezept(bauen, [[2, metallPlatten], [75, chromatischesMetall], [50, gold], [1, solarModulRezept]], [1, solarModul], 0).
rezept(bauen, [[1, metallPlatten], [20, ionisiertesKobalt], [50, phosphor], [1, gefahrenSchutzEinheitRezept]], [1, gefahrenSchutzEinheit], 0).

/* ---------------------  Anomalie  -------------------------------------------------- */
rezept(bauen, [[2, metallPlatten], [1, hermetischesSiegel], [25, natrium], [1, naehrStoffProzessorRezept]], [1, naehrStoffProzessor], 0).
rezept(bauen, [[50, magnetisiertesFerrit], [20, natrium], [1, lagerBehaelter0Rezept]], [1, lagerBehaelter0], 0).
rezept(bauen, [[50, magnetisiertesFerrit], [20, natrium], [1, lagerBehaelter1Rezept]], [1, lagerBehaelter1], 0).
rezept(bauen, [[50, magnetisiertesFerrit], [20, natrium], [1, lagerBehaelter2Rezept]], [1, lagerBehaelter2], 0).
rezept(bauen, [[50, magnetisiertesFerrit], [20, natrium], [1, lagerBehaelter3Rezept]], [1, lagerBehaelter3], 0).
rezept(bauen, [[50, magnetisiertesFerrit], [20, natrium], [1, lagerBehaelter4Rezept]], [1, lagerBehaelter4], 0).
rezept(bauen, [[50, magnetisiertesFerrit], [20, natrium], [1, lagerBehaelter5Rezept]], [1, lagerBehaelter5], 0).
rezept(bauen, [[50, magnetisiertesFerrit], [20, natrium], [1, lagerBehaelter6Rezept]], [1, lagerBehaelter6], 0).
rezept(bauen, [[50, magnetisiertesFerrit], [20, natrium], [1, lagerBehaelter7Rezept]], [1, lagerBehaelter7], 0).
rezept(bauen, [[50, magnetisiertesFerrit], [20, natrium], [1, lagerBehaelter8Rezept]], [1, lagerBehaelter8], 0).
rezept(bauen, [[50, magnetisiertesFerrit], [20, natrium], [1, lagerBehaelter9Rezept]], [1, lagerBehaelter9], 0).
rezept(bauen, [[10, ferritStaub], [1, aussehenModifikatorRezept]], [1, aussehenModifikator], 0 ).
rezept(bauen, [[10, metallPlatten], [2, ionenAkku], [2, mikroProzessor], [1, landeFeldRezept]], [1, landeFeld], 0).
rezept(bauen, [[4, metallPlatten], [2, polyFaser], [50, faecium], [1, nutzTierEinheitRezept]], [1, nutzTierEinheit], 0).
rezept(bauen, [[4, metallPlatten], [1, sauerStoffFilter], [10, kreaturenKugeln], [1, automatischerFuettererRezept]], [1, automatischerFuetterer], 0).
rezept(bauen, [[25, magnetisiertesFerrit], [3, mikroProzessor], [1, terminalDesGalaktischenMarktesRezept]], [1, terminalDesGalaktischenMarktes], 0).
rezept(bauen, [[5, metallPlatten], [100, chromatischesMetall], [25, platin], [1, kurzStreckenTelePorterRezept]], [1, kurzStreckenTelePorter], 0).
rezept(bauen, [[100, magnetisiertesFerrit], [5, diWasserStoffGelee], [1, mittlereRaffinerieRezept]], [1, mittlereRaffinerie], 0).
rezept(bauen, [[200, chromatischesMetall], [100, natriumNitrat], [5, mikroProzessor], [1, grosseRaffinerieRezept]], [1, grosseRaffinerie], 0).
rezept(bauen, [[1, sturmKristall], [2, antiMaterie], [2, metallPlatten], [1, antiMaterieReaktorRezept]], [1, antiMaterieReaktor], 0).

/* =====================  Transportmodule ============================================ */
rezept(bauen, [[5, metallPlatten], [4, ionenAkku], [100, paraffinium], [1, roamerGeoBuchtRezept]], [1, roamerGeoBucht], 0).
rezept(bauen, [[100, paraffinium], [4, metallPlatten], [4, ionenAkku], [1, nomadenGeoBuchtRezept]], [1, nomadenGeoBucht], 0).
rezept(bauen, [[100, magnetisiertesFerrit], [4, ionenAkku], [1, antiMaterie], [1, exoFahrzeugRufStationRezept]], [1, exoFahrzeugRufStation], 0).
rezept(bauen, [[5, metallPlatten], [4, kristallSulfid], [100, salz], [1, nautilonKammerRezept]], [1, nautilonKammer], 0).
rezept(bauen, [[5, metallPlatten], [4, ionenAkku], [100, paraffinium], [1, pilgerGeoBuchtRezept]], [1, pilgerGeoBucht], 0).
rezept(bauen, [[100, paraffinium], [5, metallPlatten], [4, ionenAkku], [1, kolossGeoBuchtRezept]], [1, kolossGeoBucht], 0).
rezept(bauen, [[2, mikroProzessor], [5, metallPlatten], [1, ionenAkku], [1, rennInitiatorRezept]], [1, rennInitiator], 0).
rezept(bauen, [[5, metallPlatten], [1, rennHindernisRezept]], [1, rennHindernis], 0 ).
rezept(bauen, [[5, metallPlatten], [2, diWasserStoffGelee], [1, rennKraftVerstaerkerRezept]], [1, rennKraftVerstaerker], 0).

/* =====================  Wasser ===================================================== */
rezept(bauen, [[350, reinesFerrit], [1, tiefSeeKammerRezept]], [1, tiefSeeKammer], 0 ).
rezept(bauen, [[5, lebendePerle], [1, glas], [29, ionisiertesKobalt], [1, meeresUnterSchlupfRezept]], [1, meeresUnterSchlupf], 0).
rezept(bauen, [[1, glas], [2, kristallSulfid], [25, ferritStaub], [1, glasTunnelRezept]], [1, glasTunnel], 0).
rezept(bauen, [[350, reinesFerrit], [1, quadratischeTiefSeeKammerRezept]], [1, quadratischeTiefSeeKammer], 0 ).
rezept(bauen, [[25, ferritStaub], [1, kristallSulfid], [1, wasserDichteTuerRezept]], [1, wasserDichteTuer], 0).
rezept(bauen, [[1, glas], [2, kristallSulfid], [25, ferritStaub], [1, lFoermigerGlasTunnelRezept]], [1, lFoermigerGlasTunnel], 0).
rezept(bauen, [[1, glas], [2, kristallSulfid], [25, ferritStaub], [1, vertikalerGlasTunnelRezept]], [1, vertikalerGlasTunnel], 0).
rezept(bauen, [[350, reinesFerrit], [6, kristallSulfid], [2, lebendePerle], [1, mondTeichBodenRezept]], [1, mondTeichBoden], 0).
rezept(bauen, [[1, glas], [2, kristallSulfid], [25, ferritStaub], [1, tFoermigerGlasTunnelRezept]], [1, tFoermigerGlasTunnel], 0).
rezept(bauen, [[1, glas], [2, kristallSulfid], [25, ferritStaub], [1, xFoermigerGlasTunnelRezept]], [1, xFoermigerGlasTunnel], 0).

/* =====================  Motiv Designs ============================================== */
rezept(bauen, [[20, kohlenStoff], [1, motivStilisiertesRRezept]], [1, motivStilisiertesR], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivRundPipetteRezept]], [1, motivRundPipette], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivFaltungDuennDickRezept]], [1, motivFaltungDuennDick], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivZiegelSteineRezept]], [1, motivZiegelSteine], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivRadioAktivGrauRezept]], [1, motivRadioAktivGrau], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivGrabSteinRezept]], [1, motivGrabStein], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivHelloGamesRezept]], [1, motivHelloGames], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivBuegelRezept]], [1, motivBuegel], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivNo0Rezept]], [1, motivNo0], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivNo1Rezept]], [1, motivNo1], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivNo2Rezept]], [1, motivNo2], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivNo3Rezept]], [1, motivNo3], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivNo4Rezept]], [1, motivNo4], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivNo5Rezept]], [1, motivNo5], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivNo6Rezept]], [1, motivNo6], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivNo7Rezept]], [1, motivNo7], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivNo8Rezept]], [1, motivNo8], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivNo9Rezept]], [1, motivNo9], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivSchildErstochenerVogelRezept]], [1, motivSchildErstochenerVogel], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivSchildGr�nerMannRezept]], [1, motivSchildGr�nerMann], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivSchildKorvaxRezept]], [1, motivSchildKorvax], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivFroschSackRezept]], [1, motivFroschSack], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, motivLaemmchenRezept]], [1, motivLaemmchen], 0 ).

/* =====================  Dekorative Module 1 ======================================== */
rezept(bauen, [[5, verdichteterKohlenStoff], [5, natrium], [1, wandBildSchirmRezept]], [1, wandBildSchirm], 0).
rezept(bauen, [[5, verdichteterKohlenStoff], [5, natrium], [1, wandVentilatorRezept]], [1, wandVentilator], 0).
rezept(bauen, [[10, reinesFerrit], [1, gruenerWandBildSchirmRezept]], [1, gruenerWandBildSchirm], 0 ).
rezept(bauen, [[10, reinesFerrit], [1, schubLadenSchrankRezept]], [1, schubLadenSchrank], 0 ).
rezept(bauen, [[10, reinesFerrit], [5, kobalt], [1, wandEinheitRezept]], [1, wandEinheit], 0).
rezept(bauen, [[10, reinesFerrit], [1, lagerModulDekoRezept]], [1, lagerModulDeko], 0 ).
rezept(bauen, [[5, reinesFerrit], [5, kobalt], [1, deckenPaneelRezept]], [1, deckenPaneel], 0).
rezept(bauen, [[5, verdichteterKohlenStoff], [5, kobalt], [1, techBedienFeldRezept]], [1, techBedienFeld], 0).
rezept(bauen, [[10, reinesFerrit], [5, kobalt], [1, serverRezept]], [1, server], 0).
rezept(bauen, [[10, verdichteterKohlenStoff], [1, kanisterRegalRezept]], [1, kanisterRegal], 0 ).
rezept(bauen, [[10, reinesFerrit], [1, kleineKisteRezept]], [1, kleineKiste], 0 ).
rezept(bauen, [[10, reinesFerrit], [1, schliessFachRezept]], [1, schliessFach], 0 ).
rezept(bauen, [[10, ferritStaub], [10, natrium], [1, flachesModulRezept]], [1, flachesModul], 0).
rezept(bauen, [[10, ferritStaub], [10, natrium], [1, seitenModulRezept]], [1, seitenModul], 0).
rezept(bauen, [[10, reinesFerrit], [1, regalModulRezept]], [1, regalModul], 0 ).
rezept(bauen, [[10, reinesFerrit], [1, roboterArmRezept]], [1, roboterArm], 0 ).
rezept(bauen, [[5, reinesFerrit], [5, kobalt], [1, waffenRegalRezept]], [1, waffenRegal], 0).
rezept(bauen, [[10, reinesFerrit], [1, oszilloskopRezept]], [1, oszilloskop], 0 ).
rezept(bauen, [[10, reinesFerrit], [1, achtEckSchrankRezept]], [1, achtEckSchrank], 0 ).
rezept(bauen, [[10, ionisiertesKobalt], [1, antiMaterie], [1, fassFoermigerFabrikatorRezept]], [1, fassFoermigerFabrikator], 0).
rezept(bauen, [[10, verdichteterKohlenStoff], [1, hoherSchrankRezept]], [1, hoherSchrank], 0 ).
rezept(bauen, [[10, ionisiertesKobalt], [1, antiMaterie], [1, kistenFoermigerFabrikatorRezept]], [1, kistenFoermigerFabrikator], 0).

/* =====================  Dekorative Module 2 ======================================== */
rezept(bauen, [[5, verdichteterKohlenStoff], [1, sternenSeide], [1, schalenSitzStuhlRezept]], [1, schalenSitzStuhl], 0 ).
rezept(bauen, [[5, verdichteterKohlenStoff], [1, sternenSeide], [1, stuhlEckigRezept]], [1, stuhlEckig], 0 ).
rezept(bauen, [[5, reinesFerrit], [5, kohlenStoff], [1, flagge1Rezept]], [1, flagge1], 0).
rezept(bauen, [[10, verdichteterKohlenStoff], [1, tischRezept]], [1, tisch], 0 ).
rezept(bauen, [[10, verdichteterKohlenStoff], [1, tischSechsEckigRezept]], [1, tischSechsEckig], 0 ).
rezept(bauen, [[5, verdichteterKohlenStoff], [1, sternenSeide], [1, stuhlFriseurRezept]], [1, stuhlFriseur], 0 ).
rezept(bauen, [[10, verdichteterKohlenStoff], [1, bettRezept]], [1, bett], 0 ).
rezept(bauen, [[10, verdichteterKohlenStoff], [1, sofaRezept]], [1, sofa], 0 ).
rezept(bauen, [[5, reinesFerrit], [5, kohlenStoff], [1, flagge2Rezept]], [1, flagge2], 0).
rezept(bauen, [[5, reinesFerrit], [5, kohlenStoff], [1, wandFlagge1Rezept]], [1, wandFlagge1], 0).
rezept(bauen, [[10, verdichteterKohlenStoff], [1, einfacherSchreibTischRezept]], [1, einfacherSchreibTisch], 0 ).
rezept(bauen, [[10, verdichteterKohlenStoff], [1, ergonomischesSofaRezept]], [1, ergonomischesSofa], 0 ).
rezept(bauen, [[10, verdichteterKohlenStoff], [1, eckSofaRezept]], [1, eckSofa], 0 ).
rezept(bauen, [[5, reinesFerrit], [5, kohlenStoff], [1, flagge3Rezept]], [1, flagge3], 0).
rezept(bauen, [[5, reinesFerrit], [5, kohlenStoff], [1, flagge4Rezept]], [1, flagge4], 0).
rezept(bauen, [[5, reinesFerrit], [5, kohlenStoff], [1, wandFlagge3Rezept]], [1, wandFlagge3], 0).
rezept(bauen, [[5, reinesFerrit], [5, kohlenStoff], [1, wandFlagge2Rezept]], [1, wandFlagge2], 0).
rezept(bauen, [[5, reinesFerrit], [5, kohlenStoff], [1, bodenMatteRezept]], [1, bodenMatte], 0).
rezept(bauen, [[5, reinesFerrit], [5, verdichteterKohlenStoff], [1, grosseMonitorStationRezept]], [1, grosseMonitorStation], 0).
rezept(bauen, [[10, verdichteterKohlenStoff], [5, reinesFerrit], [1, gewoelbterTischRezept]], [1, gewoelbterTisch], 0).
rezept(bauen, [[5, reinesFerrit], [5, kobalt], [1, monitorStationRezept]], [1, monitorStation], 0).
rezept(bauen, [[10, reinesFerrit], [1, arbeitsPlatteRezept]], [1, arbeitsPlatte], 0 ).
rezept(bauen, [[10, ferritStaub], [10, natrium], [1, leichterTischRezept]], [1, leichterTisch], 0).

/* =====================  Beleuchtung ================================================ */
rezept(bauen, [[5, natrium], [1, lichtHandLampeRezept]], [1, lichtHandLampe], 0 ).
rezept(bauen, [[5, natrium], [1, weisseLeuchteRezept]], [1, weisseLeuchte], 0 ).
rezept(bauen, [[5, natrium], [1, lichtStehLampeEckigRezept]], [1, lichtStehLampeEckig], 0 ).
rezept(bauen, [[10, natrium], [1, laborLampeRezept]], [1, laborLampe], 0 ).
rezept(bauen, [[5, natrium], [1, blaueLeuchteRezept]], [1, blaueLeuchte], 0 ).
rezept(bauen, [[5, natrium], [1, pinkeLeuchteRezept]], [1, pinkeLeuchte], 0 ).
rezept(bauen, [[5, natrium], [1, lichtStehLampeRundRezept]], [1, lichtStehLampeRund], 0 ).
rezept(bauen, [[5, natrium], [1, lichtStehLampeSchirmRezept]], [1, lichtStehLampeSchirm], 0 ).
rezept(bauen, [[5, reinesFerrit], [15, natrium], [1, deckenLeuchteRezept]], [1, deckenLeuchte], 0).
rezept(bauen, [[5, natrium], [1, gelbeLeuchteRezept]], [1, gelbeLeuchte], 0 ).
rezept(bauen, [[5, natrium], [1, grueneLeuchteRezept]], [1, grueneLeuchte], 0 ).
rezept(bauen, [[5, natrium], [1, roteLeuchteRezept]], [1, roteLeuchte], 0 ).

/* =====================  Quecksilber ================================================ */
rezept(bauen, [[40, kohlenStoff], [1, meeresGesteinRezept]], [1, meeresGestein], 0 ).
rezept(bauen, [[2, glas], [50, faecium], [50, mordit], [1, terrariumRezept]], [1, terrarium], 0 ).
rezept(bauen, [[40, kohlenStoff], [1, segelPalmeRezept]], [1, segelPalme], 0 ).
rezept(bauen, [[40, kohlenStoff], [1, kugelBaumRezept]], [1, kugelBaum], 0 ).
rezept(bauen, [[40, kohlenStoff], [1, steinGartenRezept]], [1, steinGarten], 0 ).
rezept(bauen, [[2, antiMaterie], [100, chromatischesMetall], [25, platin], [1, taschenRealitaetsGeneratorRezept]], [1, taschenRealitaetsGenerator], 0 ).
rezept(bauen, [[80, zytoPhosphat], [1, krauseKoralleRezept]], [1, krauseKoralle], 0 ).
rezept(bauen, [[80, zytoPhosphat], [1, wasserKristallRezept]], [1, wasserKristall], 0 ).
rezept(bauen, [[80, zytoPhosphat], [1, kronLeuchterBlueteRezept]], [1, kronLeuchterBluete], 0 ).
rezept(bauen, [[80, zytoPhosphat], [1, rankenFuesserRezept]], [1, rankenFuesser], 0 ).
rezept(bauen, [[2, glas], [1, lebendePerle], [1, kleinesAquariumRezept]], [1, kleinesAquarium], 0 ).
rezept(bauen, [[15, reinesFerrit], [15, kupfer], [1, bronzeneAtlasStatueRezept]], [1, bronzeneAtlasStatue], 0 ).
rezept(bauen, [[20, reinesFerrit], [20, silber], [1, silberneAtlasStatueRezept]], [1, silberneAtlasStatue], 0 ).
rezept(bauen, [[30, reinesFerrit], [30, gold], [1, goldeneAtlasStatueRezept]], [1, goldeneAtlasStatue], 0 ).
rezept(bauen, [[40, kohlenStoff], [1, fleischFressenderStrauchRezept]], [1, fleischFressenderStrauch], 0 ).
rezept(bauen, [[40, kohlenStoff], [1, zwergPalmeRezept]], [1, zwergPalme], 0 ).
rezept(bauen, [[40, kohlenStoff], [1, kurioserMaisRezept]], [1, kurioserMais], 0 ).
rezept(bauen, [[15, reinesFerrit], [15, kupfer], [1, bronzeneJaegerStatueRezept]], [1, bronzeneJaegerStatue], 0 ).
rezept(bauen, [[20, reinesFerrit], [20, silber], [1, silberneJaegerStatueRezept]], [1, silberneJaegerStatue], 0 ).
rezept(bauen, [[30, reinesFerrit], [30, gold], [1, goldeneJaegerStatueRezept]], [1, goldeneJaegerStatue], 0 ).
rezept(bauen, [[30, reinesFerrit], [30, platin], [1, expansionsWuerfelGeraetRezept]], [1, expansionsWuerfelGeraet], 0 ).
rezept(bauen, [[30, pugneum], [30, platin], [1, roboterBegleiterRezept]], [1, roboterBegleiter], 0 ).
rezept(bauen, [[30, reinesFerrit], [30, platin], [1, kugelHologrammGeraetRezept]], [1, kugelHologrammGeraet], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, artemisMotivRezept]], [1, artemisMotiv], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, nullMotivRezept]], [1, nullMotiv], 0 ).
rezept(bauen, [[80, kohlenStoff], [1, fruechteBaumRezept]], [1, fruechteBaum], 0 ).
rezept(bauen, [[80, kohlenStoff], [1, spindelBaumRezept]], [1, spindelBaum], 0 ).
rezept(bauen, [[80, kohlenStoff], [1, immerGruenBaumRezept]], [1, immerGruenBaum], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, apolloMotivRezept]], [1, apolloMotiv], 0 ).
rezept(bauen, [[15, reinesFerrit], [15, kupfer], [1, bronzeneDiploStatueRezept]], [1, bronzeneDiploStatue], 0 ).
rezept(bauen, [[20, reinesFerrit], [20, silber], [1, silberneDiploStatueRezept]], [1, silberneDiploStatue], 0 ).
rezept(bauen, [[30, reinesFerrit], [30, gold], [1, goldeneDiploStatueRezept]], [1, goldeneDiploStatue], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, nadaMotivRezept]], [1, nadaMotiv], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, poloMotivRezept]], [1, poloMotiv], 0 ).
rezept(bauen, [[15, reinesFerrit], [15, kupfer], [1, bronzeneKampfLaeuferStatueRezept]], [1, bronzeneKampfLaeuferStatue], 0 ).
rezept(bauen, [[20, reinesFerrit], [20, silber], [1, silberneKampfLaeuferStatueRezept]], [1, silberneKampfLaeuferStatue], 0 ).
rezept(bauen, [[30, reinesFerrit], [30, gold], [1, goldeneKampfLaeuferStatueRezept]], [1, goldeneKampfLaeuferStatue], 0 ).
rezept(bauen, [[15, reinesFerrit], [15, kupfer], [1, bronzeneGekStatueRezept]], [1, bronzeneGekStatue], 0 ).
rezept(bauen, [[20, reinesFerrit], [20, silber], [1, silberneGekStatueRezept]], [1, silberneGekStatue], 0 ).
rezept(bauen, [[30, reinesFerrit], [30, gold], [1, goldeneGekStatueRezept]], [1, goldeneGekStatue], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, anomalieMotivRezept]], [1, anomalieMotiv], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, galaktischerHubMotivRezept]], [1, galaktischerHubMotiv], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, zustimmendeHandbewegungMotivRezept]], [1, zustimmendeHandbewegungMotiv], 0 ).
rezept(bauen, [[15, reinesFerrit], [15, kupfer], [1, bronzeneKreaturStatueRezept]], [1, bronzeneKreaturStatue], 0 ).
rezept(bauen, [[20, reinesFerrit], [20, silber], [1, silberneKreaturStatueRezept]], [1, silberneKreaturStatue], 0 ).
rezept(bauen, [[30, reinesFerrit], [30, gold], [1, goldeneKreaturStatueRezept]], [1, goldeneKreaturStatue], 0 ).
rezept(bauen, [[15, reinesFerrit], [15, kupfer], [1, bronzeneAstronautenStatueRezept]], [1, bronzeneAstronautenStatue], 0 ).
rezept(bauen, [[20, reinesFerrit], [20, silber], [1, silberneAstronautenStatueRezept]], [1, silberneAstronautenStatue], 0 ).
rezept(bauen, [[30, reinesFerrit], [30, gold], [1, goldeneAstronautenStatueRezept]], [1, goldeneAstronautenStatue], 0 ).

/* =====================  Quecksilbersynthese =========================================== */
rezept(bauen, [[50, queckSilber], [1, feuerWerkGruenRezept]], [1, feuerWerkGruen], 0 ).
rezept(bauen, [[50, queckSilber], [1, feuerWerkBlauRezept]], [1, feuerWerkBlau], 0 ).
rezept(bauen, [[50, queckSilber], [1, feuerWerkRotRezept]], [1, feuerWerkRot], 0 ).

/* =====================  Industriemodule ============================================ */
rezept(bauen, [[1, metallPlatten], [40, sauerStoff], [1, treibStoffReaktorRezept]], [1, treibStoffReaktor], 0).
rezept(bauen, [[5, metallPlatten], [100, chromatischesMetall], [1, mineralienExtraktorRezept]], [1, mineralienExtraktor], 0).
rezept(bauen, [[25, ferritStaub], [25, ionisiertesKobalt], [1, wandSchalterRezept]], [1, wandSchalter], 0).
rezept(bauen, [[5, metallPlatten], [100, chromatischesMetall], [1, gasExtraktorRezept]], [1, gasExtraktor], 0).
rezept(bauen, [[10, metallPlatten], [1, versorgungsDepotRezept]], [1, versorgungsDepot], 0).
rezept(bauen, [[25, ferritStaub], [10, kohlenStoff], [1, versorgungsRohrRezept]], [1, versorgungsRohr], 0).
rezept(bauen, [[25, ferritStaub], [25, ionisiertesKobalt], [1, bodenSchalterRezept]], [1, bodenSchalter], 0).
rezept(bauen, [[20, kohlenStoff], [1, annaeherungsSchalterRezept]], [1, annaeherungsSchalter], 0).
rezept(bauen, [[20, kohlenStoff], [1, schalterRezept]], [1, schalter], 0).
rezept(bauen, [[25, ferritStaub], [15, ionisiertesKobalt], [1, energieUmkehrerRezept]], [1, energieUmkehrer], 0).
rezept(bauen, [[2, metallPlatten], [60, magnetisiertesFerrit], [75, chromatischesMetall], [1, elektroMagnetischerGeneratorRezept]], [1, elektroMagnetischerGenerator], 0).


/* =====================  Landwirtschaftsmodule ====================================== */
rezept(bauen, [[30, reinesFerrit], [20, ionisiertesKobalt], [20, kohlenStoff], [1, hydroKulturTrogRezept]], [1, hydroKulturTrog], 0).
rezept(bauen, [[10, kohlenStoff], [1, topfPflanzeRezept]], [1, topfPflanze], 0 ).
rezept(bauen, [[60, reinesFerrit], [50, ionisiertesKobalt], [50, kohlenStoff], [1, grosserHydroKulturTrogRezept]], [1, grosserHydroKulturTrog], 0).
rezept(bauen, [[50, pilzSchimmel], [25, ammoniak], [1, pilzGeflechtRezept]], [1, pilzGeflecht], 0).
rezept(bauen, [[50, frostKristall], [25, dioxit], [1, frostWurzRezept]], [1, frostWurz], 0).
rezept(bauen, [[50, gammaWurzel], [25, uran], [1, gammaGrasRezept]], [1, gammaGras], 0).
rezept(bauen, [[50, kaktusFleisch], [25, pyrit], [1, echinoKaktusRezept]], [1, echinoKaktus], 0).
rezept(bauen, [[50, sternenKnolle], [25, paraffinium], [1, sternenDornRezept]], [1, sternenDorn], 0).
rezept(bauen, [[50, solanium], [25, phosphor], [1, sonnenRebeRezept]], [1, sonnenRebe], 0).
rezept(bauen, [[15, kohlenStoff], [1, floraBehaelterHochBeetRezept]], [1, floraBehaelterHochBeet], 0 ).
rezept(bauen, [[15, kohlenStoff], [1, floraBehaelterKastenRezept]], [1, floraBehaelterKasten], 0 ).
rezept(bauen, [[15, kohlenStoff], [1, floraBehaelterTubusRezept]], [1, floraBehaelterTubus], 0 ).
rezept(bauen, [[100, emeril], [100, ionisiertesKobalt], [1, giftIgelRezept]], [1, giftIgel], 0).
rezept(bauen, [[120, ionisiertesKobalt], [25, chromatischesMetall], [25, magnetisiertesFerrit], [1, gravitinoWirtRezept]], [1, gravitinoWirt], 0).
rezept(bauen, [[40, faecium], [1, magenKrampfBlumeRezept]], [1, magenKrampfBlume], 0 ).
rezept(bauen, [[40, mordit], [1, morditWurzelRezept]], [1, morditWurzel], 0 ).
rezept(bauen, [[60, indium], [20, paraffinium], [1, eiweissPerlenKugelRezept]], [1, eiweissPerlenKugel], 0).
rezept(bauen, [[1, nipNipKnospen], [20, faecium], [1, nipNipRezept]], [1, nipNip], 0).

/* =====================  Unterschl�pfe aus Holz (auch Konstruktionsforschungsstation) */
rezept(bauen, [[40, kohlenStoff], [1, holzWandRezept]], [1, holzWand], 0 ).
rezept(bauen, [[40, kohlenStoff], [1, holzBodenPlatteRezept]], [1, holzBodenPlatte], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, duenneHolzWandRezept]], [1, duenneHolzWand], 0 ).
rezept(bauen, [[40, kohlenStoff], [1, holzTuerRahmenRezept]], [1, holzTuerRahmen], 0 ).
rezept(bauen, [[40, kohlenStoff], [10, ferritStaub], [1, holzDachRezept]], [1, holzDach], 0).
rezept(bauen, [[20, kohlenStoff], [1, glasPlatteMitHolzRahmenRezept]], [1, glasPlatteMitHolzRahmen], 0 ).
rezept(bauen, [[40, kohlenStoff], [10, reinesFerrit], [1, holzRampeRezept]], [1, holzRampe], 0).
rezept(bauen, [[20, kohlenStoff], [1, kleineHolzPlatteRezept]], [1, kleineHolzPlatte], 0 ).
rezept(bauen, [[10, kohlenStoff], [1, holzDreieckRezept]], [1, holzDreieck], 0 ).
rezept(bauen, [[5, kohlenStoff], [1, kleinesHolzDreieckRezept]], [1, kleinesHolzDreieck], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, schraegeHolzPlatteRezept]], [1, schraegeHolzPlatte], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, kleineHolzWandRezept]], [1, kleineHolzWand], 0 ).
rezept(bauen, [[40, kohlenStoff], [1, glas], [1, holzFensterRezept]], [1, holzFenster], 0).
rezept(bauen, [[20, kohlenStoff], [1, holzTuerRezept]], [1, holzTuer], 0 ).
rezept(bauen, [[40, kohlenStoff], [1, elektrischeHolzTuerRezept]], [1, elektrischeHolzTuer], 0 ).
rezept(bauen, [[20, kohlenStoff], [10, ferritStaub], [1, holzDachPlatteRezept]], [1, holzDachPlatte], 0).
rezept(bauen, [[20, kohlenStoff],[10, ferritStaub], [1, holzDachEckStueckRezept]], [1, holzDachEckStueck], 0 ).
rezept(bauen, [[40, kohlenStoff], [1, holzBogenRezept]], [1, holzBogen], 0 ).
rezept(bauen, [[25, kohlenStoff], [5, reinesFerrit], [1, halbeHolzRampeRezept]], [1, halbeHolzRampe], 0).
rezept(bauen, [[20, kohlenStoff], [1, kurzeHolzWandRezept]], [1, kurzeHolzWand], 0 ).
rezept(bauen, [[40, kohlenStoff], [10, reinesFerrit], [1, holzFassadeRezept]], [1, holzFassade], 0).
rezept(bauen, [[20, kohlenStoff], [1, kleineHolzTuerRezept]], [1, kleineHolzTuer], 0 ).
rezept(bauen, [[20, kohlenStoff], [10, ferritStaub], [1, dachInnenEckteilAusHolzRezept]], [1, dachInnenEckteilAusHolz], 0 ).
rezept(bauen, [[20, kohlenStoff], [1, halberHolzBogenRezept]], [1, halberHolzBogen], 0 ).

/* =====================  Unterschl�pfe aus Metall (Konstruktionsforschungsstation) == */
rezept(bauen, [[40, ferritStaub], [1, metallWandRezept]], [1, metallWand], 0 ).
rezept(bauen, [[20, ferritStaub], [1, metallBodenPlatteRezept]], [1, metallBodenPlatte], 0 ).
rezept(bauen, [[20, ferritStaub], [1, duenneMetallWandRezept]], [1, duenneMetallWand], 0 ).
rezept(bauen, [[40, ferritStaub], [1, metallTuerRahmenRezept]], [1, metallTuerRahmen], 0 ).
rezept(bauen, [[20, ferritStaub], [10, ferritStaub], [1, metallDachRezept]], [1, metallDach], 0).
rezept(bauen, [[20, ferritStaub], [1, glasPlatteMitMetallRahmenRezept]], [1, glasPlatteMitMetallRahmen], 0 ).
rezept(bauen, [[50, ferritStaub], [10, reinesFerrit], [1, metallRampeRezept]], [1, metallRampe], 0).
rezept(bauen, [[20, ferritStaub], [1, kleineMetallPlatteRezept]], [1, kleineMetallPlatte], 0 ).
rezept(bauen, [[10, kohlenStoff], [1, metallDreieckRezept]], [1, metallDreieck], 0 ).
rezept(bauen, [[5, kohlenStoff], [1, kleinesMetallDreieckRezept]], [1, kleinesMetallDreieck], 0 ).
rezept(bauen, [[20, ferritStaub], [1, schraegeMetallPlatteRezept]], [1, schraegeMetallPlatte], 0 ).
rezept(bauen, [[20, ferritStaub], [1, kleineMetallWandRezept]], [1, kleineMetallWand], 0 ).
rezept(bauen, [[400, ferritStaub], [1, glas], [1, metallFensterRezept]], [1, metallFenster], 0).
rezept(bauen, [[20, kohlenStoff], [1, metallTuerRezept]], [1, metallTuer], 0 ).
rezept(bauen, [[40, kohlenStoff], [1, elektrischeMetallTuerRezept]], [1, elektrischeMetallTuer], 0 ).
rezept(bauen, [[20, kohlenStoff], [10, ferritStaub], [1, metallDachPlatteRezept]], [1, metallDachPlatte], 0).
rezept(bauen, [[20, kohlenStoff], [10, ferritStaub], [1, metallDachEckStueckRezept]], [1, metallDachEckStueck], 0).
rezept(bauen, [[40, ferritStaub], [1, metallBogenRezept]], [1, metallBogen], 0 ).
rezept(bauen, [[25, ferritStaub], [5, reinesFerrit], [1, halbeMetallRampeRezept]], [1, halbeMetallRampe], 0).
rezept(bauen, [[20, kohlenStoff], [1, kurzeMetallWandRezept]], [1, kurzeMetallWand], 0 ).
rezept(bauen, [[40, ferritStaub], [10, reinesFerrit], [1, metallFassadeRezept]], [1, metallFassade], 0).
rezept(bauen, [[20, ferritStaub], [1, kleineMetallTuerRezept]], [1, kleineMetallTuer], 0 ).
rezept(bauen, [[20, kohlenStoff],[10, ferritStaub], [1, dachInnenEckteilAusMetallRezept]], [1, dachInnenEckteilAusMetall], 0 ).
rezept(bauen, [[20, ferritStaub], [1, halberMetallBogenRezept]], [1, halberMetallBogen], 0 ).

/* =====================  Unterschl�pfe aus Beton (Konstruktionsforschungsstation) === */
rezept(bauen, [[40, ferritStaub], [1, betonWandRezept]], [1, betonWand], 0 ).
rezept(bauen, [[20, ferritStaub], [1, betonBodenPlatteRezept]], [1, betonBodenPlatte], 0 ).
rezept(bauen, [[20, ferritStaub], [1, duenneBetonWandRezept]], [1, duenneBetonWand], 0 ).
rezept(bauen, [[40, ferritStaub], [1, betonTuerRahmenRezept]], [1, betonTuerRahmen], 0 ).
rezept(bauen, [[40, ferritStaub], [1, betonDachRezept]], [1, betonDach], 0 ).
rezept(bauen, [[20, ferritStaub], [1, glasPlatteMitBetonRahmenRezept]], [1, glasPlatteMitBetonRahmen], 0 ).
rezept(bauen, [[50, ferritStaub], [10, reinesFerrit], [1, betonRampeRezept]], [1, betonRampe], 0).
rezept(bauen, [[20, ferritStaub], [1, kleineBetonBodenPlatteRezept]], [1, kleineBetonBodenPlatte], 0 ).
rezept(bauen, [[10, kohlenStoff], [1, betonDreieckRezept]], [1, betonDreieck], 0 ).
rezept(bauen, [[5, kohlenStoff], [1, kleinesBetonDreieckRezept]], [1, kleinesBetonDreieck], 0 ).
rezept(bauen, [[20, ferritStaub], [1, schraegeBetonPlatteRezept]], [1, schraegeBetonPlatte], 0 ).
rezept(bauen, [[20, ferritStaub], [1, kleineBetonWandRezept]], [1, kleineBetonWand], 0 ).
rezept(bauen, [[40, ferritStaub], [1, glas], [1, betonFensterRezept]], [1, betonFenster], 0 ).
rezept(bauen, [[20, ferritStaub], [1, betonTuerRezept]], [1, betonTuer], 0 ).
rezept(bauen, [[40, kohlenStoff], [1, elektrischeBetonTuerRezept]], [1, elektrischeBetonTuer], 0 ).
rezept(bauen, [[25, ferritStaub], [1, betonDachPlatteRezept]], [1, betonDachPlatte], 0 ).
rezept(bauen, [[30, ferritStaub], [1, betonDachEckStueckRezept]], [1, betonDachEckStueck], 0 ).
rezept(bauen, [[40, ferritStaub], [1, betonBogenRezept]], [1, betonBogen], 0 ).
rezept(bauen, [[25, ferritStaub], [5, reinesFerrit], [1, halbeBetonRampeRezept]], [1, halbeBetonRampe], 0).
rezept(bauen, [[20, ferritStaub], [1, kurzeBetonWandRezept]], [1, kurzeBetonWand], 0 ).
rezept(bauen, [[40, ferritStaub], [10, reinesFerrit], [1, betonFassadeRezept]], [1, betonFassade], 0).
rezept(bauen, [[20, ferritStaub], [1, kleineBetonTuerRezept]], [1, kleineBetonTuer], 0 ).
rezept(bauen, [[20, kohlenStoff],[10, ferritStaub], [1, dachInnenEckteilAusBetonRezept]], [1, dachInnenEckteilAusBeton], 0 ).
rezept(bauen, [[20, ferritStaub], [1, halberBetonBogenRezept]], [1, halberBetonBogen], 0 ).

/* =====================  Primitive Formen =========================================== */
rezept(bauen, [[20, ferritStaub], [1, grosserKeilRezept]], [1, grosserKeil], 0 ).
rezept(bauen, [[20, ferritStaub], [1, kleinerKeilRezept]], [1, kleinerKeil], 0 ).
rezept(bauen, [[20, ferritStaub], [1, rohrRezept]], [1, rohr], 0 ).
rezept(bauen, [[20, ferritStaub], [1, pyramideRezept]], [1, pyramide], 0 ).
rezept(bauen, [[20, ferritStaub], [1, gebogenesRohrRezept]], [1, gebogenesRohr], 0 ).
rezept(bauen, [[20, ferritStaub], [1, stabilerWuerfelRezept]], [1, stabilerWuerfel], 0 ).
rezept(bauen, [[20, ferritStaub], [1, zylinderRezept]], [1, zylinder], 0 ).
rezept(bauen, [[20, ferritStaub], [1, wuerfelRezept]], [1, wuerfel], 0 ).
rezept(bauen, [[20, ferritStaub], [1, kugelRezept]], [1, kugel], 0 ).


/* %%%%%%%%%%%%%%%%%%%%%  Kochrezepte %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

/* getestet und gut */
rezept(kochen, [[1, hypnotischesAuge], [1, hypnotischesAuge]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, verarbeitetesFleisch]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, geraeuchertesFleisch]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, fleischigeStuecke]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, innereienBeutel]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, katzenLeber]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, fleischigeFluegel]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, protoWurst]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, diploStuecke]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, schuppigesFleisch]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, schreiterWurst]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, rohesSteak]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, geduenstetesGemuese]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, impulsBohnen]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, solartillo]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, jadeErbsen]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, ungiftigerPilz]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, sievertBohnen]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, suessWurzel]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, hypnotischesAuge], [1, fleischigeWurzeln]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, hypnotischesAuge]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, schrecklicherBrei]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, verarbeitetesFleisch]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, geraeuchertesFleisch]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, fleischigeStuecke]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, innereienBeutel]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, katzenLeber]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, fleischigeFluegel]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, protoWurst]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, diploStuecke]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, schuppigesFleisch]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, schreiterWurst]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, rohesSteak]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, geduenstetesGemuese]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, impulsBohnen]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, solartillo]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, jadeErbsen]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, ungiftigerPilz]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, sievertBohnen]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, suessWurzel]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, schrecklicherBrei], [1, fleischigeWurzeln]],[1, abgruendigerEintopf], 250.0).
rezept(kochen, [[1, sahne], [1, immerBrennendeMarmelade], [1, protoTeig]],[1, alarmierendeTorte], 250.0).
rezept(kochen, [[1, hexaBeere], [1, verarbeiteterZucker]],[1, anormaleMarmelade], 250.0).
rezept(kochen, [[1, hexaBeere], [1, tortenBoden]],[1, anormaleTorte], 250.0).
rezept(kochen, [[1, anormaleMarmelade], [1, tortenBoden]],[1, anormaleTorte], 250.0).
rezept(kochen, [[1, anormaleMarmelade], [1, klobigerDonut]],[1, anormalerDonut], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, holzApfel], [1, gefroreneKnollen]],[1, apfelEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, holzApfel], [1, frostKristall]],[1, apfelEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, schlaengelndeMarmelade], [1, gefroreneKnollen]],[1, apfelEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, schlaengelndeMarmelade], [1, frostKristall]],[1, apfelEisCreme], 250.0).
rezept(kochen, [[1, holzApfel], [1, heulenderTeig]],[1, apfelKuchenVerlorenerSeelen], 250.0).
rezept(kochen, [[1, sahne], [1, heulenderTeig], [1, schlaengelndeMarmelade]],[1, apfelKuchenVerlorenerSeelen], 250.0).
rezept(kochen, [[1, holzApfel], [1, protoTeig]],[1, apfelKuriositaet], 250.0).
rezept(kochen, [[1, sahne], [1, protoTeig], [1, schlaengelndeMarmelade]],[1, apfelKuriositaet], 250.0).
rezept(kochen, [[1, tortenBoden], [1, geduenstetesGemuese]],[1, balastStoffReichePastete], 250.0).
rezept(kochen, [[1, tortenBoden], [1, jadeErbsen]],[1, balastStoffReichePastete], 250.0).
rezept(kochen, [[1, beinFleisch], [1, tortenBoden]],[1, beineImTeigMantel], 250.0).
rezept(kochen, [[1, impulsBohnen]],[1, bitterSuesserKakao], 250.0).
rezept(kochen, [[1, mordit], [1, katzenLeber]],[1, blutigesOrgan], 250.0).
rezept(kochen, [[1, mordit], [1, innereienBeutel]],[1, blutigesOrgan], 250.0).
rezept(kochen, [[1, sahne], [1, immerBrennendeMarmelade], [1, heulenderTeig]],[1, brandKuchenDesGrauens], 250.0).
rezept(kochen, [[1, geschlageneButter], [1, geschlageneButter]],[1, bratOel], 250.0).
rezept(kochen, [[1, geschlageneButter], [1, protoButter]],[1, bratOel], 250.0).
rezept(kochen, [[1, teig]],[1, brot], 250.0).
rezept(kochen, [[1, monstroeserPudding], [1, tortenBoden]],[1, brueterTorte], 250.0).
rezept(kochen, [[1, sahne], [1, sahne]],[1, cremigeSosse], 250.0).
rezept(kochen, [[1, sahne], [1, protoSahne]],[1, cremigeSosse], 250.0).
rezept(kochen, [[1, protoSahne], [1, protoSahne]],[1, cremigeSosse], 250.0).
rezept(kochen, [[1, verarbeiteterZucker], [1, larvenKern]],[1, delikatessBaiser], 250.0).
rezept(kochen, [[1, verarbeiteterZucker], [1, kreaturenEi]],[1, delikatessBaiser], 250.0).
rezept(kochen, [[1, verarbeiteterZucker], [1, grosseEier]],[1, delikatessBaiser], 250.0).
rezept(kochen, [[1, protoTeig], [1, klebrigerHonig]],[1, derMerkWuerdigsteKuchen], 250.0).	
rezept(kochen, [[1, protoTeig], [1, klebrigeButter]],[1, derMerkWuerdigsteKuchen], 250.0).
rezept(kochen, [[1, klobigerDonut], [1, sternenPudding]],[1, derStellarator], 250.0).
rezept(kochen, [[1, cremigeSosse], [1, geheimnisVollerFleischEintopf]],[1, dickerFleischEintopf], 250.0).
rezept(kochen, [[1, verfeinertesMehl], [1, klebrigeButter], [1, kreaturenEi]],[1, dickerSuesserTeig], 250.0).
rezept(kochen, [[1, verfeinertesMehl], [1, klebrigeButter], [1, grosseEier]],[1, dickerSuesserTeig], 250.0).
rezept(kochen, [[1, verfeinertesMehl], [1, klebrigeProtoButter], [1, kreaturenEi]],[1, dickerSuesserTeig], 250.0).
rezept(kochen, [[1, verfeinertesMehl], [1, klebrigeProtoButter], [1, grosseEier]],[1, dickerSuesserTeig], 250.0).
rezept(kochen, [[1, faecium], [1, aloeFleisch]],[1, duftendeKraeuter], 250.0).
rezept(kochen, [[1, faecium], [1, frostKristall]],[1, duftendeKraeuter], 250.0).
rezept(kochen, [[1, faecium], [1, gammaWurzel]],[1, duftendeKraeuter], 250.0).
rezept(kochen, [[1, faecium], [1, glasKoerner]],[1, duftendeKraeuter], 250.0).
rezept(kochen, [[1, faecium], [1, heptaPloidWeizen]],[1, duftendeKraeuter], 250.0).
rezept(kochen, [[1, faecium], [1, jadeErbsen]],[1, duftendeKraeuter], 250.0).
rezept(kochen, [[1, faecium], [1, sievertBohnen]],[1, duftendeKraeuter], 250.0).
rezept(kochen, [[1, faecium], [1, solanium]],[1, duftendeKraeuter], 250.0).
rezept(kochen, [[1, frostKristall], [1, klebrigerPudding]],[1, eisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, gefroreneKnollen]],[1, eisCreme], 250.0).
rezept(kochen, [[1, gefroreneKnollen], [1, hypnotischesAuge]],[1, eisSchreie], 250.0).
rezept(kochen, [[1, frostKristall], [1, hypnotischesAuge]],[1, eisSchreie], 250.0).
rezept(kochen, [[1, gefroreneKnollen], [1, schrecklicherBrei]],[1, eisSchreie], 250.0).
rezept(kochen, [[1, frostKristall], [1, schrecklicherBrei]],[1, eisSchreie], 250.0).
rezept(kochen, [[1, sahne], [1, extraFluffigerTeig], [1, schlaengelndeMarmelade]],[1, engelsObstKuchen], 250.0).
rezept(kochen, [[1, holzApfel], [1, extraFluffigerTeig]],[1, engelsObstKuchen], 250.0).
rezept(kochen, [[1, anormaleMarmelade], [1, sahne], [1, windenderAufgewuehlterTeig]],[1, entfesselteMonstrositaet], 250.0).
rezept(kochen, [[1, sahne], [1, windenderAufgewuehlterTeig]],[1, entfesseltesSahneHorn], 250.0).
rezept(kochen, [[1, sahne], [1, grahmeLade], [1, heulenderTeig]],[1, entsetzlicherMarmeladenSchwamm], 250.0).
rezept(kochen, [[1, sahne], [1, fellKnaeuelGelee], [1, heulenderTeig]],[1, entsetzlicherMarmeladenSchwamm], 250.0).
rezept(kochen, [[1, faecium], [1, gefroreneKnollen]],[1, enzymFluessigkeit], 250.0).
rezept(kochen, [[1, faecium], [1, fleischigeWurzeln]],[1, enzymFluessigkeit], 250.0).
rezept(kochen, [[1, faecium], [1, impulsBohnen]],[1, enzymFluessigkeit], 250.0).
rezept(kochen, [[1, faecium], [1, kaktusNektar]],[1, enzymFluessigkeit], 250.0).
rezept(kochen, [[1, faecium], [1, pilzSchimmel]],[1, enzymFluessigkeit], 250.0).
rezept(kochen, [[1, faecium], [1, solartillo]],[1, enzymFluessigkeit], 250.0).
rezept(kochen, [[1, faecium], [1, ungiftigerPilz]],[1, enzymFluessigkeit], 250.0).
rezept(kochen, [[1, aloeFleisch]],[1, erfrischungsGetraenk], 250.0).
rezept(kochen, [[1, sahne], [1, kuchenTeig], [1, immerBrennendeMarmelade]],[1, ewigSiedenderKuchen], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, hexaBeere], [1, frostKristall]],[1, ewigeEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, hexaBeere], [1, gefroreneKnollen]],[1, ewigeEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, anormaleMarmelade], [1, frostKristall]],[1, ewigeEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, anormaleMarmelade], [1, gefroreneKnollen]],[1, ewigeEisCreme], 250.0).
rezept(kochen, [[1, dickerSuesserTeig], [1, sahne], [1, anormaleMarmelade]],[1, ewigerHonigKuchen], 250.0).
rezept(kochen, [[1, kuchenTeig], [1, sahne], [1, anormaleMarmelade]],[1, ewigerKuchen], 250.0).
rezept(kochen, [[1, extraFluffigerTeig], [1, sahne], [1, anormaleMarmelade]],[1, ewigesMarmeladenBiskuit], 250.0).
rezept(kochen, [[1, verfeinertesMehl], [1, delikatessBaiser], [1, kreaturenEi]],[1, extraFluffigerTeig], 250.0).
rezept(kochen, [[1, verfeinertesMehl], [1, delikatessBaiser], [1, grosseEier]],[1, extraFluffigerTeig], 250.0).
rezept(kochen, [[1, fleischigeWurzeln], [1, fleischigeWurzeln]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, fleischigeWurzeln], [1, geduenstetesGemuese]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, fleischigeWurzeln], [1, impulsBohnen]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, fleischigeWurzeln], [1, jadeErbsen]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, fleischigeWurzeln], [1, sievertBohnen]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, fleischigeWurzeln], [1, solartillo]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, fleischigeWurzeln], [1, suessWurzel]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, fleischigeWurzeln], [1, ungiftigerPilz]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, geduenstetesGemuese], [1, ungiftigerPilz]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, geduenstetesGemuese], [1, impulsBohnen]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, geduenstetesGemuese], [1, solartillo]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, geduenstetesGemuese], [1, jadeErbsen]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, geduenstetesGemuese], [1, sievertBohnen]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, geduenstetesGemuese], [1, suessWurzel]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, impulsBohnen], [1, impulsBohnen]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, impulsBohnen], [1, jadeErbsen]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, impulsBohnen], [1, sievertBohnen]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, impulsBohnen], [1, solartillo]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, impulsBohnen], [1, suessWurzel]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, impulsBohnen], [1, ungiftigerPilz]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, jadeErbsen], [1, jadeErbsen]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, jadeErbsen], [1, sievertBohnen]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, jadeErbsen], [1, solartillo]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, jadeErbsen], [1, suessWurzel]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, jadeErbsen], [1, ungiftigerPilz]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, sievertBohnen], [1, sievertBohnen]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, sievertBohnen], [1, solartillo]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, sievertBohnen], [1, suessWurzel]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, sievertBohnen], [1, ungiftigerPilz]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, solartillo], [1, solartillo]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, solartillo], [1, suessWurzel]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, solartillo], [1, ungiftigerPilz]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, suessWurzel], [1, suessWurzel]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, suessWurzel], [1, ungiftigerPilz]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, ungiftigerPilz], [1, ungiftigerPilz]],[1, fasrigerEintopf], 250.0).
rezept(kochen, [[1, leopardenFrucht], [1, verarbeiteterZucker]],[1, fellKnaeuelGelee], 250.0).
rezept(kochen, [[1, leopardenFrucht], [1, tortenBoden]],[1, fellTorteInAspik], 250.0).
rezept(kochen, [[1, fellKnaeuelGelee], [1, tortenBoden]],[1, fellTorteInAspik], 250.0).
rezept(kochen, [[1, faecium], [1, feuerBeere]],[1, fermentierteFruechte], 250.0).
rezept(kochen, [[1, faecium], [1, grahBeere]],[1, fermentierteFruechte], 250.0).
rezept(kochen, [[1, faecium], [1, hexaBeere]],[1, fermentierteFruechte], 250.0).
rezept(kochen, [[1, faecium], [1, kaktusFleisch]],[1, fermentierteFruechte], 250.0).
rezept(kochen, [[1, faecium], [1, kuerbisKnolle]],[1, fermentierteFruechte], 250.0).
rezept(kochen, [[1, faecium], [1, pilgerBeere]],[1, fermentierteFruechte], 250.0).
rezept(kochen, [[1, faecium], [1, sternenKnolle]],[1, fermentierteFruechte], 250.0).
rezept(kochen, [[1, faecium], [1, suessWurzel]],[1, fermentierteFruechte], 250.0).
rezept(kochen, [[1, regisFett], [1, tortenBoden]],[1, festerFettKuchen], 250.0).
rezept(kochen, [[1, bratOel], [1, tortenBoden]],[1, festerFettKuchen], 250.0).
rezept(kochen, [[1, protoOel], [1, tortenBoden]],[1, festerFettKuchen], 250.0).
rezept(kochen, [[1, feuerBeere]],[1, feuerWasser], 250.0).
rezept(kochen, [[1, sahne], [1, immerBrennendeMarmelade], [1, windenderAufgewuehlterTeig]],[1, feurigeMarmeladenUeberraschung], 250.0).
rezept(kochen, [[1, sahne], [1, immerBrennendeMarmelade], [1, extraFluffigerTeig]],[1, feurigesMarmeladenBiskuit], 250.0).
rezept(kochen, [[1, tortenBoden], [1, salzigeFischFilets]],[1, fischPastete], 250.0).
rezept(kochen, [[1, mordit]], [1, fleischFlocken], 250.0).
rezept(kochen, [[1, fleischFlocken]],[1, fleischigeStuecke], 250.0).
rezept(kochen, [[1, geheimnisVollerFleischEintopf], [1, wohlSchmeckendeSosse]],[1, fleischMitGewurzKruste], 250.0).
rezept(kochen, [[1, bitterSuesserKakao], [1, windenderAufgewuehlterTeig]],[1, fluechtigeSchokoTorte], 250.0).
rezept(kochen, [[1, larvenKern], [1, wuerzigerKaese]],[1, fluesterndesOmelett], 250.0).
rezept(kochen, [[1, extraFluffigerTeig], [1, knusperKaramell]],[1, fluffigeKaramellFreude], 250.0).
rezept(kochen, [[1, kaktusNektar], [1, windenderAufgewuehlterTeig]],[1, fluffigerRachenSpalter], 250.0).
rezept(kochen, [[1, kaktusGelee], [1, sahne], [1, windenderAufgewuehlterTeig]],[1, fluffigerRachenSpalter], 250.0).
rezept(kochen, [[1, kuchenTeig], [1, klebrigerHonig]],[1, fragwuerdigerSuesserKuchen], 250.0).
rezept(kochen, [[1, kuchenTeig], [1, klebrigeButter]],[1, fragwuerdigerSuesserKuchen], 250.0).
rezept(kochen, [[1, dickerSuesserTeig], [1, klebrigerHonig]],[1, fragwuerdigerSuesserKuchen], 250.0).
rezept(kochen, [[1, dickerSuesserTeig], [1, klebrigeButter]],[1, fragwuerdigerSuesserKuchen], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, frostKristall], [1, kaktusGelee]],[1, fruchtEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, gefroreneKnollen], [1, kaktusGelee]],[1, fruchtEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, frostKristall], [1, fellKnaeuelGelee]],[1, fruchtEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, gefroreneKnollen], [1, fellKnaeuelGelee]],[1, fruchtEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, frostKristall], [1, kaktusNektar]],[1, fruchtEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, gefroreneKnollen], [1, kaktusNektar]],[1, fruchtEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, frostKristall], [1, leopardenFrucht]],[1, fruchtEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, gefroreneKnollen], [1, leopardenFrucht]],[1, fruchtEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, frostKristall], [1, suessWurzel]],[1, fruchtEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, gefroreneKnollen], [1, suessWurzel]],[1, fruchtEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, frostKristall], [1, pilgerBeere]],[1, fruchtEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, gefroreneKnollen], [1, pilgerBeere]],[1, fruchtEisCreme], 250.0).
rezept(kochen, [[1, pilgerBeere], [1, tortenBoden]],[1, fruchtigerPudding], 250.0).
rezept(kochen, [[1, grahBeere], [1, tortenBoden]],[1, fruchtigerPudding], 250.0).
rezept(kochen, [[1, kuchenTeig], [1, synthetischerHonig]],[1, funkelnderHonigKuchen], 250.0).
rezept(kochen, [[1, kreaturenEi]],[1, gebackeneEier], 250.0).
rezept(kochen, [[1, grosseEier]],[1, gebackeneEier], 250.0).
rezept(kochen, [[1, larvenKern]],[1, gebackeneEier], 250.0).
rezept(kochen, [[1, geschlageneButter], [1, verfeinertesMehl]],[1, gebaeck], 250.0).
rezept(kochen, [[1, protoButter], [1, verfeinertesMehl]],[1, gebaeck], 250.0).
rezept(kochen, [[1, gefroreneKnollen]],[1, geduenstetesGemuese], 250.0).
rezept(kochen, [[1, hexaBeere]],[1, geduenstetesGemuese], 250.0).
rezept(kochen, [[1, jadeErbsen]],[1, geduenstetesGemuese], 250.0).
rezept(kochen, [[1, kuerbisFleisch]],[1, geduenstetesGemuese], 250.0).
rezept(kochen, [[1, sievertBohnen]],[1, geduenstetesGemuese], 250.0).
rezept(kochen, [[1, solartillo]],[1, geduenstetesGemuese], 250.0).
rezept(kochen, [[1, ungiftigerPilz]],[1, geduenstetesGemuese], 250.0).
rezept(kochen, [[1, heisseSosse], [1, geschmorteOrgane]],[1, gefuellteOrgane], 250.0).
rezept(kochen, [[1, fleischigeFluegel], [1, tortenBoden]],[1, geheimnisVolleFleischPastete], 250.0).
rezept(kochen, [[1, fleischigeStuecke], [1, tortenBoden]],[1, geheimnisVolleFleischPastete], 250.0).
rezept(kochen, [[1, schuppigesFleisch], [1, tortenBoden]],[1, geheimnisVolleFleischPastete], 250.0).
rezept(kochen, [[1, schreiterWurst], [1, tortenBoden]],[1, geheimnisVolleFleischPastete], 250.0).
rezept(kochen, [[1, rohesSteak], [1, tortenBoden]],[1, geheimnisVolleFleischPastete], 250.0).
rezept(kochen, [[1, tortenBoden], [1, verarbeitetesFleisch]],[1, geheimnisVolleFleischPastete], 250.0).
rezept(kochen, [[1, fleischigeFluegel], [1, fleischigeFluegel]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, fleischigeFluegel], [1, fleischigeStuecke]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, fleischigeFluegel], [1, geraeuchertesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, fleischigeFluegel], [1, rohesSteak]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, fleischigeFluegel], [1, schreiterWurst]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, fleischigeFluegel], [1, schuppigesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, fleischigeFluegel], [1, verarbeitetesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, fleischigeStuecke], [1, fleischigeStuecke]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, fleischigeStuecke], [1, geraeuchertesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, fleischigeStuecke], [1, rohesSteak]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, fleischigeStuecke], [1, schreiterWurst]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, fleischigeStuecke], [1, schuppigesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, fleischigeStuecke], [1, verarbeitetesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, geraeuchertesFleisch], [1, geraeuchertesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, geraeuchertesFleisch], [1, rohesSteak]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, geraeuchertesFleisch], [1, schreiterWurst]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, geraeuchertesFleisch], [1, schuppigesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, geraeuchertesFleisch], [1, verarbeitetesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, protoWurst], [1, diploStuecke]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, protoWurst], [1, fleischigeFluegel]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, protoWurst], [1, fleischigeStuecke]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, protoWurst], [1, geraeuchertesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, protoWurst], [1, mordit]],[1, hackFleisch], 250.0).
rezept(kochen, [[1, protoWurst], [1, rohesSteak]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, protoWurst], [1, schreiterWurst]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, protoWurst], [1, schuppigesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, protoWurst], [1, verarbeitetesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, rohesSteak], [1, rohesSteak]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, rohesSteak], [1, schreiterWurst]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, rohesSteak], [1, schuppigesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, rohesSteak], [1, verarbeitetesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, schreiterWurst], [1, schreiterWurst]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, schreiterWurst], [1, schuppigesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, schreiterWurst], [1, verarbeitetesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, schuppigesFleisch], [1, schuppigesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, schuppigesFleisch], [1, verarbeitetesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, verarbeitetesFleisch], [1, verarbeitetesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, cremigeSosse], [1, fasrigerEintopf]],[1, gemueseCremeSuppe], 250.0).
rezept(kochen, [[1, synthetischerHonig], [1, windenderAufgewuehlterTeig]],[1, gequaelterHonigKuchen], 250.0).
rezept(kochen, [[1, geraeuchertesFleisch], [1, tortenBoden]],[1, geraeucherteFleischPastete], 250.0).
rezept(kochen, [[1, kohlenStoff], [1, fleischigeFluegel]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, kohlenStoff], [1, fleischigeStuecke]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, kohlenStoff], [1, innereienBeutel]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, kohlenStoff], [1, katzenLeber]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, kohlenStoff], [1, protoWurst]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, kohlenStoff], [1, rohesSteak]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, kohlenStoff], [1, schreiterWurst]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, kohlenStoff], [1, schuppigesFleisch]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, kohlenStoff], [1, verarbeitetesFleisch]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, verdichteterKohlenStoff], [1, beinFleisch]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, verdichteterKohlenStoff], [1, fleischigeFluegel]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, verdichteterKohlenStoff], [1, fleischigeStuecke]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, verdichteterKohlenStoff], [1, innereienBeutel]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, verdichteterKohlenStoff], [1, katzenLeber]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, verdichteterKohlenStoff], [1, protoWurst]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, verdichteterKohlenStoff], [1, rohesSteak]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, verdichteterKohlenStoff], [1, schreiterWurst]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, verdichteterKohlenStoff], [1, schuppigesFleisch]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, verdichteterKohlenStoff], [1, verarbeitetesFleisch]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, sahne]],[1, geschlageneButter], 250.0).
rezept(kochen, [[1, innereienBeutel], [1, innereienBeutel]],[1, geschmorteOrgane], 250.0).
rezept(kochen, [[1, katzenLeber], [1, innereienBeutel]],[1, geschmorteOrgane], 250.0).
rezept(kochen, [[1, katzenLeber], [1, katzenLeber]],[1, geschmorteOrgane], 250.0).
rezept(kochen, [[1, tortenBoden], [1, suessWurzel]],[1, gestampfteWurzelPastete], 250.0).
rezept(kochen, [[1, geschlageneButter], [1, verarbeiteterZucker]],[1, gesuessteButter], 250.0).
rezept(kochen, [[1, protoButter], [1, verarbeiteterZucker]],[1, gesuessteProtoButter], 250.0).
rezept(kochen, [[1, faecium], [1, duftendeKraeuter]],[1, gesuessterKompost], 250.0).
rezept(kochen, [[1, faecium], [1, enzymFluessigkeit]],[1, gesuessterKompost], 250.0).
rezept(kochen, [[1, faecium], [1, fermentierteFruechte]],[1, gesuessterKompost], 250.0).
rezept(kochen, [[1, kuchenTeig], [1, holzApfel]],[1, gewuerzterApfelKuchen], 250.0).
rezept(kochen, [[1, kuchenTeig], [1, sahne], [1, schlaengelndeMarmelade]],[1, gewuerzterApfelKuchen], 250.0).
rezept(kochen, [[1, frostKristall]],[1, glasKoerner], 250.0).
rezept(kochen, [[1, anormaleMarmelade], [1, sahne], [1, heulenderTeig]],[1, glasKuchen], 250.0).
rezept(kochen, [[1, grahBeere], [1, verarbeiteterZucker]],[1, grahmeLade], 250.0).
rezept(kochen, [[1, mordit], [1, fleischigeStuecke]],[1, hackFleisch], 250.0).
rezept(kochen, [[1, mordit], [1, rohesSteak]],[1, hackFleisch], 250.0).
rezept(kochen, [[1, mordit], [1, schuppigesFleisch]],[1, hackFleisch], 250.0).
rezept(kochen, [[1, sahne], [1, wuerzigerKaese]],[1, halbFluessigerKaese], 250.0).
rezept(kochen, [[1, sahne], [1, protoKaese]],[1, halbFluessigerKaese], 250.0).
rezept(kochen, [[1, protoSahne], [1, wuerzigerKaese]],[1, halbFluessigerKaese], 250.0).
rezept(kochen, [[1, protoSahne], [1, protoKaese]],[1, halbFluessigerKaese], 250.0).
rezept(kochen, [[1, bitterSuesserKakao], [1, heulenderTeig]],[1, heimgesuchteSchokoTraeume], 250.0).
rezept(kochen, [[1, feuerBeere], [1, feuerWasser]],[1, heisseSosse], 250.0).
rezept(kochen, [[1, feuerBeere], [1, wurzelSaft]],[1, heisseSosse], 250.0).
rezept(kochen, [[1, feuerWasser], [1, feuerWasser]],[1, heisseSosse], 250.0).
rezept(kochen, [[1, feuerWasser], [1, grahBeere]],[1, heisseSosse], 250.0).
rezept(kochen, [[1, feuerWasser], [1, sievertBohnen]],[1, heisseSosse], 250.0).
rezept(kochen, [[1, feuerWasser], [1, solartillo]],[1, heisseSosse], 250.0).
rezept(kochen, [[1, grahBeere], [1, wurzelSaft]],[1, heisseSosse], 250.0).
rezept(kochen, [[1, sievertBohnen], [1, wurzelSaft]],[1, heisseSosse], 250.0).
rezept(kochen, [[1, solartillo], [1, wurzelSaft]],[1, heisseSosse], 250.0).
rezept(kochen, [[1, heulenderTeig], [1, knusperKaramell]],[1, heulenderKaramellKuchen], 250.0).
rezept(kochen, [[1, gesuessteButter], [1, larvenKern], [1, verfeinertesMehl]],[1, heulenderTeig], 250.0).
rezept(kochen, [[1, gesuessteProtoButter], [1, larvenKern], [1, verfeinertesMehl]],[1, heulenderTeig], 250.0).
rezept(kochen, [[1, honigButter], [1, larvenKern], [1, verfeinertesMehl]],[1, heulenderTeig], 250.0).
rezept(kochen, [[1, klebrigeButter], [1, larvenKern], [1, verfeinertesMehl]],[1, heulenderTeig], 250.0).
rezept(kochen, [[1, klebrigeProtoButter], [1, larvenKern], [1, verfeinertesMehl]],[1, heulenderTeig], 250.0).
rezept(kochen, [[1, protoButterMitHonig], [1, larvenKern], [1, verfeinertesMehl]],[1, heulenderTeig], 250.0).
rezept(kochen, [[1, geschlageneButter], [1, synthetischerHonig]],[1, honigButter], 250.0).
rezept(kochen, [[1, gesuessteButter], [1, klobigerDonut]],[1, honigButterDonut], 250.0).
rezept(kochen, [[1, honigButter], [1, klobigerDonut]],[1, honigButterDonut], 250.0).
rezept(kochen, [[1, synthetischerHonig], [1, klobigerDonut]],[1, honigDonut], 250.0).
rezept(kochen, [[1, gesuessteProtoButter], [1, klobigerDonut]],[1, honigButterDonut], 250.0).
rezept(kochen, [[1, protoButterMitHonig], [1, klobigerDonut]],[1, honigButterDonut], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, synthetischerHonig], [1, frostKristall]],[1, honigEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, synthetischerHonig], [1, gefroreneKnollen]],[1, honigEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, klebrigerHonig], [1, frostKristall]],[1, honigEisCreme], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, klebrigerHonig], [1, gefroreneKnollen]],[1, honigEisCreme], 250.0).
rezept(kochen, [[1, extraFluffigerTeig], [1, synthetischerHonig]],[1, honigEngelKuchen], 250.0).
rezept(kochen, [[1, salzigerPudding], [1, dickerSuesserTeig]],[1, honigKuchenMitSalz], 250.0).
rezept(kochen, [[1, klebrigerHonig], [1, tortenBoden]],[1, honigTorte], 250.0).
rezept(kochen, [[1, synthetischerHonig], [1, tortenBoden]],[1, honigTorte], 250.0).
rezept(kochen, [[1, feuerBeere], [1, verarbeiteterZucker]],[1, immerBrennendeMarmelade], 250.0).
rezept(kochen, [[1, protoTeig], [1, sternenPudding]],[1, interStellareKuriositaet], 250.0).
rezept(kochen, [[1, kuchenTeig], [1, sternenPudding]],[1, interStellareTorte], 250.0).
rezept(kochen, [[1, geheimnisVollerFleischEintopf], [1, halbFluessigerKaese]],[1, kaeseFleischEintopf], 250.0).
rezept(kochen, [[1, tortenBoden], [1, protoKaese], [1, solartillo]],[1, kaeseGemuesePastete], 250.0).
rezept(kochen, [[1, tortenBoden], [1, protoKaese], [1, jadeErbsen]],[1, kaeseGemuesePastete], 250.0).
rezept(kochen, [[1, tortenBoden], [1, protoKaese], [1, sievertBohnen]],[1, kaeseGemuesePastete], 250.0).
rezept(kochen, [[1, tortenBoden], [1, protoKaese], [1, fleischigeWurzeln]],[1, kaeseGemuesePastete], 250.0).
rezept(kochen, [[1, tortenBoden], [1, protoKaese], [1, aloeFleisch]],[1, kaeseGemuesePastete], 250.0).
rezept(kochen, [[1, tortenBoden], [1, wuerzigerKaese], [1, solartillo]],[1, kaeseGemuesePastete], 250.0).
rezept(kochen, [[1, tortenBoden], [1, wuerzigerKaese], [1, jadeErbsen]],[1, kaeseGemuesePastete], 250.0).
rezept(kochen, [[1, tortenBoden], [1, wuerzigerKaese], [1, sievertBohnen]],[1, kaeseGemuesePastete], 250.0).
rezept(kochen, [[1, tortenBoden], [1, wuerzigerKaese], [1, fleischigeWurzeln]],[1, kaeseGemuesePastete], 250.0).
rezept(kochen, [[1, tortenBoden], [1, wuerzigerKaese], [1, aloeFleisch]],[1, kaeseGemuesePastete], 250.0).
rezept(kochen, [[1, tortenBoden], [1, wuerzigerKaese]],[1, kaeseTorte], 250.0).
rezept(kochen, [[1, tortenBoden], [1, protoKaese]],[1, kaeseTorte], 250.0).
rezept(kochen, [[1, bitterSuesserKakao], [1, klobigerDonut]],[1, kakaoDonut], 250.0).
rezept(kochen, [[1, bitterSuesserKakao], [1, tortenBoden]],[1, kakaoTorte], 250.0).
rezept(kochen, [[1, kaktusNektar], [1, verarbeiteterZucker]],[1, kaktusGelee], 250.0).
rezept(kochen, [[1, kaktusFleisch]],[1, kaktusNektar], 250.0).
rezept(kochen, [[1, klobigerDonut], [1, knusperKaramell]],[1, karamellDonut], 250.0).
rezept(kochen, [[1, gefroreneKnollen], [1, klebrigerPudding], [1, knusperKaramell]],[1, karamellEisCreme], 250.0).
rezept(kochen, [[1, frostKristall], [1, klebrigerPudding], [1, knusperKaramell]],[1, karamellEisCreme], 250.0).
rezept(kochen, [[1, windenderAufgewuehlterTeig], [1, knusperKaramell]],[1, karamellisierterAlbTraum], 250.0).
rezept(kochen, [[1, protoTeig], [1, knusperKaramell]],[1, karamellKuriositaet], 250.0).
rezept(kochen, [[1, tortenBoden], [1, knusperKaramell]],[1, karamellTorte], 250.0).
rezept(kochen, [[1, kelpBeutel]],[1, kelpReis], 250.0).
rezept(kochen, [[1, geschlageneButter], [1, klebrigerHonig]],[1, klebrigeButter], 250.0).
rezept(kochen, [[1, holzApfel], [1, dickerSuesserTeig]],[1, klebrigeFruchtUeberraschung], 250.0).
rezept(kochen, [[1, schlaengelndeMarmelade], [1, sahne], [1, dickerSuesserTeig]],[1, klebrigeFruchtUeberraschung], 250.0).
rezept(kochen, [[1, protoButter], [1, klebrigerHonig]],[1, klebrigeProtoButter], 250.0).
rezept(kochen, [[1, klebrigeButter], [1, heulenderTeig]],[1, klebrigerBrueller], 250.0).
rezept(kochen, [[1, dickerSuesserTeig], [1, monstroeserPudding]],[1, klebrigerBrueller], 250.0).
rezept(kochen, [[1, klebrigeProtoButter], [1, klobigerDonut]],[1, klebrigerProtoDonut], 250.0).
rezept(kochen, [[1, kreaturenEi], [1, sahne], [1, verarbeiteterZucker]],[1, klebrigerPudding], 250.0).
rezept(kochen, [[1, grosseEier], [1, sahne], [1, verarbeiteterZucker]],[1, klebrigerPudding], 250.0).
rezept(kochen, [[1, dickerSuesserTeig], [1, klebrigerPudding]],[1, klebrigePuddingTorte], 250.0).
rezept(kochen, [[1, dickerSuesserTeig], [1, knusperKaramell]],[1, klebrigerKaramellKuchen], 250.0).
rezept(kochen, [[1, bitterSuesserKakao], [1, dickerSuesserTeig]],[1, klebrigerSchokoladenKuchen], 250.0).
rezept(kochen, [[1, extraFluffigerTeig], [1, klebrigerHonig]],[1, klebrigesHonigKuechlein], 250.0).
rezept(kochen, [[1, extraFluffigerTeig], [1, klebrigeButter]],[1, klebrigesHonigKuechlein], 250.0).
rezept(kochen, [[1, dickerSuesserTeig], [1, sahne], [1, immerBrennendeMarmelade]],[1, klebrigesMundFeuer], 250.0).
rezept(kochen, [[1, bratOel], [1, teig], [1, verarbeiteterZucker]],[1, klobigerDonut], 250.0).
rezept(kochen, [[1, salz], [1, verarbeiteterZucker]],[1, knusperKaramell], 250.0).
rezept(kochen, [[1, wurzelSaft]],[1, knusperKaramell], 250.0).
rezept(kochen, [[1, fasrigerEintopf], [1, wohlSchmeckendeSosse]],[1, koestlicherGemueseEintopf], 250.0).
rezept(kochen, [[1, kohlenStoff]],[1, kreaturenKugeln], 250.0).
rezept(kochen, [[1, klebrigerHonig], [1, windenderAufgewuehlterTeig]],[1, kriechendesJuckHonigBiskuit], 250.0).
rezept(kochen, [[1, holzApfel], [1, windenderAufgewuehlterTeig]],[1, kuchenDerSuende], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, windenderAufgewuehlterTeig]],[1, kuchenDerVerlorenen], 250.0).
rezept(kochen, [[1, salzigerPudding], [1, windenderAufgewuehlterTeig]],[1, kuchenDerVerlorenen], 250.0).
rezept(kochen, [[1, monstroeserPudding], [1, windenderAufgewuehlterTeig]],[1, kuchenDerVerlorenen], 250.0).
rezept(kochen, [[1, sternenPudding], [1, windenderAufgewuehlterTeig]],[1, kuchenDerVerlorenen], 250.0).
rezept(kochen, [[1, kuchenTeig], [1, knusperKaramell]],[1, kuchenMitKaramellKruste], 250.0).
rezept(kochen, [[1, kreaturenEi], [1, gesuessteButter], [1, verfeinertesMehl]],[1, kuchenTeig], 250.0).
rezept(kochen, [[1, grosseEier], [1, gesuessteButter], [1, verfeinertesMehl]],[1, kuchenTeig], 250.0).
rezept(kochen, [[1, kreaturenEi], [1, honigButter], [1, verfeinertesMehl]],[1, kuchenTeig], 250.0).
rezept(kochen, [[1, grosseEier], [1, honigButter], [1, verfeinertesMehl]],[1, kuchenTeig], 250.0).
rezept(kochen, [[1, mordit], [1, beinFleisch]],[1, kuenstlicheWuermer], 250.0).
rezept(kochen, [[1, mordit], [1, kohlenStoffNanoRohr]],[1, kuenstlicheWuermer], 250.0).
rezept(kochen, [[1, kuerbisKnolle]],[1, kuerbisFleisch], 250.0).
rezept(kochen, [[1, tortenBoden], [1, feuerBeere]],[1, leuchtPastete], 250.0).
rezept(kochen, [[1, tortenBoden], [1, solartillo]],[1, leuchtPastete], 250.0).
rezept(kochen, [[1, tortenBoden], [1, sievertBohnen]],[1, leuchtPastete], 250.0).
rezept(kochen, [[1, tortenBoden], [1, immerBrennendeMarmelade]],[1, leuchtPastete], 250.0).
rezept(kochen, [[1, sahne], [1, extraFluffigerTeig], [1, grahmeLade]],[1, marmeladenBiskuit], 250.0).
rezept(kochen, [[1, sahne], [1, extraFluffigerTeig], [1, fellKnaeuelGelee]],[1, marmeladenBiskuit], 250.0).
rezept(kochen, [[1, immerBrennendeMarmelade], [1, klobigerDonut]],[1, marmeladenDonut], 250.0).
rezept(kochen, [[1, grahmeLade], [1, klobigerDonut]],[1, marmeladenDonut], 250.0).
rezept(kochen, [[1, kaktusGelee], [1, klobigerDonut]],[1, marmeladenDonut], 250.0).
rezept(kochen, [[1, fellKnaeuelGelee], [1, klobigerDonut]],[1, marmeladenDonut], 250.0).
rezept(kochen, [[1, sahne], [1, protoTeig], [1, fellKnaeuelGelee]],[1, marmeladenKuriositaet], 250.0).
rezept(kochen, [[1, sahne], [1, protoTeig], [1, grahmeLade]],[1, marmeladenKuriositaet], 250.0).
rezept(kochen, [[1, sahne], [1, dickerSuesserTeig], [1, fellKnaeuelGelee]],[1, marmeladenSchleimer], 250.0).
rezept(kochen, [[1, sahne], [1, dickerSuesserTeig], [1, grahmeLade]],[1, marmeladenSchleimer], 250.0).
rezept(kochen, [[1, grahmeLade], [1, tortenBoden]],[1, marmeladenTorte], 250.0).
rezept(kochen, [[1, kaktusGelee], [1, tortenBoden]],[1, marmeladenTorte], 250.0).
rezept(kochen, [[1, klobigerDonut], [1, monstroeserPudding]],[1, monstroeserDonut], 250.0).
rezept(kochen, [[1, heulenderTeig], [1, synthetischerHonig]],[1, monstroeserHonigKuchen], 250.0).
rezept(kochen, [[1, sahne], [1, larvenKern], [1, verarbeiteterZucker]],[1, monstroeserPudding], 250.0).
rezept(kochen, [[1, kreaturenEi], [1, wuerzigerKaese]],[1, omelett], 250.0).
rezept(kochen, [[1, grosseEier], [1, wuerzigerKaese]],[1, omelett], 250.0).
rezept(kochen, [[1, larvenKern], [1, protoKaese]],[1, parasitenOmelett], 250.0).
rezept(kochen, [[1, duftendeKraeuter], [1, mordit]],[1, pheromonBeutel], 250.0).
rezept(kochen, [[1, enzymFluessigkeit], [1, mordit]],[1, pheromonBeutel], 250.0).
rezept(kochen, [[1, sternenKnolle]],[1, pilgerBeere], 250.0).
rezept(kochen, [[1, pilgerBeere]],[1, pilgerElixier], 250.0).
rezept(kochen, [[1, heisseSosse], [1, geheimnisVollerFleischEintopf]],[1, pikanteFleischBaellchen], 250.0).
rezept(kochen, [[1, tortenBoden], [1, ungiftigerPilz]],[1, pilzTorte], 250.0).
rezept(kochen, [[1, fleischigeStuecke], [1, klobigerDonut]],[1, proteinReicherDonut], 250.0).
rezept(kochen, [[1, protoSahne]],[1, protoButter], 250.0).
rezept(kochen, [[1, protoButter], [1, synthetischerHonig]],[1, protoButterMitHonig], 250.0).
rezept(kochen, [[1, protoSahne], [1, wildeHefe]],[1, protoKaese], 250.0). 
rezept(kochen, [[1, protoOel], [1, teig], [1, verarbeiteterZucker]],[1, protoKrapfen], 250.0).
rezept(kochen, [[1, protoTeig], [1, synthetischerHonig]],[1, protoKuchenMitHonig], 250.0).
rezept(kochen, [[1, protoButter], [1, protoButter]],[1, protoOel], 250.0).
rezept(kochen, [[1, kreaturenEi], [1, protoKaese]],[1, protoOmelett], 250.0).
rezept(kochen, [[1, grosseEier], [1, protoKaese]],[1, protoOmelett], 250.0).
rezept(kochen, [[1, warmeProtoMilch]],[1, protoSahne], 250.0).
rezept(kochen, [[1, kreaturenEi], [1, gesuessteProtoButter], [1, verfeinertesMehl]],[1, protoTeig], 250.0).
rezept(kochen, [[1, grosseEier], [1, gesuessteProtoButter], [1, verfeinertesMehl]],[1, protoTeig], 250.0).
rezept(kochen, [[1, kreaturenEi], [1, protoButterMitHonig], [1, verfeinertesMehl]],[1, protoTeig], 250.0).
rezept(kochen, [[1, grosseEier], [1, protoButterMitHonig], [1, verfeinertesMehl]],[1, protoTeig], 250.0).
rezept(kochen, [[1, protoWurst], [1, tortenBoden]],[1, protoWurstPastete], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, klobigerDonut]],[1, puddingDonut], 250.0).
rezept(kochen, [[1, protoTeig], [1, klebrigerPudding]],[1, puddingKuriositaet], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, tortenBoden]],[1, puddingTorte], 250.0).
rezept(kochen, [[1, salzigerPudding], [1, tortenBoden]],[1, puddingTorte], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, kuchenTeig]],[1, puddingTorte], 250.0).
rezept(kochen, [[1, kaktusGelee], [1, sahne], [1, dickerSuesserTeig]],[1, rachenKleberMitHonig], 250.0).
rezept(kochen, [[1, kaktusNektar], [1, dickerSuesserTeig]],[1, rachenKleberMitHonig], 250.0).
rezept(kochen, [[1, cremigeSosse], [1, geschmorteOrgane]],[1, rahmOrganSuppe], 250.0).
rezept(kochen, [[1, frischeMilch]],[1, sahne], 250.0).
rezept(kochen, [[1, wildeMilch]],[1, sahne], 250.0).
rezept(kochen, [[1, kuchenTeig], [1, sahne]],[1, sahneBroetchen], 250.0).
rezept(kochen, [[1, tortenBoden], [1, sahne]],[1, sahneHaeppchen], 250.0).
rezept(kochen, [[1, heulenderTeig], [1, sahne]],[1, sahneKuchenDesUntergangs], 250.0).
rezept(kochen, [[1, protoTeig], [1, sahne]],[1, sahneKuriositaet], 250.0).
rezept(kochen, [[1, kuchenTeig], [1, salzigerPudding]],[1, salzigeKoestlichkeit], 250.0).
rezept(kochen, [[1, klobigerDonut], [1, salzigerPudding]],[1, salzigerDonut], 250.0).
rezept(kochen, [[1, salz], [1, sahne], [1, verarbeiteterZucker]],[1, salzigerPudding], 250.0).
rezept(kochen, [[1, gefroreneKnollen], [1, salzigerPudding]],[1, salzigerRauReif], 250.0).
rezept(kochen, [[1, frostKristall], [1, salzigerPudding]],[1, salzigerRauReif], 250.0).
rezept(kochen, [[1, protoTeig], [1, salzigerPudding]],[1, salzigeUeberraschung], 250.0).
rezept(kochen, [[1, kaktusGelee], [1, sahne], [1, extraFluffigerTeig]],[1, sanfteStachelUeberraschung], 250.0).
rezept(kochen, [[1, kaktusNektar], [1, extraFluffigerTeig]],[1, sanfteStachelUeberraschung], 250.0).
rezept(kochen, [[1, fasrigerEintopf], [1, heisseSosse]],[1, scharferGemueseEintopf], 250.0).
rezept(kochen, [[1, holzApfel], [1, verarbeiteterZucker]],[1, schlaengelndeMarmelade], 250.0).
rezept(kochen, [[1, schlaengelndeMarmelade], [1, klobigerDonut]],[1, schlaengelnderDonut], 250.0).
rezept(kochen, [[1, holzApfel], [1, tortenBoden]],[1, schlaengelndeTorte], 250.0).
rezept(kochen, [[1, schlaengelndeMarmelade], [1, tortenBoden]],[1, schlaengelndeTorte], 250.0).
rezept(kochen, [[1, bitterSuesserKakao], [1, frostKristall], [1, klebrigerPudding]],[1, schokoladenEisCreme], 250.0).
rezept(kochen, [[1, bitterSuesserKakao], [1, gefroreneKnollen], [1, klebrigerPudding]],[1, schokoladenEisCreme], 250.0).
rezept(kochen, [[1, bitterSuesserKakao], [1, kuchenTeig]],[1, schokoladenKuchen], 250.0).
rezept(kochen, [[1, bitterSuesserKakao], [1, protoTeig]],[1, schokoladenKuriositaet], 250.0).
rezept(kochen, [[1, bitterSuesserKakao], [1, extraFluffigerTeig]],[1, schokoTraum], 250.0).
rezept(kochen, [[1, monstroeserPudding], [1, kuchenTeig]],[1, schrecklicheklebrigeKoestlichkeit], 250.0).
rezept(kochen, [[1, monstroeserPudding], [1, protoTeig]],[1, schrecklicheklebrigeKoestlichkeit], 250.0).
rezept(kochen, [[1, hypnotischesAuge]],[1, schrecklicherBrei], 250.0).
rezept(kochen, [[1, gammaWurzel]],[1, sievertBohnen], 250.0).
rezept(kochen, [[1, chromatischesMetall]],[1, silikonEi], 250.0).
rezept(kochen, [[1, klebrigerPudding], [1, extraFluffigerTeig]],[1, softePuddingTorte], 250.0).
rezept(kochen, [[1, salzigerPudding], [1, extraFluffigerTeig]],[1, softePuddingTorte], 250.0).
rezept(kochen, [[1, sternenPudding], [1, extraFluffigerTeig]],[1, softePuddingTorte], 250.0).
rezept(kochen, [[1, monstroeserPudding], [1, extraFluffigerTeig]],[1, softePuddingTorte], 250.0).
rezept(kochen, [[1, solanium]],[1, solartillo], 250.0).
rezept(kochen, [[1, kaktusGelee], [1, sahne], [1, kuchenTeig]],[1, speiseRoehrenUeberraschung], 250.0).
rezept(kochen, [[1, kaktusNektar], [1, kuchenTeig]],[1, speiseRoehrenUeberraschung], 250.0).
rezept(kochen, [[1, kaktusNektar], [1, protoTeig]],[1, stacheligeKuriositaet], 250.0).
rezept(kochen, [[1, kaktusGelee], [1, sahne], [1, protoTeig]],[1, stacheligeKuriositaet], 250.0).
rezept(kochen, [[1, aloeFleisch], [1, tortenBoden]],[1, stacheligeTorte], 250.0).
rezept(kochen, [[1, kaktusNektar], [1, tortenBoden]],[1, stacheligeTorte], 250.0).
rezept(kochen, [[1, gefroreneKnollen], [1, sternenPudding]],[1, sternenEisCreme], 250.0).
rezept(kochen, [[1, frostKristall], [1, sternenPudding]],[1, sternenEisCreme], 250.0).
rezept(kochen, [[1, sternenPudding], [1, dickerSuesserTeig]],[1, sternenGeburtKoestlichkeit], 250.0).
rezept(kochen, [[1, silikonEi], [1, sahne], [1, verarbeiteterZucker]],[1, sternenPudding], 250.0).
rezept(kochen, [[1, sternenPudding], [1, tortenBoden]],[1, sternenPuddingTorte], 250.0).
rezept(kochen, [[1, sahne], [1, extraFluffigerTeig]],[1, superLeichterSahneKuchen], 250.0).
rezept(kochen, [[1, sahne], [1, dickerSuesserTeig]],[1, suesseSahneTraeume], 250.0).
rezept(kochen, [[1, klebrigerHonig]],[1, synthetischerHonig], 250.0).
rezept(kochen, [[1, wildeHefe], [1, verfeinertesMehl]],[1, teig], 250.0).
rezept(kochen, [[1, gefroreneKnollen], [1, monstroeserPudding]],[1, toedlichKalteEisCreme], 250.0).
rezept(kochen, [[1, frostKristall], [1, monstroeserPudding]],[1, toedlichKalteEisCreme], 250.0).
rezept(kochen, [[1, gebaeck]],[1, tortenBoden], 250.0).
rezept(kochen, [[1, kuchenTeig], [1, sahne], [1, grahmeLade]],[1, traditionsKuchen], 250.0).
rezept(kochen, [[1, synthetischerHonig], [1, dickerSuesserTeig]],[1, ueppigeHonigTorte], 250.0).
rezept(kochen, [[1, pilzSchimmel]],[1, ungiftigerPilz], 250.0).
rezept(kochen, [[1, protoTeig], [1, sahne], [1, anormaleMarmelade]],[1, unloesbarerMarmeladenSturz], 250.0).
rezept(kochen, [[1, grahBeere]],[1, verarbeiteterZucker], 250.0).
rezept(kochen, [[1, kaktusNektar]],[1, verarbeiteterZucker], 250.0).
rezept(kochen, [[1, suessWurzel]],[1, verarbeiteterZucker], 250.0).
rezept(kochen, [[1, beinFleisch]],[1, verarbeitetesFleisch], 250.0).
rezept(kochen, [[1, fleischigeFluegel]],[1, verarbeitetesFleisch], 250.0).
rezept(kochen, [[1, fleischigeStuecke]],[1, verarbeitetesFleisch], 250.0).
rezept(kochen, [[1, innereienBeutel]],[1, verarbeitetesFleisch], 250.0).
rezept(kochen, [[1, katzenLeber]],[1, verarbeitetesFleisch], 250.0).
rezept(kochen, [[1, protoWurst]],[1, verarbeitetesFleisch], 250.0).
rezept(kochen, [[1, rohesSteak]],[1, verarbeitetesFleisch], 250.0).
rezept(kochen, [[1, schreiterWurst]],[1, verarbeitetesFleisch], 250.0).
rezept(kochen, [[1, schuppigesFleisch]],[1, verarbeitetesFleisch], 250.0).
rezept(kochen, [[1, glasKoerner]],[1, verfeinertesMehl], 250.0).
rezept(kochen, [[1, heptaPloidWeizen]],[1, verfeinertesMehl], 250.0).
rezept(kochen, [[1, kelpReis]],[1, verfeinertesMehl], 250.0).
rezept(kochen, [[1, frostKristall], [1, grahmeLade], [1, klebrigerPudding]],[1, vyEisCreme], 250.0).
rezept(kochen, [[1, frostKristall], [1, grahBeere], [1, klebrigerPudding]],[1, vyEisCreme], 250.0).
rezept(kochen, [[1, gefroreneKnollen], [1, grahmeLade], [1, klebrigerPudding]],[1, vyEisCreme], 250.0).
rezept(kochen, [[1, gefroreneKnollen], [1, grahBeere], [1, klebrigerPudding]],[1, vyEisCreme], 250.0).
rezept(kochen, [[1, faecium]],[1, wildeHefe], 250.0).
rezept(kochen, [[1, delikatessBaiser], [1, larvenKern], [1, verfeinertesMehl]],[1, windenderAufgewuehlterTeig], 250.0).
rezept(kochen, [[1, grahmeLade], [1, sahne], [1, windenderAufgewuehlterTeig]],[1, windendesMarmeladenKuechlein], 250.0).
rezept(kochen, [[1, fellKnaeuelGelee], [1, sahne], [1, windenderAufgewuehlterTeig]],[1, windendesMarmeladenKuechlein], 250.0).
rezept(kochen, [[1, wurzelSaft], [1, geduenstetesGemuese]],[1, wohlSchmeckendeSosse], 250.0).
rezept(kochen, [[1, geduenstetesGemuese], [1, geduenstetesGemuese]],[1, wohlSchmeckendeSosse], 250.0).
rezept(kochen, [[1, kaktusNektar], [1, heulenderTeig]],[1, wuergendesKuchenMonster], 250.0).
rezept(kochen, [[1, kaktusGelee], [1, sahne], [1, heulenderTeig]],[1, wuergendesKuchenMonster], 250.0).
rezept(kochen, [[1, halbFluessigerKaese], [1, geschmorteOrgane]],[1, wuerzigeOrganUeberraschung], 250.0).
rezept(kochen, [[1, fasrigerEintopf], [1, halbFluessigerKaese]],[1, wuerzigerGemueseEintopf], 250.0).
rezept(kochen, [[1, sahne], [1, wildeHefe]],[1, wuerzigerKaese], 250.0). 
rezept(kochen, [[1, immerBrennendeMarmelade], [1, frostKristall], [1, klebrigerPudding]],[1, wuerzigesEis], 250.0).
rezept(kochen, [[1, feuerBeere], [1, frostKristall], [1, klebrigerPudding]],[1, wuerzigesEis], 250.0).
rezept(kochen, [[1, immerBrennendeMarmelade], [1, gefroreneKnollen], [1, klebrigerPudding]],[1, wuerzigesEis], 250.0).
rezept(kochen, [[1, feuerBeere], [1, gefroreneKnollen], [1, klebrigerPudding]],[1, wuerzigesEis], 250.0).
rezept(kochen, [[1, fleischigeWurzeln]],[1, wurzelSaft], 250.0).
rezept(kochen, [[1, innereienBeutel], [1, tortenBoden]],[1, zaeheOrganPaste], 250.0).
rezept(kochen, [[1, katzenLeber], [1, tortenBoden]],[1, zaeheOrganPaste], 250.0).

/* nicht verifiziert wegen fehlender Zutaten */
/* riesenEi fehlt */

rezept(kochen, [[1, verarbeiteterZucker], [1, riesenEi]],[1, delikatessBaiser], 250.0).
rezept(kochen, [[1, verfeinertesMehl], [1, klebrigeProtoButter], [1, riesenEi]],[1, dickerSuesserTeig], 250.0).
rezept(kochen, [[1, verfeinertesMehl], [1, klebrigeButter], [1, riesenEi]],[1, dickerSuesserTeig], 250.0).
rezept(kochen, [[1, verfeinertesMehl], [1, delikatessBaiser], [1, riesenEi]],[1, extraFluffigerTeig], 250.0).
rezept(kochen, [[1, riesenEi]],[1, gebackeneEier], 250.0).
rezept(kochen, [[1, riesenEi], [1, sahne], [1, verarbeiteterZucker]],[1, klebrigerPudding], 250.0).
rezept(kochen, [[1, riesenEi], [1, gesuessteButter], [1, verfeinertesMehl]],[1, kuchenTeig], 250.0).
rezept(kochen, [[1, riesenEi], [1, honigButter], [1, verfeinertesMehl]],[1, kuchenTeig], 250.0).
rezept(kochen, [[1, riesenEi], [1, wuerzigerKaese]],[1, omelett], 250.0).
rezept(kochen, [[1, riesenEi], [1, gesuessteProtoButter], [1, verfeinertesMehl]],[1, protoTeig], 250.0).
rezept(kochen, [[1, riesenEi], [1, protoButterMitHonig], [1, verfeinertesMehl]],[1, protoTeig], 250.0).
rezept(kochen, [[1, riesenEi], [1, protoKaese]],[1, protoOmelett], 250.0).

/* diploStuecke fehlt */
rezept(kochen, [[1, diploStuecke]],[1, verarbeitetesFleisch], 250.0).
rezept(kochen, [[1, diploStuecke], [1, tortenBoden]],[1, geheimnisVolleFleischPastete], 250.0).
rezept(kochen, [[1, diploStuecke], [1, diploStuecke]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, diploStuecke], [1, fleischigeFluegel]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, diploStuecke], [1, fleischigeStuecke]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, diploStuecke], [1, geraeuchertesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, diploStuecke], [1, rohesSteak]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, diploStuecke], [1, schreiterWurst]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, diploStuecke], [1, schuppigesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, diploStuecke], [1, verarbeitetesFleisch]],[1, geheimnisVollerFleischEintopf], 250.0).
rezept(kochen, [[1, kohlenStoff], [1, diploStuecke]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, kohlenStoff], [1, unholdRogen]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, verdichteterKohlenStoff], [1, diploStuecke]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, mordit], [1, diploStuecke]],[1, hackFleisch], 250.0).

/* unholdRogen fehlt */
rezept(kochen, [[1, verdichteterKohlenStoff], [1, unholdRogen]],[1, geraeuchertesFleisch], 250.0).
rezept(kochen, [[1, tortenBoden], [1, unholdRogen]],[1, heimgesuchtePastete], 250.0).
rezept(kochen, [[1, unholdRogen]],[1, verarbeitetesFleisch], 250.0).



/* %%%%%%%%%%%%%%%%%%%%%  Rezeptfreischaltungen %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
/* =====================  Aussenposten =============================================== */
rezept(rezeptInAussenPostenErwerben, [[80, nanitHaufen]], [1, eigenesKraftFeldRezept], 0 ).
rezept(rezeptInAussenPostenErwerben, [[150, nanitHaufen]], [1, teleportEmpfaengerRezept], 0 ).
rezept(rezeptInAussenPostenErwerben, [[75, nanitHaufen]], [1, fortgeschrittenerMinenLaserARezept], 0 ).
rezept(rezeptInAussenPostenErwerben, [[90, nanitHaufen]], [1, neuralStimulatorBRezept], 0 ).
rezept(rezeptInAussenPostenErwerben, [[120, nanitHaufen]], [1, wellenFormWiederVerwerterBRezept], 0 ).
rezept(rezeptInAussenPostenErwerben, [[120, nanitHaufen]], [1, schildGitterBRezept], 0 ).
rezept(rezeptInAussenPostenErwerben, [[90, nanitHaufen]], [1, laufIonisatorCRezept], 0 ).
rezept(rezeptInAussenPostenErwerben, [[120, nanitHaufen]], [1, sauerStoffWiederVerwerterCRezept], 0 ).

/* =====================  Forschungscomputer klein =================================== */
/* ---------------------  Unterschl�pfe aus Holz ---------------------------------- */
rezept(rezeptAmForschungsComputerErwerben, [[0, geborgeneDaten]], [1, holzWandRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[0, geborgeneDaten]], [1, holzBodenPlatteRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, duenneHolzWandRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[0, geborgeneDaten]], [1, holzTuerRahmenRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[0, geborgeneDaten]], [1, holzDachRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[3, geborgeneDaten]], [1, glasPlatteMitHolzRahmenRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, holzRampeRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, kleineHolzPlatteRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, holzDreieckRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, kleinesHolzDreieckRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, schraegeHolzPlatteRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, kleineHolzWandRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, holzFensterRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[2, geborgeneDaten]], [1, holzTuerRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[2, geborgeneDaten]], [1, elektrischeHolzTuerRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, holzDachPlatteRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, holzDachEckStueckRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, holzBogenRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, halbeHolzRampeRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, kurzeHolzWandRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[2, geborgeneDaten]], [1, holzFassadeRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[2, geborgeneDaten]], [1, kleineHolzTuerRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, dachInnenEckteilAusHolzRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, halberHolzBogenRezept], 0 ).

/* ---------------------  Anterschl�pfe aus Metall -------------------------------- */
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, metallWandRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, metallBodenPlatteRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, duenneMetallWandRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[2, geborgeneDaten]], [1, metallTuerRahmenRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[2, geborgeneDaten]], [1, metallDachRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[3, geborgeneDaten]], [1, glasPlatteMitMetallRahmenRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, metallRampeRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, kleineMetallPlatteRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, metallDreieckRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, kleinesMetallDreieckRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, schraegeMetallPlatteRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, kleineMetallWandRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, metallFensterRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[2, geborgeneDaten]], [1, metallTuerRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[2, geborgeneDaten]], [1, elektrischeMetallTuerRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, metallDachPlatteRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, metallDachEckStueckRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, metallBogenRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, halbeMetallRampeRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, kurzeMetallWandRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[2, geborgeneDaten]], [1, metallFassadeRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[2, geborgeneDaten]], [1, kleineMetallTuerRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, dachInnenEckteilAusMetallRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, halberMetallBogenRezept], 0 ).

/* ---------------------  Unterschl�pfe aus Beton --------------------------------- */
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, betonWandRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, betonBodenPlatteRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, duenneBetonWandRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[2, geborgeneDaten]], [1, betonTuerRahmenRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[2, geborgeneDaten]], [1, betonDachRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[3, geborgeneDaten]], [1, glasPlatteMitBetonRahmenRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, betonRampeRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, kleineBetonBodenPlatteRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, betonDreieckRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, kleinesBetonDreieckRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, schraegeBetonPlatteRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, kleineBetonWandRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, betonFensterRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[2, geborgeneDaten]], [1, betonTuerRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[2, geborgeneDaten]], [1, elektrischeBetonTuerRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, betonDachPlatteRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, betonDachEckStueckRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, betonBogenRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, halbeBetonRampeRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, kurzeBetonWandRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[2, geborgeneDaten]], [1, betonFassadeRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[2, geborgeneDaten]], [1, kleineBetonTuerRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, dachInnenEckteilAusBetonRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, halberBetonBogenRezept], 0 ).

/* ---------------------  zentrale Wohntechnologie -------------------------------- */
rezept(rezeptAmForschungsComputerErwerben, [[2, geborgeneDaten]], [1, basisTelePorterModulRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, bioTreibStoffReaktorRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, speicherSignalRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[5, geborgeneDaten]], [1, gesundheitsStationRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[1, geborgeneDaten]], [1, signalBoosterRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[3, geborgeneDaten]], [1, batterieRezept], 0 ).
rezept(rezeptAmForschungsComputerErwerben, [[8, geborgeneDaten]], [1, solarModulRezept], 0 ).

/* =====================  Anomalie =================================================== */
/* =====================  Konstruktionsterminal gro� ================================= */
/* ------------------------------- grosse Vorfertigungen ---------------- */
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, zylindrischerRaumRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, quadratischerRaumRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[5, geborgeneDaten]], [1, geraderKorridorRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, tuerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, fundamentRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[5, geborgeneDaten]], [1, lFoermigerKorridorRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[5, geborgeneDaten]], [1, korridorMitGlasDachRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[8, geborgeneDaten]], [1, holoTuerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, zugangsRampeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, pflasterungRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, viererFundamentStrebeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, fundamentStrebeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, zylindrischerRaumRahmenRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[5, geborgeneDaten]], [1, tFoermigerKorridorRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[5, geborgeneDaten]], [1, xFoermigerKorridorRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, korridorFensterRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, bioKuppelRaumRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, gebogenerKorridorRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, leiterRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, pflasterungVierFachRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, pflasterungPodestRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, grossesGlasPaneelRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, aussichtsKugelRezept], 0 ).

/* ------------------------------- kleine Vorfertigungen ---------------- */
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, wuerfelFoermigerRaumRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, wuerfelRaumFundamentStrebeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, gewoelbteWuerfelFoermigeWandRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[5, geborgeneDaten]], [1, wuerfelFoermigerGlasRaumRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, wuerfelFoermigerRaumRahmenRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, wuerfelFoermigerRaumBodenRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, wuerfelRaumViererFundamentStrebeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, innenTreppenRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, wuerfelFoermigeInnenWandRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, wuerfelFoermigerDachAufsatzRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, gewoelbtesWuerfelFoermigesDachRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, wuerfelFoermigesFensterEckigRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, wuerfelFoermigesFensterRundRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, infraStrukturLeiterRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, wuerfelFoermigeInnenTuerRezept], 0 ).

/* ------------------------------- Technologiemodule -------------------- */
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, speicherSignalRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, terminalDesGalaktischenMarktesRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, nachrichtenModulRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[5, geborgeneDaten]], [1, gesundheitsStationRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, basisTelePorterModulRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, naehrStoffProzessorRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, lichtBoxRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kommunikationsStationRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, gefahrenSchutzEinheitRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, aussehenModifikatorRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, landeFeldRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[0, geborgeneDaten]], [1, tragbareRaffinerieRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, nutzTierEinheitRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, automatischerFuettererRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, leuchtBodenRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, geraeuschBoxRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, kugelErzeugerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, kurzStreckenTelePorterRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, mittlereRaffinerieRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, byteBeatGeraetRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, byteBeatSchaltungRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, grosseRaffinerieRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[20, geborgeneDaten]], [1, antiMaterieReaktorRezept], 0 ).

/* ------------------------------- Transportmodule ---------------------- */
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, roamerGeoBuchtRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, nomadenGeoBuchtRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, exoFahrzeugRufStationRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, nautilonKammerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, pilgerGeoBuchtRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, kolossGeoBuchtRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, rennInitiatorRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, rennHindernisRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, rennKraftVerstaerkerRezept], 0 ).

/* ------------------------------- Wasser Konstruktion ------------------ */
rezept(rezeptInAnomalieErwerben, [[6, geborgeneDaten]], [1, tiefSeeKammerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, meeresUnterSchlupfRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, glasTunnelRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[6, geborgeneDaten]], [1, quadratischeTiefSeeKammerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, wasserDichteTuerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, lFoermigerGlasTunnelRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, vertikalerGlasTunnelRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, mondTeichBodenRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, tFoermigerGlasTunnelRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, xFoermigerGlasTunnelRezept], 0 ).

/* ------------------------------- Motiv Designs 1 ---------------------- */
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivStilisiertesRRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivRundPipetteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivBuegelRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivNo0Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivSchildErstochenerVogelRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivFaltungDuennDickRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivZiegelSteineRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivRadioAktivGrauRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivGrabSteinRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivHelloGamesRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivNo1Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivNo2Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivSchildGr�nerMannRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivSchildKorvaxRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivNo3Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivNo5Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivNo7Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivNo9Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivNo4Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivNo6Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivNo8Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivFroschSackRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, motivLaemmchenRezept], 0 ).

/* ------------------------------- Dekorative Module 1 ------------------ */
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, wandBildSchirmRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, wandVentilatorRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, gruenerWandBildSchirmRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, schubLadenSchrankRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, wandEinheitRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, lagerModulRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, deckenPaneelRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, techBedienFeldRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, serverRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kanisterRegalRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kleineKisteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, schliessFachRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, verschlosseneKisteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, flachesModulRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, seitenModulRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, regalModulRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, roboterArmRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, waffenRegalRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, oszilloskopRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, achtEckSchrankRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, fassFoermigerFabrikatorRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, hoherSchrankRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kistenFoermigerFabrikatorRezept], 0 ).

/* ------------------------------- Dekorative Module 2 ------------------ */
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, schalenSitzStuhlRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, stuhlEckigRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, flagge1Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, tischRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, bettRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, stuhlFriseurRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, sofaRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[0, geborgeneDaten]], [1, flagge2Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, wandFlagge1], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, tischSechsEckigRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, einfacherSchreibTischRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, ergonomischesSofaRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, eckSofaRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, flagge3Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, flagge4Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, wandFlagge3Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, wandFlagge2Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, bodenMatteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, grosseMonitorStationRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, gewoelbterTischRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, monitorStationRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, arbeitsPlatteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, leichterTischRezept], 0 ).

/* ------------------------------- Lichter ------------------------------ */
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, lichtHandLampeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, weisseLeuchteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, lichtStehLampeEckigRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, laborLampeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, blaueLeuchteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, roteLeuchteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, lichtStehLampeRundRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[0, geborgeneDaten]], [1, lichtStehLampeSchirmRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, deckenLeuchteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, gelbeLeuchteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, grueneLeuchteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, pinkeLeuchteRezept], 0 ).

/* ------------------------------- Industriemodule ---------------------- */
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, bioTreibStoffReaktorRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, mineralienExtraktorRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, wandSchalterRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[8, geborgeneDaten]], [1, solarModulRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, batterieRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, gasExtraktorRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, versorgungsDepotRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, versorgungsRohrRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, bodenSchalterRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, annaeherungsSchalterRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, schalterRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, energieUmkehrerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, automatischerSchalterRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, elektroMagnetischerGeneratorRezept], 0 ).

/* ------------------------------- Landwirtschaft ----------------------- */
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, hydroKulturTrogRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, topfPflanzeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, geborgeneDaten]], [1, grosserHydroKulturTrogRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, pilzGeflechtRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, frostWurzRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, gammaGrasRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, echinoKaktusRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, sternenDornRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, sonnenRebeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, stehenderPflanzenBehaelterRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, floraBehaelterHochBeetRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, floraBehaelterKastenRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[0, geborgeneDaten]], [1, floraBehaelterTubusRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, giftIgelRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, gravitinoWirtRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, magenKrampfBlumeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, morditWurzelRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, eiweissPerlenKugelRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, nipNipRezept], 0 ).

/* ------------------------------- Unterschl�pfe aus Holz --------------- */
rezept(rezeptInAnomalieErwerben, [[0, geborgeneDaten]], [1, holzWandRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[0, geborgeneDaten]], [1, holzBodenPlatteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, duenneHolzWandRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[0, geborgeneDaten]], [1, holzTuerRahmenRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[0, geborgeneDaten]], [1, holzDachRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, glasPlatteMitHolzRahmenRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, holzRampeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kleineHolzPlatteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, holzDreieckRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, schraegeHolzPlatteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kleineHolzWandRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, holzFensterRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, holzTuerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, elektrischeHolzTuerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, holzDachPlatteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, holzDachEckStueckRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, holzBogenRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, halbeHolzRampeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kleinesHolzDreieckRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kurzeHolzWandRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, holzFassadeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, kleineHolzTuerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, dachInnenEckteilAusHolzRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, halberHolzBogenRezept], 0 ).

/* ------------------------------- Unterschl�pfe aus Metall ------------- */
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, metallWandRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, metallBodenPlatteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, duenneMetallWandRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, metallTuerRahmenRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, metallDachRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, glasPlatteMitMetallRahmenRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, metallRampeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kleineMetallPlatteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, metallDreieckRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, schraegeMetallPlatteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kleineMetallWandRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, metallFensterRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, metallTuerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, elektrischeMetallTuerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, metallDachPlatteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, metallDachEckStueckRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, metallBogenRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, halbeMetallRampeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kleinesMetallDreieckRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kurzeMetallWandRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, metallFassadeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, kleineMetallTuerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, dachInnenEckteilAusMetallRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, halberMetallBogenRezept], 0 ).

/* ------------------------------- Unterschl�pfe aus Beton -------------- */
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, betonWandRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, betonBodenPlatteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, duenneBetonWandRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, betonTuerRahmenRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, betonDachRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, glasPlatteMitBetonRahmenRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, betonRampeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kleineBetonPlatteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, betonDreieckRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, schraegeBetonPlatteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kleineBetonWandRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, betonFensterRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, betonTuerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, elektrischeBetonTuerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, betonDachPlatteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, betonDachEckStueckRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, betonBogenRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, halbeBetonRampeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kleinesBetonDreieckRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kurzeBetonWandRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[3, geborgeneDaten]], [1, betonFassadeRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[2, geborgeneDaten]], [1, kleineBetonTuerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, dachInnenEckteilAusBetonRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, halberBetonBogenRezept], 0 ).

/* ------------------------------- primitive Formen --------------------- */
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, grosserKeilRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kleinerKeilRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, rohrRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, pyramideRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, gebogenesRohrRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, stabilerWuerfelRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, zylinderRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, wuerfelRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[1, geborgeneDaten]], [1, kugelRezept], 0 ).

/* ------------------------------- Lagereinheiten ----------------------- */
rezept(rezeptInAnomalieErwerben, [[5, geborgeneDaten]], [1, lagerBehaelter0Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[5, geborgeneDaten]], [1, lagerBehaelter1Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[5, geborgeneDaten]], [1, lagerBehaelter2Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[5, geborgeneDaten]], [1, lagerBehaelter3Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[5, geborgeneDaten]], [1, lagerBehaelter4Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[5, geborgeneDaten]], [1, lagerBehaelter5Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[5, geborgeneDaten]], [1, lagerBehaelter6Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[5, geborgeneDaten]], [1, lagerBehaelter7Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[5, geborgeneDaten]], [1, lagerBehaelter8Rezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[5, geborgeneDaten]], [1, lagerBehaelter9Rezept], 0 ).

/* ------------------------------- Raumschiffmodule --------------------- */
rezept(rezeptInAnomalieErwerben, [[460, nanitHaufen]], [1, instabilitaetsAntriebARezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[460, nanitHaufen]], [1, unterLichtVerstaerkerSRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[150, nanitHaufen]], [1, teleportEmpfaengerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[50, nanitHaufen]], [1, konfliktScannerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[50, nanitHaufen]], [1, wirtschaftsScannerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[240, nanitHaufen]], [1, notFallWarpEinheitARezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[80, nanitHaufen]], [1, cadmiumAntriebBRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[120, nanitHaufen]], [1, effizienteDuesenBRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[85, nanitHaufen]], [1, ablativePanzerungCRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[75, nanitHaufen]], [1, nichtlineareOptikCRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[150, nanitHaufen]], [1, phasenStrahlerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[150, nanitHaufen]], [1, positronenWerferRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[150, nanitHaufen]], [1, infraMesserBeschleunigerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[150, nanitHaufen]], [1, zyklotronBallisteRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[120, nanitHaufen]], [1, emerilAntriebARezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[460, nanitHaufen]], [1, startSystemLadeGeraetSRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[50, nanitHaufen]], [1, grosseRaketenRohreBRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[120, nanitHaufen]], [1, fourierBegrenzerBRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[120, nanitHaufen]], [1, fragmentSuperAufladerBRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[120, nanitHaufen]], [1, nichtlineareOptikBRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[120, nanitHaufen]], [1, dysonPumpeBRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[200, nanitHaufen]], [1, indiumAntriebSRezept], 0 ).

/* ------------------------------- Anzugmodule -------------------------- */
rezept(rezeptInAnomalieErwerben, [[80, nanitHaufen]], [1, gefahrGutSchutzHandschuhRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[360, nanitHaufen]], [1, persoenlicheRaffinerieRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[90, nanitHaufen]], [1, einfacherUeberSetzerBRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[160, nanitHaufen]], [1, kuehlMittelNetzwerkCRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[160, nanitHaufen]], [1, waermeSchichtCRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[160, nanitHaufen]], [1, toxinDaempferCRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[160, nanitHaufen]], [1, strahlungsDeflektorCRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[120, nanitHaufen]], [1, belueftungsMembranBRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[120, nanitHaufen]], [1, schildGitterBRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[240, nanitHaufen]], [1, sauerStoffUmleiterARezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[90, nanitHaufen]], [1, neuralStimulatorBRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[460, nanitHaufen]], [1, luftSchubAntriebSRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[200, nanitHaufen]], [1, raketenStiefelARezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[350, nanitHaufen]], [1, effizienteWasserDuesenARezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[310, nanitHaufen]], [1, verbesserterUebersetzerARezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[580, nanitHaufen]], [1, perfektionierterUebersetzerSRezept], 0 ).

/* ------------------------------- Multiwerkzeugmodule ------------------ */
rezept(rezeptInAnomalieErwerben, [[80, nanitHaufen]], [1, eigenesKraftFeldRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[120, nanitHaufen]], [1, wellenFormWiederVerwerterBRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[90, nanitHaufen]], [1, laufIonisatorCRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[150, nanitHaufen]], [1, plasmaWerferRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[250, nanitHaufen]], [1, glutSpeerRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[250, nanitHaufen]], [1, streuBlasterRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[250, nanitHaufen]], [1, impulsWerferRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[80, nanitHaufen]], [1, kampfVisierRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[460, nanitHaufen]], [1, optischerBohrerSRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[320, nanitHaufen]], [1, untersuchungsGeraetARezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[150, nanitHaufen]], [1, geologieKanoneRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[180, nanitHaufen]], [1, masseBeschleunigerCRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[180, nanitHaufen]], [1, geschossSchmiererCRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[180, nanitHaufen]], [1, verstaerkteKartuschenCRezept], 0 ).

/* ------------------------------- Exofahrzeugmodule -------------------- */
rezept(rezeptInAnomalieErwerben, [[120, nanitHaufen]], [1, exoFahrzeugSignalBoosterRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[180, nanitHaufen]], [1, exoFahrzeugBeschleunigungsModulRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[180, nanitHaufen]], [1, exoFahrzeugMinenLaserRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[350, nanitHaufen]], [1, osmotischerGeneratorCRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[10, nanitHaufen]], [1, hochleistungsSonarRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[450, nanitHaufen]], [1, tethysStrahlRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[250, nanitHaufen]], [1, nautilonKanoneRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[210, nanitHaufen]], [1, exoFahrzeugSignalBoosterUpgradeSigmaBRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[210, nanitHaufen]], [1, exoFahrzeugMinenLaserUpgradeSigmaARezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[210, nanitHaufen]], [1, exoFahrzeugBordKanoneRezept], 0 ).
rezept(rezeptInAnomalieErwerben, [[320, nanitHaufen]], [1, exoFahrzeugSignalBoosterUpgradeTauARezept], 0 ).

/* ------------------------------- Quecksiberrezepte -------------------- 
rezept(rezeptInAnomalieErwerben, [[-1, queckSilber]], [1, feuerWerkGruenRezept], 0 ).
*/

/* =====================  Raumstation ================================================ */
/* ------------------------------- Multiwerkzeug ------------------------ */
rezept(modulInRaumstationErwerben, [[70, nanitHaufen]], [1, bergBauStrahlModulC], 0 ).
rezept(modulInRaumstationErwerben, [[70, nanitHaufen]], [1, blitzWerferModulC], 0 ).
rezept(modulInRaumstationErwerben, [[380, nanitHaufen]], [1, blitzWerferModulA], 0 ).
rezept(modulInRaumstationErwerben, [[580, nanitHaufen]], [1, blitzWerferModulS], 0 ).
rezept(modulInRaumstationErwerben, [[70, nanitHaufen]], [1, geologieKanonenModulC], 0 ).
rezept(modulInRaumstationErwerben, [[172, nanitHaufen]], [1, geologieKanonenModulB], 0 ).
rezept(modulInRaumstationErwerben, [[596, nanitHaufen]], [1, geologieKanonenModulS], 0 ).
rezept(modulInRaumstationErwerben, [[70, nanitHaufen]], [1, glutSpeerModulC], 0 ).
rezept(modulInRaumstationErwerben, [[369, nanitHaufen]], [1, glutSpeerModulA], 0 ).
rezept(modulInRaumstationErwerben, [[560, nanitHaufen]], [1, glutSpeerModulS], 0 ).
rezept(modulInRaumstationErwerben, [[360, nanitHaufen]], [1, impulsWerferModulA], 0 ).
rezept(modulInRaumstationErwerben, [[70, nanitHaufen]], [1, impulsWerferModulC], 0 ).
rezept(modulInRaumstationErwerben, [[164, nanitHaufen]], [1, impulsWerferModulB], 0 ).
rezept(modulInRaumstationErwerben, [[70, nanitHaufen]], [1, minenLaserModulC], 0 ).
rezept(modulInRaumstationErwerben, [[586, nanitHaufen]], [1, minenLaserModulS], 0 ).
rezept(modulInRaumstationErwerben, [[70, nanitHaufen]], [1, plasmaWerferModulC], 0 ).
rezept(modulInRaumstationErwerben, [[172, nanitHaufen]], [1, plasmaWerferModulB], 0 ).
rezept(modulInRaumstationErwerben, [[582, nanitHaufen]], [1, plasmaWerferModulS], 0 ).
rezept(modulInRaumstationErwerben, [[70, nanitHaufen]], [1, scannerModulC], 0 ).
rezept(modulInRaumstationErwerben, [[250, nanitHaufen]], [1, scannerModulA], 0 ).
rezept(modulInRaumstationErwerben, [[557, nanitHaufen]], [1, scannerModulS], 0 ).
rezept(modulInRaumstationErwerben, [[70, nanitHaufen]], [1, streuBlasterModulC], 0 ).
rezept(modulInRaumstationErwerben, [[160, nanitHaufen]], [1, streuBlasterModulB], 0 ).

/* ------------------------------- Raumschiffmodule --------------------- */
rezept(modulInRaumstationErwerben, [[72, nanitHaufen]], [1, hyperAntriebModulC], 0 ).
rezept(modulInRaumstationErwerben, [[71, nanitHaufen]], [1, impulsAntriebModulC], 0 ).
rezept(modulInRaumstationErwerben, [[596, nanitHaufen]], [1, impulsAntriebModulS], 0 ).
rezept(modulInRaumstationErwerben, [[72, nanitHaufen]], [1, infraMesserModulC], 0 ).
rezept(modulInRaumstationErwerben, [[552, nanitHaufen]], [1, infraMesserModulS], 0 ).
rezept(modulInRaumstationErwerben, [[70, nanitHaufen]], [1, photonenKanonenModulC], 0 ).
rezept(modulInRaumstationErwerben, [[173, nanitHaufen]], [1, photonenKanonenModulB], 0 ).
rezept(modulInRaumstationErwerben, [[70, nanitHaufen]], [1, photonenKanonenModulS], 0 ).
rezept(modulInRaumstationErwerben, [[73, nanitHaufen]], [1, phasenStrahlerModulC], 0 ).
rezept(modulInRaumstationErwerben, [[414, nanitHaufen]], [1, phasenStrahlerModulS], 0 ).
rezept(modulInRaumstationErwerben, [[72, nanitHaufen]], [1, positronModulC], 0 ).
rezept(modulInRaumstationErwerben, [[172, nanitHaufen]], [1, positronModulB], 0 ).
rezept(modulInRaumstationErwerben, [[575, nanitHaufen]], [1, positronModulS], 0 ).
rezept(modulInRaumstationErwerben, [[67, nanitHaufen]], [1, raumSchiffSchildModulC], 0 ).
rezept(modulInRaumstationErwerben, [[167, nanitHaufen]], [1, raumSchiffSchildModulB], 0 ).
rezept(modulInRaumstationErwerben, [[69, nanitHaufen]], [1, zyklotronModulC], 0 ).
rezept(modulInRaumstationErwerben, [[170, nanitHaufen]], [1, zyklotronModulB], 0 ).
rezept(modulInRaumstationErwerben, [[562, nanitHaufen]], [1, zyklotronModulS], 0 ).

/* ------------------------------- Anzugmodule -------------------------- */
rezept(modulInRaumstationErwerben, [[72, nanitHaufen]], [1, bewegungsModulC], 0 ).
rezept(modulInRaumstationErwerben, [[568, nanitHaufen]], [1, bewegungsModulS], 0 ).
rezept(modulInRaumstationErwerben, [[174, nanitHaufen]], [1, giftSchutzModulB], 0 ).
rezept(modulInRaumstationErwerben, [[359, nanitHaufen]], [1, giftSchutzModulA], 0 ).
rezept(modulInRaumstationErwerben, [[161, nanitHaufen]], [1, lebensErhaltungsModulB], 0 ).
rezept(modulInRaumstationErwerben, [[363, nanitHaufen]], [1, lebensErhaltungsModulA], 0 ).
rezept(modulInRaumstationErwerben, [[588, nanitHaufen]], [1, lebensErhaltungsModulS], 0 ).
rezept(modulInRaumstationErwerben, [[67, nanitHaufen]], [1, schildModulC], 0 ).
rezept(modulInRaumstationErwerben, [[350, nanitHaufen]], [1, schildModulA], 0 ).
rezept(modulInRaumstationErwerben, [[164, nanitHaufen]], [1, strahlungsSchutzModulB], 0 ).
rezept(modulInRaumstationErwerben, [[355, nanitHaufen]], [1, strahlungsSchutzModulA], 0 ).
rezept(modulInRaumstationErwerben, [[572, nanitHaufen]], [1, strahlungsSchutzModulS], 0 ).
rezept(modulInRaumstationErwerben, [[169, nanitHaufen]], [1, waermeSchutzModulKaelteB], 0 ).
rezept(modulInRaumstationErwerben, [[174, nanitHaufen]], [1, waermeSchutzModulB], 0 ).
rezept(modulInRaumstationErwerben, [[364, nanitHaufen]], [1, waermeSchutzModulA], 0 ).
rezept(modulInRaumstationErwerben, [[173, nanitHaufen]], [1, unterWasserSchutzModulB], 0 ).

/* ------------------------------- ExoFahrzeugmodule -------------------- */
rezept(modulInRaumstationErwerben, [[60, nanitHaufen]], [1, exoFahrzeugKanonenModulC], 0 ).
rezept(modulInRaumstationErwerben, [[140, nanitHaufen]], [1, exoFahrzeugKanonenModulB], 0 ).
rezept(modulInRaumstationErwerben, [[480, nanitHaufen]], [1, exoFahrzeugKanonenModulS], 0 ).
rezept(modulInRaumstationErwerben, [[60, nanitHaufen]], [1, exoFahrzeugAntriebModulC], 0 ).
rezept(modulInRaumstationErwerben, [[60, nanitHaufen]], [1, exoFahrzeugLaserModulC], 0 ).
rezept(modulInRaumstationErwerben, [[300, nanitHaufen]], [1, exoFahrzeugLaserModulB], 0 ).
rezept(modulInRaumstationErwerben, [[480, nanitHaufen]], [1, exoFahrzeugLaserModulS], 0 ).
rezept(modulInRaumstationErwerben, [[60, nanitHaufen]], [1, exoFahrzeugBoostModulC], 0 ).
rezept(modulInRaumstationErwerben, [[60, nanitHaufen]], [1, humboldtAntriebsModulC], 0 ).
rezept(modulInRaumstationErwerben, [[60, nanitHaufen]], [1, nautilonKanonenModulC], 0 ).
rezept(modulInRaumstationErwerben, [[300, nanitHaufen]], [1, nautilonKanonenModulA], 0 ).
rezept(modulInRaumstationErwerben, [[480, nanitHaufen]], [1, exoFahrzeugBoostModulS], 0 ).
rezept(modulInRaumstationErwerben, [[480, nanitHaufen]], [1, humboldtAntriebsModulS], 0 ).
rezept(modulInRaumstationErwerben, [[140, nanitHaufen]], [1, exoFahrzeugBoostModulB], 0 ).
rezept(modulInRaumstationErwerben, [[480, nanitHaufen]], [1, exoFahrzeugAntriebModulS], 0 ).

/* ------------------------------- zerlegen -------------------------- */
rezept(zerlegen, [[1, goldKlumpen]], [48, gold], 0 ).
rezept(zerlegen, [[1, tritiumHyperCluster]], [144, tritium], 0 ).
rezept(zerlegen, [[1, kristallFragment]], [42, diWasserStoff], 0 ).
rezept(zerlegen, [[1, geode]], [46, ferritStaub], 0 ).
rezept(zerlegen, [[1, geode]], [72, reinesFerrit], 0 ).
rezept(zerlegen, [[1, geode]], [73, magnetisiertesFerrit], 0 ).
rezept(zerlegen, [[1, geode]], [3, seltenesMetallElement], 0 ).
rezept(zerlegen, [[1, geode]], [45, kobalt], 0 ).
rezept(zerlegen, [[1, geode]], [58, ionisiertesKobalt], 0 ).
rezept(zerlegen, [[1, geode]], [1, tetraKobalt], 0 ).
 
/* ------------------------------- synthetisieren -------------------- 
rezept(synthetisieren, [[300, queckSilber], [1, feuerWerkGruenRezept]], [1, feuerWerkGruen], 0 ).
*/

/* ---------------------  Test Pr�dikate --------------------------------------------- */
/* in rezepten m�ssen immer Wandelaktionen angegeben sein */
integritaetWandelAktion(Op, Produkt) :-
	rezept(Op, _, [_, Produkt], _),
	\+wandelAktion:wandelAktion(Op, _).

komponenteIstKeinStoff(FehlStoff) :-
	stoff:stoffInFunktionEingangsStoff(FehlStoff),
	\+stoff:stoff(_, FehlStoff, _).

produktIstKeinStoff(FehlStoff) :-
	stoff:stoffInFunktionErgebnisStoff(FehlStoff),
	\+stoff:stoff(_, FehlStoff, _).

raffinerieRezeptHatKeineFertigungsZeit(Stoff, Komponenten) :-
	rezept(raffinieren, Komponenten, [_, Stoff], 0).

nichtHerstellbar(Stoff) :-
	stoff:stoff(StoffArt, Stoff, _),
	StoffArt \= geste,
	\+sammlung:sammelbar(Stoff, _),
	\+rezept(_, _,[_,Stoff], _).

rezeptDoppelt(Operation, Komponenten, Produkt) :-
	rezept(Operation, Komponenten, Produkt, _),
	findall(Komps, (rezept(Operation,Komps, Produkt, _), Komps = Komponenten), Bag),
	length(Bag, Len),
	Len > 1. 
	
gleicheZutaten(VergleichKomponentenListe) :-
	findall(Komp, rezept(kochen ,Komp, _, _), KomponentenListen),
	length(KomponentenListen, Len), /* Zahl aller Rezepte */
	LenMinus1 is Len - 1,
	between(1, LenMinus1, SuchNo),
	nth1(SuchNo, KomponentenListen, SuchKomponentenListe),
	maplist(nth1(2), SuchKomponentenListe, SuchKomponenten),
	SuchNoPlus1 is SuchNo + 1,
	between(SuchNoPlus1, Len, VergleichNo),
	nth1(VergleichNo,  KomponentenListen, VergleichKomponentenListe),
	maplist(nth1(2), VergleichKomponentenListe, VergleichsKomponenten),
	permutation(SuchKomponenten, VergleichsKomponenten),
	!.
	
testAll(FehlOperation, FehlOpProdukt, 
			FehlKomponente,
			FehlProdukt,
			FertigungsZeitFehlStoff, FertigungsZeitFehlKomponenten) :-
	format('testRezepte Start~n'),
	\+rezept:integritaetWandelAktion(FehlOperation, FehlOpProdukt),
	format('Operationen ok~n'),
	\+rezept:komponenteIstKeinStoff(FehlKomponente),
	format('Komponenten ok~n'),
	\+rezept:produktIstKeinStoff(FehlProdukt),
	format('Produkte ok~n'),
	\+rezept:rezeptDoppelt(FehlOperation, FehlKomponente, FehlProdukt),
	format('keine Doppelten ok~n'),
	\+rezept:gleicheZutaten(FehlKomponente),
	format('keine gleichen Zutaten ok~n'),
	\+rezept:raffinerieRezeptHatKeineFertigungsZeit(FertigungsZeitFehlStoff,FertigungsZeitFehlKomponenten),
	format('Fertigungszeiten ok~n').
	