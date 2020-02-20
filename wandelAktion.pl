:- module(wandelAktion, [wandelAktion/2]).
   
/* m�gliche Stoffwandelaktionen */
wandelAktion(bauen, nil).
wandelAktion(herstellen, ortSpieler).
wandelAktion(installieren, ortSpieler).
wandelAktion(kochen, ortNahrungsProzessor).
wandelAktion(raffinieren, nil).  /* sonderlocke mit Ortsauswahl */
wandelAktion(ausAtmosphaerenAnlageFuerSauerStoffGewinnen, ortAthmosphaerenAnlageSauerStoff).
wandelAktion(ausAtmosphaerenAnlageFuerStickStoffGewinnen, ortAthmosphaerenAnlageStickStoff).
wandelAktion(rezeptInAussenPostenErwerben, ortAussenPosten).
wandelAktion(rezeptAmForschungsComputerErwerben, ortForschungsTerminal).
wandelAktion(rezeptInAnomalieErwerben, ortAnomalie).
wandelAktion(modulInRaumstationErwerben, ortRaumStation).
wandelAktion(zerlegen, ortSpieler).

