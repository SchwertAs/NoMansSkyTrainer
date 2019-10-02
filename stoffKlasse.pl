:- module(stoffKlasse, [stoffKlasse/5]).

/* stoffKlasse(<StoffKlasse>, <Wissen>, <Verkauf>, <Kauf>, <inInventarHerstellbar>).*/
stoffKlasse(basisBauEndStoff, false, false, false, false).

stoffKlasse(modul, false, false, false, true). 
stoffKlasse(kaufModul, false, false, true, false). 

stoffKlasse(anormaleMaterialien, false, true, false, false). 
stoffKlasse(gesammelteHandelsWare, false, true, false, false). 
stoffKlasse(kuriositaet, false, true, false, false). 
stoffKlasse(relikt, false, true, false, false). 
stoffKlasse(artefakt, false, true, false, false). 
stoffKlasse(konglomerat, false, true, false, false). 
stoffKlasse(kochStoff, false, true, false, false). 

stoffKlasse(produkt, false, true, false, true ). 

stoffKlasse(rohStoff, false, true, true, false). 
stoffKlasse(handelsWare, false, true, true, false).
stoffKlasse(rohUndKochStoff, false, true, true, false). 
stoffKlasse(produktUndKochStoff, false, true, true, true). 
stoffKlasse(komponente, false, true, true, true). 

stoffKlasse(bauRezept, true, false, false, false). 
stoffKlasse(pass, true, false, false, true). 


