# LocalBite – Grundstruktur der Oberflächen

## Grundidee

LocalBite soll nicht als eine einzige Oberfläche für alle Nutzer aufgebaut werden.

Stattdessen gibt es zwei klar getrennte Hauptbereiche:

1. **Öffentliche Kunden-Web-App**
2. **Internes LocalBite-Mitarbeitersystem**

Die Trennung soll möglichst einfach und natürlich wirken, wie bei normalen Online-Plattformen oder Shops.

---

# 1. Kunden-Web-App

Die normale LocalBite-Website ist für Personen gedacht, die Produkte bzw. Wochenboxen kaufen möchten.

Es gibt am Anfang keine künstliche Auswahl wie „Ich bin Kunde“.

Wer die normale LocalBite-Website öffnet, landet direkt im öffentlichen Kundenbereich.

Beispiel:

```text
LocalBite

[Produkte] [Höfe] [So funktioniert's] [Login] [Warenkorb]

Regional. Frisch. Direkt vom Hof.

[Jetzt entdecken]
```

## Mögliche Funktionen

- Produkte und Wochenboxen ansehen
- Höfe entdecken
- Produkte bestellen
- Warenkorb verwalten
- Kundenkonto erstellen
- Einloggen
- Abo verwalten
- kommende Lieferungen ansehen
- vergangene Bestellungen ansehen
- Pfandboxen und Rückgaben verwalten
- Reklamationen bzw. Support nutzen

---

# 2. LocalBite-Mitarbeitersystem

Zusätzlich gibt es einen separaten internen Bereich für LocalBite-Mitarbeiter.

Dieser Bereich ist nicht Teil des normalen Kunden-Shops, sondern wird separat aufgerufen.

Beispiel:

```text
LocalBite Mitarbeitersystem

E-Mail
Passwort

[Anmelden]
```

Der Zugriff könnte beispielsweise über eine eigene interne Adresse erfolgen, zum Beispiel:

```text
mitarbeiter.localbite.de
```

## Mögliche Funktionen

Je nach Mitarbeiterrolle könnten unterschiedliche Funktionen sichtbar sein.

Mögliche Bereiche:

- Dashboard
- Tourenplanung
- Fahrer
- Fahrzeuge
- Bestellungen
- Logistik
- Boxen und Pfand
- Retouren
- Qualitätskontrolle
- Support

Beispielhafte Navigation:

```text
Mitarbeitersystem
├── Dashboard
├── Tourenplanung
├── Fahrer
├── Fahrzeuge
├── Bestellungen
├── Boxen & Pfand
└── Qualitätskontrolle
```

Nicht jeder Mitarbeiter muss automatisch alle Bereiche sehen. Die sichtbaren Funktionen können abhängig von der jeweiligen Rolle eingeschränkt werden.

---

# 3. Fahrer

Fahrer gehören grundsätzlich zum internen LocalBite-System.

Für Fahrer kann innerhalb des Mitarbeitersystems eine speziell für Smartphones optimierte Ansicht bereitgestellt werden.

Dort könnten beispielsweise folgende Funktionen vorhanden sein:

- heutige Tour anzeigen
- Stopps anzeigen
- Navigation starten
- Abholung bestätigen
- Lieferung bestätigen
- Pfandboxen zurücknehmen
- Probleme melden

Es muss dafür nicht zwingend eine komplett separate App entwickelt werden. Eine mobile Ansicht des internen Systems reicht für die Fallstudie zunächst aus.

---

# 4. Landwirte / Anbieter

Landwirte bzw. Anbieter werden nicht auf der normalen Startseite mit einer großen Rollenauswahl dargestellt.

Für sie kann später ein eigener Partnerbereich vorgesehen werden.

Denkbar wäre beispielsweise:

```text
partner.localbite.de
```

Dort könnten Landwirte unter anderem:

- Produkte verwalten
- verfügbare Mengen pflegen
- Abholungen sehen
- Bestellungen bzw. Bedarfe sehen
- ihr Hofprofil verwalten

Die genaue Einordnung des Partnerbereichs wird später festgelegt.

---

# Zusammenfassung

Die grundlegende Struktur von LocalBite soll damit folgendermaßen aussehen:

```text
LocalBite
│
├── Öffentliche Kunden-Web-App
│   ├── Produkte / Wochenboxen
│   ├── Höfe
│   ├── Warenkorb
│   ├── Bestellungen
│   ├── Abo
│   └── Pfand / Rückgaben
│
├── Internes Mitarbeitersystem
│   ├── Dashboard
│   ├── Tourenplanung
│   ├── Fahrer
│   ├── Fahrzeuge
│   ├── Bestellungen
│   ├── Boxen / Pfand
│   └── Qualitätskontrolle
│
└── Partnerbereich für Landwirte
    └── genaue Ausgestaltung später
```

## Aktueller Stand der Entscheidung

Für die weitere Konzeption wird zunächst von folgendem Aufbau ausgegangen:

- **normale Website/Web-App für Kunden**
- **separates internes Mitarbeitersystem**
- **Fahrer als Teil des Mitarbeitersystems mit mobiler Ansicht**
- **Landwirte später über einen eigenen Partnerbereich**

Auf dieser Grundlage können im nächsten Schritt die einzelnen Seiten und anschließend konkrete Wireframe-Skizzen erstellt werden.
