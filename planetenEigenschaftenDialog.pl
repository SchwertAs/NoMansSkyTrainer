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
	planetAuswahlDialog:systemAuswahlDialog(
	  'Eigenschaften Himmelskörper eingeben: Systemauswahl',
	  '/planetenEigenschaftenDialogPlanetAuswahl').


/* -----------------------------------  Planetauswahl ----------------------------------------------- */
planetenEigenschaftenDialogPlanetAuswahl(Request) :-
	planetAuswahlDialog:planetAuswahlDialog(
	  'Eigenschaften Himmelskörper eingeben: Himmelskörperauswahl',
	  '/planetenEigenschaftenDialog',
	  Request
	).
	
/* -----------------------------------  Eigenschaften eingeben -------------------------------------- */
planetenEigenschaftenDialog(Request) :-
	member(method(post), Request), !,
	http_parameters(Request, 
	[auswahlSystem(AuswahlSystem, [length > 0]),
	 auswahlPlanet(AuswahlPlanet, [length > 0])
	]),
	(AuswahlPlanet = 'Bitte wählen' -> planetAuswahlDialog:fehlerBehandlung; 
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
	 (spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortSauerStoffVearbeiter], SauerstoffVearbeiterEntfernungValNum) -> SauerstoffVearbeiterVal=true; SauerstoffVearbeiterVal=false),
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

	TermerizedBody = [
	\['<header>'],
    h1([align(center)], ['Eigenschaften Himmelskörper eingeben']),
    \['</header>'],
	\['<formSpace>'],       
    form([action('/planetenEigenschaften'), method('post'), name('planetenEigenschaftenAuswahlForm')], 
       	 [h3('Auswahl Himmelskörper'),
       	  \eingabeTabelleReadOnly(AuswahlSystem, AuswahlPlanet),
       	  h3('Einrichtungen und ihre Reisezeit von der Hauptbasis'),
	      h4('Jeweils die Einrichtung mit der kürzesten Entfernung zur Hauptbasis angeben!'),
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
		    	  [td([button([name("submit"), type("submit")], 'OK')]),
		    	   td([button([name("reset"), type("reset")], 'reset')])
		    	  ]))    
		 ]),
	\['</formSpace>']		             ],       
	server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: System-Eigenschaften')],
	reply_html_page(TermerizedHead, TermerizedBody).

eingabeTabelleReadOnly(AuswahlSystem, AuswahlPlanet) -->
	html(
   	  div(class('table50'),[
   	    div(class('tr'), [
   	    	\divInputReadOnly('auswahlSystem', 'System: ', AuswahlSystem, 1),
   	    	\divInputReadOnly('auswahlPlanet', 'Planet: ', AuswahlPlanet, 2)
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
	html(div(class('table50'),[
   	    div(class('tr'), [
   	    	div(class('th'), 'Hauptbasis'),
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
   	    	div(class('th'), 'Wasser'),
   	    	\checkZeitUnitGruppe('wasser_vorhanden', WasserVorhandenVal, 102, 'wasser_entfernung', WasserEntfernungVal, 102)
   	  	]),
   	    div(class('tr'), [
   	    	div(class('th'), 'Außenposten'),
   	    	\checkZeitUnitGruppe('aussenPosten_vorhanden', AussenPostenVorhandenVal, 103, 'aussenPosten_entfernung', AussenPostenEntfernungVal, 103)
   	  	]),
   	    div(class('tr'), [
   	    	div(class('th'), 'Raumstation'),
   	    	\checkZeitUnitGruppe('raumstation_vorhanden', RaumstationVorhandenVal, 104, 'raumstation_entfernung', RaumstationEntfernungVal, 104)
   	  	]),
  	    div(class('tr'), [
   	    	div(class('th'), 'Mittlere Raffinerie'),
   	    	\checkZeitUnitGruppe('mittlereRaffinerie_vorhanden', MittlereRaffinerieVorhandenVal, 105, 'mittlereRaffinerie_entfernung', MittlereRaffinerieEntfernungVal, 105)
   	    ]),
    	    div(class('tr'), [
   	    	div(class('th'), 'Große Raffinerie'),
   	    	\checkZeitUnitGruppe('grosseRaffinerie_vorhanden', GrosseRaffinerieVorhandenVal, 106, 'grosseRaffinerie_entfernung', GrosseRaffinerieEntfernungVal, 106)
   	    ]),
   	    div(class('tr'), [
   	    	div(class('th'), 'Handelsterminal'),
   	    	\checkZeitUnitGruppe('handelsTerminal_vorhanden', HandelsTerminalVorhandenVal, 107, 'handelsTerminal_entfernung', HandelsTerminalEntfernungVal, 107)
   	    ]),
   	    div(class('tr'), [
   	    	div(class('th'), 'Handelsstation'),
   	    	\checkZeitUnitGruppe('handelsStation_vorhanden', HandelsStationVorhandenVal, 108, 'handelsStation_entfernung', HandelsStationEntfernungVal, 108)
   	    ]),
   	  	div(class('tr'), [
   	    	div(class('th'), 'kleine Raffinerie'),
   	    	\checkZeitUnitGruppe('kleineRaffinerie_vorhanden', KleineRaffinerieVorhandenVal, 109, 'kleineRaffinerie_entfernung', KleineRaffinerieEntfernungVal, 109)
   	  	]),
   	  	div(class('tr'), [
   	    	div(class('th'), 'Nahrungsprozessor'),
   	    	\checkZeitUnitGruppe('nahrungsProzessor_vorhanden', NahrungsProzessorVorhandenVal, 110, 'nahrungsProzessor_entfernung', NahrungsProzessorEntfernungVal, 110)
   	  	]),
   	  	div(class('tr'), [
   	    	div(class('th'), 'Basisterminus'),
   	    	\checkZeitUnitGruppe('basisTerminus_vorhanden', BasisTerminusVorhandenVal, 111, 'basisTerminus_entfernung', BasisTerminusEntfernungVal, 111)
   	  	]),
   	  	div(class('tr'), [
   	    	div(class('th'), 'Konstruktionsforschungsstation'),
   	    	\checkZeitUnitGruppe('konstruktionsStation_vorhanden', ForschungsTerminalVorhandenVal, 112, 'konstruktionsStation_entfernung', ForschungsTerminalEntfernungVal, 112)
   	  	]),
   	  	div(class('tr'), [
   	    	div(class('th'), 'Sauerstoffverarbeiter'),
   	    	\checkZeitUnitGruppe('sauerstoffVearbeiter_vorhanden', SauerstoffVearbeiterVal, 113, 'sauerstoffVearbeiter_entfernung', SauerstoffVearbeiterEntfernungVal, 113)
   	  	]),
   	  	div(class('tr'), [
   	    	div(class('th'), 'Atmosphaerenanlage'),
   	    	\checkZeitUnitGruppe('atmosphaerenAnlage_vorhanden', AtmosphaerenAnlageVorhandenVal, 114, 'atmosphaerenAnlage_entfernung', AtmosphaerenAnlageEntfernungVal, 114)
   	  	]),
   	  	div(class('tr'), [
   	    	div(class('th'), 'Bergbaueinheit'),
   	    	\checkZeitUnitGruppe('bergbauEinheit_vorhanden', BergbauEinheitVorhandenVal, 115, 'bergbauEinheit_entfernung', BergbauEinheitEntfernungVal, 115)
   	  	]),
   	  	div(class('tr'), [
   	    	div(class('th'), 'Plantage'),
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
    ((WasserVorhanden = on, WasserEntfernung = 'Zeit', fehlerBehandlungGruppe('Wasser'));
     (AussenPostenVorhanden = on, AussenPostenEntfernung = 'Zeit', fehlerBehandlungGruppe('AussenPosten'));
     (RaumstationVorhanden = on, RaumstationEntfernung = 'Zeit', fehlerBehandlungGruppe('Raumstation'));
     (RaffinerieMittelVorhanden = on, RaffinerieMittelEntfernung = 'Zeit', fehlerBehandlungGruppe('mittlere Raffinerie'));
     (RaffinerieGrossVorhanden = on, RaffinerieGrossEntfernung = 'Zeit', fehlerBehandlungGruppe('große Raffinerie'));
     (HandelsTerminalVorhanden = on, HandelsTerminalEntfernung = 'Zeit', fehlerBehandlungGruppe('Handelsterminal'));
     (HandelsStationVorhanden = on, HandelsStationEntfernung = 'Zeit', fehlerBehandlungGruppe('Handelsstation'));
     (RaffinerieKleinVorhanden = on, RaffinerieKleinEntfernung = 'Zeit', fehlerBehandlungGruppe('kleine Raffinerie'));
     (NahrungsProzessorVorhanden = on, NahrungsProzessorEntfernung = 'Zeit', fehlerBehandlungGruppe('Nahrungsprozessor'));
     (BasisTerminusVorhanden = on, BasisTerminusEntfernung = 'Zeit', fehlerBehandlungGruppe('Basisterminus'));
     (KonstruktionsStationVorhanden = on, KonstruktionsStationEntfernung = 'Zeit', fehlerBehandlungGruppe('Konstruktionsstation'));
     (SauerstoffVearbeiterVorhanden = on, SauerstoffVerarbeiter = 'Zeit', fehlerBehandlungGruppe('Sauerstoffverarbeiter'));
     (BergbauEinheitVorhanden = on, BergbauEinheitEntfernung = 'Zeit', fehlerBehandlungGruppe('Bergbaueinheit'));
     (AtmosphaerenAnlageVorhanden = on, AtmosphaerenAnlageEntfernung = 'Zeit', fehlerBehandlungGruppe('Atmosphaerenanlage'));
     (PlantageVorhanden = on, PlantageEntfernung = 'Zeit', fehlerBehandlungGruppe('Plantage'));
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
       assertz(spielStatus:systemAusstattung([AuswahlSystem, AuswahlPlanet, ortSauerStoffVearbeiter], SauerstoffVerarbeiterNum))
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
   	string_concat('Die Einrichtung ', Gruppe, FehlerMeldung0),
   	string_concat(FehlerMeldung0, ' ist als vorhanden gekennzeichnet, aber die Zeitangabe fehlt', FehlerMeldung),
	TermerizedHead = [\[StyleString], title('No mans Sky trainer: Planeteneigenschaften Fehler')],
	TermerizedBody = [
		\['<redHeader>'],
		h3(align(center), FehlerMeldung),
		\['</redHeader>'],
		\['<formSpace>'], 
		p(\['<a href="/" > Funktionsauswahl </a>']),
		\['</formSpace>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).

	