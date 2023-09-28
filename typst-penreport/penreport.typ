#import "@preview/chic-hdr:0.3.0": *
#import "./helper/tlp.typ": ShowTLP, TLP
#import "./helper/vuln.typ": vuln
#import "./helper/severity.typ": Severity
#import "./helper/author.typ": getAuthorString
#import "../intro.typ": intro

#let penreport(
  title: "",
  subtitle: "Penetration Test Report #1",
  id: none,
  date: datetime.today(),
  versions: (),
  targets: (),
  client: "",
  sharing: none,
  authors: (),
  font: "Open Sans",
  numbering: "1.1",
  draft: false,
  body
) = [

  /* General Config */
  
  #set document(
    title: title + " - " + subtitle,
    author: getAuthorString(authors, false)
  )
  
  #set page(
    foreground: [
      #if draft [
        #set align(center)
        #set text(
          size: 100pt,
          fill: rgb(100%, 0, 0, 25%)
        )
        #rotate(-45deg)[
          DRAFT
        ]
      ]
    ]
  )
  
  #set text(font: "Open Sans")
  #set heading(numbering: numbering)
  #set list(marker: ([•], [--]))
  #show heading.where(level: 1): it => {
    pagebreak(weak: true)
    it
  }
  #show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    strong(it)
  }

  /* Header + Footer Config */
  
  #show: chic.with(
    chic-header(
      left-side: none,
      center-side: none,
      right-side: ShowTLP(sharing),
    ),
    chic-footer(
      left-side: strong(
          text(title)
      ) + text("\n" + subtitle, size: 9pt),
      center-side: [Page #chic-page-number() of #locate(loc => counter(page).final(loc).at(0))],
      right-side: ShowTLP(sharing),
    ),
    chic-separator(1pt, on: "footer"), 
    chic-offset(7pt),
    chic-height(1.75cm)
  )

  #intro(
    title: title,
    subtitle: subtitle,
    date: date,
    versions: versions,
    targets: targets,
    client: client,
    authors: authors,
  )

  #body
]

