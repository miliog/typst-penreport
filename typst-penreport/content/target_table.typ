#let targetTable(targets) = [
  #table(
    fill: (col, row) => if row == 0 { luma(240) },
    columns: (auto, 1fr),
    inset: 10pt,
    stroke: (paint: gray, thickness: 1pt),
    align: left,
    [*Target*],
    [*Additional Information*],
    ..for target in targets {
      ({target.name},{target.additionalInfo})
    }
  )
]