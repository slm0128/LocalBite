Ja, so würde ich es für LocalBite fest definieren:

Abrechnung pro Kalenderwoche: Am Ende der Bestellfrist wird der Gesamtpreis der Woche berechnet und automatisch über die hinterlegte Zahlungsmethode abgebucht.
Abo: Das Abo läuft automatisch weiter, bis der Kunde kündigt. (Pausieren nicht möglich)
Lieferkosten inklusive: Bei Abo-Kunden sind die regulären Lieferungen bereits enthalten.
Stammkundenrabatt: Nach längerer Nutzung kann der Kunde einen Rabatt bekommen, z. B. 2 % ab der 8. Woche. -> wie bei Duolingo
Spontanbestellung: Möglich, aber nicht im Abo enthalten bzw. mit zusätzlichem Liefer-/Kurzfristigkeitsaufschlag.

Beispiel:Kunde ist in Woche 5, bestellt Lebensmittel für 62 €. Seine regulären Lieferungen sind durch das Abo abgedeckt → 62 € werden für diese Woche abgerechnet. Später als Stammkunde mit 5 % Rabatt wären es 58,90 €.
Das ist für euer Modell sehr verständlich und lässt sich auch sauber in Use Cases und Klassen abbilden.

Also sauber getrennt:
Abo = Vertrags-/Bestellmodell
Bestellung = konkrete Lebensmittel für eine Woche
Lieferung = Transport zum Kunden
Box = Behälter der Lieferung
Boxinhalt = Produkte aus der Bestellung