:- module(wandelAktion, [wandelAktion/2]).
   
/* mögliche Stoffwandelaktionen */
wandelAktion(bauen, nil).
wandelAktion(herstellen, ortSpieler).
wandelAktion(installieren, ortSpieler).
wandelAktion(kochen, ortNahrungsProzessor).
wandelAktion(raffinieren, nil).  /* sonderlocke mit Ortsauswahl */
wandelAktion(rezeptInAussenPostenErwerben, ortAussenPosten).
wandelAktion(rezeptAmForschungsComputerErwerben, ortForschungsTerminal).
wandelAktion(rezeptInAnomalieErwerben, ortAnomalie).
wandelAktion(modulInRaumstationErwerben, ortRaumStation).

