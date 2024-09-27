#import "template.typ": template
#show: doc => template(doc)

// Úvodní strana
#set text(19pt)
#set align(center)
#set par(justify: false)
ČESKÁ ZEMĚDĚLSKÁ UNIVERZITA V PRAZE\
FAKULTA ŽIVOTNÍHO PROSTŘEDÍ\
KATEDRA PROSTOROVÝCH VĚD\
\
\
\

XXX NÁZEV PRÁCE XXX\
DIPLOMOVÁ PRÁCE\
\
\
\
\
Vedoucí práce: Ing. Jiří Prošek, Ph.D.\
Diplomant: Bc. Vít Ježek\
#set align(center + bottom)
2025
#pagebreak()

// Prohlášení
#set text(11pt)
#set align(left)
#set par(justify: true,
   first-line-indent: 0em)
*ČESTNÉ PROHLÁŠENÍ*

Prohlašuji, že jsem diplomovou práci na téma:
……………...................................vypracoval samostatně a citoval jsem všechny informační
zdroje, které jsem v práci použil a které jsem rovněž uvedl na konci práce v seznamu použitých
informačních zdrojů.

Jsem si vědom, že na moji diplomovou práci se plně vztahuje zákon č. 121/2000 Sb.,
o právu autorském, o právech souvisejících s právem autorským a o změně některých zákonů, ve
znění pozdějších předpisů, především ustanovení § 35 odst. 3 tohoto zákona, tj. o užití tohoto díla.

Jsem si vědom, že odevzdáním diplomové práce souhlasím s jejím zveřejněním podle
zákona č. 111/1998 Sb., o vysokých školách a o změně a doplnění dalších zákonů, ve znění
pozdějších předpisů, a to i bez ohledu na výsledek její obhajoby.

Svým podpisem rovněž prohlašuji, že elektronická verze práce je totožná s verzi tištěnou a že
s údaji uvedenými v práci bylo nakládáno v souvislosti s GDPR.
\
\
\
V Praze dne xxx10 února 2025xxx
\
\
#set align(right)
..............................................\
(podpis autora práce)
#pagebreak()

// Poděování
#set align(left)
*PODĚKOVÁNÍ*\
#lorem(30)
#pagebreak()

// Abstrakty
#set align(top + left)
*Abstrakt*\
#lorem(50)

*Abstract*\
#lorem(50)
#pagebreak()

// Obsah
#outline()
#pagebreak()

////////////////////////////////
// Text
#import "template.typ": template
#show: doc => template(doc)
#set page(numbering: "1") 

= Úvod
#lorem(100)

= Cíle práce
#lorem(1)@author2016book7
#lorem(1)@author2017book4
#lorem(1)@author2018book6
#lorem(1)@author2019book2
#lorem(1)@author2019book8
#lorem(1)@author2020book10
#lorem(1)@author2020book5
#lorem(1)@author2021book1
#lorem(1)@author2022book9
#lorem(1)@author2023book3
#lorem(1)@moudry2012influence
#lorem(1)@example2024
= Metodika
= Literární rešerše
= Charakteristika území
= Výsledky
= Diskuse
= Závěr a přínos práce
= Přehled literatury a použitých zdrojů
#set par(first-line-indent: 0em, leading: 0.8em)
#set block(spacing: 0.8em) // mezera mezi zdroji
#bibliography("zdroje.bib", title: none, style: "citace_czu.csl")


= Přílohy
