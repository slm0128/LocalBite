# 📌 Checkliste & Übersicht: Fallstudie Systemanalyse

~Schaut euch aber noch die PDF Datei "Ablauf-Fallstudie 2026" sicherheitshalber an~ 

**📅 Abgabe-Deadline:** 13.11.2026, 23:59 Uhr (über Moodle-Upload-Link)
**⚠️ Wichtig:** Am Ende muss *pro Person* eine individuelle, archivierbare Version der vollständigen Prüfungsleistung in Moodle vorliegen!

---

## 📋 1. Projekt-Setup & Team
- [ ] **Projektteam konstituiert**
- [ ] **Zuständigkeiten verteilt** (Projektleiter/in als Ansprechpartner, Scrum-Master, Backup-Beauftragte/r, etc.)
- [ ] **Beispielprojekt** (selbst gewählt) festgelegt

## ⚙️ 2. Geschäftsprozessanalyse (BPMN)
- [ ] Vollständige, syntaktisch korrekte Modellierung mit **BPMN 2.0**.
- [ ] **Umfang:** 10 BPMN-Kollaborationsdiagramme mit durchschnittlich 10 Aktivitäten.
- [ ] **Elemente:** Beteiligte Ressourcen (Lanes/Pools) und Datenobjekte/-speicher sind modelliert.
- [ ] **Tooling:** Camunda Modeler oder BPMN.io Webfrontend.
- [ ] **Ablage:** Diagramme in vorbereitete Unterordner im *Camunda Cloud Repository* abgelegt.
- [ ] **Benennung der Modelle:** Zweistellige Nummer + prägnanter Name (z.B. `01-Registrierung`, `02-Anmeldung`).
- [ ] **Automatisierungspotenzial:** Ein Aspekt im Prozess für Software-Automatisierung identifiziert (angemessene Komplexität & Originalität).

## 💻 3. Objektorientierte Analyse (UML)
- [ ] **Use-Case-Diagramm:** Mindestens 10 Use-Cases.
- [ ] **Klassendiagramm:** Mindestens 10 Klassen.
- [ ] **Sequenzdiagramme:** Für 5 ausgewählte Use-Cases je ein Sequenzdiagramm erstellt.
- [ ] **Strukturierung (WICHTIG):** Sequenzdiagramme sind als "Unterdiagramm" des zugehörigen Use-Cases angelegt (Verfeinerungsdiagramme).
- [ ] **Tooling:** Visual Paradigm.
- [ ] **Ablage:** Diagramme in die Standardordner im *UML-Repository* (VP-Server) abgelegt.

## 📄 4. Projektdokumentation (ca. 20 Seiten)
Die Dokumentation ist eine anschaulich gestaltete Zusammenfassung ("Visitenkarte/Teaser") des Projekts.
- [ ] **Titelseite:** Kursnummer, Gruppennummer, Projektname und vollständige Namen aller Gruppenmitglieder.
- [ ] **Inhalt - Mitglieder der Gruppe**
- [ ] **Inhalt - Ausführliche Beschreibung des Projekts** (Ausgangssituation, Vorgehen, Verlauf, Ergebnis)
- [ ] **Inhalt - Vorgehen bei Umsetzung**
- [ ] **Inhalt - Projektmanagement**
- [ ] **Inhalt - Überblick über die erstellten Artefakte**
- [ ] **Inhalt - Probleme/Herausforderungen**
- [ ] **Inhalt - Feedback**
- [ ] Export als **PDF**.

## 🎤 5. Abschlusspräsentation
- [ ] Dauer: 15-20 Minuten.
- [ ] Präsentation als PDF exportiert.
- [ ] **Besonderheit:** Im PDF ist angegeben, welche/r Vortragende welchen Beitrag verantwortet hat.

---

## 📦 6. Vorbereitung der finalen Abgabe (Dateinamens-Konventionen)

Alles wird in einem finalen ZIP-Archiv verpackt. Bitte Platzhalter `<Kurs>` (z.B. WWI25BX) und `<Gruppe>` (z.B. Gruppe2) entsprechend ersetzen.

- [ ] **Projektdokumentation (PDF):**
  - Format: `Projekt-<Kurs>-<Gruppe>.pdf` (z.B. *Projekt-WWI25BX-Gruppe2.pdf*)
- [ ] **BPMN-Modellierung (XML-Export als ZIP):**
  - Format: `BPMN-<Kurs>-<Gruppe>.zip` (z.B. *BPMN-WWI25BX-Gruppe2.zip*)
- [ ] **OO-Modellierung (Lokale Kopie der Workspace-Datei):**
  - Format: `UML-<Kurs>-<Gruppe>.vpp` (z.B. *UML-WWI25BX-Gruppe2.vpp*)
- [ ] **Präsentation (PDF):** Exportierte PDF der Präsentation beilegen.
- [ ] **Finales ZIP-Archiv für Moodle:**
  - Format: `Fallstudie-<Kurs>-<Gruppe>.zip` (z.B. *Fallstudie-WWI25BX-Gruppe2.zip*)

---

## 📊 Benotungsübersicht (Portfolioprüfung)
*Hinweis: 50% der Gesamtnote kommen aus der LV "Projektmanagement". Die anderen 50% aus "Methoden der WI" (dieser Fallstudie).*

| Portfolio-Element | Umfang / Format | Wertung | Gewicht (Gesamt-Modul) |
| :--- | :--- | :--- | :--- |
| **Abschlusspräsentation** | 15-20 Min | Individuell | 10% |
| **Engagement** | Während des Semesters | Individuell | 5% |
| **Projektdokumentation** | 20 Seiten, PDF | Gruppenbasiert | 5% |
| **BPMN-Modellierung** | XML-Export (.zip) | Gruppenbasiert | 15% |
| **OO-Modellierung** | VP-Datei (.vpp) | Gruppenbasiert | 15% |
| **Projektmanagement** | *Andere Modul-Unit* | *Andere Modul-Unit* | *50%* |
