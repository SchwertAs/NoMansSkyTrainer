:- module(ort, [ort/1]).


ort(ortAnomalie).
ort(ortAtmosphaerenAnlage).
ort(ortAussenPosten).
ort(ortBasisTerminus).
ort(ortBergbauEinheit).
ort(ortForschungsTerminal).
ort(ortFrachter).
ort(ortGrosseRaffinerie).
ort(ortHandelsStation).
ort(ortHandelsTerminal).
ort(ortHauptBasis).
ort(ortKleineRaffinerie).
ort(ortMittlereRaffinerie).
ort(ortNahrungsProzessor).
ort(ortNil).
ort(ortPlantage).
ort(ortRaumStation). 
ort(ortSauerStoffVerarbeiter).
ort(ortSpieler).
ort(ortWald). 
ort(ortWasser).
ort(ortWeltRaum).

domaenenPruefungOrt(Ort) :-
	ort(Ort) -> true; throw(error(domain_error(ort, Ort), _)).

