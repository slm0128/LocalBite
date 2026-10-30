# LocalBite – Gemeinsamer aktueller Stand, TODOs und nächste Schritte

**Stand:** 06.10.2026  
**Bereich:** Logistik & Operations  
**Verantwortlich:** Leon

## Paketinhalt

Dieses Paket enthält genau den aktuellen Arbeitsstand:

- `BPMN_05_Auslieferung_Routing.bpmn`
- `BPMN_05_Auslieferung_Routing.md`
- `BPMN_06_Fahrermanagement_Abwicklung.bpmn`
- `BPMN_06_Fahrermanagement_Abwicklung.md`
- `BPMN_07_Retouren_Pfand.bpmn`
- `BPMN_07_Retouren_Pfand.md`
- diese gemeinsame Datei

Die BPMN-Dateien entsprechen dem aktuellen **V2-Arbeitsstand**. Sie sind Review-Versionen, noch nicht die finale Abgabe.

## Pflichtquellen für spätere Chats / Reviews

Für eine vollständige fachliche Weiterarbeit sollten zusätzlich verfügbar sein:

1. **`LocalBite.zip`** – verbindliche Projektquelle
2. **`ZweitesSemester_BPMN_FACH.zip`** – BPMN-/Systemanalyse-Unterlagen aus dem 2. Semester

Regel:

- Projektfachlichkeit gegen `LocalBite.zip` prüfen
- BPMN-Modellierung gegen den Folienstand des 2. Semesters prüfen

## Feste Prozessgrenzen

```text
BPMN 05 – Auslieferung & Routing
→ plant und baut die Tour

BPMN 06 – Fahrermanagement & Abwicklung
→ besetzt und fährt die Tour

BPMN 07 – Retouren & Pfand-Management
→ wickelt Rückgabe, Pfand und Boxzustand ab
```

### Übergabe 05 → 06

BPMN 05 liefert eine freigegebene Tour mit:

- Abholorten
- Lieferzielen
- geplanter Reihenfolge
- Kapazitätsbedarf
- Kühl-/Ausstattungsanforderungen
- erwarteter Dauer
- Zeitfenstern

BPMN 06 wählt erst dann das konkrete Fahrzeug und den konkreten Fahrer.

### Übergabe 06 → 07

BPMN 06 kann Pfandboxen / Retouren physisch mitnehmen. BPMN 07 übernimmt danach die eigentliche Rückgabe-, Pfand-, Zustands- und Wiederverwendungslogik.

## Gemeinsame offene Projektfragen

### Hub / Warenfluss

Noch offen:

- direkte Abholung beim Bauern?
- LocalBite-Hub / Umschlagpunkt?
- Hybridmodell?

Die Prozesse sind bewusst so gehalten, dass diese Entscheidung später angepasst werden kann.

### Lieferplanung

Noch offen:

- exakter T-2/T-1/T-0-Zeitpunkt
- konkreter Cutoff für späte Bestellungen
- wie weit eine freigegebene Tour nach T-1/T-0 noch verändert werden darf

### Fahrzeuge

Noch offen:

- konkrete Fahrzeugklassen
- konkrete Kapazitäten
- genaue Kühlanforderungen
- weitere Spezialausstattung
- genaue Regeln für Fahrzeug-zu-Fahrzeug-Transfer

### BPMN 07 / Pfand

Noch offen:

- konkrete Pfandhöhe
- genaue Boxgrößen / Boxklassen
- zentraler LocalBite-Rückgabeort
- genaue technische Lösung für Scan / Kamera
- Schwelle zwischen normaler Abnutzung und schwerem Schaden
- genaue Schadens-/Einspruchsregel

## Inhaltliche Punkte für den Review

Für jeden BPMN prüfen:

- fehlt ein fachlich wichtiger Schritt?
- ist etwas doppelt oder im falschen Prozess?
- sind Start und Ende sauber definiert?
- sind Gateways wirklich Entscheidungen / Synchronisationen?
- sind Sequenzflüsse und Nachrichtenflüsse korrekt?
- sind Pools und Lanes sinnvoll?
- sind Ausnahmefälle ausreichend, aber nicht künstlich aufgebläht?
- passen die Schnittstellen 05 → 06 → 07?
- passt alles zum Semester-2-Folienstand?
- kann Leon jeden Schritt später selbst erklären?

## Nächste Schritte – festgelegte Reihenfolge

```text
1. Visuellen BPMN-Standard festlegen
        ↓
2. BPMN 05 / 06 / 07 inhaltlich vollständig reviewen
        ↓
3. Verbesserte, saubere BPMN-Versionen erstellen
        ↓
4. Mit dem Team abstimmen
        ↓
5. Teamfeedback einarbeiten
        ↓
6. Leon baut alle drei BPMNs selbst noch einmal von Grund auf
        ↓
7. Finaler Review
```

## Visueller Standard – als Nächstes festzulegen

Für alle drei Modelle soll ein einheitlicher Aufbau gelten:

- Hauptfluss möglichst einheitlich links → rechts
- klare Abstände
- einheitliche Taskgrößen
- keine Sequenzflüsse durch Tasks
- Rücksprünge sauber außen führen
- einheitliche Gateway-Beschriftung
- gleiche Pool-/Lane-Logik
- Nachrichtenflüsse nur zwischen Pools
- Subprozesse nur dort, wo sie Übersicht schaffen
- keine künstliche Komplexität

Ziel:

> Die drei BPMNs sollen fachlich sauber und visuell wie aus einem Guss wirken.

## Aktueller Status

Die Grundlogik aller drei Prozesse ist belastbar genug für den nächsten Schritt. Die V2-BPMNs dienen als **Arbeits- und Review-Version**. Nach Standardisierung und Review werden sie erneut sauber erstellt und anschließend mit dem Team abgestimmt.
