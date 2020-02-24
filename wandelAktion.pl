:- module(wandelAktion, [wandelAktion/2]).
   
/* mögliche Stoffwandelaktionen */
wandelAktion(bauen, nil).
wandelAktion(herstellen, ortSpieler).
wandelAktion(installieren, ortSpieler).
wandelAktion(kochen, ortNahrungsProzessor).
wandelAktion(raffinieren, nil).  /* sonderlocke mit Ortsauswahl */
wandelAktion(ausSauerStoffVearbeiterGewinnen, ortSauerStoffVearbeiter).
wandelAktion(ausAtmosphaerenAnlageGewinnen, ortAtmosphaerenAnlage).
wandelAktion(rezeptInAussenPostenErwerben, ortAussenPosten).
wandelAktion(rezeptAmForschungsComputerErwerben, ortForschungsTerminal).
wandelAktion(rezeptInAnomalieErwerben, ortAnomalie).
wandelAktion(rezeptInAnomalieErwerben, ortAnomalie).
wandelAktion(rezeptInFabrikErwerben, ortWald).
wandelAktion(rezeptInFrachterErwerben, ortFrachter).
wandelAktion(modulInRaumstationErwerben, ortRaumStation).
wandelAktion(zerlegen, ortSpieler).

