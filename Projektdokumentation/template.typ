#let page_numbering = "1 / 1"
#let heading_numbering = "1.1.1"

#let localbite_document(
  title_long: none,
  title_short: none,
  document_type: none,
  authors: none,
  course: none,
  group: none,
  submission_date: none,
  font_family: "Times New Roman",
  font_size: 12pt,
  line_leading: 1em,
  paragraph_spacing: 1.65em,
  main_margins: (top: 2.5cm, left: 3.5cm, right: 2.5cm, bottom: 2cm),
  front_margins: (top: 2.5cm, left: 3.5cm, right: 2.5cm, bottom: 2.5cm),
  body,
) = {
  // ------------------------------------------------------------
  // Dokumentgrundlage – PA1-Design
  // ------------------------------------------------------------
  set document(title: title_long)
  set page(paper: "a4")
  set text(
    lang: "de",
    font: font_family,
    size: font_size,
    hyphenate: false,
  )
  set par(
    justify: true,
    linebreaks: "optimized",
    leading: line_leading,
  )

  // Überschriften wie in der PA1.
  set heading(numbering: heading_numbering)
  show heading.where(level: 1): set heading(supplement: "Kapitel")
  show heading.where(level: 2): set heading(supplement: "Abschnitt")
  show heading.where(level: 3): set heading(supplement: "Unterabschnitt")

  show heading: it => {
    text(font: font_family, it)
    v(0.5cm)
  }

  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    it
  }

  show heading.where(level: 2): it => {
    v(weak: true, 1.2cm)
    it
  }

  show heading.where(level: 3): it => {
    v(weak: true, 1.2cm)
    it
  }

  // Abbildungs-/Tabellenbezeichnungen wie in der PA1.
  show figure.where(kind: image): set figure(supplement: "Abb.")
  show figure.where(kind: table): set figure(supplement: "Tab.")
  show figure.where(kind: raw): set figure(supplement: [Code])

  // Code-Stil wie in der PA1.
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 2pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )

  show raw.where(block: true): block.with(
    fill: luma(240),
    inset: 10pt,
    radius: 2pt,
    width: 100%,
  )

  // ------------------------------------------------------------
  // Titelblatt – reduziert auf die Fallstudie, nur DHBW
  // ------------------------------------------------------------
  set page(margin: front_margins)
  set par(spacing: 2em)

  grid(
    columns: (1fr, 1fr),
    align(left)[],
    align(right)[
      #image("Assets/Logos/DHBW-Logo.svg", height: 2.5cm)
    ],
  )

  v(0.1cm)

  align(center)[
    #set par(justify: false, leading: 0.7em)

    #text(16pt)[*Fakultät Wirtschaft*]
    #v(0.1cm)

    #text(16pt)[*Studiengang Wirtschaftsinformatik*]
    #v(0.1cm)

    #text(size: 26pt)[*#title_long*]
    #v(0.1cm)

    #text(16pt)[*#document_type*]
    #v(0.1cm)

    #text(12pt)[Im Rahmen der Fallstudie im 3. Semester]
  ]

  v(0.5cm)

  set par(leading: 0.9em)
  align(center)[
    #table(
      columns: (1fr, 1fr),
      align: (right, left),
      stroke: none,
      [*Verfasst von*], [#authors],
      [*Kurs, Gruppe*], [#course, #group],
      [*Hochschule*], [Duale Hochschule Baden-Württemberg Karlsruhe],
      [*Abgabedatum*], [#submission_date],
    )
  ]

  pagebreak()

  // ------------------------------------------------------------
  // Vorspann – römische Seitenzahlen
  // ------------------------------------------------------------
  set par(spacing: paragraph_spacing)
  set page(
    numbering: "I",
    margin: front_margins,
  )
  counter(page).update(1)

  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    strong(it)
  }

  outline(
    title: [Inhaltsverzeichnis],
    depth: 3,
    indent: auto,
  )

  pagebreak()

  // ------------------------------------------------------------
  // Hauptteil – Kopf-/Fußzeile wie in der PA1
  // ------------------------------------------------------------
  set page(header: context {
    if here().page-numbering() != page_numbering {
      return
    }

    let display_heading = []
    let elems = query(selector(heading).after(here()))

    if elems != () and elems.first().location().page() == here().page() and elems.first().level == 1 {
      display_heading = elems.first().body
    } else {
      elems = query(heading.where(level: 1).before(here()))
      if elems != () and elems.last().location().page-numbering() == page_numbering {
        display_heading = elems.last().body
      }
    }

    place(
      top,
      grid(
        columns: (auto, 1fr),
        align(left, text(title_short)),
        align(right, text(style: "italic", display_heading)),
      ),
      dy: 1.25cm,
    )

    place(
      top,
      line(length: 100%, stroke: (paint: gray)),
      dy: 1.75cm,
    )
  })

  set page(
    numbering: page_numbering,
    margin: main_margins,
    footer: context align(right)[
      #place(
        bottom,
        line(length: 100%, stroke: (paint: gray)),
        dy: -1.7cm,
      )

      #place(
        bottom + right,
        counter(page).display(),
        dy: -1.25cm,
      )
    ],
  )

  counter(page).update(1)

  body
}
