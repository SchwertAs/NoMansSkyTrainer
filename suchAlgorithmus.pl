:- module(suchAlgorithmus, [baue/3, baueFuerVorfertigung/3, ersterNichtBeschaffbarerStoff/3]).

:- dynamic(loesung/8).
:- dynamic(maxTiefe/1).
:- dynamic(ersterNichtBeschaffbarerStoff/3).
:- dynamic(ersterNichtBeschaffbarerStoffGesetzt/1).

/* ------------------------------------------------------------------------------------------------------------------------- */
baueFuerVorfertigung(Strategie, Anzahl, Stoff) :-
	abolish(loesung/8),
	abolish(maxTiefe/1),
	dict_create(SammelSet0, 'SammelStueckliste', []),
	assertz(loesung(none, [], SammelSet0, 0, 0, 0, 0, 0)),
	assertz(maxTiefe(99)),
	beschaffen(Strategie, Anzahl, Stoff, [], [], Vorgaenge, 0, MaxTiefe),
	maxTiefeVerringern(MaxTiefe),
	dict_create(SammelSet1, 'SammelStueckliste', []),
	statistik:bildeSammelSet(Vorgaenge, SammelSet1, SammelSet),
	statistik:bildeGesamtZahl(SammelSet, 0, GesamtZahl),
	statistik:bildeGesamtWert(SammelSet, 0, GesamtWertSammlung),
	arbeitsVorbereitung:bildeAvZeiten(Vorgaenge, 0, GesamtHauptZeit, 0, GesamtNebenZeit, 0, GesamtRuestZeit),
	logistik:logistikOptimierungReisen(Vorgaenge, OptimierteVorgaenge),
	reisen:bildeReiseZeiten(OptimierteVorgaenge, GesamtReiseZeit),
	statistik:bildeGesamtAufwaende(Vorgaenge, 0, GesamtEinkaufsAufwand),
	GesamtZeitAufwand is GesamtHauptZeit + GesamtNebenZeit + GesamtRuestZeit + GesamtReiseZeit, 
	GesamtAufwand is GesamtEinkaufsAufwand + GesamtWertSammlung,
	stoff:stoff(_, Stoff, Wert),
	Erloes is Anzahl * Wert,
	assertz(loesung(Stoff, Vorgaenge, SammelSet, GesamtZahl, GesamtWertSammlung, GesamtZeitAufwand, GesamtAufwand, Erloes)),
	fail.

/* Subprädikate */
baue(Strategie, Anzahl, Stoff) :-
	abolish(loesung/8),
	abolish(ersterNichtBeschaffbarerStoff/3),
	abolish(maxTiefe/1),
	dict_create(SammelSet0, 'SammelStueckliste', []),
	assertz(loesung(none, [], SammelSet0, 0, 0, 0, 0, 0)),
	assertz(ersterNichtBeschaffbarerStoff(Strategie, none, [])),
	assertz(maxTiefe(99)),
	beschaffen(Strategie, Anzahl, Stoff, [], [], Vorgaenge, 0, MaxTiefe),
	maxTiefeVerringern(MaxTiefe),
	dict_create(SammelSet1, 'SammelStueckliste', []),
	statistik:bildeSammelSet(Vorgaenge, SammelSet1, SammelSet),
	statistik:bildeGesamtZahl(SammelSet, 0, GesamtZahl),
	statistik:bildeGesamtWert(SammelSet, 0, GesamtWertSammlung),
	arbeitsVorbereitung:bildeAvZeiten(Vorgaenge, 0, GesamtHauptZeit, 0, GesamtNebenZeit, 0, GesamtRuestZeit),
	logistik:logistikOptimierungReisen(Vorgaenge, OptimierteVorgaenge),
	reisen:bildeReiseZeiten(OptimierteVorgaenge, GesamtReiseZeit),
	statistik:bildeGesamtAufwaende(OptimierteVorgaenge, 0, GesamtEinkaufsAufwand),
	GesamtZeitAufwand is GesamtHauptZeit + GesamtNebenZeit + GesamtRuestZeit + GesamtReiseZeit, 
	GesamtAufwand is GesamtEinkaufsAufwand + GesamtWertSammlung,
	stoff:stoff(_, Stoff, Wert),
	Erloes is Anzahl * Wert,
	reisen:fuegeReiseOperationenEin(OptimierteVorgaenge, ortSpieler, [], ErgaenzteVorgaenge),
	assertz(loesung(Stoff, ErgaenzteVorgaenge, SammelSet, GesamtZahl, GesamtWertSammlung, GesamtZeitAufwand, GesamtAufwand, Erloes)),
	fail.

/* ------------------------------------------------------------------------------------------------------------------------- */
beschaffen(Strategie, Anzahl, Stoff, _, BisherigeVorgaenge, Vorgaenge, IstTiefe, MaxTiefe) :-
	sammlung:sammelbar(Stoff, vorfertigen),
	!,
	append([[Anzahl, vorfertigen, [], [Anzahl, Stoff]]], BisherigeVorgaenge, VorgaengeMitVorfertigung),
	expandiereVorgaenge(Strategie, VorgaengeMitVorfertigung, [], Vorgaenge),
	ignore(MaxTiefe = IstTiefe). 

beschaffen(_, Anzahl, Stoff, _, BisherigeVorgaenge, Vorgaenge, IstTiefe, MaxTiefe) :-
	sammlung:sammelbar(Stoff, Operation),
	append([[Anzahl, Operation, [], [Anzahl, Stoff]]], BisherigeVorgaenge, Vorgaenge),
	ignore(MaxTiefe = IstTiefe).

beschaffen(Strategie, Anzahl, Stoff, StoffPfad, BisherigeVorgaenge, ListeVorgaenge, IstTiefe, MaxTiefe) :-
	maxTiefe(MaxTiefe0),
	length(StoffPfad, Len),
	Len =< MaxTiefe0, 
	rezept:rezept(Operation, Komponenten, [AnzahlRezeptErgebnis, Stoff], _),
	rezeptZulaessig(Operation, Komponenten),
	keinZirkel(Komponenten, StoffPfad, Stoff),
	divmod(Anzahl, AnzahlRezeptErgebnis, AnzahlDivision, Rest),
	(Rest > 0, AnzahlRaffinaden is AnzahlDivision + 1; Rest = 0, AnzahlRaffinaden is AnzahlDivision),
	AnzahlRaffiniert is AnzahlRaffinaden * AnzahlRezeptErgebnis,
	append([[AnzahlRaffinaden, Operation, Komponenten, [AnzahlRaffiniert, Stoff]]], BisherigeVorgaenge, ListeVorgaenge0),
	append([Stoff], StoffPfad, StoffPfadDanach),
	IstTiefe0 is IstTiefe + 1,
	abolish(ersterNichtBeschaffbarerStoffGesetzt/1),	
	assertz(ersterNichtBeschaffbarerStoffGesetzt(false)),	
	listeBeschaffen(Strategie, IstTiefe0, MaxTiefe, AnzahlRaffinaden, Komponenten, StoffPfadDanach, ListeVorgaenge0, ListeVorgaenge),
	ignore(MaxTiefe = IstTiefe0). 

/* ------------------------------------------------------------------------------------------------------------------------- */
expandiereVorgaenge(_, Vorgaenge, VorgaengeExpandiertTmp, VorgaengeExpandiert) :-
	Vorgaenge = [],
	VorgaengeExpandiert = VorgaengeExpandiertTmp,
	!.
	
expandiereVorgaenge(Strategie, Vorgaenge, VorgaengeExpandiertTmp, VorgaengeExpandiert) :-
	Vorgaenge = [Kopf|Rest], 
	Kopf \= [_, vorfertigen, _, [_, _]],
	append(VorgaengeExpandiertTmp, [Kopf], VorgaengeExpandiertDanach),
	expandiereVorgaenge(Strategie, Rest, VorgaengeExpandiertDanach, VorgaengeExpandiert),
	!.

expandiereVorgaenge(Strategie, Vorgaenge, VorgaengeExpandiertTmp, VorgaengeExpandiert) :-
	Vorgaenge = [Kopf|Rest],
	Kopf = [Anzahl, vorfertigen, _, [_, Stoff]],
	sammlung:fertigeLoesung(Strategie, Stoff, VorgaengeDanach0),
	ermittleNoetigenRezeptMultiplikator(VorgaengeDanach0, Anzahl, Faktor),
	multipliziereVorgangsWerte(VorgaengeDanach0, Faktor, [], VorgaengeDanach1), 
	expandiereVorgaenge(Strategie, VorgaengeDanach1, VorgaengeExpandiertTmp, VorgaengeExpandiert0),
	expandiereVorgaenge(Strategie, Rest, VorgaengeExpandiert0, VorgaengeExpandiert),
	!.

/* ------------------------------------------------------------------------------------------------------------------------- */
ermittleNoetigenRezeptMultiplikator(Vorgaenge, Anzahl, Faktor) :-
	Vorgaenge = [ Vorgang | []],
	Vorgang = [_, _, _, [AnzahlProdukteVorgang, _]],
	Faktor is ceiling(Anzahl / AnzahlProdukteVorgang).

ermittleNoetigenRezeptMultiplikator(Vorgaenge, Anzahl, Faktor) :-
	Vorgaenge = [ _ | Rest],
	ermittleNoetigenRezeptMultiplikator(Rest, Anzahl, Faktor).

/* ------------------------------------------------------------------------------------------------------------------------- */
multipliziereVorgangsWerte(Vorgaenge, _, VorgaengeMultipliziertBisher, VorgaengeMultipliziert) :-
	Vorgaenge = [],
	VorgaengeMultipliziertBisher = VorgaengeMultipliziert,
	!.

multipliziereVorgangsWerte(Vorgaenge, Faktor, VorgaengeMultipliziertBisher, VorgaengeMultipliziert) :-
	Vorgaenge = [Vorgang|RestVorgaenge],
	Vorgang = [AnzahlVorgang, Operation, Komponenten, [AnzahlProdukteVorgang, Stoff]],
	AnzahlVorgangMultipliziert is AnzahlVorgang * Faktor,
	AnzahlProdukteVorgangMultipliziert is AnzahlProdukteVorgang * Faktor,
	VorgangMultipliziert = [AnzahlVorgangMultipliziert, Operation, Komponenten, [AnzahlProdukteVorgangMultipliziert, Stoff]],
	append(VorgaengeMultipliziertBisher, [VorgangMultipliziert], VorgaengeMultipliziertBisher1),
	multipliziereVorgangsWerte(RestVorgaenge, Faktor, VorgaengeMultipliziertBisher1, VorgaengeMultipliziert).   

/* ------------------------------------------------------------------------------------------------------------------------- */
rezeptZulaessig(Operation, _) :-
	Operation \= raffinieren,
	!.
	
rezeptZulaessig(_, Komponenten) :-
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	(spielStatus:systemAusstattung([System, Planet, ortKleineRaffinerie], _); 
	 spielStatus:systemAusstattung([System, Planet, ortMittlereRaffinerie], _);
	 spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], _)
	),
	Komponenten = [[_, _]],
	!.
	
rezeptZulaessig(_, Komponenten) :-
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	(spielStatus:systemAusstattung([System, Planet, ortMittlereRaffinerie], _);
	 spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], _)
	),
	Komponenten = [[_, _], [_, _]],
	!.

rezeptZulaessig(_, Komponenten) :-
	spielStatus:systemAusstattung([System, Planet, ortSpieler], _),
	spielStatus:systemAusstattung([System, Planet, ortGrosseRaffinerie], _),
	Komponenten = [[_, _], [_, _], [_, _]],
	!.

/* ------------------------------------------------------------------------------------------------------------------------- */
keinZirkel(Komponenten, StoffPfad, Stoff) :-
	Komponenten = [[_, Stoff1]],
	\+memberchk(Stoff1, StoffPfad),
	\+Stoff = Stoff1,
	!.

keinZirkel(Komponenten, StoffPfad, Stoff) :-
	Komponenten = [[_, Stoff1], [_, Stoff2]],
	\+memberchk(Stoff1, StoffPfad),
	\+memberchk(Stoff2, StoffPfad),
	\+Stoff = Stoff1,
	\+Stoff = Stoff2,
	!.

keinZirkel(Komponenten, StoffPfad, Stoff) :-
	Komponenten = [[_, Stoff1], [_, Stoff2], [_, Stoff3]],
	\+memberchk(Stoff1, StoffPfad),
	\+memberchk(Stoff2, StoffPfad),
	\+memberchk(Stoff3, StoffPfad),
	\+Stoff = Stoff1,
	\+Stoff = Stoff2,
	\+Stoff = Stoff3,
	!.

keinZirkel(Komponenten, StoffPfad, Stoff) :-
	Komponenten = [[_, Stoff1], [_, Stoff2], [_, Stoff3], [_, Stoff4]],
	\+memberchk(Stoff1, StoffPfad),
	\+memberchk(Stoff2, StoffPfad),
	\+memberchk(Stoff3, StoffPfad),
	\+memberchk(Stoff4, StoffPfad),
	\+Stoff = Stoff1,
	\+Stoff = Stoff2,
	\+Stoff = Stoff3,
	\+Stoff = Stoff4,
	!.
	
baueBegruendung(Strategie, Komp, ListeBisherigerVorgaenge) :-
	ersterNichtBeschaffbarerStoffGesetzt(false),
	retract(ersterNichtBeschaffbarerStoffGesetzt(false)),
	assertz(ersterNichtBeschaffbarerStoffGesetzt(true)),	
	assertz(ersterNichtBeschaffbarerStoff(Strategie, Komp, ListeBisherigerVorgaenge)),
	fail.
	
/*---------------------------------------------------------------*/
listeBeschaffen(Strategie, IstTiefe, MaxTiefe, AnzahlRaffinaden, Komponenten, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge) :-
	Komponenten = [[Anz1, Komp1]],
	Anzahl1 is Anz1 * AnzahlRaffinaden,
	(beschaffen(Strategie, Anzahl1, Komp1, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge, IstTiefe, MaxTiefe);
	 baueBegruendung(Strategie, Komp1, ListeBisherigerVorgaenge)
	),
	!.

listeBeschaffen(Strategie, IstTiefe, MaxTiefe, AnzahlRaffinaden, Komponenten, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge) :-
	Komponenten = [[Anz1, Komp1], [Anz2, Komp2]],
	Anzahl1 is Anz1 * AnzahlRaffinaden,
	Anzahl2 is Anz2 * AnzahlRaffinaden,
	(beschaffen(Strategie, Anzahl1, Komp1, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge1, IstTiefe, MaxTiefe);
	 baueBegruendung(Strategie, Komp1, ListeBisherigerVorgaenge)
	),
	(beschaffen(Strategie, Anzahl2, Komp2, StoffPfad, ListeVorgaenge1, ListeVorgaenge, IstTiefe, MaxTiefe);
	 baueBegruendung(Strategie, Komp2, ListeBisherigerVorgaenge)
	),
	!.

listeBeschaffen(Strategie, IstTiefe, MaxTiefe, AnzahlRaffinaden, Komponenten, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge) :-
	Komponenten = [[Anz1, Komp1], [Anz2, Komp2], [Anz3, Komp3]],
	Anzahl1 is Anz1 * AnzahlRaffinaden,
	Anzahl2 is Anz2 * AnzahlRaffinaden,
	Anzahl3 is Anz3 * AnzahlRaffinaden,
	(beschaffen(Strategie, Anzahl1, Komp1, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge2, IstTiefe, MaxTiefe);
	 baueBegruendung(Strategie, Komp1, ListeBisherigerVorgaenge)
	),
	(beschaffen(Strategie, Anzahl2, Komp2, StoffPfad, ListeVorgaenge2, ListeVorgaenge3, IstTiefe, MaxTiefe);
	 baueBegruendung(Strategie, Komp2, ListeBisherigerVorgaenge)
	),
	(beschaffen(Strategie, Anzahl3, Komp3, StoffPfad, ListeVorgaenge3, ListeVorgaenge, IstTiefe, MaxTiefe);
	 baueBegruendung(Strategie, Komp3, ListeBisherigerVorgaenge)
	),
	!.

listeBeschaffen(Strategie, IstTiefe, MaxTiefe, AnzahlRaffinaden, Komponenten, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge) :-
	Komponenten = [[Anz1, Komp1], [Anz2, Komp2], [Anz3, Komp3], [Anz4, Komp4]],
	Anzahl1 is Anz1 * AnzahlRaffinaden,
	Anzahl2 is Anz2 * AnzahlRaffinaden,
	Anzahl3 is Anz3 * AnzahlRaffinaden,
	Anzahl4 is Anz4 * AnzahlRaffinaden,
	(beschaffen(Strategie, Anzahl1, Komp1, StoffPfad, ListeBisherigerVorgaenge, ListeVorgaenge2, IstTiefe, MaxTiefe);
	 baueBegruendung(Strategie, Komp1, ListeBisherigerVorgaenge)
	),
	(beschaffen(Strategie, Anzahl2, Komp2, StoffPfad, ListeVorgaenge2, ListeVorgaenge3, IstTiefe, MaxTiefe);
	 baueBegruendung(Strategie, Komp2, ListeBisherigerVorgaenge)
	),
	(beschaffen(Strategie, Anzahl3, Komp3, StoffPfad, ListeVorgaenge3, ListeVorgaenge4, IstTiefe, MaxTiefe);
	 baueBegruendung(Strategie, Komp3, ListeBisherigerVorgaenge)
	),
	(beschaffen(Strategie, Anzahl4, Komp4, StoffPfad, ListeVorgaenge4, ListeVorgaenge, IstTiefe, MaxTiefe);
	 baueBegruendung(Strategie, Komp4, ListeBisherigerVorgaenge)
	),
	!.
	
/* ------------------------------------------------------------------------------------------------------------------------- */
maxTiefeVerringern(MaxTiefe) :-
	maxTiefe(MaxTiefeVorher),
	MaxTiefeVorher > MaxTiefe,
	retract(maxTiefe(_)),
	assertz(maxTiefe(MaxTiefe)),
	!.

maxTiefeVerringern(MaxTiefe) :-
	maxTiefe(MaxTiefeVorher),
	MaxTiefeVorher = MaxTiefe,
	!.
		