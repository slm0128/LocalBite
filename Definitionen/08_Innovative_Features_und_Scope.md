# 08 – Innovative Features & Scope

> LocalBite hat mehrere „Geheimrezept"-Features. Bei **10 BPMN-Diagrammen** als Budget muss das Team
> bewusst entscheiden, **wie tief** jedes Feature modelliert wird – sonst bläht sich das Projekt auf.

## Zentrale Frage

Welche Innovationsfeatures werden **voll modelliert**, welche bleiben **nur Pitch-Vision**?

## Die Features & Vorschläge

### 🐄 Animal-Sharing (Tierpartnerschaft)
Kunde sponsert ein Tier und erhält dauerhaft X % Rabatt.
- **Optionen:** (a) eigener BPMN-Prozess + `Tierpartnerschaft`-Klasse · (b) nur ein Rabatt-Mechanismus
  im System · (c) nur Pitch-Vision.
- Im Klassendiagramm ist `Tierpartnerschaft` **bereits eingeplant** (Team Selim) → spricht für (a)/(b).
- **💡 Vorschlag:** **(b)** als Klasse + Rabattlogik modellieren, kein eigener großer BPMN (spart Budget).

### 🍲 Community-Kochen / Hof-Gastronomie
Kunden buchen Events/Kochabende auf Höfen.
- **Optionen:** (a) eigener Buchungs-/Ticketprozess · (b) nur im Pitch erwähnen.
- **💡 Vorschlag:** **(b)** – schöne Vision, aber als eigener Prozess teuer. Nur falls BPMN-Budget übrig.

### 🤖 Autonome Lieferung (Roboter/Drohne)
- Im Brainstorming selbst als **„zu futuristisch"** eingestuft.
- **💡 Vorschlag:** **Nur Ausblick/Vision** im Pitch, nicht modellieren.

### 📣 Social-Media-Automatisierung
Hof-Posts landen automatisch auf Instagram/Facebook (Meta-API).
- **💡 Vorschlag:** als **optionales Feature** erwähnen; evtl. kleiner Teilschritt im Landwirt-Onboarding.

### 📣 Werbung / gesponserte Platzierungen
Aus dem Feedback anderer Gruppen – als mögliche Erlösquelle (siehe Thema 01).
- **💡 Vorschlag:** im Erlösmodell nennen, nicht als eigener Prozess.

## 📋 Scope-Entscheidung (Kernprozesse stehen schon)

Die 10 Pflicht-BPMN sind durch die Kernprozesse bereits weitgehend belegt (Abo, Box & Lieferanten,
Routing, Fahrermanagement, Retouren/Pfand, Abrechnung, Reklamation, Onboarding Landwirt, Wareneingang
& QS, Abo verwalten). **Innovationsfeatures konkurrieren also um knappe Diagramm-Plätze** – daher
bewusst sparsam modellieren.

## ✅ Team-Entscheidung

```
Animal-Sharing:        voll modelliert / nur Klasse / nur Vision
Community-Kochen:      Prozess / nur Pitch
Autonome Lieferung:    nur Vision
Social Media:          Teilschritt / optional / weglassen
Werbung:               Erlösmodell / weglassen
```

## 📌 Betrifft

- BPMN-Budget (10 Diagramme), Pitch/Präsentation
- UML-Klassen: `Tierpartnerschaft`, `Bewertung` (Team Selim)
- Thema 01 (Werbung/Animal-Sharing als Erlös)
