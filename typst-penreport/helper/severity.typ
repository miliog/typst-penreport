#let Severity = (
  Informational: 0,
  Low: 1,
  Medium: 2,
  High: 3,
  Critical: 4,
  Undetermined: 5,
)

#let getSeverityInfo(severity) = [  
  #if severity == Severity.Informational {
    return (
      text: "Informational",
      bg: rgb("#00B0F0"),
    )
  } else if severity == Severity.Low {
    return (
      text: "Low",
      bg: green,
    )
  } else if severity == Severity.Medium {
    return (
      text: "Medium",
      bg: orange,
    )
  } else if severity == Severity.High {
    return (
      text: "High",
      bg: red,
    )
  } else if severity == Severity.Critical {
    return (
      text: "Critical",
      bg: rgb("#221E1F"),
    )
  } else if severity == Severity.Undetermined {
    return (
      text: "Undetermined",
      bg: gray.darken(30%),
    )
  } else {
    assert(severity in Severity, message: "Severity not found!")
  }
]