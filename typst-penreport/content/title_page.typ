#let titlePage(title, subtitle, date) = {
  set align(horizon + center)
  v(-50%)
  line(length: 100%)
  text(30pt, title + "\n")
  v(-23pt)
  text(16pt, subtitle + "\n")
  line(length: 100%, stroke: 2pt)
  date.display("[month repr:long] [day], [year]")
  set align(bottom + right)
  pagebreak()
}