# 09 – Automatisierungspotential

> **Pflichtartefakt der Fallstudie:** „Festlegung eines Aspekts innerhalb des
> Geschäftsprozessumfelds, der durch eine spezielle Software automatisiert werden kann" – mit
> *passender Komplexität und ausreichendem Originalitätspotenzial*.

## Zentrale Frage

Welcher **eine** Aspekt wird als Automatisierungspotential ausgewählt und vertieft?

## Anforderung (aus der Fallstudien-Beschreibung)

- Genau **ein** Aspekt.
- Muss **sinnvoll automatisierbar**, **ausreichend komplex** und **originell** sein (nicht trivial,
  nicht „nur DHL nachbauen").

## Kandidaten / Vorschläge

- **A) Intelligente Tourenplanung & Routing-Optimierung** *(BPMN 05)*
  Software bündelt Bestellungen automatisch zu optimalen Touren (Kapazität, Kühlung, Zeitfenster,
  Abhol- + Lieferreihenfolge).
  ➕ Hoher Komplexitäts-/Originalitätsgrad, Herzstück der Logistik, gut in Sequenzdiagramm darstellbar.

- **B) Bedarfsprognose & automatische Box-Zusammenstellung**
  System sagt aus Abos/Forecast den Bedarf voraus und stellt Boxen + Bestellungen an die Höfe
  automatisch zusammen.
  ➕ Verbindet Landwirt- und Kundenseite, stark fürs Geschäftsmodell. ➖ Etwas abstrakter zu zeigen.

- **C) Box- & Pfand-Tracking** *(BPMN 07)*
  Automatische Box-Identifikation (QR/RFID), Fristenüberwachung, Pfandberechnung, Box-Historie.
  ➕ Konkret, gut visualisierbar. ➖ Etwas enger im Umfang.

- **D) Dynamisches Fahrer-/Fahrzeug-Matching** *(BPMN 06)*
  Automatische Zuweisung passendes Fahrzeug → passender Fahrer je Touranforderung.

## 💡 Vorschlag

**Option A (Tourenplanung & Routing-Optimierung).** Begründung: Es ist der originellste,
komplexeste und zugleich am besten modellierbare Aspekt, hebt sich klar von einem simplen Paketdienst
ab (Projektleitlinie „nicht DHL nachbauen"), und BPMN 05 liefert dafür bereits die fachliche Grundlage.
Gut geeignet für eines der 5 Pflicht-**Sequenzdiagramme**.

> Alternative Kombination: A als Hauptfokus, B als ergänzende Erwähnung im Pitch.

## ✅ Team-Entscheidung

```
Gewähltes Automatisierungspotential: _______________________
Begründung:                          _______________________
Zugehöriges Sequenzdiagramm:         _______________________
```

## 📌 Betrifft

- Pflichtartefakt „Automatisierungspotential", 1 der 5 Sequenzdiagramme
- BPMN 05 / 06 / 07 (je nach Wahl)
- Pitch: zentrale „Software-Story" von LocalBite
