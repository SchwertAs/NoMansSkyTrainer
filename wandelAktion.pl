:- module(wandelAktion, [wandelAktion/2]).
   
/* m�gliche Stoffwandelaktionen */
wandelAktion(bauen, ortHauptBasis).
wandelAktion(herstellen, ortSpieler).
wandelAktion(installieren, ortSpieler).
wandelAktion(kochen, ortNahrungsProzessor).
wandelAktion(raffinieren, ortNil).  /* sonderlocke mit Ortsauswahl */
wandelAktion(ausSauerStoffVearbeiterGewinnen, ortSauerStoffVerarbeiter).
wandelAktion(ausAtmosphaerenAnlageGewinnen, ortAtmosphaerenAnlage).
wandelAktion(rezeptInAussenPostenErwerben, ortAussenPosten).
wandelAktion(rezeptAmForschungsComputerErwerben, ortForschungsTerminal).
wandelAktion(rezeptInAnomalieErwerben, ortAnomalie).
wandelAktion(rezeptInAnomalieForschungsComputerErwerben, ortAnomalie).
wandelAktion(rezeptInFabrikErwerben, ortWald).
wandelAktion(rezeptInFrachterErwerben, ortFrachter).
wandelAktion(modulInRaumstationErwerben, ortRaumStation).
wandelAktion(zerlegen, ortSpieler).
wandelAktion(inEinfacherRaffinerieRaffinieren, ortNil).  /* sonderlocke mit Ortsauswahl */
