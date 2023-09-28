#let Status = (
  NotFixed: 0,
  PartiallyFixed: 1,
  Fixed: 2,
  Undetermined: 3,
)

#let getStatusInfo(status) = [  
  #if status == Status.Fixed {
    return (
      text: "Fixed",
      bg: green,
    )
  } else if status == Status.PartiallyFixed {
    return (
      text: "Partially Fixed",
      bg: orange,
    )
  } else if status == Status.NotFixed {
    return (
      text: "Not Fixed",
      bg: red,
    )
  } else if status == Status.NotFixed {
    return (
      text: "Undetermined",
      bg: gray,
    )
  } else {
    assert(status in Status, message: "Status not found!")
  }
]