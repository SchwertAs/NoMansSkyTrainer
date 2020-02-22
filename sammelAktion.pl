:- module(sammelAktion, [sammelOrt/2]).

sammelAktion(bekannt).
sammelAktion(pfluecken).
sammelAktion(herausSchlagen).
sammelAktion(minenLaserNutzen).
sammelAktion(verbessertenMinenLaserNutzen).
sammelAktion(exoFahrzeugMinenLaserNutzen).
sammelAktion(terrainFormerNutzen).
sammelAktion(jagen).
sammelAktion(erkaempfen).
sammelAktion(vonTierErhalten).
sammelAktion(ernten).
sammelAktion(raumSchuerfen).
sammelAktion(kaufen).
sammelAktion(ertauchen).
sammelAktion(unterWasserErkaempfen).

sammelOrt(bekannt, ortSpieler).
sammelOrt(pfluecken, ortWald).
sammelOrt(herausSchlagen, ortWald).
sammelOrt(minenLaserNutzen, ortWald).
sammelOrt(verbessertenMinenLaserNutzen, ortWald).
sammelOrt(exoFahrzeugMinenLaserNutzen, ortWald).
sammelOrt(terrainFormerNutzen, ortWald).
sammelOrt(jagen, ortWald).
sammelOrt(erkaempfen, ortWald). 
sammelOrt(vonTierErhalten, ortWald).
sammelOrt(ernten, ortWald).
sammelOrt(raumSchuerfen, ortWeltRaum).
sammelOrt(kaufen, Ort) :-
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	((spielStatus:systemAusstattung([System, Planet, ortHandelsTerminal], _),
	  Ort = ortHandelsTerminal);
	 (spielStatus:systemAusstattung([System, Planet, ortRaumStation], _),
	  Ort = ortRaumStation)
	).

sammelOrt(ertauchen, ortWasser).
sammelOrt(unterWasserErkaempfen, ortWasser).

pruefeSammelAktionVorraussetzung(minenLaserNutzen) :-
	!,
	spielStatus(minenLaser),
	!.
	
pruefeSammelAktionVorraussetzung(verbessertenMinenLaserNutzen) :-
	!,
	spielStatus(verbesserterMinenLaser),
	!.

pruefeSammelAktionVorraussetzung(terrainFormerNutzen) :-
	!,
	spielStatus(terrainFormer),
	!.

pruefeSammelAktionVorraussetzung(jagen) :-
	!,
	spielStatus(waffeVorhanden),
	!.

pruefeSammelAktionVorraussetzung(erkaempfen) :-
	!,
	spielStatus(waffeVorhanden),
	!.

pruefeSammelAktionVorraussetzung(unterWasserErkaempfen) :-
	!,
	spielStatus(waffeVorhanden),
	sammelOrt(unterWasserErkaempfen, Ort),
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	spielStatus:systemAusstattung([System, Planet, Ort], _),
	!.

pruefeSammelAktionVorraussetzung(raumSchuerfen) :-
	!,
	spielStatus(raumSchiffIstFlott),
	!.

pruefeSammelAktionVorraussetzung(exoFahrzeugMinenLaserNutzen) :-
	!,
	spielStatus(exoFahrzeugMinenLaser),
	!.

pruefeSammelAktionVorraussetzung(Operation) :-
	sammelOrt(Operation, Ort),
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	spielStatus:systemAusstattung([System, Planet, Ort], _),
	!.

pruefeSammelAktionVorraussetzung(_) :-
	true.	

spielStatus(Operation) :-
	spielStatus:spielStatus(Operation, true).
