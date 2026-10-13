# 05 – Pfand & Box-Rücknahme

> **Teilweise schon geklärt.** In BPMN 07 sind Boxkonzept und Pfandstaffel bereits definiert –
> hier geht es nur noch um die **letzten konkreten Zahlen und Techniken**.

## Zentrale Fragen

Welche konkreten **Beträge, Boxklassen, Rückgabeorte und Technik** gelten für die Mehrwegbox?

## Bereits festgelegt (aus BPMN 07 – als Basis übernehmen)

- **Box:** stabile, lebensmittelechte **Mehrwegbox** aus Recycling-Kunststoff, mit **eindeutiger
  Box-ID** (z. B. `LB-004281`) und geführter **Box-Historie**.
- **Pfandstaffel (Rückgabefrist):**

  | Rückgabezeit | Erstattung |
  |---|---:|
  | Tag 0–14 | 100 % |
  | Tag 15–21 | 75 % |
  | Tag 22–29 | 50 % |
  | ab Tag 30 | 0 % |

- **Pfand ≠ Schaden:** normale Abnutzung trägt LocalBite; bekannter Vorschaden belastet den Kunden
  nicht; keine Automatik „Box beschädigt = Kunde zahlt".

## Noch offen – zu entscheiden

- **Pfandhöhe (absoluter Betrag)** pro Box – Vorschlag zur Diskussion: **5 € / 7,50 € / 10 €**?
- **Boxgrößen / Boxklassen** – z. B. S / M / L, oder gekühlt / ungekühlt? (ggf. je Klasse eigenes Pfand)
- **Zentraler Rückgabeort** – welche Varianten?
  - [ ] Rückgabe nur bei nächster Lieferung (Fahrer nimmt mit)
  - [ ] zusätzlich fester LocalBite-Rückgabepunkt / Umschlagpunkt (siehe Thema 03)
  - [ ] Partner-Abgabestellen (z. B. teilnehmende Höfe/Läden)
- **Scan-/Erfassungstechnik** – QR-Code / Barcode / RFID? (RFID komfortabler, teurer)
- **Schadensschwelle** – ab wann „erheblicher Schaden" statt „normale Abnutzung", und Einspruchsregel.

## 💡 Vorschlag

Pfand **einheitlich 5 €** je Box (einfach kommunizierbar), **QR-Code** zur Erfassung (günstig,
smartphone-fähig), Rückgabe primär **bei nächster Lieferung** + optionaler Rückgabepunkt am
Umschlagpunkt. Boxklassen zunächst nur **S/M/L** ohne separate Pfandhöhe, um es einfach zu halten.

## ✅ Team-Entscheidung

```
Pfandhöhe:        ___________________________________________
Boxklassen:       ___________________________________________
Rückgabeort(e):   ___________________________________________
Scan-Technik:     ___________________________________________
Schadensschwelle: ___________________________________________
```

## 📌 Betrifft

- BPMN 07 (Retouren & Pfand) – Zahlen/Technik eintragen
- UML-Klassen: `Wochenbox`/`Box`, evtl. `Pfand`, `Box-Historie`
- Thema 03 (Rückgabeort = Hub?) und 06 (Pfand-Verbuchung)
