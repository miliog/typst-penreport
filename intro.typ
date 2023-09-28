#import "./typst-penreport/content/title_page.typ": *
#import "./typst-penreport/content/document_properties.typ": *
#import "./typst-penreport/content/version_table.typ": *
#import "./typst-penreport/content/target_table.typ": *
#import "./typst-penreport/content/summary_of_findings.typ": *

#let intro(
  title: "",
  subtitle: "Penetration Test Report #1",
  date: datetime.today(),
  versions: (),
  targets: (),
  client: "",
  authors: (),
) = [

  #titlePage(title, subtitle, date)

  #documentProperties("Document Properties", client, subtitle, targets)

  #versionTable("Version Control", versions)

  #outline(
    title: "Table of Contents",
    indent: true,
    depth: 2,
    fill: none,
  )

  = Executive Summary

  == Introduction

  == Scope

  == Objectives

  == Summary of Findings

  #summaryOfFindings()

  = Methodology

  == Planning
  == Risk Classification
  == CWE

  The Common Weakness Enumeration (CWE) data, including titles, descriptions, and related content referenced in this report, are owned by The MITRE Corporation (MITRE). For detailed terms of use and further information, please refer to MITRE's CWE Terms of Use which can be found at https://cwe.mitre.org/about/termsofuse.html.

  #pagebreak()

  = Findings

]