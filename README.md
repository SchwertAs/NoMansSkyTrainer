# NoMansSkyTrainer
Expertensystem für das Spiel No Man's Sky (©Hello Games). Gibt Tipps wie man schnell im Spiel vorwärts kommt.
Ziele wie viel Geld ansammeln, oder einen Stoff mit wenig Grundstoffen zu bekommen sind mit dem Programm direkt erreichbar. Mit konkreten Handlungsanweisungen unterstützt das Programm den Spieler. Die Tipps berücksichtigt dabei die jeweilige Lage im Spiel.
- Eingabe der Spielsituation über konfortable Dialoge
- Übersichtliche Ausgabe der Handlungsanweisungen
- Mehrere Optimierungsstrategieen 
  - wenig Einsatzmaterial
  - kurze Bauzeit
  - minimale Kosten (units)
- Unterstützung für Rezeptbeschaffung
- Kochrezepte enthalten
- Raffinerierezepte enthalten
- Sammelmöglichkeiten spezifisch für den Planetentyp

# Installation:
- Der Trainer benötigt eine SWI Prolog Installation. 
  - Das Prolog System ist zu finden unter: https://swi-prolog.org/downloads/stable.
  - Dort das 32 oder 64 bit Windows Subsystem auswählen und installieren. 
  - Dabei Swipl in den Pfad aufnehmen und alle Optionen installieren.
- noMansSkyTrainer.exe aus der Distribution in beliebiges Verzeichnis auf eigenem Rechner kopieren.
- Start mit Doppelklick auf das Exe im Verzeichnis. Das Verzeichnis muss Schreibrechte haben, damit das Programm seine Datenbank anlegen kann.
- Eventuell kommt eine Meldung von der Firewall, ob man den Port 8000 erlauben möchte. Dem bitte zustimmen.
- Die Anwendung ist als Web Server programmiert.
- Der Anwendungsserver ist nach dem Start des Exe Files unter http://localhost:8000 erreichbar.
- Durch weiteren Tastendruck im Konsolenfenster wird der Server wieder beendet

# Deinstallation
Das Verzeichnis mit noMansSkyTrainer.exe komplett löschen. Der Trainer ist damit vollständig entfernt. Wenn gewünscht kann auch das Prolog System mit Hilfe der Systemsteuerung (Syatemsteuerung->Apps->SWI-Prolog x.x.x->Deinstalllieren) entfernt werden.
