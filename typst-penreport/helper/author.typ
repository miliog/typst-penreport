#let getAuthorString(authors, onlyPentester) = {
  let authorString = ""
  for author in authors {
    if (onlyPentester and author.pentester) or not onlyPentester {
      authorString += author.name + ", "
    }
  }
  authorString = authorString.slice(0, -2)
  return authorString
}