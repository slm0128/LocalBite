# 06 – Zahlung & Abrechnung

> Betrifft die Kunden- *und* die Lieferantenseite. Aus dem Freytag-Feedback gibt es bereits klare
> Hinweise, wie die Zahlung modelliert werden soll.

## Zentrale Fragen

1. **Wann** und **wie** zahlt der Kunde?
2. **Wie** rechnet LocalBite mit dem Landwirt ab (abhängig von Thema 01)?

## Hinweise aus dem Feedback (Freytag) – als Leitplanke

- Zahlung **sauber als eigener Schritt** modellieren (nicht „SQL schreiben", sondern fachlich:
  Zahlungsmethode hinterlegen → Zahlung auslösen).
- **Zahlungsmethode wird früh hinterlegt**, die **Zahlung aber erst nach der Lieferung gefordert**.
- Zahlung als eigener **Datentyp/Objekt** behandeln, ebenso `Bestellung`.

---

## Teil A – Kundenzahlung

### Optionen / Vorschläge – Zeitpunkt
- **A) Zahlung nach Lieferung** *(laut Feedback bevorzugt)* – Methode hinterlegt, Abbuchung nach
  erfolgter Lieferung.
- **B) Vorkasse je Lieferung** – vor der Auslieferung.
- **C) Monatliche Sammelrechnung** (passt gut zum Abo).

### Zahlungsmethoden (Mehrfachauswahl)
- [ ] Kreditkarte / Debit [ ] PayPal [ ] SEPA-Lastschrift [ ] Kauf auf Rechnung

**💡 Vorschlag:** **A** umsetzen (folgt dem Feedback). Beim Abo zusätzlich **C** als Option andenken.

---

## Teil B – Abrechnung mit dem Landwirt *(hängt an Thema 01)*

- Wenn **Vermittler/Marktplatz (01-A):** Kunde zahlt an LocalBite → LocalBite zahlt Hof aus
  **minus Provision**. Braucht `Auszahlung` + `Provision`.
- Wenn **Händler/Reseller (01-B):** Hof stellt LocalBite eine **Einkaufsrechnung**, Kunde zahlt den
  LocalBite-Verkaufspreis. Zwei getrennte Zahlungsströme.
- Wenn **Hybrid (01-C):** beides parallel je nach Bestelltyp.

## ✅ Team-Entscheidung

```
Zahlungszeitpunkt Kunde: ____________________________________
Zahlungsmethoden:        ____________________________________
Abrechnung mit Landwirt: ____________________________________
```

## 📌 Betrifft

- BPMN: Abrechnung & Rechnungsstellung (03), Abo abschließen (01)
- UML-Klassen: `Zahlungsdaten`, `Bestellung`, evtl. `Rechnung`/`Auszahlung`/`Provision`
- Sequenzdiagramm-Kandidat: „Zahlung nach Lieferung"
- Thema 01 (Geschäftsmodell) ist Voraussetzung für Teil B
