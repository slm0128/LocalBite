# 04 – Abholung & Lieferung

> Deine zweite Kernfrage: **Wer liefert das eigentlich?** Betrifft die „letzte Meile" und die
> Abholung beim Bauern – beides in BPMN 05/06 als offen markiert.

## Zentrale Fragen

1. **Abholung:** Wer holt die Ware beim Landwirt ab, wann, und wie läuft die Übergabe?
2. **Lieferung:** Wer fährt zum Kunden – eigene Fahrer oder Subunternehmer? Mit welcher Flotte?

---

## Teil A – Abholung beim Landwirt

> Aus dem Feedback anderer Gruppen: *„Genauer überlegen: Wer holt ab? Wann? Wie läuft die Übergabe?"*
> und *„Amazon-Mitarbeiter/Fahrer nehmen die Ware beim Anbieter auf."*

### Optionen – Wer holt ab?
- **A1) LocalBite-Fahrer holen ab** (Fahrer macht Abhol- *und* Lieferstopps in einer Tour) –
  bereits so in BPMN 06 vorgesehen (Stoppart „Abholung"/„Lieferung").
- **A2) Bauer bringt selbst zum Hub/Umschlagpunkt** an.
- **A3) Subunternehmer/Kurier holt ab.**

### Optionen – Wann & Übergabe?
- Feste **Abholfenster** am Tag T-1/T-0 (siehe Thema 07).
- Qualitätskontrolle **beim Bauern** (vor Mitnahme) **oder** erst **im Hub** (siehe Thema 03) –
  diese Wahl hängt am Lagermodell.

**💡 Vorschlag:** **A1** – LocalBite-Fahrer holen ab und liefern in kombinierten Touren; QS primär
im Umschlagpunkt, Sichtprüfung beim Bauern. Passt zur bestehenden BPMN-06-Logik.

---

## Teil B – Wer liefert aus?

### Optionen / Vorschläge
- **A) Eigene Fahrer + eigene Flotte**
  ➕ Volle Kontrolle über Qualität, Kühlung, Markenerlebnis. ➖ Hohe Fixkosten, Personal, Skalierung
  langsam.
- **B) Subunternehmer / Kurierdienst**
  ➕ Skaliert schnell, wenig Fixkosten. ➖ Weniger Kontrolle, Risiko „nur DHL nachbauen" (gegen die
  Projektleitlinie), Kühlkette schwerer sicherzustellen.
- **C) Mischmodell** – eigener Fahrer-Kern + Subunternehmer für Spitzen/Randgebiete.
  ➕ Flexibel + kontrolliert. ➖ Zwei Fahrertypen im Modell.
- **D) Freelance-/Pool-Fahrer** (Uber-/Lieferando-Stil, per App zugewiesen).
  ➕ Elastisch. ➖ Qualität/Kühlung schwer garantierbar.

**💡 Vorschlag:** **Option A (eigene Fahrer)** als Hauptmodell, optional **C** für den Ausblick.
Begründung: Regionalität, Kühlkette und das Pfandbox-Handling (Rücknahme beim Liefern, BPMN 07)
sprechen für eigene, geschulte Fahrer. Das BPMN-06-Modell ist bereits auf eigene Fahrer + eigene
Fahrzeugauswahl ausgelegt. „Eigene Fahrer" ist zudem die bessere Pitch-Story als „wir nutzen DHL".

### Unterentscheidung – Fahrzeuge *(in BPMN offen)*
- Fahrzeugklassen (z. B. Kleintransporter gekühlt / Pkw) · Kapazität (Anzahl Boxen) ·
  Kühlanforderung · Spezialausstattung. → Als `Fahrzeug`-Attribute im Klassendiagramm (Team Esra).

## ✅ Team-Entscheidung

```
Abholung durch:   ___________________________________________
Lieferung durch:  ___________________________________________
Flotte/Fahrzeuge: ___________________________________________
```

## 📌 Betrifft

- BPMN 05 (Abholorte), BPMN 06 (Fahrer-/Fahrzeugwahl, Beladung), BPMN 09 (Fahrermanagement)
- UML-Klassen: `Fahrer`, `Fahrzeug`, `Route` (Team Esra/Leon)
- Thema 03 (Hub) und 07 (Planung)
