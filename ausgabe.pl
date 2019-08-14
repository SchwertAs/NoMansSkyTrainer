:- module(ausgabe, [ausgabe/1, ausgabeSummen/5]).
	
ausgabe(Vorgaenge) :-
	gebeAus(Vorgaenge).
	
gebeAus(Vorgaenge) :-
	Vorgaenge = [].
	
gebeAus(Vorgaenge) :-
	Vorgaenge = [ Kopf | Rest], 
	Kopf = [_, [Operation, _], _, [_, _]],
	(Operation = raffinieren; Operation = herstellen; Operation = bauen),
	format('~k~n', [Kopf]),
	gebeAus(Rest),
	!.		

gebeAus(Vorgaenge) :-
	Vorgaenge = [ _ | Rest], 
	gebeAus(Rest).		

ausgabeSammlung(SammelSet) :-
	format('~n', []),
	format('~k~n', SammelSet).
    
ausgabeSummen(GesamtZahl, GesamtWertSammlung, GesamtZeit, GesamtKosten, GesamtWertEndProdukt) :-
	format('Sammeln Gesamtbedarf: ~k Stück~n', GesamtZahl),
    format('Gesamtwert Sammlung: ~k Units~n', GesamtWertSammlung),
    format('GesamtZeitAufwand: ~k 1/100 sec~n', GesamtZeit),
    format('Kosten: ~k Units~n', GesamtKosten),
    format('Gesamtwert Endstoff: ~k Units~n', GesamtWertEndProdukt),
    MehrWert is GesamtWertEndProdukt - GesamtWertSammlung,
    format('Mehrwert: ~k Units~n', MehrWert).
