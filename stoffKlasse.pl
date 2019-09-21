:- module(stoffKlasse, [stoffKlasse/4]).

/* stoffKlasse(<StoffKlasse>, <Wissen>, <Verkauf>, <Kauf>).*/
stoffKlasse(rohStoff, false, true, true).
stoffKlasse(produkt, false, true, false ).
stoffKlasse(modul, false, true, false).
stoffKlasse(basisBauEndStoff, false, true, false).
stoffKlasse(handelsWare, false, true, true).
stoffKlasse(kuriositaet, false, true, false).
stoffKlasse(bauRezept, true, false, false).
stoffKlasse(rohUndKochStoff, false, true, false).
stoffKlasse(produktUndKochStoff, false, true, false).

stoffKlasse(komponente, false, true, true).
stoffKlasse(anormaleMaterialien, false, true, false).
stoffKlasse(relikt, false, true, false).
stoffKlasse(artefakt, false, true, false).
stoffKlasse(gesammelteHandelsWare, false, true, false).
stoffKlasse(konglomerat, false, true, false).
stoffKlasse(kochStoff, false, true, false).
