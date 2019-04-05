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
    format('Sammeln Gesamtbedarf: ~k~n', GesamtZahl),
    format('Gesamtwert Sammlung: ~k~n', GesamtWertSammlung),
    format('GesamtZeitAufwand: ~k~n', GesamtZeit),
    format('Kosten: ~k~n', GesamtKosten),
    format('Gesamtwert Endstoff: ~k~n', GesamtWertEndProdukt),
    MehrWert is GesamtWertEndProdukt - GesamtKosten,
    format('Mehrwert: ~k~n', MehrWert).
