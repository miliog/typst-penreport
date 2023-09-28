#let VersionJump = (
  MINOR: 0,
  MAJOR: 1,
)

#let nextVersion(version, majorJump) = {
  let x = version.split(".")
  assert(x.len() == 2)
  let major = int(x.first())
  let minor = int(x.last())
  if majorJump {
    minor = 0
    major += 1
  } else {
    minor += 1
  }
  return str(major) + "." + str(minor)
}