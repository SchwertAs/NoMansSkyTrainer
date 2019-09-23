:- module(ausgabe, [printMinSammlungForm/7]).

printMinSammlungForm(SammelSet, Vorgaenge, MinimalSammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes) :-
	format('<table width="25%" border="1">
			  <caption>
			    <h2>St�ckliste</h2>
			  </caption>
			  <tr>
			    <th scope="col">Anzahl&nbsp;</th>
			    <th scope="col">Stoff&nbsp;</th>
			  </tr>~n'
			),
	ausgabeSammlung(SammelSet),
	format('</table>~n'),
	format('<hr>~n', []),
	format('<table width="100%" border="1">
			  <caption>
			    <h2>Aktionsreihenfolge</h2>
			  </caption>
			  <tr>
			    <th scope="col">Anweisung&nbsp;</th>
			    <th scope="col">Operation&nbsp;</th>
			    <th scope="col">Ergebnis&nbsp;</th>
			  </tr>~n'),
	ausgabeVorgaenge(Vorgaenge),
	format('</table>~n'),
	format('<hr>~n', []),
	format('<table width="35%" border="1">
			  <caption>
			    <h2>Summenwerte</h2>
			  </caption>
			  <tr>
			    <th scope="col">Summenwert&nbsp;</th>
			    <th scope="col">Anzahl&nbsp;</th>
			    <th scope="col">Einheit&nbsp;</th>
			  </tr>~n'),
	ausgabeSummen(MinimalSammelZahl, GesamtWertSammlung, MinimalZeit, HandelswertSammlung, Erloes),
	format('</table>~n').

nichtHerstellBar(Stoff) :-
	stoff:stoff(_, Stoff, Wert),
	format('<h3>Stoff kann nicht hergestellt werden. Kaufwert ca. ~k</h3>', Wert).
	
ausgabeSammlung(SammelSet) :-
	dict_create(SammelSet0, 'SammelStueckliste', []),
	SammelSet = SammelSet0.
	
ausgabeSammlung(SammelSet) :-
	get_dict(Stoff, SammelSet, Vorgang),
	Vorgang = [Operation, _],
	Operation = bekannt,
	format('<tr>~n'),
	format('<td>~k&nbsp;</td>~n', 1),
	format('<td>~k&nbsp;</td>~n', Stoff),
	format('</tr>~n'),
	del_dict(Stoff, SammelSet, Vorgang, SammelSetDanach),
	ausgabeSammlung(SammelSetDanach),
	!. 

ausgabeSammlung(SammelSet) :-
	get_dict(Stoff, SammelSet, Vorgang),
	Vorgang = [Operation, SammelAnzahl],
	Operation \= bekannt,
	format('<tr>~n'),
	format('<td>~k&nbsp;</td>~n', SammelAnzahl),
	format('<td>~k&nbsp;</td>~n', Stoff),
	format('</tr>~n'),
	del_dict(Stoff, SammelSet, Vorgang, SammelSetDanach),
	ausgabeSammlung(SammelSetDanach),
	!. 
    
ausgabeVorgaenge(Vorgaenge) :-
	gebeAus(Vorgaenge).

gebeAus(Vorgaenge) :-
	Vorgaenge = [],
	!.
	
gebeAus(Vorgaenge) :-
	Vorgaenge = [ Kopf | Rest], 
	Kopf = [WandelAnz, Operation, Komponenten, [ProduktAnzahl, Produkt]],
	wandelAktion:wandelAktion(Operation, _),
	format('<tr>~n'),
	format('<td>F�hren Sie ', []),
	format('~k', WandelAnz),
	format(' mal '),
	format('~k', Operation),
	format(' von '),
	format('~k', Produkt),
	format(' unter Verwendung von '),
	gebeKomponenteAus(Komponenten),
	format(' aus'),
	format('.~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>~n', Operation),
	format('<td>'),
	format('~k ', ProduktAnzahl),
	format('Einheiten ~k', Produkt),
	format('~n&nbsp;</td>'),
	format('</tr>~n'),
	gebeAus(Rest),
	!.		

gebeAus(Vorgaenge) :-
	Vorgaenge = [ Kopf | Rest], 
	Kopf = [_, Operation, _, [_, Produkt]],
	Operation = bekannt,
	format('<tr>~n'),
	format('<td>'),
	format('Das ~k ist bekannt.', Produkt),
	format('~n&nbsp;</td>'),
	format('<td>&nbsp;</td>~n'),
	format('<td>~n&nbsp;</td>'),
	format('</tr>~n'),
	gebeAus(Rest),
	!.		

gebeAus(Vorgaenge) :-
	Vorgaenge = [ Kopf | Rest], 
	Kopf = [WandelAnz, Operation, _, [_, Produkt]],
	sammelAktion:sammelAktion(Operation, _),
	format('<tr>~n'),
	format('<td>'),
	format('Erlangen Sie ~k ', WandelAnz),
	format('Einheiten ~k mit ', Produkt),
	format('~k', Operation),
	format('.~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>~n', Operation),
	format('<td>'),
	format('~k ', WandelAnz),
	format('Einheiten ~k', Produkt),
	format('~n&nbsp;</td>'),
	format('</tr>~n'),
	gebeAus(Rest),
	!.		

gebeAus(Vorgaenge) :-
	Vorgaenge = [ Kopf | Rest], 
	Kopf = [_, Operation, [[_, _], [_, Nach]], [_, Produkt]],
	Operation = reisen,
	format('<tr>~n'),
	format('<td>'),
	format('Bitte ~k Sie nach ', Operation),
	format('~k.', Nach),
	format('~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>~n', Operation),
	format('<td>'),
	format('in ~k ', Nach),
	format('~k~n&nbsp;', Produkt),
	format('</tr>~n'),
	gebeAus(Rest),
	!.		

gebeAus(Vorgaenge) :-
	Vorgaenge = [ _ | Rest], 
	gebeAus(Rest),
	!.		 

gebeKomponenteAus(Komponenten) :-
	Komponenten = [].
	
gebeKomponenteAus(Komponenten) :-
	Komponenten = [ Kopf | Rest ],
	Kopf = [Anzahl, Stoff],
	format('~k x ', Anzahl),
	format('~k', Stoff),
	(Rest \= [], format(', '); format(' ')),
	gebeKomponenteAus(Rest),
	!.
	
ausgabeSummen(GesamtZahl, GesamtWertSammlung, GesamtZeit, GesamtKosten, GesamtWertEndProdukt) :-
	
	format('<tr>~n<td>Sammeln Gesamtbedarf~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>', GesamtZahl),
	format('<td>St�ck~n&nbsp;</td>~n</tr>'),
    format('<tr>~n<td>Gesamtwert Sammlung~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>', GesamtWertSammlung),
	format('<td>Units~n&nbsp;</td>~n</tr>'),
    format('<tr>~n<td>GesamtZeitAufwand~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>', GesamtZeit),
	format('<td>1/100 sec~n&nbsp;</td>~n</tr>'),
    format('<tr>~n<td>Kosten Eingangsstoffe~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>', GesamtKosten),
	format('<td>Units~n&nbsp;</td>~n</tr>'),
    format('<tr>~n<td>Gesamtwert Endstoff~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>', GesamtWertEndProdukt),
	format('<td>Units~n&nbsp;</td>~n</tr>'),
    MehrWert is GesamtWertEndProdukt - GesamtKosten,
    format('<tr>~n<td>Mehrwert~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>', MehrWert),
	format('<td>Units~n&nbsp;</td>~n</tr>'),
	berechneStundenLohn(GesamtZeit, MehrWert, StundenLohn),
    format('<tr>~n<td>Stundenlohn~n&nbsp;</td>'),
	format('<td>~k~n&nbsp;</td>', StundenLohn),
	format('<td>Units/Stunde~n&nbsp;</td>~n</tr>').

	berechneStundenLohn(GesamtZeit, _, StundenLohn) :-
		GesamtZeit = 0,
		StundenLohn = 0.
	
	berechneStundenLohn(GesamtZeit, MehrWert, StundenLohn) :-
	StundenLohn is round(MehrWert * 360000 / GesamtZeit).