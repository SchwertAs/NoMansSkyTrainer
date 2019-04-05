:- module(rezept, [rezept/4]).
/* TODO: Zeiten aufnehmen 
   Kostenfunktion mit Anreise, Abreise */

/* Komponenten, AusgabeBestand, Dauer
[[Anzahl, Stoff]], [Anzahl, Produkt], Dauer in 1/100 sec pro Ergebnis-Stück */

/* ---------------------  Raffinerie-Rezepte --------------------------------------- */
/* Eine Komponente */
rezept(raffinieren, [[1, diWasserStoffGelee]], [50, diWasserStoff], 3 ).
rezept(raffinieren, [[5, tritium]], [1, diWasserStoff], 90 ).
rezept(raffinieren, [[30, diWasserStoff]], [2, diWasserStoffGelee], 12000 ).
rezept(raffinieren, [[1, chlorGitter]], [150, chlor], 2 ).
rezept(raffinieren, [[2, salz]], [1, chlor], 90 ).
rezept(raffinieren, [[1, aktiviertesCadmium]], [2, chromatischesMetall], 28 ).
rezept(raffinieren, [[1, aktiviertesEmeril]], [3, chromatischesMetall], 15 ).
rezept(raffinieren, [[1, aktiviertesIndium]], [4, chromatischesMetall], 10 ).
rezept(raffinieren, [[1, aktiviertesKupfer]], [1, chromatischesMetall], 62 ).
rezept(raffinieren, [[1, cadmium]], [1, chromatischesMetall], 79 ).
rezept(raffinieren, [[2, emeril]], [3, chromatischesMetall], 14 ).
rezept(raffinieren, [[2, indium]], [4, chromatischesMetall], 7 ).
rezept(raffinieren, [[2, kupfer]], [1, chromatischesMetall], 93 ).
rezept(raffinieren, [[3, mordit]], [1, coprit], 64 ).
rezept(raffinieren, [[1, ammoniak]], [1, ferritStaub], 93 ).
rezept(raffinieren, [[1, dioxit]], [2, ferritStaub], 93 ).
rezept(raffinieren, [[1, paraffinium]], [1, ferritStaub], 93 ).
rezept(raffinieren, [[1, phosphor]], [1, ferritStaub], 93 ).
rezept(raffinieren, [[1, pyrit]], [1, ferritStaub], 93 ).
rezept(raffinieren, [[1, uran]], [1, ferritStaub], 93 ).
rezept(raffinieren, [[1, verrostetesMetall]], [2, ferritStaub], 84 ).
rezept(raffinieren, [[100, silber]], [1, glas], 6000 ).
rezept(raffinieren, [[1, grantine]], [125, gold], 3 ).
rezept(raffinieren, [[1, lebendePerle]], [100, gold], 1 ).
rezept(raffinieren, [[1, lemmium]], [125, gold], 3 ).
rezept(raffinieren, [[1, magnoGold]], [125, gold], 3 ).
rezept(raffinieren, [[2, kobalt]], [1, ionisiertesKobalt], 93 ).
rezept(raffinieren, [[1, tetraKobalt]], [150, ionisiertesKobalt], 2 ).
rezept(raffinieren, [[1, ionisiertesKobalt]], [2, kobalt], 16 ).
rezept(raffinieren, [[1, frostKristall]], [2, kohlenStoff], 15 ).
rezept(raffinieren, [[1, gammaWurzel]], [2, kohlenStoff], 18 ).
rezept(raffinieren, [[1, kaktusFleisch]], [2, kohlenStoff], 18 ).
rezept(raffinieren, [[1, pilzSchimmel]], [2, kohlenStoff], 18 ).
rezept(raffinieren, [[1, sauerStoff]], [1, kohlenStoff], 22 ).
rezept(raffinieren, [[1, sternenKnolle]], [2, kohlenStoff], 18 ).
rezept(raffinieren, [[1, solanium]], [2, kohlenStoff], 18 ).
rezept(raffinieren, [[1, zaeheFluessigkeiten]], [1, lebenderSchleim], 154 ).
rezept(raffinieren, [[2, reinesFerrit]], [1, magnetisiertesFerrit], 64 ).
rezept(raffinieren, [[3, coprit]], [2, mordit], 93 ).
rezept(raffinieren, [[5, platin]], [1, nanitHaufen], 64 ).
rezept(raffinieren, [[10, pugneum]], [1, nanitHaufen], 33 ).
rezept(raffinieren, [[5, unkontrollierbarerSchimmel]], [1, nanitHaufen], 15 ).
rezept(raffinieren, [[1, kuerbisKnolle]], [1, natrium], 63 ).
rezept(raffinieren, [[1, natriumNitrat]], [2, natrium], 32 ).
rezept(raffinieren, [[1, instabilesNatrium]], [150, natriumNitrat], 1 ).
rezept(raffinieren, [[1, kristallSulfid]], [50, natriumNitrat], 1 ).
rezept(raffinieren, [[2, natrium]], [1, natriumNitrat], 10 ).
rezept(raffinieren, [[1, iridesit]], [250, platin], 1 ).
rezept(raffinieren, [[1, geoDesit]], [250, platin], 1 ).
rezept(raffinieren, [[1, gold]], [1, pyrit], 62 ).
rezept(raffinieren, [[3, schwefelin]], [1, radon], 93 ).
rezept(raffinieren, [[1, ferritStaub]], [1, reinesFerrit], 32 ).
rezept(raffinieren, [[1, magnetisiertesFerrit]], [2, reinesFerrit], 24 ).
rezept(raffinieren, [[1, seltenesMetallElement]], [150, reinesFerrit], 2 ).
rezept(raffinieren, [[1, chlor]], [2, salz], 170 ).
rezept(raffinieren, [[1, kelpBeutel]], [1, sauerStoff], 62 ).
rezept(raffinieren, [[1, superOxidKristall]], [150, sauerStoff], 2 ).
rezept(raffinieren, [[3, stickStoff]], [1, schwefelin], 95 ).
rezept(raffinieren, [[1, aronium]], [250, silber], 1 ).
rezept(raffinieren, [[1, herox]], [250, silber], 1 ).
rezept(raffinieren, [[1, strassenKoeterBronze]], [250, silber], 1 ).
rezept(raffinieren, [[3, radon]], [1, stickStoff], 93 ).
rezept(raffinieren, [[1, lebenderSchleim]], [1, unkontrollierbarerSchimmel], 152 ).
rezept(raffinieren, [[2, kohlenStoff]], [1, verdichteterKohlenStoff], 48 ).
rezept(raffinieren, [[1, kohlenStoffKristall]], [150, verdichteterKohlenStoff], 2 ).
rezept(raffinieren, [[1, restSubstanz]], [1, zaeheFluessigkeiten], 154 ).


/* Zwei Komponenten */
rezept(raffinieren, [[2, pilzSchimmel], [1, salz]], [1, ammoniak], 93 ).
rezept(raffinieren, [[2, paraffinium], [1, ferritStaub]], [1, ammoniak], 93 ).
rezept(raffinieren, [[1, diWasserStoff], [1, stickStoff]], [1, ammoniak], 43 ).
rezept(raffinieren, [[1, chromatischesMetall], [1, cadmium]], [4, cadmium], 23 ).
rezept(raffinieren, [[2, sauerStoff], [2, salz]], [5, chlor], 20 ).
rezept(raffinieren, [[1, kelpBeutel], [1, salz]], [2, chlor], 47 ).
rezept(raffinieren, [[1, kelpBeutel], [1, pugneum]], [2, chlor], 48 ).
rezept(raffinieren, [[1, kelpBeutel], [1, sauerStoff]], [2, chlor], 48 ).
rezept(raffinieren, [[1, kelpBeutel], [1, chlor]], [2, chlor], 48 ).
rezept(raffinieren, [[2, sauerStoff], [1, chlor]], [6, chlor], 16 ).
rezept(raffinieren, [[50, chlor], [50, salz]], [1, chlorGitter], 12000 ).
rezept(raffinieren, [[1, reinesFerrit], [1, aktiviertesCadmium]], [4, chromatischesMetall], 24 ).
rezept(raffinieren, [[1, reinesFerrit], [1, aktiviertesEmeril]], [6, chromatischesMetall], 15 ).
rezept(raffinieren, [[1, reinesFerrit], [1, aktiviertesIndium]], [8, chromatischesMetall], 12 ).
rezept(raffinieren, [[1, reinesFerrit], [1, aktiviertesKupfer]], [2, chromatischesMetall], 48 ).
rezept(raffinieren, [[1, reinesFerrit], [1, indium]], [4, chromatischesMetall], 24 ).
rezept(raffinieren, [[1, reinesFerrit], [1, emeril]], [3, chromatischesMetall], 31 ).
rezept(raffinieren, [[1, reinesFerrit], [1, kupfer]], [1, chromatischesMetall], 94 ).
rezept(raffinieren, [[1, reinesFerrit], [1, cadmium]], [2, chromatischesMetall], 48 ).
rezept(raffinieren, [[1, stickStoff], [1, schwefelin]], [1, coprit], 62 ).
rezept(raffinieren, [[1, diWasserStoff], [1, tritium]], [1, deuterium], 63 ).
rezept(raffinieren, [[1, verdichteterKohlenStoff], [1, mordit]], [4, coprit], 24 ).
rezept(raffinieren, [[2, kohlenStoff], [1, mordit]], [3, coprit], 31 ).
rezept(raffinieren, [[1, coprit], [1, sauerStoff]], [3, coprit], 31 ).
rezept(raffinieren, [[2, frostKristall], [1, salz]], [1, dioxit], 91 ).
rezept(raffinieren, [[1, verdichteterKohlenStoff], [1, natriumNitrat]], [2, dioxit], 48 ).
rezept(raffinieren, [[1, kohlenStoff], [1, natriumNitrat]], [1, dioxit], 84 ).
rezept(raffinieren, [[2, ammoniak], [1, ferritStaub]], [1, dioxit], 90 ).
rezept(raffinieren, [[1, chromatischesMetall], [1, emeril]], [4, emeril], 24 ).
rezept(raffinieren, [[1, dioxit], [1, frostKristall]], [2, frostKristall], 48 ).
rezept(raffinieren, [[2, dioxit], [1, sauerStoff]], [1, frostKristall], 94 ).
rezept(raffinieren, [[2, uran], [1, sauerStoff]], [1, gammaWurzel], 92 ).
rezept(raffinieren, [[1, gammaWurzel], [1, uran]], [2, gammaWurzel], 48 ).
rezept(raffinieren, [[1, mordit], [1, pugneum]], [1, gold], 92 ).
rezept(raffinieren, [[1, coprit], [1, pugneum]], [2, gold], 47 ).
rezept(raffinieren, [[1, chromatischesMetall], [1, indium]], [4, indium], 23 ).
rezept(raffinieren, [[50, natriumNitrat], [50, natrium]], [1, instabilesNatrium], 12000 ).
rezept(raffinieren, [[1, kuerbisKnolle], [1, pugneum]], [2, ionisiertesKobalt], 48 ).
rezept(raffinieren, [[1, kuerbisKnolle], [1, sauerStoff]], [2, ionisiertesKobalt], 48 ).
rezept(raffinieren, [[2, sauerStoff], [1, ionisiertesKobalt]], [6, ionisiertesKobalt], 16 ).
rezept(raffinieren, [[1, kuerbisKnolle], [1, ionisiertesKobalt]], [2, ionisiertesKobalt], 48 ).
rezept(raffinieren, [[2, sauerStoff], [2, kobalt]], [5, ionisiertesKobalt], 20 ).
rezept(raffinieren, [[2, pyrit], [1, sauerStoff]], [1, kaktusFleisch], 94 ).
rezept(raffinieren, [[1, kaktusFleisch], [1, pyrit]], [2, kaktusFleisch], 48 ).
rezept(raffinieren, [[50, kohlenStoff], [50, verdichteterKohlenStoff]], [1, kohlenStoffKristall], 12000 ).
rezept(raffinieren, [[1, mordit], [2, natrium]], [1, kuerbisKnolle], 31 ).
rezept(raffinieren, [[1, mordit], [1, natriumNitrat]], [4, kuerbisKnolle], 24 ).
rezept(raffinieren, [[1, kupfer], [1, chromatischesMetall]], [4, kupfer], 94 ).
rezept(raffinieren, [[1, ferritStaub], [1, aktiviertesCadmium]], [4, magnetisiertesFerrit], 24 ).
rezept(raffinieren, [[1, ferritStaub], [1, aktiviertesEmeril]], [6, magnetisiertesFerrit], 16 ).
rezept(raffinieren, [[1, ferritStaub], [1, aktiviertesIndium]], [8, magnetisiertesFerrit], 12 ).
rezept(raffinieren, [[1, ferritStaub], [1, aktiviertesKupfer]], [2, magnetisiertesFerrit], 48 ).
rezept(raffinieren, [[2, reinesFerrit], [1, pugneum]], [3, magnetisiertesFerrit], 31 ).
rezept(raffinieren, [[1, platin], [1, sauerStoff]], [10, magnetisiertesFerrit], 9 ).
rezept(raffinieren, [[3, magnetisiertesFerrit], [1, pugneum]], [4, magnetisiertesFerrit], 24 ).
rezept(raffinieren, [[1, ferritStaub], [1, indium]], [4, magnetisiertesFerrit], 24 ).
rezept(raffinieren, [[1, ferritStaub], [1, emeril]], [3, magnetisiertesFerrit], 31 ).
rezept(raffinieren, [[1, ferritStaub], [1, kupfer]], [1, magnetisiertesFerrit], 92 ).
rezept(raffinieren, [[1, ferritStaub], [1, cadmium]], [2, magnetisiertesFerrit], 48 ).
rezept(raffinieren, [[1, verdichteterKohlenStoff], [1, pugneum]], [2, mordit], 48 ).
rezept(raffinieren, [[1, kohlenStoff], [1, pugneum]], [1, mordit], 92 ).
rezept(raffinieren, [[1, kohlenStoff], [1, kuerbisKnolle]], [2, natrium], 48 ).
rezept(raffinieren, [[1, natrium], [1, stickStoff]], [1, natriumNitrat], 92 ).
rezept(raffinieren, [[1, natrium], [1, verdichteterKohlenStoff]], [2, natriumNitrat], 48 ).
rezept(raffinieren, [[1, natrium], [1, kohlenStoff]], [1, natriumNitrat], 92 ).
rezept(raffinieren, [[1, natriumNitrat], [1, sauerStoff]], [2, natriumNitrat], 48 ).
rezept(raffinieren, [[1, natriumNitrat], [1, stickStoff]], [2, natriumNitrat], 48 ).
rezept(raffinieren, [[1, natrium], [1, pugneum]], [1, natriumNitrat], 92 ).
rezept(raffinieren, [[1, natrium], [1, sauerStoff]], [1, natriumNitrat], 92 ).
rezept(raffinieren, [[1, natrium], [1, coprit]], [2, natriumNitrat], 48 ).
rezept(raffinieren, [[1, natriumNitrat], [1, pugneum]], [3, natriumNitrat], 31 ).
rezept(raffinieren, [[1, natriumNitrat], [1, coprit]], [2, natriumNitrat], 48 ).
rezept(raffinieren, [[2, sternenKnolle], [1, salz]], [1, paraffinium], 92 ).
rezept(raffinieren, [[1, sauerStoff], [1, silber]], [2, paraffinium], 48 ).
rezept(raffinieren, [[2, pyrit], [1, ferritStaub]], [1, paraffinium], 92 ).
rezept(raffinieren, [[2, solanium], [1, salz]], [1, phosphor], 92 ).
rezept(raffinieren, [[2, dioxit], [1, ferritStaub]], [1, phosphor], 92 ).
rezept(raffinieren, [[1, ammoniak], [1, pilzSchimmel]], [2, pilzSchimmel], 48 ).
rezept(raffinieren, [[2, ammoniak], [1, sauerStoff]], [1, pilzSchimmel], 92 ).
rezept(raffinieren, [[1, gold], [1, silber]], [1, platin], 62 ).
rezept(raffinieren, [[2, uran], [1, ferritStaub]], [1, pyrit], 92 ).
rezept(raffinieren, [[1, sauerStoff], [1, gold]], [2, pyrit], 48 ).
rezept(raffinieren, [[2, kaktusFleisch], [1, salz]], [1, pyrit], 92 ).
rezept(raffinieren, [[1, schwefelin], [1, sauerStoff]], [1, radon], 92 ). 
rezept(raffinieren, [[2, ferritStaub], [1, pugneum]], [3, reinesFerrit], 31 ).
rezept(raffinieren, [[1, diWasserStoff], [1, sauerStoff]], [1, salz], 24 ).
rezept(raffinieren, [[1, kohlenStoff], [1, kelpBeutel]], [2, sauerStoff], 48 ).
rezept(raffinieren, [[1, sauerStoff], [1, stickStoff]], [1, schwefelin], 92 ).
rezept(raffinieren, [[50, sauerStoff], [25, magnetisiertesFerrit]], [1, seltenesMetallElement], 12000).
rezept(raffinieren, [[1, solanium], [1, phosphor]], [2, solanium], 48 ).
rezept(raffinieren, [[2, phosphor], [1, sauerStoff]], [1, solanium], 92 ).
rezept(raffinieren, [[1, diWasserStoff], [1, schwefelin]], [1, solanium], 42 ).
rezept(raffinieren, [[1, paraffinium], [1, sternenKnolle]], [2, sternenKnolle], 48 ).
rezept(raffinieren, [[2, paraffinium], [1, sauerStoff]], [1, sternenKnolle], 92 ).
rezept(raffinieren, [[1, radon], [1, sauerStoff]], [1, stickStoff], 92 ).
rezept(raffinieren, [[100, sauerStoff], [50, tritium]], [1, superOxidKristall], 20000 ).
rezept(raffinieren, [[50, kobalt], [50, ionisiertesKobalt]], [1, tetraKobalt], 12000 ).
rezept(raffinieren, [[1, radon], [1, diWasserStoff]], [1, uran], 43 ).
rezept(raffinieren, [[1, radon], [1, ferritStaub]], [1, uran], 92 ).
rezept(raffinieren, [[1, radon], [1, reinesFerrit]], [2, uran], 48 ).
rezept(raffinieren, [[1, radon], [1, magnetisiertesFerrit]], [3, uran], 31 ).
rezept(raffinieren, [[1, coprit], [1, mordit]], [2, verdichteterKohlenStoff], 48 ).
rezept(raffinieren, [[1, coprit], [1, verdichteterKohlenStoff]], [3, verdichteterKohlenStoff], 31 ).
rezept(raffinieren, [[2, kohlenStoff], [1, coprit]], [2, verdichteterKohlenStoff], 48 ).
rezept(raffinieren, [[2, sauerStoff], [1, verdichteterKohlenStoff]], [6, verdichteterKohlenStoff], 16 ).
rezept(raffinieren, [[2, kohlenStoff], [2, sauerStoff]], [5, verdichteterKohlenStoff], 18 ).
rezept(raffinieren, [[1, sauerStoff], [1, reinesFerrit]], [2, verrostetesMetall], 52 ).
rezept(raffinieren, [[1, sauerStoff], [1, ferritStaub]], [1, verrostetesMetall], 10 ).

/* Drei Komponenten */
rezept(raffinieren, [[60, kobalt], [30, paraffinium], [20, tritium]], [1, aronium], 9000 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, paraffinium], [20, tritium]], [1, aronium], 9000 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, paraffinium], [20, silber]], [1, aronium], 9000 ).
rezept(raffinieren, [[60, kobalt], [30, paraffinium], [20, silber]], [1, aronium], 9000 ).
rezept(raffinieren, [[60, kobalt], [30, paraffinium], [5, platin]], [1, aronium], 9000 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, paraffinium], [5, platin]], [1, aronium], 9000 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, paraffinium], [10, gold]], [1, aronium], 9000 ).
rezept(raffinieren, [[60, kobalt], [30, paraffinium], [10, gold]], [1, aronium], 9000 ).
rezept(raffinieren, [[100, radon], [10, verdichteterKohlenStoff], [5, chlor]], [1, angereicherterKohlenStoff], 9000 ).
rezept(raffinieren, [[100, radon], [10, verdichteterKohlenStoff], [10, salz]], [1, angereicherterKohlenStoff], 9000 ).
rezept(raffinieren, [[100, radon], [20, kohlenStoff], [10, salz]], [1, angereicherterKohlenStoff], 9000 ).
rezept(raffinieren, [[100, radon], [20, kohlenStoff], [5, chlor]], [1, angereicherterKohlenStoff], 9000 ).
rezept(raffinieren, [[100, radon], [20, kohlenStoff], [5, chlor]], [1, angereicherterKohlenStoff], 9000 ).
rezept(raffinieren, [[50, tritium], [40, salz], [40, chlor]], [1, chlorGitter], 20000 ).
rezept(raffinieren, [[1, gold], [1, silber], [1, indium]], [30, chromatischesMetall], 41 ).
rezept(raffinieren, [[1, gold], [1, silber], [1, emeril]], [20, chromatischesMetall], 61 ).
rezept(raffinieren, [[1, silber], [1, gold], [1, kupfer]], [5, chromatischesMetall], 242 ).
rezept(raffinieren, [[1, silber], [1, gold], [1, cadmium]], [10, chromatischesMetall], 123 ).
rezept(raffinieren, [[1, ferritStaub], [1, sauerStoff], [1, emeril]], [1, gold], 123 ).
rezept(raffinieren, [[60, kobalt], [30, dioxit], [20, tritium]], [1, grantine], 9000 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, dioxit], [20, tritium]], [1, grantine], 9000 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, dioxit], [20, silber]], [1, grantine], 9000 ).
rezept(raffinieren, [[60, kobalt], [30, dioxit], [20, silber]], [1, grantine], 9000 ).
rezept(raffinieren, [[60, kobalt], [30, dioxit], [5, platin]], [1, grantine], 9000 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, dioxit], [5, platin]], [1, grantine], 9000 ).
rezept(raffinieren, [[30, kobalt], [30, dioxit], [10, gold]], [1, grantine], 9000 ).
rezept(raffinieren, [[60, ionisiertesKobalt], [30, dioxit], [10, gold]], [1, grantine], 9000 ).
rezept(raffinieren, [[60, kobalt], [30, ammoniak], [20, tritium]], [1, herox], 9000 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, ammoniak], [20, tritium]], [1, herox], 9000 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, ammoniak], [20, silber]], [1, herox], 9000 ).
rezept(raffinieren, [[60, kobalt], [30, ammoniak], [20, silber]], [1, herox], 9000 ).
rezept(raffinieren, [[60, kobalt], [30, ammoniak], [5, platin]], [1, herox], 9000 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, ammoniak], [5, platin]], [1, herox], 9000 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, ammoniak], [10, gold]], [1, herox], 9000 ).
rezept(raffinieren, [[60, kobalt], [30, ammoniak], [10, gold]], [1, herox], 9000 ).
rezept(raffinieren, [[50, tritium], [40, natrium], [40, natriumNitrat]], [1, instabilesNatrium], 20000 ).
rezept(raffinieren, [[50, tritium], [40, kohlenStoff], [40, verdichteterKohlenStoff]], [1, kohlenStoffKristall], 20000 ).
rezept(raffinieren, [[120, ferritStaub], [30, uran], [20, tritium]], [1, lemmium], 9000 ).
rezept(raffinieren, [[60, reinesFerrit], [30, uran], [20, tritium]], [1, lemmium], 9000 ).
rezept(raffinieren, [[60, reinesFerrit], [30, uran], [20, silber]], [1, lemmium], 9000 ).
rezept(raffinieren, [[120, ferritStaub], [30, uran], [20, silber]], [1, lemmium], 9000 ).
rezept(raffinieren, [[120, ferritStaub], [30, uran], [5, platin]], [1, lemmium], 9000 ).
rezept(raffinieren, [[60, reinesFerrit], [30, uran], [5, platin]], [1, lemmium], 9000 ).
rezept(raffinieren, [[60, reinesFerrit], [30, uran], [10, gold]], [1, lemmium], 9000 ).
rezept(raffinieren, [[120, ferritStaub], [30, uran], [10, gold]], [1, lemmium], 9000 ).
rezept(raffinieren, [[60, kobalt], [30, phosphor], [20, tritium]], [1, magnoGold], 9000 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, phosphor], [20, tritium]], [1, magnoGold], 9000 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, phosphor], [20, silber]], [1, magnoGold], 9000 ).
rezept(raffinieren, [[60, kobalt], [30, phosphor], [20, silber]], [1, magnoGold], 9000 ).
rezept(raffinieren, [[60, kobalt], [30, phosphor], [5, platin]], [1, magnoGold], 9000 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, phosphor], [5, platin]], [1, magnoGold], 9000 ).
rezept(raffinieren, [[30, ionisiertesKobalt], [30, phosphor], [10, gold]], [1, magnoGold], 9000 ).
rezept(raffinieren, [[60, kobalt], [30, phosphor], [10, gold]], [1, magnoGold], 9000 ).
rezept(raffinieren, [[250, chromatischesMetall], [1, ferritStaub], [1, sauerStoff]], [10, platin], 121 ).
rezept(raffinieren, [[35, ferritStaub], [35, reinesFerrit], [35, magnetisiertesFerrit]], [1, seltenesMetallElement], 12000 ).
rezept(raffinieren, [[25, tritium], [20, sauerStoff], [20, magnetisiertesFerrit]], [1, seltenesMetallElement], 12000 ).
rezept(raffinieren, [[100, stickStoff], [10, verdichteterKohlenStoff], [5, chlor]], [1, stickStoffSalz], 2000 ).
rezept(raffinieren, [[100, stickStoff], [10, verdichteterKohlenStoff], [10, salz]], [1, stickStoffSalz], 2000 ).
rezept(raffinieren, [[100, stickStoff], [20, kohlenStoff], [10, salz]], [1, stickStoffSalz], 2000 ).
rezept(raffinieren, [[100, stickStoff], [20, kohlenStoff], [5, chlor]], [1, stickStoffSalz], 2000 ).
rezept(raffinieren, [[120, ferritStaub], [30, pyrit], [30, tritium]], [1, strassenKoeterBronze], 9000 ).
rezept(raffinieren, [[60, reinesFerrit], [30, pyrit], [20, tritium]], [1, strassenKoeterBronze], 9000 ).
rezept(raffinieren, [[60, reinesFerrit], [30, pyrit], [20, silber]], [1, strassenKoeterBronze], 9000 ).
rezept(raffinieren, [[120, ferritStaub], [30, pyrit], [20, silber]], [1, strassenKoeterBronze], 9000 ).
rezept(raffinieren, [[120, ferritStaub], [30, pyrit], [5, platin]], [1, strassenKoeterBronze], 9000 ).
rezept(raffinieren, [[60, reinesFerrit], [30, pyrit], [5, platin]], [1, strassenKoeterBronze], 9000 ).
rezept(raffinieren, [[60, reinesFerrit], [30, pyrit], [10, gold]], [1, strassenKoeterBronze], 9000 ).
rezept(raffinieren, [[120, ferritStaub], [30, pyrit], [10, gold]], [1, strassenKoeterBronze], 9000 ).
rezept(raffinieren, [[50, tritium], [40, sauerStoff], [40, uran]], [1, superOxidKristall], 20000 ).
rezept(raffinieren, [[100, schwefelin], [10, verdichteterKohlenStoff], [10, salz]], [1, thermischesKondensat], 9000 ).
rezept(raffinieren, [[100, schwefelin], [10, verdichteterKohlenStoff], [5, chlor]], [1, thermischesKondensat], 9000 ).
rezept(raffinieren, [[50, tritium], [40, kobalt], [40, ionisiertesKobalt]], [1, tetraKobalt], 20000 ).
rezept(raffinieren, [[100, schwefelin], [20, kohlenStoff], [5, chlor]], [1, thermischesKondensat], 9000 ).
rezept(raffinieren, [[100, schwefelin], [20, kohlenStoff], [10, salz]], [1, thermischesKondensat], 9000 ).
rezept(raffinieren, [[250, chromatischesMetall], [25, verdichteterKohlenStoff], [10, natrium]], [1, warpZelle], 60000 ).
rezept(raffinieren, [[250, chromatischesMetall], [25, verdichteterKohlenStoff], [5, natriumNitrat]], [1, warpZelle], 60000 ).
rezept(raffinieren, [[250, chromatischesMetall], [50, kohlenStoff], [5, natriumNitrat]], [1, warpZelle], 60000 ).


/* ---------------------  Fabik-Rezepte ------------------------------------------- */
rezept(herstellen, [[150, chlor]], [1, chlorGitter], 0 ).
rezept(herstellen, [[150, natriumNitrat]], [1, instabilesNatrium], 0 ).
rezept(herstellen, [[150, natriumNitrat]], [1, hermetischesSiegel], 0 ).
rezept(herstellen, [[50, ionisiertesKobalt]], [1, kobaltSpiegel], 0 ).
rezept(herstellen, [[150, verdichteterKohlenStoff]], [1, kohlenStoffKristall], 0 ).
rezept(herstellen, [[50, kohlenStoff]], [1, kohlenStoffNanoRohr], 0 ).
rezept(herstellen, [[150, reinesFerrit]], [1, seltenesMetallElement], 0 ).
rezept(herstellen, [[50, chlor]], [1, salzRefaktor], 0 ).
rezept(herstellen, [[150, sauerStoff]], [1, superOxidKristall], 0 ).


rezept(herstellen, [[50, paraffinium], [50, ionisiertesKobalt]], [1, aronium], 0 ).
rezept(herstellen, [[250, radon], [50, verdichteterKohlenStoff]], [1, angereicherterKohlenStoff], 0 ).
rezept(herstellen, [[1, organischerKatalysator], [1, stickStoffSalz]], [1, fusionsBeschleuniger], 0 ).
rezept(herstellen, [[1, natriumDiode], [50, gold]], [1, gedankenKontrollGeraet], 0 ).
rezept(herstellen, [[1, thermischesKondensat], [1, stickStoffSalz]], [1, halbLeiter], 0 ).
rezept(herstellen, [[1, angereicherterKohlenStoff], [1, stickStoffSalz]], [1, heissesEis], 0 ).
rezept(herstellen, [[50, ammoniak], [50, ionisiertesKobalt]], [1, herox], 0 ).
rezept(herstellen, [[1, sauerStoffFilter], [50, gold]], [1, holografischerAnalysator], 0).
rezept(herstellen, [[25, kobalt], [20, ferritStaub]], [1, ionenAkku], 0 ).
rezept(herstellen, [[1, lebendesGlas], [1, kryoPumpe]], [1, kryogenKammer], 0 ).
rezept(herstellen, [[1, heissesEis], [1, thermischesKondensat]], [1, kryoPumpe], 0 ).
rezept(herstellen, [[100, reinesFerrit], [50, uran]], [1, lemmium], 0 ).
rezept(herstellen, [[50, ionisiertesKobalt], [50, phosphor]], [1, magnoGold], 0 ).
rezept(herstellen, [[40, natriumNitrat], [40, ferritStaub]], [1, natriumDiode], 0 ).
rezept(herstellen, [[1, thermischesKondensat], [1, angereicherterKohlenStoff]], [1, organischerKatalysator], 0 ).
rezept(herstellen, [[1, schaltPlatte], [1, supraLeiter]], [1, quantumProzessor], 0 ).
rezept(herstellen, [[90, sauerStoff], [30, reinesFerrit]], [1, sauerStoffFilter], 0 ).
rezept(herstellen, [[1, kampfLaeuferGehirn], [50, gold]], [1, sprengDrohnen], 0 ).
rezept(herstellen, [[250, stickStoff], [50, verdichteterKohlenStoff]], [1, stickStoffSalz], 0 ).
rezept(herstellen, [[50, pyrit], [100, reinesFerrit]], [1, strassenKoeterBronze], 0 ).
rezept(herstellen, [[1, halbLeiter], [1, angereicherterKohlenStoff]], [1, supraLeiter], 0 ).
rezept(herstellen, [[1, fluessigSprengStoff], [1, fusionsBeschleuniger]], [1, tragbarerReaktor], 0 ).
rezept(herstellen, [[2, vierFachServo], [50, gold]], [1, treibStoffOxidant], 0 ).


rezept(herstellen, [[1, tragbarerReaktor], [1, quantumProzessor], [1, geoDesit]], [1, fusionsZuender], 0 ).
rezept(herstellen, [[1, strassenKoeterBronze], [1, herox], [1, lemmium]], [1, geoDesit], 0 ).
rezept(herstellen, [[1, aronium], [1, magnoGold], [1, grantine]], [1, iridesit], 0 ).
rezept(herstellen, [[1, quantumProzessor], [1, kryogenKammer], [1, iridesit]], [1, staseGeraet], 0 ).


/* ---------------------  Anzug-Bau-Rezepte --------------------------------------- */

/* Eine Komponente */
rezept(herstellen, [[40, diWasserStoff]], [1, diWasserStoffGelee], 0).
rezept(herstellen, [[100, chromatischesMetall]], [1, gefangeneNanode], 0 ).
rezept(herstellen, [[50, frostKristall]], [1, glas], 0).
rezept(herstellen, [[30, verdichteterKohlenStoff]], [1, hermetischesSiegel], 0 ).
rezept(herstellen, [[200, kaktusFleisch]], [1, instabilesGel], 0 ).
rezept(herstellen, [[50, kohlenStoff]], [1, kohlenStoffNanoRohr], 0).
rezept(herstellen, [[50, ferritStaub]], [1, metallPlatten], 0).
rezept(herstellen, [[60, ferritStaub]], [1, projektilMunition], 0).
rezept(herstellen, [[150, ionisiertesKobalt]], [1, tetraKobalt], 0 ).

/* Zwei Komponenten */
rezept(herstellen, [[25, chromatischesMetall], [20, verdichteterKohlenStoff]], [1, antiMaterie], 0).
rezept(herstellen, [[30, sauerStoff], [50, ferritStaub]], [1, antiMaterieGehaeuse], 0).
rezept(herstellen, [[1, saeure], [1, instabilesGel]], [1, fluessigSprengStoff], 0).
rezept(herstellen, [[25, ionisiertesKobalt], [20, reinesFerrit]], [1, fortschrittlicherIonenAkku], 0).
rezept(herstellen, [[50, diWasserStoff], [50, tritium]], [1, fregattenTreibStoff50to], 0).
rezept(herstellen, [[100, diWasserStoff], [100, tritium]], [1, fregattenTreibStoff100to], 0).
rezept(herstellen, [[200, diWasserStoff], [200, tritium]], [1, fregattenTreibStoff200to], 0).
rezept(herstellen, [[100, frostKristall], [200, solanium]], [1, hitzeKondensator], 0).
rezept(herstellen, [[25, kobalt], [20, ferritStaub]], [1, ionenAkku], 0).
rezept(herstellen, [[1, schmierMittel], [5, glas]], [1, lebendesGlas], 0).
rezept(herstellen, [[1, diWasserStoffGelee], [20, kohlenStoff]], [1, lebensErhaltungsGel], 0).
rezept(herstellen, [[1, kohlenStoffNanoRohr], [40, chromatischesMetall]], [1, mikroProzessor], 0).
rezept(herstellen, [[100, tritium], [1, technologieModul]], [1, phasenStrahler], 0 ).
rezept(herstellen, [[100, kaktusFleisch], [200, sternenKnolle]], [1, polyFaser], 0 ).
rezept(herstellen, [[1, metallPlatten], [40, diWasserStoff]], [1, raumSchiffStartTreibStoff], 0).
rezept(herstellen, [[25, mordit], [600, pilzSchimmel]], [1, saeure], 0).
rezept(herstellen, [[25, sauerStoff], [20, ferritStaub]], [1, sauerStoffKapsel], 0).
rezept(herstellen, [[1, hitzeKondensator], [1, polyFaser]], [1, schaltPlatte], 0).
rezept(herstellen, [[50, coprit], [400, gammaWurzel]], [1, schmierMittel], 0).
rezept(herstellen, [[1, gefangeneNanode], [100, reinesFerrit]], [1, umhuellterSchatten], 0).
rezept(herstellen, [[1, antiMaterieGehaeuse], [1, antiMaterie]], [1, warpZelle], 0).



/* Drei Komponenten */
rezept(herstellen, [[10, reinesFerrit ], [10, natriumNitrat], [10, silber]], [1, fortschrittlicherIonenAkku], 0 ).
rezept(herstellen, [[40, salz], [40, zytoPhosphat], [40, kohlenStoff]], [1, hydrothermaleTreibStoffZelle], 0).
rezept(herstellen, [[1, herox], [1, strassenKoeterBronze], [1, lemmium]], [1, geoDesit], 0).

/* ---------------------  Siedlung-Bau-Rezepte --------------------------------------- */

/* Eine Komponente */
rezept(bauen, [[10, reinesFerrit]], [1, achtEckSchrank], 0 ).
rezept(bauen, [[10, reinesFerrit]], [1, arbeitsPlatte], 0 ).
rezept(bauen, [[10, ferritStaub]], [1, aussehenModifikator], 0 ).
rezept(bauen, [[50, reinesFerrit]], [1, basisBergungsKapsel], 0 ).
rezept(bauen, [[40, chromatischesMetall]], [1, basisComputer], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, betonBodenPlatte], 0 ).
rezept(bauen, [[40, ferritStaub]], [1, betonBogen], 0 ).
rezept(bauen, [[40, ferritStaub]], [1, betonDach], 0 ).
rezept(bauen, [[30, ferritStaub]], [1, betonDachEndStueck], 0 ).
rezept(bauen, [[25, ferritStaub]], [1, betonDachPlatte], 0 ).
rezept(bauen, [[40, ferritStaub]], [1, betonWand], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, betonTuer], 0 ).
rezept(bauen, [[40, ferritStaub]], [1, betonTuerRahmen], 0 ).
rezept(bauen, [[10, verdichteterKohlenStoff]], [1, bett], 0 ).
rezept(bauen, [[40, coprit]], [1, copritBlume], 0 ).
rezept(bauen, [[20, kohlenStoff]], [1, dekor], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, duenneBetonWand], 0 ).
rezept(bauen, [[20, kohlenStoff]], [1, duenneMetallWand], 0 ).
rezept(bauen, [[10, verdichteterKohlenStoff]], [1, eckSofa], 0 ).
rezept(bauen, [[10, verdichteterKohlenStoff]], [1, einfacherSchreibTisch], 0 ).
rezept(bauen, [[10, verdichteterKohlenStoff]], [1, ergonomischesSofa], 0 ).
rezept(bauen, [[5, natrium]], [1, farbigeLeuchtGruen], 0 ).
rezept(bauen, [[5, natrium]], [1, farbigeLeuchteRot], 0 ).
rezept(bauen, [[5, natrium]], [1, farbigeLeuchteWeiss], 0 ).
rezept(bauen, [[15, kohlenStoff]], [1, floraBehaelter], 0 ).
rezept(bauen, [[100, reinesFerrit]], [1, gebogenerKorridor], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, gebogenesRohr], 0 ).
rezept(bauen, [[100, reinesFerrit]], [1, geraderKorridor], 0 ).
rezept(bauen, [[100, reinesFerrit]], [1, gewoelbteWuerfelFoermigeWand], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, glasPlatteMitBetonRahmen], 0 ).
rezept(bauen, [[20, kohlenStoff]], [1, glasPlatteMitHolzRahmen], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, glasPlatteMitMetallRahmen], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, grosserKeil], 0 ).
rezept(bauen, [[1, glas]], [1, grossesGlasPaneel], 0 ).
rezept(bauen, [[10, reinesFerrit]], [1, gruenerWandBildSchirm], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, halberBetonBogen], 0 ).
rezept(bauen, [[20, kohlenStoff]], [1, halberHolzBogen], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, halberMetallBogen], 0 ).
rezept(bauen, [[10, verdichteterKohlenStoff]], [1, hoherSchrank], 0 ).
rezept(bauen, [[40, kohlenStoff]], [1, holzBodenPlatte], 0 ).
rezept(bauen, [[40, kohlenStoff]], [1, holzTuerRahmen], 0 ).
rezept(bauen, [[40, kohlenStoff]], [1, holzWand], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, infraStrukturLeiter], 0 ).
rezept(bauen, [[10, verdichteterKohlenStoff]], [1, kanisterRegal], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, kleineBetonBodenPlatte], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, kleineBetonWand], 0 ).
rezept(bauen, [[20, kohlenStoff]], [1, kleineHolzPlatte], 0 ).
rezept(bauen, [[20, kohlenStoff]], [1, kleineHolzWand], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, kleineMetallWand], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, kleineMetallPlatte], 0 ).
rezept(bauen, [[10, reinesFerrit]], [1, kleineKiste], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, kleinerKeil], 0 ).
rezept(bauen, [[20, reinesFerrit]], [1, kommunikationsStation], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, kugel], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, kurzeBetonWand], 0 ).
rezept(bauen, [[20, kohlenStoff]], [1, kurzeHolzWand], 0 ).
rezept(bauen, [[20, kohlenStoff]], [1, kurzeMetallWand], 0 ).
rezept(bauen, [[10, natrium]], [1, laborLampe], 0 ).
rezept(bauen, [[10, reinesFerrit]], [1, lagerBehaelter1], 0 ).
rezept(bauen, [[10, reinesFerrit]], [1, lagerModulDeko], 0 ).
rezept(bauen, [[30, reinesFerrit]], [1, leiter], 0 ).
rezept(bauen, [[100, reinesFerrit]], [1, lFoermigerKorridor], 0 ).
rezept(bauen, [[5, natrium]], [1, licht], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, metallBodenPlatte], 0 ).
rezept(bauen, [[40, ferritStaub]], [1, metallBogen], 0 ).
rezept(bauen, [[20, kohlenStoff]], [1, metallTuer], 0 ).
rezept(bauen, [[40, ferritStaub]], [1, metallWand], 0 ).
rezept(bauen, [[40, mordit]], [1, morditWurzel], 0 ).
rezept(bauen, [[10, reinesFerrit]], [1, orangeFarbenerWandBildSchirm], 0 ).
rezept(bauen, [[10, reinesFerrit]], [1, oszilloskop], 0 ).
rezept(bauen, [[5, reinesFerrit]], [1, pflasterung1], 0 ).
rezept(bauen, [[5, reinesFerrit]], [1, pflasterung2], 0 ).
rezept(bauen, [[25, reinesFerrit]], [1, pflasterung3], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, pyramide], 0 ).
rezept(bauen, [[350, reinesFerrit]], [1, quadratischerRaum], 0 ).
rezept(bauen, [[350, reinesFerrit]], [1, quadratischeTiefSeeKammer], 0 ).
rezept(bauen, [[10, reinesFerrit]], [1, regalModul], 0 ).
rezept(bauen, [[5, metallPlatten]], [1, rennHindernis], 0 ).
rezept(bauen, [[10, reinesFerrit]], [1, roboterArm], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, rohr], 0 ).
rezept(bauen, [[10, reinesFerrit]], [1, schliessFach], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, schraegeBetonPlatte], 0 ).
rezept(bauen, [[20, kohlenStoff]], [1, schraegeHolzPlatte], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, schraegeMetallPlatte], 0 ).
rezept(bauen, [[10, reinesFerrit]], [1, schubLadenSchrank], 0 ).
rezept(bauen, [[10, verdichteterKohlenStoff]], [1, sofa], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, stabilerWuerfel], 0 ).
rezept(bauen, [[10, verdichteterKohlenStoff]], [1, stuhl1], 0 ).
rezept(bauen, [[10, verdichteterKohlenStoff]], [1, stuhl2], 0 ).
rezept(bauen, [[10, verdichteterKohlenStoff]], [1, stuhl3], 0 ).
rezept(bauen, [[10, verdichteterKohlenStoff]], [1, tisch1], 0 ).
rezept(bauen, [[10, verdichteterKohlenStoff]], [1, tisch2], 0 ).
rezept(bauen, [[100, reinesFerrit]], [1, tFoermigerKorridor], 0 ).
rezept(bauen, [[350, reinesFerrit]], [1, tiefSeeKammer], 0 ).
rezept(bauen, [[10, kohlenStoff]], [1, topfPflanze], 0 ).
rezept(bauen, [[50, reinesFerrit]], [1, tuer], 0 ).
rezept(bauen, [[10, reinesFerrit]], [1, verschlosseneKiste], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, wuerfel], 0 ).
rezept(bauen, [[50, reinesFerrit]], [1, wuerfelFoermigeInnenTuer], 0 ).
rezept(bauen, [[80, reinesFerrit]], [1, wuerfelFoermigerDachAufsatz], 0 ).
rezept(bauen, [[200, reinesFerrit]], [1, wuerfelFoermigerRaum], 0 ).
rezept(bauen, [[80, reinesFerrit]], [1, wuerfelFoermigerRaumBoden], 0 ).
rezept(bauen, [[80, reinesFerrit]], [1, wuerfelFoermigerRaumRahmen], 0 ).
rezept(bauen, [[80, reinesFerrit]], [1, wuerfelRaumFundamentStrebe], 0 ).
rezept(bauen, [[80, reinesFerrit]], [1, wuerfelRaumViererFundametStrebe], 0 ).
rezept(bauen, [[100, reinesFerrit]], [1, xFoermigerKorridor], 0 ).
rezept(bauen, [[20, ferritStaub]], [1, zylinder], 0 ).
rezept(bauen, [[350, reinesFerrit]], [1, zylindrischerRaum], 0 ).
rezept(bauen, [[200, reinesFerrit]], [1, zylindrischerRaumRahmen], 0 ).


/* Zwei Komponenten */
rezept(bauen, [[10, magnetisiertesFerrit], [3, glas]], [1, aussichtsKugel], 0).
rezept(bauen, [[50, ionisiertesKobalt], [1, ionenAkku]], [1, basisTelePorterModul], 0).
rezept(bauen, [[20, magnetisiertesFerrit], [1, kohlenStoffNanoRohr]], [1, bauplanAnalysator], 0).
rezept(bauen, [[40, ferritStaub], [10, reinesFerrit]], [1, betonFassade], 0).
rezept(bauen, [[40, ferritStaub], [1, glas]], [1, betonFenster], 0).
rezept(bauen, [[50, ferritStaub], [10, reinesFerrit]], [1, betonRampe], 0).
rezept(bauen, [[25, magnetisiertesFerrit], [5, glas]], [1, bioKuppelRaum], 0).
rezept(bauen, [[5, reinesFerrit], [5, kohlenStoff]], [1, bodenMatte], 0).
rezept(bauen, [[4, reinesFerrit], [5, kobalt]], [1, deckenLeuchte], 0).
rezept(bauen, [[5, reinesFerrit], [5, kobalt]], [1, deckenPaneel], 0).
rezept(bauen, [[50, kaktusFleisch], [25, pyrit]], [1, echinoKaktus], 0).
rezept(bauen, [[60, indium], [20, paraffinium]], [1, eiweissPerlenKugel], 0).
rezept(bauen, [[50, pugneum], [100, kupfer]], [1, exoFahrzeugBordKanone], 0).
rezept(bauen, [[50, pugneum], [100, kupfer]], [1, exoFahrzeugBordKanonenUpgrade], 0).
rezept(bauen, [[50, chromatischesMetall], [50, pugneum]], [1, exoFahrzeugMinenLaserUpgrade], 0).
rezept(bauen, [[50, chromatischesMetall], [1, mikroProzessor]], [1, exoFahrzeugSignalBooster], 0).
rezept(bauen, [[40, chromatischesMetall], [25, diWasserStoff]], [1, exoFahrzeugTerminal], 0).
rezept(bauen, [[10, ionisiertesKobalt], [1, antiMaterie]], [1, fassFoermigerFabrikator], 0).
rezept(bauen, [[5, ionisiertesKobalt], [1, glas]], [1, fenster], 0).
rezept(bauen, [[10, ferritStaub], [10, natrium]], [1, flachesModul], 0).
rezept(bauen, [[5, reinesFerrit], [5, kohlenStoff]], [1, flagge], 0).
rezept(bauen, [[50, frostKristall], [25, dioxit]], [1, frostWurz], 0).
rezept(bauen, [[50, gammaWurzel], [25, uran]], [1, gammaGras], 0).
rezept(bauen, [[100, reinesFerrit], [1, glas]], [1, gewoelbtesWuerfelFoermigesDach], 0).
rezept(bauen, [[100, emeril], [100, ionisiertesKobalt]], [1, giftIgel], 0).
rezept(bauen, [[10, verdichteterKohlenStoff], [5, reinesFerrit]], [1, gewoelbterTisch], 0).
rezept(bauen, [[5, reinesFerrit], [5, verdichteterKohlenStoff]], [1, grosseMonitorStation], 0).
rezept(bauen, [[25, ferritStaub], [5, reinesFerrit]], [1, halbeBetonRampe], 0).
rezept(bauen, [[25, kohlenStoff], [5, reinesFerrit]], [1, halbeHolzRampe], 0).
rezept(bauen, [[25, ferritStaub], [5, reinesFerrit]], [1, halbeMetallRampe], 0).
rezept(bauen, [[40, ionisiertesKobalt], [40, reinesFerrit]], [1, holoTuer], 0).
rezept(bauen, [[40, kohlenStoff], [10, ferritStaub]], [1, holzDach], 0).
rezept(bauen, [[20, kohlenStoff], [10, ferritStaub]], [1, holzDachEndStueck], 0).
rezept(bauen, [[20, kohlenStoff], [10, ferritStaub]], [1, holzDachPlatte], 0).
rezept(bauen, [[40, kohlenStoff], [10, reinesFerrit]], [1, holzFassade], 0).
rezept(bauen, [[40, kohlenStoff], [1, glas]], [1, holzFenster], 0).
rezept(bauen, [[40, kohlenStoff], [10, reinesFerrit]], [1, holzRampe], 0).
rezept(bauen, [[50, reinesFerrit], [30, kohlenStoff]], [1, innenTreppen], 0).
rezept(bauen, [[10, ionisiertesKobalt], [1, antiMaterie]], [1, kistenFoermigerFabrikator], 0).
rezept(bauen, [[40, chromatischesMetall], [25, reinesFerrit]], [1, konstruktionsTerminal], 0).
rezept(bauen, [[100, reinesFerrit], [1, glas]], [1, korridorMitGlasDach], 0).
rezept(bauen, [[50, magnetisiertesFerrit], [20, natrium]], [1, lagerBehaelter], 0).
rezept(bauen, [[40, chromatischesMetall], [25, verdichteterKohlenStoff]], [1, landwirtschaftsTerminal], 0).
rezept(bauen, [[10, ferritStaub], [10, natrium]], [1, leichterTisch], 0).
rezept(bauen, [[20, ferritStaub], [10, ferritStaub]], [1, metallDach], 0).
rezept(bauen, [[20, kohlenStoff], [10, ferritStaub]], [1, metallDachEndStueck], 0).
rezept(bauen, [[20, kohlenStoff], [10, ferritStaub]], [1, metallDachPlatte], 0).
rezept(bauen, [[40, ferritStaub], [10, reinesFerrit]], [1, metallFassade], 0).
rezept(bauen, [[40, ferritStaub], [1, glas]], [1, metallFenster], 0).
rezept(bauen, [[50, ferritStaub], [10, reinesFerrit]], [1, metallRampe], 0).
rezept(bauen, [[100, magnetisiertesFerrit], [5, diWasserStoffGelee]], [1, mittlereRaffinerie], 0).
rezept(bauen, [[5, reinesFerrit], [5, kobalt]], [1, monitorStation], 0).
rezept(bauen, [[1, metallPlatten], [1, kohlenStoffNanoRohr]], [1, nachrichtenModul], 0).
rezept(bauen, [[50, pilzSchimmel], [25, ammoniak]], [1, pilzGeflecht], 0).
rezept(bauen, [[5, metallPlatten], [2, diWasserStoffGelee]], [1, rennKraftVerstaerker], 0).
rezept(bauen, [[10, ferritStaub], [10, natrium]], [1, seitenModul], 0).
rezept(bauen, [[10, reinesFerrit], [5, kobalt]], [1, server], 0).
rezept(bauen, [[50, solanium], [25, phosphor]], [1, sonnenRebe], 0).
rezept(bauen, [[2, metallPlatten], [1, diWasserStoffGelee]], [1, speicherPunkt], 0).
rezept(bauen, [[50, sternenKnolle], [25, paraffinium]], [1, sternenDorn], 0).
rezept(bauen, [[5, verdichteterKohlenStoff], [5, kobalt]], [1, techBedienFeld], 0).
rezept(bauen, [[25, magnetisiertesFerrit], [3, mikroProzessor]], [1, terminalDesGalaktischenMarktes], 0).
rezept(bauen, [[1, metallPlatten], [30, sauerStoff]], [1, tragbareRaffinerie], 0).
rezept(bauen, [[5, reinesFerrit], [5, kobalt]], [1, waffenRegal], 0).
rezept(bauen, [[40, chromatischesMetall], [25, pugneum]], [1, waffenTerminal], 0).
rezept(bauen, [[5, verdichteterKohlenStoff], [5, kobalt]], [1, wandBildSchirm], 0).
rezept(bauen, [[10, reinesFerrit], [5, kobalt]], [1, wandEinheit], 0).
rezept(bauen, [[5, reinesFerrit], [5, kohlenStoff]], [1, wandFlagge], 0).
rezept(bauen, [[5, verdichteterKohlenStoff], [5, kobalt]], [1, wandVentilator], 0).
rezept(bauen, [[25, ferritStaub], [1, kristallSulfid]], [1, wasserDichteTuer2], 0).
rezept(bauen, [[40, chromatischesMetall], [25, magnetisiertesFerrit]], [1, wissenschaftsTerminal], 0).
rezept(bauen, [[20, ionisiertesKobalt], [2, glas]], [1, wuerfelFoermigerGlasRaum], 0).
rezept(bauen, [[50, kohlenStoff], [50, reinesFerrit]], [1, zugangsRampe], 0).



/* Drei Komponenten */
rezept(bauen, [[5, ammoniak], [2, metallPlatten], [2, hermetischesSiegel]], [1, atmosphaerenVerarbeitungsAnlage], 0).
rezept(bauen, [[100, uran], [2, metallPlatten], [1, fortschrittlicherIonenAkku]], [1, autonomeBergBauEinheit], 0).
rezept(bauen, [[50, chromatischesMetall], [15, magnetisiertesFerrit], [2, kohlenStoffNanoRohr]], [1, exoFahrzeugBeschleunigungsModul], 0).
rezept(bauen, [[150, chromatischesMetall], [40, verdichteterKohlenStoff], [4, kohlenStoffNanoRohr]], [1, exoFahrzeugBeschleunigungsModulA], 0).
rezept(bauen, [[100, chromatischesMetall], [20, verdichteterKohlenStoff], [3, kohlenStoffNanoRohr]], [1, exoFahrzeugBeschleunigungsModulB], 0).
rezept(bauen, [[100, chromatischesMetall], [25, magnetisiertesFerrit], [2, sauerStoffKapsel]], [1, exoFahrzeugMinenLaser], 0).
rezept(bauen, [[100, chromatischesMetall], [2, ionenAkku], [2, mikroProzessor]], [1, exoFahrzeugSignalBoosterUpgrade], 0).
rezept(bauen, [[150, chromatischesMetall], [2, ionenAkku], [50, gold]], [1, exoFahrzeugSignalBoosterUpgradeA], 0).
rezept(bauen, [[120, silber], [40, gold], [10, tritium]], [1, flottenKommandoRaum], 0).
rezept(bauen, [[1, kohlenStoffNanoRohr], [1, hermetischesSiegel], [2, technologieModul]], [1, fortgeschrittenerMinenLaser], 0).
rezept(bauen, [[1, metallPlatten], [20, ionisiertesKobalt], [50, phosphor]], [1, gefahrenSchutzEinheit], 0).
rezept(bauen, [[1, metallPlatten], [20, ionisiertesKobalt], [50, uran]], [1, gesundheitsStation], 0).
rezept(bauen, [[1, glas], [2, kristallSulfid], [25, ferritStaub]], [1, glasTunnel], 0).
rezept(bauen, [[120, ionisiertesKobalt], [25, chromatischesMetall], [25, magnetisiertesFerrit]], [1, gravitinoWirt], 0).
rezept(bauen, [[60, reinesFerrit], [50, ionisiertesKobalt], [50, kohlenStoff]], [1, grosserHydroKulturTrog], 0).
rezept(bauen, [[200, chromatischesMetall], [100, natriumNitrat], [5, mikroProzessor]], [1, grosseRaffinerie], 0).
rezept(bauen, [[30, reinesFerrit], [20, ionisiertesKobalt], [20, kohlenStoff]], [1, hydroKulturTrog], 0).
rezept(bauen, [[100, paraffinium], [5, metallPlatten], [4, ionenAkku]], [1, kolossGeoBucht], 0).
rezept(bauen, [[10, metallPlatten], [2, ionenAkku], [2, mikroProzessor]], [1, landeFeld], 0).
rezept(bauen, [[1, glas], [2, kristallSulfid], [25, ferritStaub]], [1, lFoermigerGlasTunnel], 0).
rezept(bauen, [[5, lebendePerle], [1, glas], [29, ionisiertesKobalt]], [1, meeresUnterSchlupf], 0).
rezept(bauen, [[5, metallPlatten], [4, kristallSulfid], [100, salz]], [1, nautilonKammer], 0).
rezept(bauen, [[100, paraffinium], [4, metallPlatten], [4, ionenAkku]], [1, nomadenGeoBucht], 0).
rezept(bauen, [[5, metallPlatten], [4, ionenAkku], [100, paraffinium]], [1, roamerGeoBucht], 0).
rezept(bauen, [[5, metallPlatten], [5, sauerStoffKapsel], [3, diWasserStoffGelee]], [1, sauerStoffVerarbeiter], 0).
rezept(bauen, [[1, metallPlatten], [2, ionenAkku], [1, mikroProzessor]], [1, signal], 0).
rezept(bauen, [[1, metallPlatten], [1, kohlenStoffNanoRohr], [15, natrium]], [1, signalBooster], 0).
rezept(bauen, [[1, glas], [2, kristallSulfid], [25, ferritStaub]], [1, tFoermigerGlasTunnel], 0).
rezept(bauen, [[1, glas], [2, kristallSulfid], [25, ferritStaub]], [1, vertikalerGlasTunnel], 0).
rezept(bauen, [[350, reinesFerrit], [6, kristallSulfid], [2, lebendePerle]], [1, wasserDichteTuer1], 0).
rezept(bauen, [[1, glas], [2, kristallSulfid], [25, ferritStaub]], [1, xFoermigerGlasTunnel], 0).


/* ---------------------  Test Prädikate ----------------------------------------------- */
fehlerOperation(Op, Produkt) :-
	rezept(Op, _, [_, Produkt], _),
	\+memberchk(Op, [raffinieren, bauen, herstellen]). 

komponenteIstKeinStoff(FehlStoff) :-
	ausgangsStoff:stoffInFunktionEingangsStoff(FehlStoff),
	\+ausgangsStoff:stoff(FehlStoff, _).
	
produktIstKeinStoff(FehlStoff) :-
	ausgangsStoff:stoffInFunktionErgebnisStoff(FehlStoff),
	\+ausgangsStoff:stoff(FehlStoff, _).
	
raffinerieRezeptHatKeineFertigungsZeit(Stoff, Komponenten) :-
	rezept(raffinieren, Komponenten, [_, Stoff], 0).
	
nichtHerstellbar(Stoff) :-
	reaktionsStoff(Stoff,_),
	\+rezept(_, _,[_,Stoff], _).
	