# Ablauf Fallstudie 3. Semester (Stand: 07.07.2026)

## Aufgabenstellung

- Durchführung einer methoden- und werkzeuggestützten Systemanalyse in Form einer Fallstudie an einem selbst gewählten Beispielprojekt

## Konstituierung des Projektteams

- Bestimmung eines Projektleiters / einer Projektleiterin als Ansprechpartner
- Verteilung der Zuständigkeiten innerhalb des Projekts (Scrum-Master, Backup-Beauftragte/r, ...

## Zeitlicher Ablauf im Semester

- 2 Stunden Kickoff + 23 Stunden in den Kleingruppen + 3 Stunden Abschlusspräsentation
- Regelmäßiges Coaching in den Kleingruppen in Präsenz
- Ort: i. d. R. Planspiel-Labor oder andere Gruppenräume

## Wahl eines Projektthemas

- Suche und Bestimmung eines geeigneten Beispiels (z. B. ein Startup-Szenario)
- Fachspezifisches Know-how auf dem gewählten Gebiet sollte sinnvollerweise vorhanden sein oder leicht angeeignet werden können
- Im Umfeld des Beispiels müssen spezifische Geschäftsprozesse klar identifizierbar und eine Automatisierung durch Software-Einsatz möglich sein
- Beispiel sollte genügend große, aber nicht zu große Komplexität besitzen

## Durchführung einer Geschäftsprozessanalyse (BPMN)

- Vollständige, syntaktisch korrekte Modellierung mit BPMN 2.0
- Prozessmodell: 10 BPMN-Kollaborationsdiagramme mit durchschnittlich 10 Aktivitäten
- Beteiligte Ressourcen (Lanes/Pools) und Datenobjekte/Speicher sind ebenfalls zu modellieren
- Umsetzung unter Verwendung des Camunda Modeler oder des Webfrontends BPMN.io
- Nutzung der Camunda.io Cloud als Artefakt-Repository (siehe separates How-To)

## Identifizierung von Automatisierungspotential

- Festlegung eines Aspekts innerhalb des Geschäftsprozessumfelds, der durch eine spezielle Software automatisiert werden kann
- Auch hier darauf achten, dass diese Software eine passende Komplexität und ein ausreichendes Originalitätspotenzial hat

## Durchführung einer objektorientierten Analyse (UML)

- Use-Case-Diagramm mit mindestens 10 Use-Cases
- UML-Klassendiagramm mit mindestens 10 Klassen
- Für 5 ausgewählte Use-Cases je ein UML-Sequenzdiagramm
- Umsetzung unter Nutzung des Werkzeugs Visual Paradigm
- Nutzung des VP-Servers als Artefakt-Repository (siehe separates How-To)

## Abschlusspräsentation

Jede Gruppe muss beim letzten Termin (Mitte Oktober) eine Präsentation der Projektergebnisse im Plenum halten (Dauer je 15-20 Minuten). Diese wird individuell bewertet und ins Portfolio eingerechnet, d.h. alle Gruppenmitglieder sollten beim Vortrag mitwirken.

## Ausarbeitung (Abgabe bis Ende des Semesters, genauer Termin in Moodle)

- Projektdokumentation (mit Kurs und Gruppennummer, Name des Projekts und den vollständigen Namen aller Gruppenmitglieder auf der Titelseite), Inhalt s.u.
- GP-Modelle im BPMN-Format
- OO-Modellierung als VPP-Datei aus Visual Paradigm (Format s.u.)
- PDF-Export der Abschlusspräsentation (mit zusätzlicher Angabe, welche/r Vortragende welchen Beitrag verantwortet hat)

## Abgabeform

Alles in ein ZIP-File packen mit dem Namen und hochladen über Link auf der Moodle-Seite.  
Unbedingt die Namens- und Strukturierungskonventionen beachten (s.u.)

## Portfolioprüfung

Das Portfolio der Fallstudie ist Teil des Portfolios im Modul „Methoden der WI“ und wir zusammen mit der LV „Projektmanagement“ bewertet (Verhältnis 50:50). Es besteht aus folgenden Elementen und Gewichtungen:

| Portfolio-Element | Umfang, Format | Wertung | Gewicht |
|---|---|---|---|
| Abschlusspräsentation | 15-20 Minuten | Individuell | 10% |
| Engagement | Während des Semesters | Individuell | 5% |
| Projektdokumentation | 20 Seiten, PDF | Gruppenbasiert | 5% |
| BPMN-Modellierung | Als XML-Export<br>Anforderungen s.o. | Gruppenbasiert | 15% |
| OO-Modellierung | Als VPP-Datei<br>Anforderungen s.o. | Gruppenbasiert | 15% |
| Projektmanagement | Andere Modul-Unit |  | 50% |

## Einzusetzende Software

- Für beide Produkte (Camunda und Visual Paradigm) werden Installationsanleitung, ggfs. Lizenzen und Zugänge zum Repository-Server an die Projektgruppenleiter im Vorfeld bereitgestellt.

## Dateinamens-Konventionen

- Projektdokumentation: `Projekt-<KURS>-<GRUPPE>.pdf`  
  Beispiel: Projekt-WWI25BX-Gruppe2.pdf

- BPMN-Modellierung: `BPMN-<KURS>-<GRUPPE>.zip`  
  Beispiel: BPMN-WWI25BX-Gruppe2.zip

- OO-Modellierung: `UML-<KURS>-<GRUPPE>.vpp`  
  Beispiel: UML-WWI25BX-Gruppe2.vpp

- ZIP-Archiv für Moodle-Einreichung: `Fallstudie-<KURS>-<GRUPPE>.zip`  
  Beispiel: Fallstudie-WWI25BX-Gruppe2.zip

## Formatierung und Strukturierung der Artefakte und Repository-Elemente

Der Aufbau der jeweiligen Modellierungen (BPMN und OO) und Artefakte hat in der vorgeschriebenen Form zu erfolgen:

- Die BPMN-Modelle sind in die vorbereiteten Unterordner im Camunda Cloud Repository abzulegen.
- Die BPMN-Prozessdiagramme mit einer zweistelligen Nummer und einem prägnanten Modellnamen benennen. Beispiele: "01-Registrierung", "02-Anmeldung" usw.
- Bei Visual Paradigm sind grundsätzlich erst einmal alle Diagramme in die zugehörigen Standardordner im UML-Repository abzulegen.
- Sequenzdiagramme sind in allen Fällen als "Unterdiagramm" des zugehörigen Use-Cases zu erstellen und werden dann automatisch unterhalb dieser Einträge (als Verfeinerungsdiagramme) angelegt.

Zur Einreichung ist für BPMN ein ZIP aller exportierten Diagramme und für UML eine lokale Kopie der VP-Workspace-Datei (*.VPP) zu verwenden.

## Projektdokumentation

Jede Projektgruppe hat dem Archiv eine Projektdokumentation von ca. 20 Seiten Länge beizufügen. Folgendes soll dort enthalten sein:

- Mitglieder der Gruppe
- Ausführliche Beschreibung des Projekts
- Vorgehen bei Umsetzung
- Projektmanagement
- Überblick über die erstellten Artefakte
- Probleme/Herausforderungen
- Feedback

Die Projektdokumentation soll eine anschaulich gestaltete, kompakte Zusammenfassung ("Visitenkarte" bzw. "Teaser") Ihres Projekts darstellen, so dass ein Außenstehender schnell erkennen kann, was genau im Rahmen der Fallstudie von wem, mit welcher Ausgangssituation, mit welchem Verlauf und mit welchem Ergebnis auf welche Weise erarbeitet worden ist.

## Abgabe der Prüfungsleistung

Elektronische Einreichung über Moodle-Upload-Link

**bis zum 13.11.2026, 23:59 Uhr**

**Am Ende muss pro Person eine individuelle, archivierbare Version der vollständigen Prüfungsleistung in Moodle vorliegen.**

## Nutzung der Repositories außerhalb des DHBW-Netzwerks

Die IP-Adresse des VP-Repositories ist nur von innerhalb des DHBW-Netzwerks erreichbar.  
Von außerhalb der Hochschule muss deshalb zur Nutzung zunächst das Lehre-VPN über den Cisco Anyconnect Client gestartet werden. Die Camunda Cloud ist hingegen auch ohne VPN nutzbar.
