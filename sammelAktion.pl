:- module(sammelAktion, [sammelAktion/1, sammelOrt/2, pruefeSammelAktionVorraussetzung/3]).

sammelAktion(bekannt).
sammelAktion(erkaempfen).
sammelAktion(ernten).
sammelAktion(ertauchen).
sammelAktion(exoFahrzeugMinenLaserNutzen).
sammelAktion(gemuetsStrahlNutzen).
sammelAktion(herausSchlagen).
sammelAktion(jagen).
sammelAktion(kaufen).
sammelAktion(minenLaserNutzen).
sammelAktion(pfluecken).
sammelAktion(raumSchuerfen).
sammelAktion(solarStrahlNutzen).
sammelAktion(terrainFormerNutzen).
sammelAktion(unterWasserErkaempfen).
sammelAktion(verbessertenMinenLaserNutzen).
sammelAktion(verdienen).
sammelAktion(vonBergbauEinheitGewinnen).
sammelAktion(vonTierErhalten).

sammelOrt(bekannt, ortSpieler).
sammelOrt(ernten, ortPlantage).
sammelOrt(erkaempfen, ortWald). 
sammelOrt(ertauchen, ortWasser).
sammelOrt(exoFahrzeugMinenLaserNutzen, ortWald).
sammelOrt(herausSchlagen, ortWald).
sammelOrt(jagen, ortWald).
sammelOrt(kaufen, ortHandelsTerminal).
sammelOrt(kaufen, ortRaumStation).
sammelOrt(kaufen, ortAussenPosten).
sammelOrt(kaufen, ortHandelsStation).
sammelOrt(minenLaserNutzen, ortWald).
sammelOrt(pfluecken, ortWald).
sammelOrt(raumSchuerfen, ortWeltRaum).
sammelOrt(terrainFormerNutzen, ortWald).
sammelOrt(unterWasserErkaempfen, ortWasser).
sammelOrt(verbessertenMinenLaserNutzen, ortWald).
sammelOrt(vonTierErhalten, ortWald).
sammelOrt(solarStrahlNutzen, ortWald).
sammelOrt(gemuetsStrahlNutzen, ortWald).
sammelOrt(verdienen, ortRaumStation).
sammelOrt(vonBergbauEinheitGewinnen, ortBergbauEinheit).

sammelStatus(minenLaserNutzen, minenLaser).
sammelStatus(verbessertenMinenLaserNutzen, verbesserterMinenLaser).
sammelStatus(terrainFormerNutzen, terrainFormer).
sammelStatus(jagen, waffeVorhanden).
sammelStatus(erkaempfen, waffeVorhanden).
sammelStatus(raumSchuerfen, raumSchiffIstFlott).
sammelStatus(exoFahrzeugMinenLaserNutzen, exoFahrzeugMinenLaser).
sammelStatus(solarStrahlNutzen, solarStrahl).
sammelStatus(gemuetsStrahlNutzen, gemuetsStrahl).
sammelStatus(unterWasserErkaempfen, waffeVorhanden).

/* Vorraussetzungen nach spielstatus und systemausstattung */
pruefeSammelAktionVorraussetzung(System, Planet, SammelAktion) :-
	((sammelStatus(SammelAktion, NoetigerStatus), spielStatus:spielStatus(NoetigerStatus, true)); \+sammelStatus(SammelAktion, _)),
	(sammelOrt(SammelAktion, Ort), spielStatus:systemAusstattung([System, Planet, Ort], _)),
	!.
	