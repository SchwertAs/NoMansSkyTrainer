:- module(ausgabe, [ausgabe/1, ausgabeSummen/6]).
	
ausgabe(Vorgaenge) :-
	format('~n', []),
	gebeAus(Vorgaenge).
	
gebeAus(Vorgaenge) :-
	Vorgaenge = [].
	
gebeAus(Vorgaenge) :-
	Vorgaenge = [Kopf|Rest], 
	format('~k~n', [Kopf]),
	gebeAus(Rest).		
	
ausgabeSummen(SammelSet, GesamtZahl, GesamtWertSammlung, GesamtZeit, GesamtKosten, GesamtWertEndProdukt) :-
	format('~k~n', SammelSet),
    format('Sammeln Gesamtbedarf: ~k Stück~n', GesamtZahl),
    format('Gesamtwert Sammlung: ~k Units~n', GesamtWertSammlung),
    format('GesamtZeitAufwand: ~k 1/10 sec~n', GesamtZeit),
    format('Kosten: ~k Units~n', GesamtKosten),
    format('Gesamtwert Endstoff: ~k Units~n', GesamtWertEndProdukt),
    MehrWert is GesamtWertEndProdukt - GesamtKosten,
    format('Mehrwert: ~k Units~n', MehrWert).
