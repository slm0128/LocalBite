# 02 – Produkt, Wochenbox & Abo

> Klärt, **was** LocalBite eigentlich verkauft. Ohne eine klare Definition von „Wochenbox" und
> „Abo" bleiben Bestellung, Zahlung und Box-Management unscharf.

## Zentrale Fragen

1. **Was genau ist eine „Wochenbox"?**
2. **Was ist ein „Abo"** – und wie verhält es sich zur Einmalbestellung?

---

## Teil A – Was ist eine Wochenbox?

### Optionen / Vorschläge
- **A) Feste kuratierte Box** – LocalBite stellt zusammen (saisonal, „Überraschungsbox"). Kunde
  wählt nur Größe/Typ (z. B. „Gemüsebox 2 Personen").
  ➕ Einfach, planbar, starkes Markenprodukt. ➖ Weniger Kundenfreiheit.
- **B) Konfigurierbare Box** – Kunde stellt aus einem Katalog selbst zusammen (Mindestbestellwert).
  ➕ Flexibel. ➖ Planung/Logistik komplexer, schwerer zu bündeln.
- **C) Reine Einzelprodukte** – gar keine „Box", nur einzelne Produkte wie im Online-Shop.
  ➕ Simpel. ➖ Verliert das Alleinstellungsmerkmal „HelloFresh".
- **D) Hybrid** – feste Basis-Box + optionale Zusatzprodukte.
  ➕ Beste Mischung. ➖ Etwas mehr Modellierungsaufwand.

**💡 Vorschlag:** **A** oder **D**. Die kuratierte Box ist das Herzstück der Idee und am klarsten
modellierbar. „Wochenbox" = eine zu einem Liefertermin gebündelte, kuratierte Zusammenstellung
regionaler Produkte in einer Mehrweg-Pfandbox (siehe Thema 05).

---

## Teil B – Was ist ein Abo?

> Aus dem Feedback (Mitschrift): **„erst Account anlegen, dann Abo anbieten/abschließen, ein Abo pro
> Account"** und **„Abo verwalten nötig?"**

### Optionen / Vorschläge
- **A) Festes wiederkehrendes Abo** – z. B. wöchentlich/14-tägig automatisch, **pausierbar** und
  änderbar. Einmalbestellung als Sonderfall ohne Abo.
  ➕ Planbare Nachfrage (gut für Forecast/Logistik). ➖ Bindung schreckt manche ab.
- **B) Flexibles Abo** – Rahmen besteht, aber jede Lieferung wird aktiv bestätigt/abbestellt.
  ➕ Kundenfreundlich. ➖ Schlechter planbar.
- **C) Kein Abo, nur Einmalbestellung** – jede Bestellung einzeln.
  ➕ Einfachste Logik. ➖ Widerspricht „Abo-System" im Projekttitel.

**Festlegungen aus dem Feedback (als gesetzt behandeln, bis widerrufen):**
- Reihenfolge: **Account anlegen → danach Abo abschließen**
- **Ein Abo pro Account**
- **Abo verwalten** (Pausieren/Ändern/Kündigen) ist ein eigener Prozess → gehört modelliert

**💡 Vorschlag:** **Option A** – festes, pausierbares Abo + mögliche Einmalbestellung. Passt zu
„Abo-System", liefert planbare Nachfrage für die Logistik (Thema 07) und deckt die bestehenden
BPMN „Abo abschließen" / „Abo verwalten" sauber ab.

## ✅ Team-Entscheidung

```
Wochenbox:          ___________________________________________
Abo-Modell:         ___________________________________________
Einmalbestellung?:  ___________________________________________
```

## 📌 Betrifft

- BPMN: Abo abschließen (01), Abo verwalten (02), Box & Lieferanten (09)
- UML-Klassen: `Abo`, `Wochenbox`, `Produkt`, `Bestellung` (Team Aaron/Mika/Leon)
- Use-Cases: „Abo abschließen", „Abo verwalten", „Box konfigurieren" (falls Option B/D)
