:- module(sammelAktion, [sammelOrt/2]).

sammelAktion(bekannt).
sammelAktion(erkaempfen).
sammelAktion(ernten).
sammelAktion(ertauchen).
sammelAktion(exoFahrzeugMinenLaserNutzen).
sammelAktion(herausSchlagen).
sammelAktion(jagen).
sammelAktion(kaufen).
sammelAktion(minenLaserNutzen).
sammelAktion(pfluecken).
sammelAktion(raumSchuerfen).
sammelAktion(terrainFormerNutzen).
sammelAktion(unterWasserErkaempfen).
sammelAktion(verbessertenMinenLaserNutzen).
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
sammelOrt(minenLaserNutzen, ortWald).
sammelOrt(pfluecken, ortWald).
sammelOrt(raumSchuerfen, ortWeltRaum).
sammelOrt(terrainFormerNutzen, ortWald).
sammelOrt(unterWasserErkaempfen, ortWasser).
sammelOrt(verbessertenMinenLaserNutzen, ortWald).
sammelOrt(vonTierErhalten, ortWald).

/* Vorraussetzungen im Multiwerkzeug */
pruefeSammelAktionVorraussetzung(_System, _Planet, minenLaserNutzen) :-
	!,
	spielStatus(minenLaser),
	!.
	
pruefeSammelAktionVorraussetzung(_System, _Planet, verbessertenMinenLaserNutzen) :-
	!,
	spielStatus(verbesserterMinenLaser),
	!.

pruefeSammelAktionVorraussetzung(_System, _Planet, terrainFormerNutzen) :-
	!,
	spielStatus(terrainFormer),
	!.

pruefeSammelAktionVorraussetzung(_System, _Planet, SammelAktion) :-
	(SammelAktion = jagen; SammelAktion = erkaempfen),
	!,
	spielStatus(waffeVorhanden),
	!.

/* Vorraussetzungen ohne Ortseinschränkung */
pruefeSammelAktionVorraussetzung(_System, _Planet, raumSchuerfen) :-
	!,
	spielStatus(raumSchiffIstFlott),
	!.
	
pruefeSammelAktionVorraussetzung(_System, _Planet, exoFahrzeugMinenLaserNutzen) :-
	!, /* TODO Abfrage auf Rufstation ergänzen */
	spielStatus(exoFahrzeugMinenLaser),
	!.

/* Vorraussetzungen in Planetenausstattung */
pruefeSammelAktionVorraussetzung(System, Planet, kaufen) :-
	!,
	/* TODO Handelsposten einbringen */
	(spielStatus:systemAusstattung([System, Planet, ortHandelsTerminal], _);
	 spielStatus:systemAusstattung([System, Planet, ortRaumStation], _)
	),
	!.
	
pruefeSammelAktionVorraussetzung(System, Planet, unterWasserErkaempfen) :-
	!,
	spielStatus(waffeVorhanden),
	sammelOrt(unterWasserErkaempfen, Ort),
	spielStatus:systemAusstattung([System, Planet, Ort], _),
	!.

/* ernten, ertauchen, herausschlagen vonTierErhalten */
pruefeSammelAktionVorraussetzung(System, Planet, Operation) :-
	sammelOrt(Operation, Ort),
	spielStatus:systemAusstattung([System, Planet, Ort], _),
	!.

pruefeSammelAktionVorraussetzung(_System, _Planet, _) :-
	true.	

spielStatus(Operation) :-
	spielStatus:spielStatus(Operation, true).
