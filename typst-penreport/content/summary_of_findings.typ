#import "../helper/severity.typ": *

#let summaryOfFindings() = {
  locate(
    loc => {
      let items = query(<data>, loc)
      let n = 0
      let columns = (1fr, auto)
      table(
        columns: columns,
        inset: 10pt,
        fill: (col, row) => {
          if row == 0 { return luma(240) }
          if col == columns.len() - 1 {
            let sev = items.at(row - 1).value.at("severity")
            return getSeverityInfo(sev).bg.lighten(75%)
          }
        },
        stroke: (paint: gray, thickness: 1pt),
        .. {
          let headers = (
            [*Title*],
            [*Severity*],
          )
          headers
          for item in items {
            let severityInfo = getSeverityInfo(item.value.at("severity"))
            n += 1
            let row = (
              [#link(item.value.at("position"))[#item.value.at("title")]],
              [
                #set text(
                  size: 12pt,
                )
                #text(weight: "bold")[#severityInfo.at("text")]
              ]
            )
            row
          }
        },
      )
    },
  )
}