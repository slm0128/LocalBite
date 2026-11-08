#import "template.typ": localbite_document
#import "config.typ": *

#show: localbite_document.with(
  title_long: title_long,
  title_short: title_short,
  document_type: document_type,
  authors: authors,
  course: course,
  group: group,
  submission_date: submission_date,
  font_family: font_family,
  font_size: font_size,
  line_leading: line_leading,
  paragraph_spacing: paragraph_spacing,
  main_margins: main_margins,
  front_margins: front_margins,
  dark_green: dark_green,
  accent_green: accent_green,
  chapter_authors: chapter_authors,
)

= Mitglieder der Gruppe
#include "Content/01_Mitglieder_der_Gruppe/01_Mitglieder_der_Gruppe.typ"

== Vorstellung der Gruppenmitglieder
#include "Content/01_Mitglieder_der_Gruppe/01_01_Vorstellung_der_Gruppenmitglieder.typ"

== Rollen- und Aufgabenverteilung
#include "Content/01_Mitglieder_der_Gruppe/01_02_Rollen_und_Aufgabenverteilung.typ"



= Ausführliche Beschreibung des Projekts
#include "Content/02_Ausfuehrliche_Beschreibung_des_Projekts/02_Ausfuehrliche_Beschreibung_des_Projekts.typ"

== Projektidee und Motivation
#include "Content/02_Ausfuehrliche_Beschreibung_des_Projekts/02_01_Projektidee_und_Motivation.typ"

== Zielsetzung und Anforderungen (Requirements)
#include "Content/02_Ausfuehrliche_Beschreibung_des_Projekts/02_02_Zielsetzung_und_Anforderungen.typ"

== Zielgruppe / Stakeholder
#include "Content/02_Ausfuehrliche_Beschreibung_des_Projekts/02_03_Zielgruppe_Stakeholder.typ"






= Vorgehen bei der Umsetzung
#include "Content/03_Vorgehen_bei_Umsetzung/03_Vorgehen_bei_Umsetzung.typ"

== Wahl des Vorgehensmodells (Methodik)
#include "Content/03_Vorgehen_bei_Umsetzung/03_01_Wahl_des_Vorgehensmodells.typ"

== Architektur und technologischer Stack <architektur-stack>
#include "Content/03_Vorgehen_bei_Umsetzung/03_02_Architektur_und_technologischer_Stack.typ"

== Phasen der Entwicklung
#include "Content/03_Vorgehen_bei_Umsetzung/03_03_Phasen_der_Entwicklung.typ"

=== Konzeption und Design <konzeption-design>
#include "Content/03_Vorgehen_bei_Umsetzung/03_03_01_Konzeption_und_Design.typ"

=== Implementierung
#include "Content/03_Vorgehen_bei_Umsetzung/03_03_02_Implementierung.typ"

= Projektmanagement <projektmanagement>
#include "Content/04_Projektmanagement/04_Projektmanagement.typ"







= Überblick über die erstellten Artefakte
#include "Content/05_Ueberblick_ueber_die_erstellten_Artefakte/05_Ueberblick_ueber_die_erstellten_Artefakte.typ"
// Testabbildung: für die finale PDF bitte durch ein echtes Projektbild ersetzen oder entfernen.
#include "Content/05_Ueberblick_ueber_die_erstellten_Artefakte/05_00_Beispielbild.typ"

== Dokumentations- und Planungsartefakte
#include "Content/05_Ueberblick_ueber_die_erstellten_Artefakte/05_01_Dokumentations_und_Planungsartefakte.typ"

== Benutzeroberfläche (UI/UX)
#include "Content/05_Ueberblick_ueber_die_erstellten_Artefakte/05_02_Benutzeroberflaeche_UI_UX.typ"

= Probleme / Herausforderungen
#include "Content/06_Probleme_Herausforderungen/06_Probleme_Herausforderungen.typ"

== Technische Schwierigkeiten
#include "Content/06_Probleme_Herausforderungen/06_01_Technische_Schwierigkeiten.typ"

== Organisatorische Herausforderungen
#include "Content/06_Probleme_Herausforderungen/06_02_Organisatorische_Herausforderungen.typ"

== Lessons Learned
#include "Content/06_Probleme_Herausforderungen/06_03_Lessons_Learned.typ"

= Feedback, Fazit & Ausblick
#include "Content/07_Feedback_Fazit_und_Ausblick/07_Feedback_Fazit_und_Ausblick.typ"

== Externes Feedback / Evaluation
#include "Content/07_Feedback_Fazit_und_Ausblick/07_01_Externes_Feedback_Evaluation.typ"

== Fazit
#include "Content/07_Feedback_Fazit_und_Ausblick/07_02_Fazit.typ"

== Ausblick
#include "Content/07_Feedback_Fazit_und_Ausblick/07_03_Ausblick.typ"

// Literaturverzeichnis nur aktivieren, wenn ihr Quellen verwendet:
// #pagebreak()
// #bibliography("Literature/sources.bib", title: "Literaturverzeichnis", style: "ieee")
