// LocalBite – voll editierbares Typst-Deckblatt.
// Logo und Illustration sind separate Assets; keine Textbestandteile sind in einem Bild eingebrannt.
// Es wird vom bestehenden template.typ vor dem Inhaltsverzeichnis aufgerufen.
#let localbite_deckblatt(
  title_long: "LocalBite",
  authors: [],
  course: "",
  group: "",
  submission_date: "",
) = {
  let dark = rgb("#193D2A")
  let green = rgb("#8DAD48")
  // Auf dem Deckblatt bewusst eine moderne Schrift wie im Bildbeispiel;
  // die Schrift im Inhaltsverzeichnis und Fließtext bleibt unverändert.
  set text(font: "Arial", fill: dark)
  set par(justify: false)

  block(width: 210mm, height: 296mm)[
    // Grüner Seitenstreifen und komplett austauschbares weißes Logo-SVG.
    #place(top + left, dx: 0mm, dy: 0mm,
      image("Assets/Design/Deckblatt_Seitenleiste.svg", width: 40mm, height: 297mm))
    #place(top + left, dx: 3mm, dy: 12mm,
      image("Assets/Logos/LocalBite-Logo-Weiss.svg", width: 34mm))
    #place(top + left, dx: 10mm, dy: 61mm,
      line(length: 22mm, stroke: 1.2pt + green))

    // Offizielles DHBW-Logo, separat und austauschbar.
    #place(top + left, dx: 146mm, dy: 10mm,
      image("Assets/Logos/DHBW-Logo.svg", width: 54mm))

    // Bearbeitbare Titeltexte.
    #place(top + left, dx: 49mm, dy: 66mm,
      text(size: 25pt, weight: "bold", fill: dark)[Projektdokumentation])
    #place(top + left, dx: 49mm, dy: 84mm,
      text(size: 24pt, fill: rgb("#64894C"))[#title_long])
    #place(top + left, dx: 49mm, dy: 100mm,
      line(length: 25mm, stroke: 1.5pt + green))

    // Illustration aus eurer Designvorlage (kein Foto/Platzhaltertext).
    #place(top + left, dx: 42mm, dy: 117mm,
      image("Assets/Design/Deckblatt_Illustration.png", width: 164mm))

    // Projektdaten: Die Werte stammen aus config.typ und werden nicht ins Bild eingebrannt.
    #place(top + left, dx: 51mm, dy: 210mm,
      box(width: 149mm)[
        #set text(size: 9.2pt)
        #grid(
          columns: (35mm, 1fr),
          column-gutter: 7mm,
          row-gutter: 3mm,
          [*Projekt*], [LocalBite – Regionale Lebensmittel direkt vom Hof],
          [*Studiengang*], [Wirtschaftsinformatik (B.Sc.)],
          [*Projektteam*], [#authors],
          [*Kurs / Gruppe*], [#course / #group],
          [*Abgabe*], [#submission_date],
        )
      ])

    // Zurückhaltender Abschluss, analog zu den Inhaltsseiten.
    #place(top + left, dx: 51mm, dy: 280mm,
      line(length: 126mm, stroke: 0.5pt + green))
    #place(top + left, dx: 51mm, dy: 284mm,
      text(size: 9pt)[DHBW Karlsruhe])
    #place(top + left, dx: 182mm, dy: 274.5mm,
      image("Assets/Design/Blatt.svg", width: 11mm))
  ]
}
