#let template(
doc,
)={

set text(
  lang: "cs",
  font: "Libertinus Serif",
  size: 11pt,
  hyphenate: true, // dělení slov

)

set page(
  paper: "a4",
  margin: (
    top: 2.5cm,
    bottom: 2.5cm,
    left: 4cm,
    right: 2.5cm 
  ),
)


set par(
  leading: 1em, // řádkování
  justify: true, 
   first-line-indent: 2em, // odsazení
)

set heading(
  numbering: "1. ",
)

set block(spacing: 1.8em) // mezera mezi odstavci

show figure.caption: emph // zkosení textu u figures
show figure.caption: set text(11pt)
doc}