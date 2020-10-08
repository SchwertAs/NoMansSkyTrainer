:- module(stoffKlasse, [stoffKlasse/1]).

stoffKlasse(rohStoff).   			/* ist sammelbar */
stoffKlasse(komponente). 			/* nicht sammelbar, bestandteil von Rezept */
stoffKlasse(produkt).    			/* endstoff in Rezept */
stoffKlasse(pass).       			/* hergestellt Zugangskontrolle */
stoffKlasse(verbrauch).  			/* beschaffen und verbrauchen */
stoffKlasse(modul).      			/* istallieren */
stoffKlasse(basisBauEndStoff).		/* bauen */
stoffKlasse(stoerung).          	/* sammeln und aufstellen */
stoffKlasse(geste).             	/* beschaffen und benutzen */
stoffKlasse(kleidung).          	/* beschaffen und Aussehen modifizieren */
stoffKlasse(handelsWare).       	/* beschaffen und verkaufen */
stoffKlasse(kuriositaet).       	/* beschaffen und verschenken / bei historischen Gebäuden einsetzen */
stoffKlasse(bauRezept).         	/* beschaffen, Zutat zu Bau */
stoffKlasse(rohUndKochStoff).   	/* sammelbar, kochbar */
stoffKlasse(produktUndKochStoff).   /* herstellbar, kochbar */
stoffKlasse(kochStoff). 			/* kochbar, kochprodukt */
stoffKlasse(biomechanischesKonstrukt).

/* alles was keine Wandelaktion und keine Sammelart ist */
weitereAktion(verkaufen).
weitereAktion(amAussehenWandlerEinsetzen).
weitereAktion(lagern).
weitereAktion(installieren).
weitereAktion(verbrauchen).
weitereAktion(ausfuehren).
weitereAktion(aufstellen).
weitereAktion(durchgangsKontrolle).
weitereAktion(verschenken).

stoffKlassenAktion(rohStoff, verkaufen).
stoffKlassenAktion(komponente, verkaufen).
stoffKlassenAktion(produkt, verkaufen).
stoffKlassenAktion(verbrauch, verkaufen).
stoffKlassenAktion(stoerung, verkaufen).
stoffKlassenAktion(handelsWare, verkaufen).
stoffKlassenAktion(kuriositaet, verkaufen).
stoffKlassenAktion(rohUndKochStoff, verkaufen).
stoffKlassenAktion(produktUndKochStoff, verkaufen).
stoffKlassenAktion(kochStoff, verkaufen).
stoffKlassenAktion(kleidung, amAussehenWandlerEinsetzen).
stoffKlassenAktion(rohStoff, lagern).
stoffKlassenAktion(komponente, lagern).
stoffKlassenAktion(produkt, lagern).
stoffKlassenAktion(pass, lagern).
stoffKlassenAktion(verbrauch, lagern).
stoffKlassenAktion(stoerung, lagern).
stoffKlassenAktion(handelsWare, lagern).
stoffKlassenAktion(kuriositaet, lagern).
stoffKlassenAktion(rohUndKochStoff, lagern).
stoffKlassenAktion(produktUndKochStoff, lagern).
stoffKlassenAktion(kochStoff, lagern).
stoffKlassenAktion(modul, installieren).
stoffKlassenAktion(verbrauch, verbrauchen).
stoffKlassenAktion(geste, ausfuehren).
stoffKlassenAktion(basisBauEndStoff, aufstellen).
stoffKlassenAktion(stoerung, aufstellen).
stoffKlassenAktion(pass, durchgangsKontrolle).
stoffKlassenAktion(kuriositaet, verschenken).

testStoffKlassenUsed(NichtBenutzteStoffklassen) :-
	findall(Kl, stoff:stoff(Kl, _,_), Klassen), 
	sort(Klassen, KlassenSet), findall(Kli, 
	stoffKlasse:stoffKlasse(Kli), Klien), 
	sort(Klien, Kl2Set), 
	subtract(Kl2Set, KlassenSet, NichtBenutzteStoffklassen).


