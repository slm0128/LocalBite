# 07 – Liefergebiet & Planung

> Legt den räumlichen und zeitlichen Rahmen fest. Betrifft den Landkreis-Filter (Kunden-App) und
> das in BPMN 05 bereits angelegte, aber nicht konkretisierte T-2/T-1/T-0-Planungsmodell.

## Zentrale Fragen

1. **Wie groß ist das Liefergebiet** und wie wird es bestimmt?
2. **Welche konkreten Cutoff-/Planungszeiten** gelten?
3. **In welchem Rhythmus** wird geliefert?

---

## Teil A – Liefergebiet

- Aus dem Brainstorming: **PLZ-/Landkreis-Filter** – Kunde gibt PLZ ein → nur Höfe im Umkreis von
  **X km** werden angezeigt.
- Zu entscheiden: **Radius X** (z. B. 25 / 50 km?) · Start mit **einer Pilotregion** oder mehreren?
- Hängt am Lagermodell (Thema 03): zentral = ein großer Radius; regionale Mini-Hubs = mehrere kleine.

**💡 Vorschlag:** Start mit **einer Pilotregion** (ein Landkreis) und Radius ~**30 km**. Klein,
glaubwürdig, gut im Pitch erklärbar.

---

## Teil B – Planungszeiten (T-2 / T-1 / T-0)

> In BPMN 05 ist das Dreistufen-Modell bereits angelegt, aber die **konkreten Uhrzeiten/Cutoffs**
> sind ausdrücklich offen.

| Stufe | Bisher (BPMN 05) | Zu konkretisieren |
|---|---|---|
| **T-2** | Vorplanung (Forecast/Abos, grober Bedarf) | Wie viele Tage vorher genau? |
| **T-1** | Hauptplanung (Punkte, Bündelung, Optimierung) | Uhrzeit? |
| **T-0** | Finaler Check & verbindliche Freigabe | Uhrzeit? |

Zu entscheiden:
- **Bestell-Cutoff** – bis wann kann ein Kunde für Liefertag `D` bestellen/ändern?
- Wie weit darf eine **freigegebene Tour nach T-1/T-0** noch geändert werden?

**💡 Vorschlag:** Cutoff z. B. **T-1, 18:00 Uhr**; danach nur noch Ausnahme-Nachplanung am T-0.

---

## Teil C – Lieferrhythmus

- Feste **Liefertage** je Gebiet (z. B. 1–2 feste Tage/Woche) vs. tägliche Lieferung?
- Hängt am Abo-Modell (Thema 02).

**💡 Vorschlag:** **Feste Liefertage je Gebiet** – bündelt Touren, senkt Kosten, passt zum Wochen-Abo.

## ✅ Team-Entscheidung

```
Liefergebiet/Radius:  _______________________________________
Cutoff & T-Zeiten:    _______________________________________
Lieferrhythmus:       _______________________________________
```

## 📌 Betrifft

- BPMN 05 (Timer/Cutoffs), Kunden-App (PLZ-Filter), Abo-Prozesse
- UML-Klassen: `Route`, evtl. `Liefergebiet`/`Zeitfenster`
- Thema 02 (Abo-Rhythmus) und 03 (Hub-Reichweite)
