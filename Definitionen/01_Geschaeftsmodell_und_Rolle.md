# 01 – Geschäftsmodell & Rolle von LocalBite

> **Das Fundament.** Diese Entscheidung bestimmt mit, wem die Ware gehört, wer wem eine Rechnung
> stellt, wer das Risiko trägt und wie fast alle anderen Prozesse aussehen.

## Zentrale Fragen

1. **Was *ist* LocalBite** – ein Vermittler (Marktplatz) oder ein Händler (kauft Ware ein und
   verkauft sie als eigenes Produkt)?
2. **Womit verdient LocalBite Geld** (Erlösmodell)?

## Warum wichtig / was hängt davon ab

- **Wem gehört die Ware?** → Wareneingang, Qualitätskontrolle, Haftung, Pfand
- **Wer stellt die Rechnung?** → Zahlung & Abrechnung (Thema 06)
- **Wer trägt das Risiko** bei unverkaufter/verdorbener Ware? → Lagerung (Thema 03)
- **UML-Klassen:** Bestimmt, ob es Klassen wie `Provision`, `Auszahlung`, `Händlervertrag` braucht.

## Optionen / Vorschläge

### A) Reiner Vermittler / Marktplatz *(wie Lieferando)*
- Bauer verkauft **direkt** an den Kunden, LocalBite vermittelt nur + liefert.
- Erlös = **Provision** je Verkauf + evtl. Liefergebühr.
- ➕ Kein Wareneinkaufsrisiko, schlank. ➖ Weniger Kontrolle über Sortiment/Preis, „nur Plattform".

### B) Händler / Reseller *(wie HelloFresh)*
- LocalBite **kauft** die Ware vom Bauern, stellt Boxen zusammen, verkauft im **eigenen Namen**.
- Erlös = **Marge** (Verkaufspreis − Einkaufspreis) + Abo-Gebühr.
- ➕ Volle Kontrolle über Box, Preis, Marke. ➖ Einkaufs-/Lagerrisiko, mehr Kapitalbedarf.

### C) Hybrid *(empfohlen prüfen)*
- Die **kuratierte Wochenbox** ist ein LocalBite-Produkt (Reseller-Logik), **einzelne
  Hof-Direktbestellungen** laufen als Vermittlung (Provision).
- ➕ Verbindet Markenprodukt + Marktplatz-Vielfalt. ➖ Zwei Abrechnungslogiken parallel.

## 💡 Vorschlag

**Option C (Hybrid)**, mit Schwerpunkt auf der kuratierten Box.
Begründung: Das Tafelbild „Landwirt → Rechnungsstellung → Zahlung" deutet auf Marktplatz-Elemente
hin, während „Wochenbox" und „HelloFresh" klar nach einem eigenen Produkt klingen. Hybrid bildet
beides ab — fachlich reizvoll und gut modellierbar. Falls das zu komplex wird: **Option B** als
saubere, einfache Variante.

### Erlösmodell (Unterentscheidung – Mehrfachauswahl möglich)
- [ ] Abo-/Box-Marge *(Kerngeschäft)*
- [ ] Provision je vermitteltem Direktverkauf
- [ ] Liefergebühr pro Lieferung
- [ ] Werbung / gesponserte Hof-Platzierungen *(aus Feedback anderer Gruppen)*
- [ ] Animal-Sharing-Beiträge *(siehe Thema 08)*

## ✅ Team-Entscheidung

```
Rolle:        ______________________________________________
Erlösmodell:  ______________________________________________
Begründung:   ______________________________________________
```

## 📌 Betrifft

- BPMN: Wareneingang & QS (10), Abrechnung & Rechnungsstellung (03), Box & Lieferanten (09)
- UML-Klassen: `Bestellung`, `Zahlungsdaten`, evtl. neu `Provision`/`Auszahlung`
- Pitch/Doku: Kernaussage „Was ist LocalBite?"
