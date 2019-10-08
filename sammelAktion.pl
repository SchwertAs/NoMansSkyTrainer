:- module(sammelAktion, [sammelAktion/2]).

sammelAktion(bekannt, ortSpieler).
sammelAktion(pfluecken, ortWald).
sammelAktion(minenLaserNutzen, ortWald).
sammelAktion(verbessertenMinenLaserNutzen, ortWald).
sammelAktion(exoFahrzeugMinenLaserNutzen, ortWald).
sammelAktion(terrainFormerNutzen, ortWald).
sammelAktion(jagen, ortWald).
sammelAktion(erkaempfen, ortWald).
sammelAktion(vonTierErhalten, ortWald).
sammelAktion(ernten, ortWald).
sammelAktion(raumSchuerfen, ortWeltRaum).
sammelAktion(kaufen, ortHandelsTerminal).

sammelAktion(ertauchen, ortWasser).
sammelAktion(unterWasserErkaempfen, ortWasser).

sammelAktion(ausAtmosphaerenAnlageFuerSauerStoffGewinnen, ortAthmosphaerenAnlageSauerStoff).
sammelAktion(ausAtmosphaerenAnlageFuerStickStoffGewinnen, ortAthmosphaerenAnlageStickStoff).

pruefeOperationVorraussetzung(Operation) :-
	Operation = minenLaserNutzen,
	!,
	spielStatus:spielStatus(minenLaser).
	
pruefeOperationVorraussetzung(Operation) :-
	Operation = verbessertenMinenLaserNutzen,
	!,
	spielStatus:spielStatus(verbesserterMinenLaser).

pruefeOperationVorraussetzung(Operation) :-
	Operation = terrainFormerNutzen,
	!,
	spielStatus:spielStatus(terrainFormer).

pruefeOperationVorraussetzung(Operation) :-
	Operation = jagen,
	!,
	spielStatus:spielStatus(waffeVorhanden).

pruefeOperationVorraussetzung(Operation) :-
	Operation = erkaempfen,
	!,
	spielStatus:spielStatus(waffeVorhanden).

pruefeOperationVorraussetzung(Operation) :-
	Operation = raumSchuerfen,
	!,
	spielStatus:spielStatus(raumSchiffIstFlott).

pruefeOperationVorraussetzung(Operation) :-
	Operation = exoFahrzeugMinenLaserNutzen,
	!,
	spielStatus:spielStatus(exoFahrzeugMinenLaser).

pruefeOperationVorraussetzung(Operation) :-
	Operation = ausAtmosphaerenAnlageFuerSauerStoffGewinnen,
	!,
	spielStatus:spielStatus(atmosphaerenAnlageSauerStoffVorhanden).

pruefeOperationVorraussetzung(Operation) :-
	Operation = ausAtmosphaerenAnlageFuerStickStoffGewinnen,
	!,
	spielStatus:spielStatus(atmosphaerenAnlageStickStoffVorhanden).

pruefeOperationVorraussetzung(Operation) :-
	Operation = kaufen,
	!,
	spielStatus:spielStatus(kaufTerminalVorhanden);
	spielStatus:spielStatus(torWarpVerfügbar).

pruefeOperationVorraussetzung(_) :-
	true.	