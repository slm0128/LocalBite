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

= Projektüberblick
#include("Content/01_Projektueberblick.typ")

= Projektbeschreibung
#include("Content/02_Projektbeschreibung.typ")

= Vorgehen bei der Umsetzung
#include("Content/03_Vorgehen_bei_der_Umsetzung.typ")

= Projektmanagement
#include("Content/04_Projektmanagement.typ")

= Geschäftsprozessanalyse
#include("Content/05_Geschaeftsprozessanalyse.typ")

= Automatisierungspotenzial
#include("Content/06_Automatisierungspotenzial.typ")

= Objektorientierte Analyse
#include("Content/07_Objektorientierte_Analyse.typ")

= Probleme und Herausforderungen
#include("Content/08_Probleme_und_Herausforderungen.typ")

= Feedback und Fazit
#include("Content/09_Feedback_und_Fazit.typ")

// Literaturverzeichnis nur aktivieren, wenn ihr Quellen verwendet:
// #pagebreak()
// #bibliography("Literature/sources.bib", title: "Literaturverzeichnis", style: "ieee")
