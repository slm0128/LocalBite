Die drei Datenelemente würde ich genau so verwenden:
Rückgabeverwaltung [Data Store]
= dauerhafte Daten zum Rückgabefall

- Rückgabefall-ID
- Kunde
- Rückgabefrist
- Rückgabedatum
- aktueller Pfandanspruch
- Rückgabestatus

Boxregister [Data Store]
= dauerhafte Daten zur physischen Box

- Box-ID
- Boxgröße
- aktueller Zustand
- bisherige Schäden
- Wiederverwendbarkeit
- frühere Prüfungen

Prüfprotokoll [Data Object]
= konkrete Prüfung bei dieser einen Rückgabe

- Box-ID
- Rückgabezeitpunkt
- festgestellter Zustand
- neuer Schaden ja/nein
- wiederverwendbar ja/nein

Damit ist die Trennung sauber: Rückgabeverwaltung = Fall/Pfand, Boxregister = Box-Historie, Prüfprotokoll = aktuelle Einzelprüfung. Genau dafür unterscheidet BPMN Datenobjekt und Datenspeicher.