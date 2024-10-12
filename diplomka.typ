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
#set align(start)
#set par(justify: true,
         first-line-indent: 0em)
         
*ČESTNÉ PROHLÁŠENÍ*\
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
#set align(right)
..............................................\
(podpis autora práce)
#pagebreak()

// Poděování
#set align(start)
*PODĚKOVÁNÍ*\
#lorem(30)
#pagebreak()

// Abstrakty
#set align(start + top)
*Abstrakt*\
#lorem(50)

*Abstract*\
#lorem(50)
#pagebreak()

///////////
// Obsah
#outline()
#pagebreak()

////////////////////////////////////////
// Text
#set par(first-line-indent: 2em)
#set page(numbering: "1") 

= Úvod
   velmi stručný popis myšlenky zvyšování zelenosti pixelů: globální oteplování x nevhodně připravená data (lehká dostupnost x nedostatečná odbornost)
= Cíle práce
   podrobnější rozepsání viz zadání
   výzkumné otázky? 

= Literární rešerše
   cca deset stran studie viz trello a zadání
   krátce o misi landsat a popis obou senzorů (jejich spektrálním rozsahů - porovnání)

= Charakteristika studijního území
   něco o Léhu a typických znacích vysokohorského prostředí
   obrázky scén landsat

= Metodika
== Charakteristika vstupních dat
Pro potřeby této práce byly data z obou senzorů zpracovány v prostředí Google Earth Engine, který nabízí uživateli efektivní možnost cloudového zpracování velkého množství dat s využitím programovacího jazyku Java Script API. 

Z důvodu jednoduché aplikace pro pozdější statistickou analýzu byly použity atmosféricky korigovaná data v označení _Level 2, Collection 2, Tier 1_ a to jak pro Landsat 7, tak i Landsat 8. V obou případech se zároveň jednalo o zpracování na úrovni _Surface Reflectance_. Kompletní předzpracování snímků provedla US. Geological Survey pomocí metod _Landsat Ecosystem Disturbance Adaptive Processing System (LEDAPS)_ pro Landsat 7 a _Land Surface Reflectance Code (LaSRC)_ pro Landsat 8 @usgs_sr.

Základní myšlenkou modelu _LEDAPS_ je, v prvním kroku, kalibrace syrových dat na horní část atmosféry (TOA) a následně atmosferická korekce pomocí metody MODIS/6S @masek_2006. Metoda _LaSRC_ využívá pro výpočet aerosolové pásmo a pomocná klimatická data MODIS nebo VIIRS CMG společně s modelem radiačního přenosu @VERMOTE2016.

== Filtrace oblačnosti a výpočet NDVI
Prvním krokem předzpracování dat v GEE byla filtrace oblačosti s využitím QA_PIXEL. Pásmo Quality Assessment (QA) v sobě ukládá binární přepis informací o kvalitě jednotlivých pixelů v obraze a pomáhá tak identifikovat přítomnost oblaků, ledu, sněhu či vody ve snímku @usgs_qa. Na obrázku x je přiložen kód pro filtraci oblačnosti. Bity pro _Cloud Confidence_ i _Cloud Shadow Confidence_ byly filtrovány s intenzitou _.gte(2)_.

#figure(
block()[
   #set par(first-line-indent: 0em, leading: 0.6em)
#show raw.where(block: true): block.with(
  fill: luma(240),
  width: 100%,
  inset: 10pt,
  radius: 4pt,
)
```js
var radix = 2; //filtr pro binary data

// Funkce pro extrakci QA_PIXEL bitů
var extractQABits = function(qaBand, bitStart, bitEnd) {
  var numBits = bitEnd - bitStart + 1;
  var qaBits = qaBand.rightShift(bitStart).mod(Math.pow(radix, numBits));
  return qaBits;
};

// Funkce pro vytvoření masky pro QA_PIXEL bitovou kombinaci
var createMask = function(image) {
  var image_qa = image.select('QA_PIXEL');

  // Výběr bitů "Cloud Confidence"
  var bitStartCloudConfidence = 8;
  var bitEndCloudConfidence = 9;
  var qaBitsCloudConfidence = extractQABits(image_qa, bitStartCloudConfidence, bitEndCloudConfidence);
  var testCloudConfidence = qaBitsCloudConfidence.gte(2);

  // Výběr bitů "Cloud Shadow Confidence"
  var bitStartShadowConfidence = 10;
  var bitEndShadowConfidence = 11;
  var qaBitsShadowConfidence = extractQABits(image_qa, bitStartShadowConfidence, bitEndShadowConfidence);
  var testShadowConfidence = qaBitsShadowConfidence.gte(2);

  var maskComposite = testCloudConfidence.or(testShadowConfidence).not();
  return image.updateMask(maskComposite);
};
```
],

   kind: "img",
   supplement: "obr.",
   caption: "Funkce pro maskování oblačnosti",)

Následně byl vypočítan normalizovaný vegetační index (NDVI). Jedná se o jeden z nejpoužívanějších vegetačních indexů pro sledování zdraví a hustoty vegetace @huang2021commentary. NDVI se získává dle vzorce: $ "NDVI"= ("NIR"-"RED")/("NIR"+"RED") $

Hodnoty NDVI se pohybují od -1 do 1. Nízké hodnoty, kolem 0,1 nebo méně, obvykle ukazují na suché oblasti, jako jsou kamenné či písečné pouště. Hodnoty v rozmezí 0,2 až 0,3, charakterizují křoviny a pastviny. Vysoké hodnoty, pohybující se mezi 0,6 a 0,8, indikují husté vegetační porosty, včetně mírných a tropických deštných lesů @weier2000measuring. Na základě těchto informací byl práh v kódu na obrázku x nastaven na hodnotu _0.1_ a pixely s nižší hodnotou byly zamaskovány.


#figure(
block()[
   #set par(first-line-indent: 0em, leading: 0.6em)
#show raw.where(block: true): block.with(
  fill: luma(240),
  width: 100%,
  inset: 10pt,
  radius: 4pt,
)
```js
"thresholdValue": 0.1 // práh NDVI

// Funkce NDVI + threshold
var computeNdvi = function(image) {
  var ndvi = image.expression(
    '((NIR - RED) / (NIR +  RED))',
    {
      'NIR': image.select('NIR'),
      'RED': image.select('RED'),  
    }
  ).rename('NDVI');
  var thresholdMask = ndvi.gt(thresholdValue);
  var updatedMask = ndvi.updateMask(thresholdMask);
  var addNDVI = image.addBands(updatedMask);
  var maskedBands = updatedMask.mask();
  return addNDVI.updateMask(maskedBands);
};
```
],

   kind: "img",
   supplement: "obr.",
   caption: "Funkce pro výpočet NDVI a threshold",)

Zpracování dat popsané výše bylo společné pro obě následující kapitoly. Tedy jak pro porovnání maximálních hodnot z celých sezón, tak i pro porovnání jednotlivých scén v sezóně mezi sebou.

== Porovnání maximálních hodnot NDVI z celé sezóny
Cílem této části bylo vždy získání maximální hodnoty NDVI za celou sezónu, kdy sezóna byla časově definována na období mezi 1. květnem a 30. zářím, a tyto maxima pak srovnat s dalšími, stejně upravenými, sezónami. 

Analýza proběhla v principu ve třech samostatných větvích, kdy v jedné byly zpracovávány pouze snímky z Landsat 7, v druhé pouze snímky z Landsat 8 a nakonec snímky z obou nosičů dohromady. Všechny dostupné snímky v každé větvi byly překryty přes sebe a byla z nich vyfiltrována maxima pomocí reduceru dle obrázku x.

#figure(
block()[
   #set par(first-line-indent: 0em, leading: 0.6em)
#show raw.where(block: true): block.with(
  fill: luma(240),
  width: 108%,
  inset: 10pt,
  radius: 4pt,
)
```js
// Redukce pro získání maximálních hodnot pro každý pixel
var maxCombination = imageCombination.reduce(ee.Reducer.max()).rename(startExport + '_comb');
var maxL7 = imageL7.reduce(ee.Reducer.max()).rename(startExport + '_L7');
var maxL8 = imageL8.reduce(ee.Reducer.max()).rename(startExport + '_L8');

var finalCombination = finalCombination.addBands(maxCombination).select('20.*');
var finalL7 = finalL7.addBands(maxL7).select('20.*');
var finalL8 = finalL8.addBands(maxL8).select('20.*');
```
],

   kind: "img",
   supplement: "obr.",
   caption: "Aplikace reduceru pro získání maximálních hodnot",)

Celá filtrace proběhla ve for cyklu, který postup zopakoval pro celkem devět sezón za sebou (2013 až 2021). Výstupem byl tak pro každou větev image s devíti pásmy, kdy každé odpovídalo jedné sezóně. 

Další fází této analýzy bylo získání společných pixelů pro celé sledované období, a to z důvodu možnosti porovnání sezón mezi sebou. K tomu byl použit for cyklus (obr. x), který pracoval na principu postupného přikládání snímků přes sebe a maskováním pixelů, které se nenacházely na scénách ze všech sezón. Výstupem bylo nové pásmo _mask_, které bylo později použito pro tvorbu stratifikovaných bodů. 

#figure(
block()[
   #set par(first-line-indent: 0em, leading: 0.6em)
#show raw.where(block: true): block.with(
  fill: luma(240),
  width: 100%,
  inset: 10pt,
  radius: 4pt,
)
```js
// Výběr prvního pásma jako vstupu do for cyklu 
var firstBand = finalCombination.select(0);

// Maska
for (var i = 1; i <= 8 ; i++) {
  var currentBand = finalCombination.select(i);
  firstBand = firstBand.add(currentBand);
}

var maskImage = firstBand.select(0).rename('mask');
var maskImage = maskImage.select(0).multiply(0).int();
```
],

   kind: "img",
   supplement: "obr.",
   caption: "For cyklus pro maskování pixelů",)

Nakonec bylo pomocí fce _ee.Image.stratifiedSample_ vytvořeno 5000 společných bodů a ty byly následně vyexportovány do .csv tabulky. Ta obsahovala pro každý bod maximílní hodnotu NDVI pro všechny sezóny a větve zároveň.

== Porovnání hodnot NDVI jednotlivých scén
Tato část se zaměřovala na porovnání všech dostupných snímků v ramci jedné sezóny mezi sebou, kdy nebylo cílem porovnávat různé sezóny, ale primárně rozdíly mezi oběma senzory. Sezóna byla časově opět  definována na období mezi 1. květnem a 30. zářím. Zaroveň nebyla srovnávána maxima, ale přímo naměřené hodnoty NDVI.

Celá analýza probíhala ve for cyklu, který byl časově omezený na zmiňované období. Každý rok (2013 až 2021) byl tak zpracováván nezávisle na ostatních. To v praxi znamená, že nezamaskované pixely byly pozičně shodné pouze v rámci jedné sezóny, ale nikoli mezi sezónami, jako tomu bylo v kapitole 5.3.. Tento fakt ale není pro potřeby porovnání jednotlivých scén omezující. Důvodem tohoto postupu byla oblačnost na snímcích a kvůli tomu nulová šance filtrovat shodné pixely na snímcích ve všech sezónách současně. Maskování probíhalo dle obrázku x. Princip byl stejný, jako v kapitole 5.3..

#figure(
block()[
   #set par(first-line-indent: 0em, leading: 0.6em)
#show raw.where(block: true): block.with(
  fill: luma(240),
  width: 100%,
  inset: 10pt,
  radius: 4pt,
)
```js
var finalImage = finalL7Filtered.addBands(finalL8Filtered);

var bandNames = finalImage.bandNames();
var numBands = bandNames.length().subtract(1);

// Výběr prvního pásma jako vstupu do for cyklu 
var firstBand = finalImage.select(0);

// Maska
for (var i = 1; i <= numBands ; i++) {
  var currentBand = finalImage.select(i);
  firstBand = firstBand.add(currentBand);
}

var maskImage = firstBand.select(0).rename('mask');
var maskImage = maskImage.select(0).multiply(0).int();
```
],

   kind: "img",
   supplement: "obr.",
   caption: "For cyklus pro maskování pixelů",)

Nově vytvořené pásmo _mask_, které definuje pozičně stejné pixely pro všechny snímky v sezóně bylo použito jako vstup do fce _ee.Image.stratifiedSample_ pro tvorbu stratifikovaných bodů. Jejich počet ale nebyl definován parametrem funkce, ale pomocí nastavení filtrovacího kritéria _'CLOUD_COVER'_ při importu snímků. Smyslem toho bylo nastavit filtr tak, aby bylo pro následný export do .csv tabulky získáno 5000 bodů a zároveň odfiltrováno co nejméně snímků s vyšší oblačností.

== Statistická analýza
Statistická část probíhala v prostředí R Studio (verze R 4.3.1). Importováno bylo celkem pět balíčků, a to _ggplot2, reshape2, gridExtra, dplyr_ a _tidyr_. Cílem bylo zpracovat .csv tabulky, statisticky je analyzovat a vytvořit vhodné výstupy v podobě grafů a tabulek. 

=== Analýza maximálních hodnot NDVI z celé sezóny
Po importu .csv tabulky byly jednotlivé sloupce rozděleny do vektorů, kde každý vektor obsahoval vždy tři sloupce z určité sezóny - Landsat 7, Landsat 8 a jejich kombinaci. 

Poté byla vytvořena přehledová tabulka se základními metrikami, a to pro každý rok samostatně:
- *Procentuální rozdělení bodů:* Bylo zjištěno kolik procent bodů mělo vyšší hodnotu NDVI oproti druhému nosiči. 
- *Kvartily:* Nejříve byly odečteny hodnoty NDVI Landsatu 7 od Landsatu 8 (L8 - L7). Nově získané hodnoty byly před výpočtem kvartilů sežazeny vzestupně.
- *Hodnocení přesnosti:* V podobě _RMSE_ (Root Mean Square Error) a _ME_ (Mean Error) přímo mezi hodnotami bodů z obou senzorů.
- *lineární regrese:* Přes všechny body byl spočítán lineární model. Do tabulky byly zahrnuty hodnoty _Slope_, _Intercept_ a _R2 - koeficient determinace_.

Následovala tvorba grafů. 
- *Density Plot:* Tento graf zobrazuje rozložení hodnot NDVI. Pro lepší orientaci byl graf doplněn o kolmice, které reprezentují průměrné hodnoty.
- *Scatter Plot:* Bodový graf, který zahrnuje také křivku regresního modelu pro vizuální porovnání naměřených dat mezi senzory.

=== Analýza hodnot NDVI jednotlivých scén
Nejdříve byly hromadně načteny všechny .csv tabulky. Pokračovalo se tvorbou přehledových tabulek shrnující každý snímek v sezóně:
- *Kvartily:* V tomto případě byly hodnoty zpracovány v neupravené podobě (na rozdíl od předchozí analýzy maximálních hodnot). 
- *Pruměr:* Jako doplňující metrika ke kvartilům.

Pro lepší porovnání jednotlivých scén v průběhu sezóny byl vytvořen následující graf:
- *Box Plot:* Každý snímek z celé sezóny byl zobrazen formou Box Plotu na časové ose. Tento graf umožňuje nejen sledovat vývoj hodnot NDVI v průběhu vegetační sezóny, ale také porovnávat snímky z různých senzorů mezi sebou.

Tato komplexní analýza poskytuje detailní pohled na vývoj a rozdíly v hodnotách NDVI mezi Landsatem 7 a Landsatem 8 v průběhu vegetačních sezón, a to jak na úrovni maximálních hodnot, tak i na úrovni jednotlivých scén.
= Výsledky

= Diskuse

= Závěr a přínos práce

= Přehled literatury a použitých zdrojů
   #set par(first-line-indent: 0em, leading: 0.6em)
   #set block(spacing: 0.6em)
   #bibliography("zdroje.bib", title: none, style: "citace_czu.csl")

= Přílohy
   #set par(first-line-indent: 2em, leading: 1em)
   #set block(spacing: 2.5em)

== Test tabulky obrázky
#figure(
   table(
   columns: (11),
   inset: 5pt,
   align: center + horizon,

   [*Year*], [*L7 %*], [*L8 %*], [*Q25*], [*Q50*], [*Q75*], [*RMSE*], [*ME*], [*Slp.*], [*Int.*], [*R2*],
   [2013], [12.40], [87.60], [0.018], [0.037], [0.062], [0.064], [0.039], [0.893], [0.066], [0.723],
   [2014], [9.64], [90.36], [0.020], [0.040], [0.064], [0.065], [0.046], [0.904], [0.070], [0.781],
   [2015], [4.34], [95.66], [0.033], [0.055], [0.084], [0.078], [0.062], [0.947], [0.075], [0.753],
   [2016], [10.24], [89.76], [0.026], [0.053], [0.086], [0.080], [0.058], [0.958], [0.067], [0.687],
   [2017], [26.76], [73.24], [-0.002], [0.023], [0.048], [0.052], [0.023], [0.894], [0.051], [0.763],
   [2018], [31.72], [68.28], [-0.009], [0.020], [0.051], [0.069], [0.021], [0.702], [0.093], [0.552],
   [2019], [8.80], [91.20], [0.027], [0.052], [0.081], [0.077], [0.058], [0.885], [0.085], [0.698],
   [2020], [16.70], [83.30], [0.010], [0.030], [0.049], [0.051], [0.030], [0.941], [0.045], [0.817],
   [2021], [10.24], [89.76], [0.023], [0.050], [0.089], [0.086], [0.061], [0.893], [0.086], [0.624]

   ),
   kind: "tab",
   supplement: "tab.",
   caption: "Výsledky analýzy sezón",
)

#lorem(100)

#figure(
   image("images/images.jpg", width: 60%),
   kind: "img",
   supplement: "obr.",
   caption: " ježek",
)

#figure(
   table(
   columns: (6),
   inset: 5pt,
   align: center + horizon,

[*Date*], [*Sensor*], [*Mean*], [*Median*], [*Q1*], [*Q3*],
[2014-05-07], [Landsat 8], [0.168], [0.150], [0.126], [0.194],
[2014-05-15], [Landsat 7], [0.160], [0.140], [0.117], [0.185],
[2014-06-08], [Landsat 8], [0.244], [0.237], [0.187], [0.290],
[2014-06-24], [Landsat 8], [0.281], [0.276], [0.208], [0.344],
[2014-07-10], [Landsat 8], [0.295], [0.293], [0.214], [0.367],
[2014-07-26], [Landsat 8], [0.303], [0.297], [0.220], [0.375],
[2014-08-03], [Landsat 7], [0.265], [0.253], [0.184], [0.335],
[2014-08-11], [Landsat 8], [0.289], [0.281], [0.208], [0.359],
[2014-08-19], [Landsat 7], [0.252], [0.244], [0.177], [0.315],
[2014-08-27], [Landsat 8], [0.249], [0.231], [0.181], [0.307],
[2014-09-12], [Landsat 8], [0.226], [0.208], [0.174], [0.271],
[2014-09-20], [Landsat 7], [0.212], [0.198], [0.153], [0.260]


   ),
   kind: "tab",
   supplement: "tab.",
   caption: "Cross Landsat 2014",
)

