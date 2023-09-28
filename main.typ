#import "./typst-penreport/penreport.typ": *

#show: body => penreport(
  title: "Test Webseite",
  client: "Die Organisation",
  sharing: TLP.CLEAR,
  targets: (
    (
      name: "Test Website",
      additionalInfo: [
        - https://example.org
      ]
    ),
  ),
  authors: (
    (
      name: "Max Mustermann",
    ),
  ),
  versions: (
    (
      date: datetime(year: 2020, month: 10, day: 4),
      name: "Max Mustermann",
      comment: "First draft",
    ),
    (
      major: true,
      date: datetime(year: 2020, month: 10, day: 4),
      name: "Max Mustermann",
      comment: "Release",
    ),
  ),
  draft: true,
  body,
)

#vuln(
  title: "Cross-Site Scripting",
  target: "Test Website",
  severity: Severity.High,
  type: 79
)[
  The "Test Website" allows unfiltered user input to be rendered on its search results page, leading to a persistent Cross-Site Scripting (XSS) vulnerability. Specifically, when a user submits a search query, the input is echoed back on the page without proper sanitization. An attacker can craft a malicious link containing a script payload, and once clicked by an unsuspecting user, it can lead to session hijacking, defacement, or potentially more severe actions.

  To demonstrate:

  + Visit https://example.org/search
  + In the search bar, input ```js <script>alert('XSS')</script>``` and submit.
  + The alert box pops up, indicating the vulnerability.

This poses a risk as it can be exploited to run any arbitrary JavaScript code in the context of the victim's browser session.
][
  - Always validate and sanitize user input. Ensure that any user-provided data is treated as untrusted and is sanitized properly before rendering it on the page.
  - Use Content Security Policy (CSP) headers to reduce the risk of XSS attacks. This can limit the sources and types of content that can be executed in the web page context.
  - Ensure that all user input is properly encoded when being output to the page. This will prevent special characters from being interpreted as code.
  - Adopt web application firewalls (WAFs) or other security mechanisms that can detect and block malicious input.
  Regularly review and update web applications to patch any vulnerabilities and to stay ahead of potential security threats.
]

#vuln(
  title: "SQLi",
  target: "Test Website",
  severity: Severity.High,
  type: 89
)[][]

#vuln(
  title: "CSP not implemented",
  target: "Test Website",
  severity: Severity.Informational,
  type: 1021,
)[][]

#vuln(
  title: "Huh",
  target: "Test Website",
)[][]