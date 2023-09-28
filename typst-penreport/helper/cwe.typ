#let cweXmlData = xml("../static/cwec_v4.12.xml")

#let findWeaknessById(id) = {
  for weakness in cweXmlData.first().children.at(1).children {
    if ("attrs" in weakness and weakness.attrs.ID == str(id)) {
      let description = weakness.children.at(1).children.at(0)
      // A fix for CWE-20 and probably others as well
      description = description.replace(regex("\n[ ]{2,}"), " ")
      return (
        id: weakness.attrs.ID,
        name: weakness.attrs.Name,
        description: description,
        link: "https://cwe.mitre.org/data/definitions/" + str(id) + ".html",
      )
    }
  }
  assert(false, message: "CWE not found!")
}