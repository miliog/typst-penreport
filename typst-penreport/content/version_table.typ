#import "../helper/version.typ": *

#let versionTable(headingName, versions) = [
  #if versions.len() > 0 [
    #strong(headingName)
    #let version = "0.0"
    #table(
      fill: (col, row) => if row == 0 { luma(240) },
      columns: (0.56fr, 1.05fr, 0.7fr, 1.5fr),
      inset: 10pt,
      stroke: (paint: gray, thickness: 1pt),
      align: left,
      [*Version*],
      [*Date*],
      [*Author*],
      [*Description*],
      ..for item in versions {
        version = nextVersion(version, if "major" in item {
          item.major
        } else {
          false
        })
        (
          version,
          item.date.display("[month repr:long] [day], [year]"),
          item.name,
          item.comment
        )
      }
    )
  ]
]