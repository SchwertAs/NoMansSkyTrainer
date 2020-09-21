:- module(planetenEigenschaftenDialog, [planetenEigenschaftenDialogSystemAuswahl/1]).

:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/planetenEigenschaftenDialogSystemAuswahl', planetenEigenschaftenDialogSystemAuswahl, []).
:- http_handler('/planetenEigenschaftenDialogPlanetAuswahl', planetenEigenschaftenDialogPlanetAuswahl, []).
:- http_handler('/planetenEigenschaftenDialog', planetenEigenschaftenDialog, []).
:- http_handler('/planetenEigenschaften', planetenEigenschaften, []).

/* -----------------------------------  Systemauswahl ----------------------------------------------- */
planetenEigenschaftenDialogSystemAuswahl(_Request) :-
	textResources:getText(txtEigenschaftenHimmelsKoerperEingeben, TxtEigenschaftenHimmelsKoerperEingeben),
	textResources:getText(txtSternenSystemEingeben, TxtSternenSystemEingeben),
	string_concat(TxtEigenschaftenHimmelsKoerperEingeben, ': ', Txt0),
	string_concat(Txt0, TxtSternenSystemEingeben, TxtHeader),
	planetAuswahlDialog:systemAuswahlDialog(
	  TxtHeader,
	  '/planetenEigenschaftenDialogPlanetAuswahl').


/* -----------------------------------  Planetauswahl ----------------------------------------------- */
planetenEigenschaftenDialogPlanetAuswahl(Request) :-
	textResources:getText(txtEigenschaftenHimmelsKoerperEingeben, TxtEigenschaftenHimmelsKoerperEingeben),
	textResources:getText(txtPlanetAuswaehlen, TxtPlanetAuswaehlen),
	string_concat(TxtEigenschaftenHimmelsKoerperEingeben, ': ', Txt0),
	string_concat(Txt0, TxtPlanetAuswaehlen, TxtHeader),
	planetAuswahlDialog:planetAuswahlDialog(
	  TxtHeader,
	  '/planetenEigenschaftenDialog',
	  Request
	).
	
/* -----------------------------------  Eigenschaften eingeben -------------------------------------- */
planetenEigenschaftenDialog(Request) :-
	textResources:getText(txtBitteWaehlen, TxtBitteWaehlen),
	member(method(post), Request), !,
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0]),
	 auswahlPlanet(AuswahlPlanet, [length > 0])
	]),
	(AuswahlPlanet = TxtBitteWaehlen -> planetAuswahlDialog:fehlerBehandlung; 
	 planetenEigenschaftenAnzeigen(AuswahlSystem, AuswahlPlanet)
	).

planetenEigenschaftenAnzeigen(AuswahlSystem, AuswahlPlanet) :-
	spielStatus:copyDefaultIfEmpty(AuswahlSystem, AuswahlPlanet),
	/* Einlesen vorhandener Werte */
	((spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortHauptBasis], 0) -> HauptBasisVorhandenVal=true; HauptBasisVorhandenVal=false),
	 (spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortWasser], WasserEntfernungValNum) -> WasserVorhandenVal=true; WasserVorhandenVal=false),
	 (spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortAussenPosten], AussenPostenEntfernungValNum) -> AussenPostenVorhandenVal=true; AussenPostenVorhandenVal=false),
	 (spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortRaumStation], RaumstationEntfernungValNum) -> RaumstationVorhandenVal=true; RaumstationVorhandenVal=false),
	 
	 (spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortMittlereRaffinerie], MittlereRaffinerieEntfernungValNum) -> MittlereRaffinerieVorhandenVal=true; MittlereRaffinerieVorhandenVal=false),
	 (spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortGrosseRaffinerie], GrosseRaffinerieEntfernungValNum) -> GrosseRaffinerieVorhandenVal=true; GrosseRaffinerieVorhandenVal=false),
	 (spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortHandelsTerminal], HandelsTerminalEntfernungValNum) -> HandelsTerminalVorhandenVal=true; HandelsTerminalVorhandenVal=false),
	 (spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortHandelsStation], HandelsStationEntfernungValNum) -> HandelsStationVorhandenVal=true; HandelsStationVorhandenVal=false),
	 (spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortKleineRaffinerie], KleineRaffinerieEntfernungValNum) -> KleineRaffinerieVorhandenVal=true; KleineRaffinerieVorhandenVal=false),
	 (spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortNahrungsProzessor], NahrungsProzessorEntfernungValNum) -> NahrungsProzessorVorhandenVal=true; NahrungsProzessorVorhandenVal=false),
	 (spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortBasisTerminus], BasisTerminusEntfernungValNum) -> BasisTerminusVorhandenVal=true; BasisTerminusVorhandenVal=false),
	 (spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortForschungsTerminal], ForschungsTerminalEntfernungValNum) -> ForschungsTerminalVorhandenVal=true; ForschungsTerminalVorhandenVal=false),
	 (spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortSauerStoffVerarbeiter], SauerstoffVearbeiterEntfernungValNum) -> SauerstoffVearbeiterVal=true; SauerstoffVearbeiterVal=false),
	 (spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortAtmosphaerenAnlage], AtmosphaerenAnlageEntfernungValNum) -> AtmosphaerenAnlageVorhandenVal=true; AtmosphaerenAnlageVorhandenVal=false),
	 (spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortBergbauEinheit], BergbauEinheitEntfernungValNum) -> BergbauEinheitVorhandenVal=true; BergbauEinheitVorhandenVal=false),
	 (spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortPlantage], PlantageEntfernungValNum) -> PlantageVorhandenVal=true; PlantageVorhandenVal=false)
	),
	(var(WasserEntfernungValNum) -> WasserEntfernungVal = 'Zeit'; number_string(WasserEntfernungValNum, WasserEntfernungVal)),
	(var(AussenPostenEntfernungValNum) -> AussenPostenEntfernungVal = 'Zeit'; number_string(AussenPostenEntfernungValNum, AussenPostenEntfernungVal)),
	(var(RaumstationEntfernungValNum) -> RaumstationEntfernungVal = 'Zeit'; number_string(RaumstationEntfernungValNum, RaumstationEntfernungVal)),
	(var(MittlereRaffinerieEntfernungValNum) -> MittlereRaffinerieEntfernungVal = 'Zeit'; number_string(MittlereRaffinerieEntfernungValNum, MittlereRaffinerieEntfernungVal)),
	(var(GrosseRaffinerieEntfernungValNum) -> GrosseRaffinerieEntfernungVal = 'Zeit'; number_string(GrosseRaffinerieEntfernungValNum, GrosseRaffinerieEntfernungVal)),
	(var(HandelsTerminalEntfernungValNum) -> HandelsTerminalEntfernungVal = 'Zeit'; number_string(HandelsTerminalEntfernungValNum, HandelsTerminalEntfernungVal)),
	(var(HandelsStationEntfernungValNum) -> HandelsStationEntfernungVal = 'Zeit'; number_string(HandelsStationEntfernungValNum, HandelsStationEntfernungVal)),
	(var(KleineRaffinerieEntfernungValNum) -> KleineRaffinerieEntfernungVal = 'Zeit'; number_string(KleineRaffinerieEntfernungValNum, KleineRaffinerieEntfernungVal)),
	(var(NahrungsProzessorEntfernungValNum) -> NahrungsProzessorEntfernungVal = 'Zeit'; number_string(NahrungsProzessorEntfernungValNum, NahrungsProzessorEntfernungVal)),
	(var(BasisTerminusEntfernungValNum) -> BasisTerminusEntfernungVal = 'Zeit'; number_string(BasisTerminusEntfernungValNum, BasisTerminusEntfernungVal)),
	(var(ForschungsTerminalEntfernungValNum) -> ForschungsTerminalEntfernungVal = 'Zeit'; number_string(ForschungsTerminalEntfernungValNum, ForschungsTerminalEntfernungVal)),
	(var(SauerstoffVearbeiterEntfernungValNum) -> SauerstoffVearbeiterEntfernungVal = 'Zeit'; number_string(SauerstoffVearbeiterEntfernungValNum, SauerstoffVearbeiterEntfernungVal)),
	(var(AtmosphaerenAnlageEntfernungValNum) -> AtmosphaerenAnlageEntfernungVal = 'Zeit'; number_string(AtmosphaerenAnlageEntfernungValNum, AtmosphaerenAnlageEntfernungVal)),
	(var(BergbauEinheitEntfernungValNum) -> BergbauEinheitEntfernungVal = 'Zeit'; number_string(BergbauEinheitEntfernungValNum, BergbauEinheitEntfernungVal)),
	(var(PlantageEntfernungValNum) -> PlantageEntfernungVal = 'Zeit'; number_string(PlantageEntfernungValNum, PlantageEntfernungVal)),
	textResources:getText(txtAuswahlHimmelskoerper, TxtAuswahlHimmelskoerper),
	textResources:getText(txtEinrichtungenUndIhreReisezeit, TxtEinrichtungenUndIhreReisezeit),
	textResources:getText(txtJeweilsDieEinrichtungMit, TxtJeweilsDieEinrichtungMit),

	textResources:getText(txtEigenschaftenHimmelsKoerperEingeben, TxtEigenschaftenHimmelsKoerperEingeben),
	textResources:getText(txtEigenschaftenHimmelsKoerper, TxtEigenschaftenHimmelsKoerper),
	string_concat(TxtEigenschaftenHimmelsKoerperEingeben, ': ', Txt0),
	string_concat(Txt0, TxtEigenschaftenHimmelsKoerper, TxtHeader),

	textResources:getText(txtOk, TxtOk),
	textResources:getText(txtReset, TxtReset),
	TermerizedBody = [
	\['<header>'],
    h1([align(center)], [TxtHeader]),
    \['</header>'],
	\['<formSpace>'],       
    form([action('/planetenEigenschaften'), method('post'), name('planetenEigenschaftenAuswahlForm')], 
       	 [h3(TxtAuswahlHimmelskoerper),
       	  \eingabeTabelleReadOnly(AuswahlSystem, AuswahlPlanet),
       	  h3(TxtEinrichtungenUndIhreReisezeit),
	      h4(TxtJeweilsDieEinrichtungMit),
       	  \tabelleEinrichtungen(
			HauptBasisVorhandenVal,
			WasserVorhandenVal, WasserEntfernungVal,
			AussenPostenVorhandenVal, AussenPostenEntfernungVal, 
			RaumstationVorhandenVal, RaumstationEntfernungVal,
			MittlereRaffinerieVorhandenVal, MittlereRaffinerieEntfernungVal,
			GrosseRaffinerieVorhandenVal, GrosseRaffinerieEntfernungVal,
			HandelsTerminalVorhandenVal, HandelsTerminalEntfernungVal,
			HandelsStationVorhandenVal, HandelsStationEntfernungVal,
			KleineRaffinerieVorhandenVal, KleineRaffinerieEntfernungVal,
			NahrungsProzessorVorhandenVal, NahrungsProzessorEntfernungVal,
			BasisTerminusVorhandenVal, BasisTerminusEntfernungVal,
			ForschungsTerminalVorhandenVal, ForschungsTerminalEntfernungVal,
			SauerstoffVearbeiterVal, SauerstoffVearbeiterEntfernungVal,
			AtmosphaerenAnlageVorhandenVal, AtmosphaerenAnlageEntfernungVal,
			BergbauEinheitVorhandenVal, BergbauEinheitEntfernungVal,
			PlantageVorhandenVal, PlantageEntfernungVal			
       	  ),
       	  p(table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
		    	  [td([button([name("submit"), type("submit")], TxtOk)]),
		    	   td([button([name("reset"), type("reset")], TxtReset)])
		    	  ]))    
		 ]),
	\['</formSpace>']		             ],       
	server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: System-Eigenschaften')],
	reply_html_page(TermerizedHead, TermerizedBody).

eingabeTabelleReadOnly(AuswahlSystem, AuswahlPlanet) -->
	{	textResources:getText(txtSystemDp, TxtSystem),
		textResources:getText(txtPlanetDp, TxtPlanet)
	},
	html(
   	  div(class('table50'),[
   	    div(class('tr'), [
   	    	\divInputReadOnly('auswahlSystem', TxtSystem, AuswahlSystem, 1),
   	    	\divInputReadOnly('auswahlPlanet', TxtPlanet, AuswahlPlanet, 2)
   	  	])
   	  ])).

tabelleEinrichtungen(
	HauptBasisVorhandenVal,
	WasserVorhandenVal, WasserEntfernungVal,
	AussenPostenVorhandenVal, AussenPostenEntfernungVal, 
	RaumstationVorhandenVal, RaumstationEntfernungVal,
	MittlereRaffinerieVorhandenVal, MittlereRaffinerieEntfernungVal,
	GrosseRaffinerieVorhandenVal, GrosseRaffinerieEntfernungVal,
	HandelsTerminalVorhandenVal, HandelsTerminalEntfernungVal,
	HandelsStationVorhandenVal, HandelsStationEntfernungVal,
	KleineRaffinerieVorhandenVal, KleineRaffinerieEntfernungVal,
	NahrungsProzessorVorhandenVal, NahrungsProzessorEntfernungVal,
	BasisTerminusVorhandenVal, BasisTerminusEntfernungVal,
	ForschungsTerminalVorhandenVal, ForschungsTerminalEntfernungVal,
	SauerstoffVearbeiterVal, SauerstoffVearbeiterEntfernungVal,
	AtmosphaerenAnlageVorhandenVal, AtmosphaerenAnlageEntfernungVal,
	BergbauEinheitVorhandenVal, BergbauEinheitEntfernungVal,
	PlantageVorhandenVal, PlantageEntfernungVal
    ) -->
	{	textResources:getText(ortHauptBasis, TxtHauptBasis0),
		textResources:getText(ortWasser, TxtWasser0),
		textResources:getText(ortAussenPosten, TxtAussenPosten0),
		textResources:getText(ortRaumStation, TxtRaumStation0),
		textResources:getText(ortMittlereRaffinerie, TxtMittlereRaffinerie0),
		textResources:getText(ortGrosseRaffinerie, TxtGrosseRaffinerie0),
		textResources:getText(ortHandelsTerminal, TxtHandelsTerminal0),
		textResources:getText(ortHandelsStation, TxtHandelsStation0),
		textResources:getText(ortKleineRaffinerie, TxtKleineRaffinerie0),
		textResources:getText(ortNahrungsProzessor, TxtNahrungsProzessor0),
		textResources:getText(ortBasisTerminus, TxtBasisTerminus0),
		textResources:getText(ortForschungsTerminal, TxtForschungsTerminal0),
		textResources:getText(ortSauerStoffVerarbeiter, TxtSauerStoffVerarbeiter0),
		textResources:getText(ortAtmosphaerenAnlage, TxtAtmosphaerenAnlage0),
		textResources:getText(ortBergbauEinheit, TxtBergbauEinheit0),
		textResources:getText(ortPlantage, TxtPlantage0),
		textResources:stringToSubstantiv(TxtHauptBasis0, TxtHauptBasis),
		textResources:stringToSubstantiv(TxtWasser0, TxtWasser),
		textResources:stringToSubstantiv(TxtAussenPosten0, TxtAussenPosten),
		textResources:stringToSubstantiv(TxtRaumStation0, TxtRaumStation),
		textResources:stringToSubstantiv(TxtMittlereRaffinerie0, TxtMittlereRaffinerie),
		textResources:stringToSubstantiv(TxtGrosseRaffinerie0, TxtGrosseRaffinerie),
		textResources:stringToSubstantiv(TxtHandelsTerminal0, TxtHandelsTerminal),
		textResources:stringToSubstantiv(TxtHandelsStation0, TxtHandelsStation),
		textResources:stringToSubstantiv(TxtKleineRaffinerie0, TxtKleineRaffinerie),
		textResources:stringToSubstantiv(TxtNahrungsProzessor0, TxtNahrungsProzessor),
		textResources:stringToSubstantiv(TxtBasisTerminus0, TxtBasisTerminus),
		textResources:stringToSubstantiv(TxtForschungsTerminal0, TxtForschungsTerminal),
		textResources:stringToSubstantiv(TxtSauerStoffVerarbeiter0, TxtSauerStoffVerarbeiter),
		textResources:stringToSubstantiv(TxtAtmosphaerenAnlage0, TxtAtmosphaerenAnlage),
		textResources:stringToSubstantiv(TxtBergbauEinheit0, TxtBergbauEinheit),
		textResources:stringToSubstantiv(TxtPlantage0, TxtPlantage)		
	},
	html(div(class('table50'),[
   	    div(class('tr'), [
   	    	div(class('th'), TxtHauptBasis),
			div(class('td'), [
				\check('hauptBasis_vorhanden', HauptBasisVorhandenVal, 101),
	   	  	    input([	type('text'), 
	   	  	    		value('0'), 
	   	  	    		size(6), 
	   	  	    		minlength(1), 
	   	  	    		maxlength(6), 
	   	  	    		pattern('(^[1..9]*[0-9]*$)|Zeit'),
	   	  	    		name('hauptBasis_entfernung'),
	   	  	    		tabindex(102),
	   	  	    		disabled(true)
	   	  	    	  ]),
	   	  	   label([for('hauptBasis_entfernung')],[' 1/100 sec'])
			])
   	  	]),
   	    div(class('tr'), [
   	    	div(class('th'), TxtWasser),
   	    	\checkZeitUnitGruppe('wasser_vorhanden', WasserVorhandenVal, 102, 'wasser_entfernung', WasserEntfernungVal, 102)
   	  	]),
   	    div(class('tr'), [
   	    	div(class('th'), TxtAussenPosten),
   	    	\checkZeitUnitGruppe('aussenPosten_vorhanden', AussenPostenVorhandenVal, 103, 'aussenPosten_entfernung', AussenPostenEntfernungVal, 103)
   	  	]),
   	    div(class('tr'), [
   	    	div(class('th'), TxtRaumStation),
   	    	\checkZeitUnitGruppe('raumstation_vorhanden', RaumstationVorhandenVal, 104, 'raumstation_entfernung', RaumstationEntfernungVal, 104)
   	  	]),
  	    div(class('tr'), [
   	    	div(class('th'), TxtMittlereRaffinerie),
   	    	\checkZeitUnitGruppe('mittlereRaffinerie_vorhanden', MittlereRaffinerieVorhandenVal, 105, 'mittlereRaffinerie_entfernung', MittlereRaffinerieEntfernungVal, 105)
   	    ]),
    	    div(class('tr'), [
   	    	div(class('th'), TxtGrosseRaffinerie),
   	    	\checkZeitUnitGruppe('grosseRaffinerie_vorhanden', GrosseRaffinerieVorhandenVal, 106, 'grosseRaffinerie_entfernung', GrosseRaffinerieEntfernungVal, 106)
   	    ]),
   	    div(class('tr'), [
   	    	div(class('th'), TxtHandelsTerminal),
   	    	\checkZeitUnitGruppe('handelsTerminal_vorhanden', HandelsTerminalVorhandenVal, 107, 'handelsTerminal_entfernung', HandelsTerminalEntfernungVal, 107)
   	    ]),
   	    div(class('tr'), [
   	    	div(class('th'), TxtHandelsStation),
   	    	\checkZeitUnitGruppe('handelsStation_vorhanden', HandelsStationVorhandenVal, 108, 'handelsStation_entfernung', HandelsStationEntfernungVal, 108)
   	    ]),
   	  	div(class('tr'), [
   	    	div(class('th'), TxtKleineRaffinerie),
   	    	\checkZeitUnitGruppe('kleineRaffinerie_vorhanden', KleineRaffinerieVorhandenVal, 109, 'kleineRaffinerie_entfernung', KleineRaffinerieEntfernungVal, 109)
   	  	]),
   	  	div(class('tr'), [
   	    	div(class('th'), TxtNahrungsProzessor),
   	    	\checkZeitUnitGruppe('nahrungsProzessor_vorhanden', NahrungsProzessorVorhandenVal, 110, 'nahrungsProzessor_entfernung', NahrungsProzessorEntfernungVal, 110)
   	  	]),
   	  	div(class('tr'), [
   	    	div(class('th'), TxtBasisTerminus),
   	    	\checkZeitUnitGruppe('basisTerminus_vorhanden', BasisTerminusVorhandenVal, 111, 'basisTerminus_entfernung', BasisTerminusEntfernungVal, 111)
   	  	]),
   	  	div(class('tr'), [
   	    	div(class('th'), TxtForschungsTerminal),
   	    	\checkZeitUnitGruppe('konstruktionsStation_vorhanden', ForschungsTerminalVorhandenVal, 112, 'konstruktionsStation_entfernung', ForschungsTerminalEntfernungVal, 112)
   	  	]),
   	  	div(class('tr'), [
   	    	div(class('th'), TxtSauerStoffVerarbeiter),
   	    	\checkZeitUnitGruppe('sauerstoffVearbeiter_vorhanden', SauerstoffVearbeiterVal, 113, 'sauerstoffVearbeiter_entfernung', SauerstoffVearbeiterEntfernungVal, 113)
   	  	]),
   	  	div(class('tr'), [
   	    	div(class('th'), TxtAtmosphaerenAnlage),
   	    	\checkZeitUnitGruppe('atmosphaerenAnlage_vorhanden', AtmosphaerenAnlageVorhandenVal, 114, 'atmosphaerenAnlage_entfernung', AtmosphaerenAnlageEntfernungVal, 114)
   	  	]),
   	  	div(class('tr'), [
   	    	div(class('th'), TxtBergbauEinheit),
   	    	\checkZeitUnitGruppe('bergbauEinheit_vorhanden', BergbauEinheitVorhandenVal, 115, 'bergbauEinheit_entfernung', BergbauEinheitEntfernungVal, 115)
   	  	]),
   	  	div(class('tr'), [
   	    	div(class('th'), TxtPlantage),
   	    	\checkZeitUnitGruppe('plantage_vorhanden', PlantageVorhandenVal, 116, 'plantage_entfernung', PlantageEntfernungVal, 117)
   	  	])
   	  ])).

divInputReadOnly(Name, LabelText, Value, Index) -->
	html(
	div(class('td'), [
		label([ for(Name)],[LabelText]),
   	  	input([ name(Name),
   	  	  		class(text40Format),
   	  	  		type('text'), 
   	  	  		size(20), 
   	  	  		maxlength(20),
   	  	  		value(Value),
   	  	  		tabindex(Index),
   	  	  		readonly(true)
   	  	  	  ])
   	  	])
	).

checkZeitUnitGruppe(NameCheck, ValueCheck, IndexCheck, NameZeit, ValueZeit, IndexZeit) -->
	html(   	  	    
		div(class('td'), [
			\check(NameCheck, ValueCheck, IndexCheck),
   	  	    input([	type('text'), 
   	  	    		size(6), 
   	  	    		minlength(1), 
   	  	    		maxlength(6), 
   	  	    		pattern('(^[1..9]*[0-9]*$)|Zeit'),
   	  	    		name(NameZeit),
   	  	    		value(ValueZeit),
   	  	    		tabindex(IndexZeit)
   	  	    	  ]),
   	  	   label([for(NameZeit)],[' 1/100 sec'])
		])
	).

check(CheckName, CheckVal, Index) -->
	 { string_concat('<input type="checkbox" name=', CheckName, CheckedString0),
	   string_concat(CheckedString0, ' tabindex=', CheckedString1),
	   string_concat(CheckedString1, Index, CheckedString2),
	   ((CheckVal = true, string_concat(CheckedString2, ' checked>', CheckedString));
	    (CheckVal = false, string_concat(CheckedString2, '>', CheckedString))
	   )
	 },
	 html(
	 	\[CheckedString]
  	).

/* -----------------------------------  Abspeichern und Antwort ------------------------------------- */
planetenEigenschaften(Request) :-
	member(method(post), Request), !,
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0]),
	 auswahlPlanet(AuswahlPlanet, [length > 0]),
	 
     hauptBasis_vorhanden(HauptBasisVorhanden, [default(off)]),
     wasser_vorhanden(WasserVorhanden, [default(off)]),
     aussenPosten_vorhanden(AussenPostenVorhanden, [default(off)]),
     raumstation_vorhanden(RaumstationVorhanden, [default(off)]),
     
     mittlereRaffinerie_vorhanden(RaffinerieMittelVorhanden, [default(off)]),
     grosseRaffinerie_vorhanden(RaffinerieGrossVorhanden, [default(off)]),
     handelsTerminal_vorhanden(HandelsTerminalVorhanden, [default(off)]),
     handelsStation_vorhanden(HandelsStationVorhanden, [default(off)]),
     
     kleineRaffinerie_vorhanden(RaffinerieKleinVorhanden, [default(off)]),
     nahrungsProzessor_vorhanden(NahrungsProzessorVorhanden, [default(off)]),
     basisTerminus_vorhanden(BasisTerminusVorhanden, [default(off)]),
     konstruktionsStation_vorhanden(KonstruktionsStationVorhanden, [default(off)]),
	 sauerstoffVearbeiter_vorhanden(SauerstoffVearbeiterVorhanden, [default(off)]),
	 atmosphaerenAnlage_vorhanden(AtmosphaerenAnlageVorhanden, [default(off)]),
	 bergbauEinheit_vorhanden(BergbauEinheitVorhanden, [default(off)]),
	 plantage_vorhanden(PlantageVorhanden, [default(off)]),

     wasser_entfernung(WasserEntfernung, [default('Zeit')]), 
     aussenPosten_entfernung(AussenPostenEntfernung, [default('Zeit')]),
     raumstation_entfernung(RaumstationEntfernung, [default('Zeit')]), 
	 mittlereRaffinerie_entfernung(RaffinerieMittelEntfernung, [default('Zeit')]),
	 grosseRaffinerie_entfernung(RaffinerieGrossEntfernung, [default('Zeit')]),
	 handelsTerminal_entfernung(HandelsTerminalEntfernung, [default('Zeit')]),
	 handelsStation_entfernung(HandelsStationEntfernung, [default('Zeit')]),
	 
     kleineRaffinerie_entfernung(RaffinerieKleinEntfernung, [default('Zeit')]),
     nahrungsProzessor_entfernung(NahrungsProzessorEntfernung, [default('Zeit')]), 
     basisTerminus_entfernung(BasisTerminusEntfernung, [default('Zeit')]), 
     konstruktionsStation_entfernung(KonstruktionsStationEntfernung, [default('Zeit')]),
     sauerstoffVearbeiter_entfernung(SauerstoffVerarbeiter, [default('Zeit')]),
     atmosphaerenAnlage_entfernung(AtmosphaerenAnlageEntfernung, [default('Zeit')]),
     bergbauEinheit_entfernung(BergbauEinheitEntfernung, [default('Zeit')]),
     plantage_entfernung(PlantageEntfernung, [default('Zeit')])
    ]),
    ((WasserVorhanden = on, WasserEntfernung = 'Zeit', fehlerBehandlungGruppe(ortWasser));
     (AussenPostenVorhanden = on, AussenPostenEntfernung = 'Zeit', fehlerBehandlungGruppe(ortAussenPosten));
     (RaumstationVorhanden = on, RaumstationEntfernung = 'Zeit', fehlerBehandlungGruppe(ortRaumStation));
     (RaffinerieMittelVorhanden = on, RaffinerieMittelEntfernung = 'Zeit', fehlerBehandlungGruppe(ortMittlereRaffinerie));
     (RaffinerieGrossVorhanden = on, RaffinerieGrossEntfernung = 'Zeit', fehlerBehandlungGruppe(ortGrosseRaffinerie));
     (HandelsTerminalVorhanden = on, HandelsTerminalEntfernung = 'Zeit', fehlerBehandlungGruppe(ortHandelsTerminal));
     (HandelsStationVorhanden = on, HandelsStationEntfernung = 'Zeit', fehlerBehandlungGruppe(ortHandelsStation));
     (RaffinerieKleinVorhanden = on, RaffinerieKleinEntfernung = 'Zeit', fehlerBehandlungGruppe(ortKleineRaffinerie));
     (NahrungsProzessorVorhanden = on, NahrungsProzessorEntfernung = 'Zeit', fehlerBehandlungGruppe(ortNahrungsProzessor));
     (BasisTerminusVorhanden = on, BasisTerminusEntfernung = 'Zeit', fehlerBehandlungGruppe(ortBasisTerminus));
     (KonstruktionsStationVorhanden = on, KonstruktionsStationEntfernung = 'Zeit', fehlerBehandlungGruppe(ortForschungsTerminal));
     (SauerstoffVearbeiterVorhanden = on, SauerstoffVerarbeiter = 'Zeit', fehlerBehandlungGruppe(ortSauerStoffVerarbeiter));
     (BergbauEinheitVorhanden = on, BergbauEinheitEntfernung = 'Zeit', fehlerBehandlungGruppe(ortBergbauEinheit));
     (AtmosphaerenAnlageVorhanden = on, AtmosphaerenAnlageEntfernung = 'Zeit', fehlerBehandlungGruppe(ortAtmosphaerenAnlage));
     (PlantageVorhanden = on, PlantageEntfernung = 'Zeit', fehlerBehandlungGruppe(ortPlantage));
     (HauptBasisVorhanden = off,
      WasserVorhanden = off,
      AussenPostenVorhanden = off,
      RaumstationVorhanden = off,
      RaffinerieMittelVorhanden = off,
      RaffinerieGrossVorhanden = off,
      HandelsTerminalVorhanden = off,
      HandelsStationVorhanden = off,
      RaffinerieKleinVorhanden = off,
      NahrungsProzessorVorhanden = off,
      BasisTerminusVorhanden = off,
      KonstruktionsStationVorhanden = off,
      SauerstoffVearbeiterVorhanden = off,
      AtmosphaerenAnlageVorhanden = off,
      BergbauEinheitVorhanden = off,
      PlantageVorhanden = off,
      ignore(retractall(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, _], _))),
      gespeichert
     );
     (ausgabe:zeitFeldToNumber(WasserEntfernung, WasserEntfernungNum),
      ausgabe:zeitFeldToNumber(AussenPostenEntfernung, AussenPostenEntfernungNum),
      ausgabe:zeitFeldToNumber(RaumstationEntfernung, RaumstationEntfernungNum),
      ausgabe:zeitFeldToNumber(RaffinerieMittelEntfernung, RaffinerieMittelEntfernungNum),
      ausgabe:zeitFeldToNumber(RaffinerieGrossEntfernung, RaffinerieGrossEntfernungNum),
      ausgabe:zeitFeldToNumber(HandelsTerminalEntfernung, HandelsTerminalEntfernungNum),
      ausgabe:zeitFeldToNumber(HandelsStationEntfernung, HandelsStationEntfernungNum),
      ausgabe:zeitFeldToNumber(RaffinerieKleinEntfernung, RaffinerieKleinEntfernungNum),
      ausgabe:zeitFeldToNumber(NahrungsProzessorEntfernung, NahrungsProzessorEntfernungNum),
      ausgabe:zeitFeldToNumber(BasisTerminusEntfernung, BasisTerminusEntfernungNum),
      ausgabe:zeitFeldToNumber(KonstruktionsStationEntfernung, KonstruktionsStationEntfernungNum),
      ausgabe:zeitFeldToNumber(SauerstoffVerarbeiter, SauerstoffVerarbeiterNum),
      ausgabe:zeitFeldToNumber(AtmosphaerenAnlageEntfernung, AtmosphaerenAnlageEntfernungNum),
      ausgabe:zeitFeldToNumber(BergbauEinheitEntfernung, BergbauEinheitEntfernungNum),
      ausgabe:zeitFeldToNumber(PlantageEntfernung, PlantageEntfernungNum),
      (spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortSpieler], Entfernung);
       Entfernung = -1
      ),
      ignore(retractall(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, _], _))),
      (Entfernung = -1;
       assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortSpieler], Entfernung))
      ),
      (HauptBasisVorhanden = off; 
       (assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortHauptBasis], 0)),
      	assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortWald], 1500)),
      	assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortWeltRaum], 1431)), 
      	assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortAnomalie], 1444)) 
      )),
      (WasserVorhanden = off; 
       assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortWasser], WasserEntfernungNum))
      ),
      (AussenPostenVorhanden = off; 
       assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortAussenPosten], AussenPostenEntfernungNum))
      ),
      (RaumstationVorhanden = off; 
       assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortRaumStation], RaumstationEntfernungNum))
      ),
      (RaffinerieMittelVorhanden = off; 
       assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortMittlereRaffinerie], RaffinerieMittelEntfernungNum))
      ),
      (RaffinerieGrossVorhanden = off; 
       assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortGrosseRaffinerie], RaffinerieGrossEntfernungNum))
      ),
      (HandelsTerminalVorhanden = off; 
       assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortHandelsTerminal], HandelsTerminalEntfernungNum))
      ),
      (HandelsStationVorhanden = off; 
       assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortHandelsStation], HandelsStationEntfernungNum))
      ),
      (RaffinerieKleinVorhanden = off; 
       assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortKleineRaffinerie], RaffinerieKleinEntfernungNum))
      ),
      (NahrungsProzessorVorhanden = off; 
       assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortNahrungsProzessor], NahrungsProzessorEntfernungNum))
      ),
      (BasisTerminusVorhanden = off; 
       assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortBasisTerminus], BasisTerminusEntfernungNum))
      ),
      (KonstruktionsStationVorhanden= off; 
       assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortForschungsTerminal], KonstruktionsStationEntfernungNum))
      ),
      (SauerstoffVearbeiterVorhanden= off; 
       assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortSauerStoffVerarbeiter], SauerstoffVerarbeiterNum))
      ),
      (AtmosphaerenAnlageVorhanden= off; 
       assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortAtmosphaerenAnlage], AtmosphaerenAnlageEntfernungNum))
      ), 
      (BergbauEinheitVorhanden= off; 
       assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortBergbauEinheit], BergbauEinheitEntfernungNum))
      ), 
      (PlantageVorhanden= off; 
       assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortPlantage], PlantageEntfernungNum))
      ), 
	  gespeichert
	)).
	  
	  
gespeichert :-
      server:holeCssAlsStyle(StyleString),
	  TermerizedHead = [\[StyleString], title('No mans Sky trainer: Planeteneigenschaften gespeichert')],
	  TermerizedBody = [
		\['<header>'],
		h3(align(center),'gespeichert!'),
		\['</header>'],
		\['<formSpace>'], 
		p(\['<a href="/" > Funktionsauswahl </a>']),
		\['</formSpace>']
		             ],
	  reply_html_page(TermerizedHead, TermerizedBody).

fehlerBehandlungGruppe(Gruppe) :-
   	server:holeCssAlsStyle(StyleString),
	textResources:getText(Gruppe, TxtGruppe),
	textResources:getText(txtDieEinrichtung, TxtDieEinrichtung),
	textResources:getText(txtVorhandenGekennzeichnet, TxtVorhandenGekennzeichnet),
   	string_concat(TxtDieEinrichtung, TxtGruppe, FehlerMeldung0),
   	string_concat(FehlerMeldung0, TxtVorhandenGekennzeichnet, FehlerMeldung),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Planeteneigenschaften Fehler')],
	TermerizedBody = [
		\['<redHeader>'],
		h3(align(center), FehlerMeldung),
		\['</redHeader>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).

	