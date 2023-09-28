#import "@preview/tablex:0.0.5": *
#import "cwe.typ": *
#import "severity.typ": *
#import "status.typ": *

#let vuln(
  title: "",
  target: "",
  severity: Severity.Undetermined,
  type: none,
  status: Status.NotFixed,
  recheck: false,
  description,
  remediation,
) = [
  #heading(level: 2, title)
  #locate(loc => [
    #let vuln_data = (
      title: title,
      severity: severity,
      type: type,
      page: numbering("1.1", ..counter(page).at(loc)),
      position: loc.position(),
    )
    #metadata(vuln_data)<data>
  ])
  #tablex(
    columns: (1fr, 1fr),
    inset: 10pt,
    stroke: (paint: gray, thickness: 0pt),
    vlinex(start: 0, end: 1, x: 0, stroke: getSeverityInfo(severity).bg + 5pt),
    vlinex(start: 0, end: 1, x: 1, stroke: getStatusInfo(status).bg + 5pt),
    vlinex(start: 1, end: 2, x: 0, stroke: gray + 5pt),
    vlinex(start: 2, end: 3, x: 0, stroke: rgb("#222255").lighten(50%) + 5pt),
    align: left,
    .. {
      if status == Status.NotFixed and not recheck {
        (
          colspanx(2, cellx(fill: getSeverityInfo(severity).bg.lighten(75%))[
            Severity: *#getSeverityInfo(severity).text*
          ]),
        )
      } else {
        (cellx(fill: getSeverityInfo(severity).bg.lighten(75%))[
          Severity: *#getSeverityInfo(severity).text*
        ],
        cellx(fill: getStatusInfo(status).bg.lighten(75%))[
          Status: *#getStatusInfo(status).text*
        ]
        ,)
      }
    },
    colspanx(2, cellx(fill: gray.lighten(75%))[
      Target: #target
    ]),
    colspanx(2, inset: 0pt, cellx()[
      #if type != none [
        #let weakness = findWeaknessById(type)
        #box(inset: 10pt, width: 100%, fill: rgb("#222255").lighten(75%))[
          #link("https://google.com")[*CWE-#weakness.id: #weakness.name*]
        ]
        #v(-15pt)
        #box(inset: 10pt, fill: rgb("#222255").lighten(80%), width: 100%)[
          #weakness.description
        ]
      ]
    ]),
  )
  #heading(level: 3, "Description", numbering: none)
  #description
  #heading(level: 3, "Remediation", numbering: none)
  #remediation
  #pagebreak(weak: true)
]