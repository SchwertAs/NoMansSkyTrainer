:- module(stoffKlasse, [stoffKlasse/5]).

/* ermöglichen, lernen, lagern, herstellen, installieren, bauen, zerlegen, bauenAusInventar, abreissen, raffinieren, kochen, kaufen, verkaufen, anziehen */
stoffKlasse(rohStoff, false, true, true, false). 
stoffKlasse(komponente, false, true, true, true). 
stoffKlasse(produkt, false, true, false, true ). 
stoffKlasse(pass, true, false, false, true). 
stoffKlasse(modul, false, false, false, true). 
stoffKlasse(basisBauEndStoff, false, false, false, false).
stoffKlasse(stoerung, false, false, false, false).
stoffKlasse(geste, false, false, false, false).
stoffKlasse(kleidung, false, false, false, false).
stoffKlasse(handelsWare, false, true, true, false).
stoffKlasse(kuriositaet, false, true, false, false). 
stoffKlasse(artefakt, false, true, false, false). 
stoffKlasse(bauRezept, true, false, false, false). 
stoffKlasse(rohUndKochStoff, false, true, true, false). 
stoffKlasse(produktUndKochStoff, false, true, true, true). 
stoffKlasse(kochStoff, false, true, false, false). 

/* stoffKlasse(<StoffKlasse>, <Wissen>, <Verkauf>, <Kauf>, <inInventarHerstellbar>).*/

stoffKlasse(kaufModul, false, false, true, false). 

stoffKlasse(anormaleMaterialien, false, true, false, false). 
stoffKlasse(gesammelteHandelsWare, false, true, false, false). 
stoffKlasse(relikt, false, true, false, false). 
stoffKlasse(konglomerat, false, true, false, false). 





