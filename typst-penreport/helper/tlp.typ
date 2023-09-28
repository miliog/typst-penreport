#let TLP = (
  RED: (
    text: "TLP:RED",
    color: "#FF2B2B"
  ),
  AMBER: (
    text: "TLP:AMBER",
    color: "#FFC000"
  ),
  AMBER_STRICT: (
    text: "TLP:AMBER+STRICT",
    color: "#FFC000"
  ),
  GREEN: (
    text: "TLP:GREEN",
    color: "#33FF00"
  ),
  CLEAR: (
    text: "TLP:CLEAR",
    color: "#FFFFFF"
  ),
)

#let ShowTLP(sharing) = [
  #box(height: 1.5em, fill: black, inset: .2em,
    [
      #set align(horizon)
      #text(rgb(sharing.color), size: 12pt, weight: 700)[#sharing.text]
    ]
  )
]