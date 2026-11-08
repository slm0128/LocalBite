#import "deckblatt.typ": localbite_deckblatt

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
  dark_green: rgb("#193D2A"),
  accent_green: rgb("#8DAD48"),
  chapter_authors: (:),
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
    hyphenate: true,
  )
  set par(
    justify: true,
    linebreaks: "optimized",
    leading: line_leading,
  )

  // Dokumentstruktur bleibt erhalten, nur die Optik wird modernisiert.
  // Bewusst KEINE Linien oder Balken unter den Überschriften.
  set heading(numbering: heading_numbering)
  show heading.where(level: 1): set heading(supplement: "Kapitel")
  show heading.where(level: 2): set heading(supplement: "Abschnitt")
  show heading.where(level: 3): set heading(supplement: "Unterabschnitt")

  show heading: it => {
    let title_size = if it.level == 1 { 20pt } else if it.level == 2 { 15pt } else { 12pt }
    text(font: font_family, size: title_size, weight: "bold", fill: dark_green, it)
    v(if it.level == 1 { 0.48cm } else { 0.22cm })
  }

  show heading.where(level: 1, outlined: true): it => {
    pagebreak(weak: true)
    it
  }

  show heading.where(level: 2): it => {
    v(weak: true, 0.58cm)
    it
  }

  show heading.where(level: 3): it => {
    v(weak: true, 0.4cm)
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
  // Deckblatt – eigenständiges LocalBite-Layout mit austauschbaren SVGs.
  // Ein Seitenlayoutwechsel via set page(...) trennt Deckblatt und Verzeichnis.
  // ------------------------------------------------------------
  set page(
    paper: "a4",
    margin: 0pt,
    numbering: none,
    header: none,
    footer: none,
    fill: rgb("#FCFBF7"),
  )
  localbite_deckblatt(
    title_long: title_long,
    authors: authors,
    course: course,
    group: group,
    submission_date: submission_date,
  )

  // ------------------------------------------------------------
  // Inhaltsverzeichnis – dezentes LocalBite-Design.
  // Keine Aenderung an Schriftart oder Formatierung der Untereintraege.
  // ------------------------------------------------------------
  set par(spacing: paragraph_spacing)
  set page(
    numbering: "I",
    // Die gleichen Seitenraender wie im Hauptteil (keine 1-cm-Verschiebung).
    margin: main_margins,
    footer-descent: 0pt,
    header: context {
      // Gleiche Logo-Position wie auf den Textseiten.
      grid(
        columns: (1fr, 1fr),
        align: (left, right),
        move(dy: 4mm, image("Assets/Logos/LocalBite-Logo.svg", height: 10mm)),
        [],
      )
      v(9pt)
      line(length: 100%, stroke: (paint: accent_green, thickness: 0.5pt))
    },
    footer: context {
      line(length: 100%, stroke: (paint: accent_green, thickness: 0.5pt))
      v(9pt)
      grid(
        columns: (1fr, auto, auto),
        gutter: 5pt,
        align: (left + horizon, right + horizon, right + horizon),
        text(size: 8.5pt, fill: dark_green)[Projektdokumentation – LocalBite],
        text(size: 8.5pt, fill: dark_green)[#counter(page).display("I")],
        image("Assets/Design/Blatt.svg", height: 5mm),
      )
    },
  )
  counter(page).update(1)

  // Nur die Hauptkapitel im Verzeichnis werden grün;
  // Schriftart, Schriftgroesse, Texte, Seitenzahlen und Einrueckungen bleiben erhalten.
  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    text(fill: dark_green, strong(it))
  }

  v(6mm)
  outline(
    title: text(size: 20pt, weight: "bold", fill: dark_green)[Inhaltsverzeichnis],
    depth: 3,
    indent: auto,
  )

  pagebreak()

  // ------------------------------------------------------------
  // Hauptteil – zurückhaltendes LocalBite-Design.
  // Logo und Blätter sind eigenständige SVG-Dateien und austauschbar.
  // Bestimmung des Hauptkapitels auch auf dessen erster Seite:
  // Der Header liegt vor dem eigentlichen Seiteninhalt.
  // Für die Fußzeile wird derselbe Kapitelstand verwendet.
  let current_chapter = () => {
    let chapters = query(heading.where(level: 1))
    let page_no = here().page()
    let this_page = chapters.filter(it => it.location().page() == page_no)
    let preceding = chapters.filter(it => it.location().page() < page_no)
    let item = if this_page.len() > 0 {
      this_page.last()
    } else if preceding.len() > 0 {
      preceding.last()
    } else {
      none
    }

    if item == none {
      (number: 0, title: [])
    } else {
      (
        number: counter(heading).at(item.location()).first(),
        title: item.body,
      )
    }
  }

  set page(
    numbering: page_numbering,
    margin: main_margins,
    footer-descent: 0pt, // Footer höher platzieren, damit das Blatt nicht über die Seite hinausragt.
    header: context {
      let chapter = current_chapter()
      let chapter_num = if chapter.number > 0 { str(chapter.number) + " " } else { "" }

      grid(
        columns: (1fr, 1fr),
        align: (left, right),
        move(dy: 4mm, image("Assets/Logos/LocalBite-Logo.svg", height: 10mm)),
        text(size: 9pt, fill: dark_green)[#chapter_num#chapter.title],
      )
      v(5pt)
      line(length: 100%, stroke: (paint: accent_green, thickness: 0.8pt))
    },
    footer: context {
      let chapter = current_chapter()
      let author = chapter_authors.at(str(chapter.number), default: "Projektteam")

      v(3pt)
      line(length: 100%, stroke: (paint: accent_green, thickness: 0.8pt))
      v(2pt)
      grid(
        columns: (1fr, auto, auto),
        gutter: 5pt,
        align: (left + horizon, right + horizon, right + horizon),
        [
          #text(size: 8.5pt, fill: dark_green)[Projektdokumentation – LocalBite]
          #v(2pt)
          #text(size: 8pt, fill: dark_green)[Verfasst von: #author]
        ],
        text(size: 8.5pt, fill: dark_green)[Seite #counter(page).display("1")],
        image("Assets/Design/Blatt.svg", height: 5mm),
      )
    },
  )

  counter(page).update(1)
  body
}
