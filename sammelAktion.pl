:- module(sammelAktion, [sammelAktion/2]).

sammelAktion(bekannt, ortSpieler).
sammelAktion(pfluecken, ortWald).
sammelAktion(herausSchlagen, ortWald).
sammelAktion(minenLaserNutzen, ortWald).
sammelAktion(verbessertenMinenLaserNutzen, ortWald).
sammelAktion(exoFahrzeugMinenLaserNutzen, ortWald).
sammelAktion(terrainFormerNutzen, ortWald).
sammelAktion(jagen, ortWald).
sammelAktion(erkaempfen, ortWald).
sammelAktion(vonTierErhalten, ortWald).
sammelAktion(ernten, ortWald).
sammelAktion(raumSchuerfen, ortWeltRaum).
sammelAktion(kaufen, Ort) :-
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	((spielStatus:systemAusstattung([System, Planet, ortHandelsTerminal], _),
	  Ort = ortHandelsTerminal);
	 (spielStatus:systemAusstattung([System, Planet, ortRaumStation], _),
	  Ort = ortRaumStation)
	).

sammelAktion(ertauchen, ortWasser).
sammelAktion(unterWasserErkaempfen, ortWasser).

sammelAktion(ausAtmosphaerenAnlageFuerSauerStoffGewinnen, ortAthmosphaerenAnlageSauerStoff).
sammelAktion(ausAtmosphaerenAnlageFuerStickStoffGewinnen, ortAthmosphaerenAnlageStickStoff).

pruefeOperationVorraussetzung(minenLaserNutzen) :-
	!,
	\+spielStatus(minenLaser),
	!.
	
pruefeOperationVorraussetzung(verbessertenMinenLaserNutzen) :-
	!,
	\+spielStatus(verbesserterMinenLaser),
	!.

pruefeOperationVorraussetzung(terrainFormerNutzen) :-
	!,
	spielStatus(terrainFormer),
	!.

pruefeOperationVorraussetzung(jagen) :-
	!,
	\+spielStatus(waffeVorhanden),
	!.

pruefeOperationVorraussetzung(erkaempfen) :-
	!,
	\+spielStatus(waffeVorhanden),
	!.

pruefeOperationVorraussetzung(unterWasserErkaempfen) :-
	!,
	\+spielStatus(waffeVorhanden),
	sammelAktion(unterWasserErkaempfen, Ort),
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	spielStatus:systemAusstattung([System, Planet, Ort], _),
	!.

pruefeOperationVorraussetzung(raumSchuerfen) :-
	!,
	\+spielStatus(raumSchiffIstFlott),
	!.

pruefeOperationVorraussetzung(exoFahrzeugMinenLaserNutzen) :-
	!,
	\+spielStatus(exoFahrzeugMinenLaser),
	!.

pruefeOperationVorraussetzung(Operation) :-
	sammelAktion(Operation, Ort),
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	spielStatus:systemAusstattung([System, Planet, Ort], _),
	!.

pruefeOperationVorraussetzung(_) :-
	true.	

spielStatus(Operation) :-
	spielStatus:spielStatus(Operation, false).
