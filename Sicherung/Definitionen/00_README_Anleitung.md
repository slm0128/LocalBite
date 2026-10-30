# �definitionen – Offene Grundsatzentscheidungen zu LocalBite

**Zweck:** Dieser Ordner sammelt die **betriebswirtschaftlichen Grunddefinitionen**, die bisher
unklar sind und sich durch alle BPMN- und UML-Modelle ziehen. Ziel ist **nicht**, hier schon alles
festzulegen, sondern pro Großthema die **zentrale Frage**, die **Optionen/Vorschläge** und die
**Auswirkungen** so aufzubereiten, dass das Team im Meeting schnell **entscheiden** kann.

> Faustregel: Erst wenn diese Grundsatzfragen entschieden sind, lassen sich BPMN und UML sauber und
> widerspruchsfrei finalisieren. Fast jedes offene „TODO" in den bestehenden Dokumenten hängt an
> einer dieser Entscheidungen.

---

## 🗺️ Themenlandkarte

| Nr. | Thema | Zentrale Frage |
|---|---|---|
| **01** | [Geschäftsmodell & Rolle](01_Geschaeftsmodell_und_Rolle.md) | Was **ist** LocalBite – Vermittler (Marktplatz) oder Händler (kauft & verkauft Boxen)? Wie verdienen wir Geld? |
| **02** | [Produkt, Wochenbox & Abo](02_Produkt_Wochenbox_und_Abo.md) | Was genau ist eine **Wochenbox**? Was ist ein **Abo** (vs. Einmalbestellung)? |
| **03** | [Warenfluss, Lagerung & Hub](03_Warenfluss_Lagerung_und_Hub.md) | **Wo wird Ware gelagert – und ob überhaupt?** Hub, Mini-Lager, nur im Auto, zentral? |
| **04** | [Abholung & Lieferung](04_Abholung_und_Lieferung.md) | **Wer** holt beim Bauern ab und **wer** liefert aus? Eigene Fahrer oder Subunternehmer? |
| **05** | [Pfand & Box-Rücknahme](05_Pfand_und_Boxruecknahme.md) | Pfandhöhe, Boxklassen, zentraler Rückgabeort, Scan-Technik? |
| **06** | [Zahlung & Abrechnung](06_Zahlung_und_Abrechnung.md) | **Wann** und **wie** wird bezahlt? Wie wird mit dem Landwirt abgerechnet? |
| **07** | [Liefergebiet & Planung](07_Liefergebiet_und_Planung.md) | Wie groß ist das Liefergebiet? Welche Cutoff-Zeiten (T-2/T-1/T-0)? |
| **08** | [Innovative Features & Scope](08_Innovative_Features_und_Scope.md) | Animal-Sharing, Community-Kochen – wie tief modellieren wir das? |
| **09** | [Automatisierungspotential](09_Automatisierungspotential.md) | Welcher **eine** Aspekt wird als Automatisierung ausgearbeitet (Pflicht der Fallstudie)? |

---

## 🔑 Hierarchie der Entscheidungen

Nicht alle Themen sind gleich wichtig. Es gibt eine **Reihenfolge**, weil manche Entscheidungen
andere vorgeben:

```text
01 Geschäftsmodell & Rolle   ← FUNDAMENT (entscheidet mit über 02, 03, 06)
        ↓
02 Produkt/Wochenbox/Abo     ← WAS verkaufen wir?
        ↓
03 Warenfluss & Hub          ← WO ist die Ware? (entscheidet mit über 04, 05)
        ↓
04 Abholung & Lieferung      ← WIE kommt sie zum Kunden?
        ↓
05–07 Pfand / Zahlung / Gebiet   ← Detaillierung
        ↓
08 Features / 09 Automatisierung ← Abrundung & Pflichtartefakt
```

**Empfohlene Reihenfolge im Meeting:** 01 → 02 → 03 → 04, danach der Rest.

---

## 📝 Aufbau jeder Themendatei

Jede Datei folgt demselben Muster, damit die Diskussion schnell geht:

1. **Zentrale Frage(n)** – worum geht es?
2. **Warum wichtig / was hängt davon ab** – welche Modelle/Prozesse betroffen sind.
3. **Optionen / Vorschläge** – mehrere Varianten mit kurzem Für/Wider.
4. **💡 Vorschlag** – eine unverbindliche Empfehlung als Diskussionsstart.
5. **✅ Team-Entscheidung** – leer, hier wird im Meeting eingetragen.
6. **📌 Betrifft** – welche BPMN/UML-Artefakte angepasst werden müssen.

---

## 📊 Entscheidungs-Log (zentrale Übersicht)

Hier nach jedem Meeting das **Ergebnis** eintragen (eine Zeile pro Thema):

| Thema | Status | Entscheidung (Kurzfassung) | Datum |
|---|---|---|---|
| 01 Geschäftsmodell | 🔴 offen | – | – |
| 02 Produkt/Wochenbox/Abo | 🔴 offen | – | – |
| 03 Warenfluss & Hub | 🔴 offen | – | – |
| 04 Abholung & Lieferung | 🔴 offen | – | – |
| 05 Pfand & Rücknahme | 🟡 teilweise | Pfandstaffel steht (siehe BPMN 07), Beträge offen | – |
| 06 Zahlung & Abrechnung | 🔴 offen | – | – |
| 07 Liefergebiet & Planung | 🔴 offen | – | – |
| 08 Features & Scope | 🔴 offen | – | – |
| 09 Automatisierungspotential | 🔴 offen | – | – |

**Legende:** 🔴 offen · 🟡 teilweise geklärt · 🟢 entschieden
