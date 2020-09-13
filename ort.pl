:- module(ort, [ort/1]).


ort(nil).
ort(ortHauptBasis).
ort(ortWald). 
ort(ortBasisTerminus).
ort(ortWeltRaum).
ort(ortAnomalie).
ort(ortRaumStation). 
ort(ortWasser).
ort(ortAussenPosten).
ort(ortHandelsStation).
ort(ortNahrungsProzessor).
ort(ortKleineRaffinerie).
ort(ortMittlereRaffinerie).
ort(ortGrosseRaffinerie).
ort(ortHandelsTerminal).
ort(ortForschungsTerminal).
ort(ortFrachter).
ort(ortSpieler).
ort(ortBasis).
ort(ortSauerStoffVerarbeiter).
ort(ortAtmosphaerenAnlage).
ort(ortBergbauEinheit).
ort(ortPlantage).

domaenenPruefungOrt(Ort) :-
	ort(Ort) -> true; throw(error(domain_error(ort, Ort), _)).

