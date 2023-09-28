#let CVE(id: "") = {
  assert(id.matches(regex("^\d{4}-\d{4,7}$")).len() == 1, message: "The CVE number must match the format \d{4}-\d{4,7}.")
  link("https://www.cve.org/CVERecord?id=CVE-" + id)[CVE-#id]
}