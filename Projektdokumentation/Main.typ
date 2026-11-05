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
)

= Mitglieder der Gruppe (ca. 1 Seite)
#include("Content/02_Projektbeschreibung.typ")

== Vorstellung der Gruppenmitglieder

== Rollen- und Aufgabenverteilung






= Ausführliche Beschreibung des Projekts (ca. 3–4 Seiten)

== Projektidee und Motivation

== Zielsetzung und Anforderungen (Requirements)

== Zielgruppe / Stakeholder


= Vorgehen bei Umsetzung (ca. 5–6 Seiten)

== Wahl des Vorgehensmodells (Methodik)

== Architektur und technologischer Stack

== Phasen der Entwicklung

=== Konzeption & Design

=== Implementierung

=== Qualitätssicherung & Tests

= Projektmanagement (ca. 3–4 Seiten)

== Zeit- und Ablaufplanung (Projektphasen)

== Ressourcen- und Kostenplanung

== Kommunikation und Kollaboration

= Überblick über die erstellten Artefakte (ca. 4–5 Seiten)

== Dokumentations- und Planungsartefakte

== Technische Artefakte

== Benutzeroberfläche (UI/UX)

= Probleme / Herausforderungen (ca. 2 Seiten)

== Technische Schwierigkeiten

== Organisatorische Herausforderungen

== Lessons Learned (Was lief gut, was beim nächsten Mal anders?)

= Feedback, Fazit & Ausblick (ca. 2 Seiten)

== Externes Feedback / Evaluation

== Fazit

== Ausblick

// Literaturverzeichnis nur aktivieren, wenn ihr Quellen verwendet:
// #pagebreak()
// #bibliography("Literature/sources.bib", title: "Literaturverzeichnis", style: "ieee")
