# LocalBite – Typst-Projektdokumentation

Schlanke Typst-Grundstruktur für die LocalBite-Fallstudie. Das Layout übernimmt die wesentlichen PA1-Designwerte, enthält aber keine PA-spezifischen Bestandteile und kein SAP-Logo.

## Was du vor dem Schreiben ändern musst

Öffne nur `config.typ` und passe mindestens an:

1. `authors` – vollständige Namen aller Gruppenmitglieder
2. `group` – eure Gruppennummer

Bereits gesetzt sind:

- Projekt: `LocalBite`
- Kurs: `WWI25B1`
- Abgabedatum: `13.11.2026`
- Hochschule: DHBW Karlsruhe
- Schrift: Times New Roman, 12 pt
- PA1-Seitenränder und Abstände

## Preview

Öffne `Main.typ` und starte dort die Typst-Preview.

Falls du die CLI nutzt:

```bash
typst compile Main.typ
```

## Titelblatt

Das Titelblatt wird automatisch durch `template.typ` erzeugt. Es enthält nur das DHBW-Logo sowie LocalBite, Dokumentart, Namen, Kurs, Gruppe, Hochschule und Abgabedatum.

## Kapitel

1. Projektüberblick
2. Projektbeschreibung
3. Vorgehen bei der Umsetzung
4. Projektmanagement
5. Geschäftsprozessanalyse
6. Automatisierungspotenzial
7. Objektorientierte Analyse
8. Probleme und Herausforderungen
9. Feedback und Fazit

## Ordner

- `Content/` – Kapiteltexte
- `Assets/BPMN/` – BPMN-Abbildungen
- `Assets/UML/` – UML-Abbildungen
- `Assets/Bilder/` – sonstige Bilder/Screenshots
- `Assets/Logos/` – nur das DHBW-Logo
- `Literature/` – Quellen bei Bedarf

## Hinweis

Die Struktur ist bewusst klein gehalten: kein Sperrvermerk, keine Selbstständigkeitserklärung, kein SAP-Logo und keine PA-spezifischen Sonderteile.
