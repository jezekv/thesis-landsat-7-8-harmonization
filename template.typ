#let template(
doc,
)={

set text(
  lang: "cs",
  font: "Arial",
  size: 11pt,
  hyphenate: false, // dělení slov

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

set block(spacing: 2.5em) // mezera mezi odstavci

show figure.caption: emph // zkosení textu u figures

doc}