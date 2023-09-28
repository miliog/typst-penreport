#let documentProperties(headingName, organisation, subtitle, targets) = [
  #strong(headingName)
  #table(
    fill: (col, row) => if col == 0 { luma(240) },
    columns: (auto, 1fr),
    inset: 10pt,
    stroke: (paint: gray, thickness: 1pt),
    align: left,
    [*Client*],
    organisation,
    [*Title*],
    subtitle,
    [*Targets*],
    for item in targets {
      item.name + "\n"
    },
    [*Version*],
    [1.0],
    [*Pentester*],
    [],
  )
]