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
   velmi stručný popis myšlenky zvyšování zelenosti pixelů: globální oteplování x nevhodně připravená data (lehká dostupnost x nedostatečná odbornost) definuj greening trend

   klidně i zatím ve zkrácené formě kdo používá (pár vzorových publikací v prestižních žurnálech) a co ze spectral greening vyvozují za závěry (např. v kontextu globálního oteplování apod.)
= Cíle práce
já mám rád výzkumné otázky, forma je na vás, ale psal bych a formuloval až budete mít napsané závěry/conclusion a držel stejnou strukturu, tedy tady se zeptám, odstavcem závěrů odpovím 

= Literární rešerše
== Mise Landsat
Satelity Landsat snímají zemský povrch nepřetržitě již více než 50 let. Poskytují tak nejdélší časovou řadu pozorování ze všech globálních vesmírných misí @roy2014landsat. Již v prvních letech po zavedení programu začala vznikat nová metodika pro mapování změn krajiného pokryvu a vyhledávání přírodních zdroju @goward1997landsat. Většinu času však  bylo snímky možné získat pouze komerčně. Zlom nastal v roce 2008, kdy byla data poskytnuta zdarma online pro všechny uživatele. To způsobilo značné navýšení uplatnění nejen v aplikační sféře, ale také ve vědeckém sektoru @wulder2012opening. Vzhledem k neustálemu rozšiřování mise se role Landsatu jako nástroje pro globální pozorování Země i nadále zvyšuje @zhu2019benefits. 

Satelit Landsat 7 byl na oběžnou dráhu vypuštěn v roce 1999 jako nástupce Landsatu 5. Měl opakovací cyklus 16 dní a nesl s sebou několik vylepšení. Kromě zdokonaleného sensoru ETM+ i takzvaný _long-term acquisition plan (LTAP)_ a _image assessment system (IAS)_ @loveland2012landsat. Principem LTAP bylo automatizovat výběr vhodných míst na Zemi pro pravidelnou aktualizaci globálního archivu bezoblačných a dobře osvětlených scén @arvidson2001landsat. Algoritmy metody IAS zase vylepšily geometrickou a radiometrickou přesnost @basislandsat. V roce 2003 selhal na snímači _scan line corrector (SLC)_. Ten kompenzoval dopředný pohyb satelitu za účelem zpětného snímání sensoru. Z toho důvodu chybí na snímcích přibližně 22 % plochy ve formě pravidelných pruhů @scaramuzza2005landsat. Nominální mise Landsatu 7 byla ukončena v roce 2022 přechodem satelitu na nižší oběžnou dráhu @landsat7end.

Satelit Landsat 8 začal zaznamenávat povrch Země v roce 2013. Hlavní změnou oproti predchozím generacím byl nový vylepšený optický snímač OLI a termální infračervený sensor TIRS @roy2014landsat. Jak OLI, tak TIRS jsou senzory typu _pushbroom_, jejichž vlivem byla vylepšena geometrická přesnost a také poměr signálu k šumu @irons2012next. Landsat 8 má opakovací cyklus snímání 16 dní a je umístěn na stejné oběžné dráze jako již vyřazený Landsat 5 @roy2014landsat. V kombinaci s Landsatem 7 bylo tak umožněno zachytit každé místo na rovníku s intervalem 8 dní a ve vyšších zeměpisních šířkách, v důsledku tzv. _poleward convergence_, kdy se dráhy satelitů směrem k pólům sbíhají, i častěji @kovalskyy2013global.  

Aktuálně na oběžné dráze aktivně snímají pouze dva satelity, a to Landsat 8 a Landsat 9. Kompletní přehled jednotlivých misí Landsat a jejich období provozu je znázorněno na obrázku X. 
První generace satelitů Landsat byla vybavena snímačem Multispectral Scanner (MSS), který měl ve srovnání s novějšími snímači (TM - Thematic Mapper, ETM+ a OLI) nejen horší prostorové rozlišení (60 metrů), ale také odlišná spektrální pásma, pokrývající jiné oblasti vlnových délek. Z tohoto důvodu je možné vytvářet konzistentní časové řady až od nástupu satelitu Landsat 4 @banskota2014forest. 

#figure(
   image("images/landsat.png", width: 100%),
   kind: "img",
   supplement: "obr.",
   caption: " Časová osa misí Landsat",
)

Kolem roku 2030 by měla být zahájena mise Landsat-Next, která nabídné lepší prostorové rozlišení s více specificky zaměřenými pásmy a díky konstelaci třech satelitů i šestidenní interval snímání  @wulder2022fifty @landsatnext.

== Specifikace sensorů
=== Enhanced Thematic Mapper Plus (ETM+) 
Sensor ETM+ je pevný osmipásmový multispektrální radiometr řadící se do skupiny _whiskbroom_ skenerů: aby v průběhu snímání pokryly detektory celou oblast záběru, tak se pohybovaly ze strany na stranu. Toto oscilování připomínalo zametání. Snímač pracuje s 8bitovou hloubkou záznamu @SaylerL7. Oproti předchozí verzi představil ETM+ několik novinek. Primární inovací bylo přidání panchromatického pásma s prostorovým rozlišením 15 metrů a výrazně lepší rozlišení u TIR pásma @nasaetm. Dále sensor obsahuje dva přístroje: _full aperture solar calibrator (FASC)_ a _partial aperture solar calibrator (PASC)_ zajištující solární kalibraci a řadu dalších vylepšení, které garantují maximální radiometrickou chybu měření do 5 % @markham1994radiometric.

Jednotlivá pásma sensoru ETM+ a jejich vlnové délky jsou uvedeny v tabulce x.

#figure(
   table(
   columns: (4),
   inset: 5pt,
   align: center + horizon,
   stroke: none,
   table.hline(),
   [*Pásmo*], [*Vlnová délka (µm)*], [*Název*], [*Rozlišení (m)*],
   table.hline(),
   [1], [0.45 - 0.52], [Blue], [30],
   [2], [0.52 - 0.60], [Green], [30],
   [3], [0.63 - 0.69], [Red], [30],
   [4], [0.77 - 0.90], [Near Infrared (NIR)], [30],
   [5], [1.55 - 1.75], [Shortwave Infrared (SWIR1)], [30],
   [6], [10.40 - 12.50], [Thermal Infrared (TIR)], [60],
   [7], [2.08 - 2.35], [Shortwave Infrared (SWIR2)], [30],
   [8], [0.52 - 0.90], [Panchromatic], [15],
   table.hline(),
   ),
   kind: "tab",
   supplement: "tab.",
   caption: "Spektrální pásma sensoru ETM+",
)
=== Operational Land Imager (OLI)
Sensor OLI představoval významný technologický pokrok na poli radiometrů. Oproti ETM+, který používal oscilující zrcadla (_whiskbroom_) zde byly aplikovány dlouhé lineární řady detektorů zarovnané na ohniskové rovině přístroje společně se čtyřzrcadlovým astigmatickým teleskopem. Díky tomu bylo možné z architektury odstranit několik pohyblivých částí a zároveň zlepšit citlivost. Tato technologie se nazýva _pushbroom_ @VaughnL8. OLI je multispektrální radiometr snímající devět pásem ve 12bitové hloubce @irons2012next. Novinkou jsou dvě pásma. _Coastal Aerosol_ určené pro pozorování atmosférických podmínek v pobřežních zónách a _Cirrus_ pro detekci vysoké oblačnosti @nasaoli. Z hlediska radiometrické chybovosti byly požadavky na OLI srovnatelné s ETM+. Avšak u poměru signálu k šumu (SNR) byly stanoveny přísněji @VaughnL8.

Jednotlivá pásma sensoru OLI a jejich vlnové délky jsou uvedeny v tabulce x.

#figure(
   table(
   columns: (4),
   inset: 5pt,
   align: center + horizon,
   stroke: none,
   table.hline(),
   [*Pásmo*], [*Vlnová délka (µm)*], [*Název*], [*Rozlišení (m)*],
   table.hline(),
   [1], [0.43 - 0.45], [Coastal Aerosol], [30],
   [2], [0.45 - 0.51], [Blue], [30],
   [3], [0.53 - 0.59], [Green], [30],
   [4], [0.64 - 0.67], [Red], [30],
   [5], [0.85 - 0.88], [Near Infrared (NIR)], [30],
   [6], [1.57 - 1.65], [Shortwave Infrared (SWIR1)], [30],
   [7], [2.11 - 2.29], [Shortwave Infrared (SWIR2)], [30],
   [8], [0.50 - 0.68], [Panchromatic], [15],
   [9], [1.36 - 1.38], [Cirrus], [30],
   table.hline(),
   ),
   kind: "tab",
   supplement: "tab.",
   caption: "Spektrální pásma sensoru OLI",
)

=== Rozdíly mezi sensory
Ačkoli byl senzor OLI navržen s ohledem na kompatibilitu se staršími snímači ETM+ a TM (Thematic Mapper), tak se vzhledem k inovacím mírně liší @irons2012next. Přidáním dalšího pásma na modrém konci spektra u OLI se změnilo číslování. Pásma TM a ETM+ označena jako 1, 2, 3, 4, 5, 7 odpovídají reflexním pásmům OLI 2, 3, 4, 5, 6, 7 v tomto pořadí @flood2014continuity. Několik pásem u OLI bylo zuženo, aby se vyhnula atmosferickým absorpčním zónám. Největší změna se týká pásma 5 OLI, které bylo upraveno tak, aby vyloučilo absorpční pás vodní páry při 0,825 μm uprostřed pásma 4 ETM+. Upraveno bylo i panchromatické pásmo a SWIR1 se SWIR2 @VaughnL8. Spektrální odezvy jednotlivých pásem jsou zobrazeny na obrázku x.

#figure(
   image("images/OLI_ETM+.png", width: 100%),
   kind: "img",
   supplement: "obr.",
   caption: " Relativní spektrální odezvy pro pásma Landsat 7 (ETM+) a Landsat 8 (OLI). Spektrální odezva pro každé pásmo je zobrazena s číslem pásma ve stejné barvě (Flood 2014)",
)
== Spektrální rozdíly mezi pásmy a jejich dopad na vegetační indexy
Běžně používané vegetační indexy jsou založeny na vztahu spektra červeného a blízkého infračerveného záření, a to z důvodu citlivosti na fotosyntetická barviva a morfologii listu @ELVIDGE199538. Navzdory snadné aplikaci mají tyto kombinace řadu nevýhod. Například nedostatek citlivosti a spektrální věrnosti k zachycení jemných variací při použití nespecificky korigovaných a širokých spektrálních pásem. U satelitů Landsat snižuje citlivost také menší prostorové rozlišení 30 metrů @xue2017significant @huete2012vegetation. I přes tyto nedostatky jsou však sensory s hrubším prostorovým i spektrálním rozlišením dobrým zdrojem konzistentních a včasných informací o regionálních trendech @huete2012vegetation.

Hodnoty vegetačních indexů odvozených ze snímků z různých satelitních sensorů se liší na základě rozdílů mezi analogickými spektrálními pásmy používanými k jejich generování @teillet2008spectral.
AVIRIS (Airborne Visible/Infrared Imaging Spectrometer) je hyperspektrální senzor umístěný na letadlech, který snímá odrazivost povrchu Země v celém viditelném a blízkém infračerveném spektru s prostorovým rozlišením 20 metrů @green1998imaging. Při porovnání dat ze senzoru AVIRIS se spektrálními pásmy specifickými pro další satelitní sensory byly výsledky NDVI (Normalized Difference Vegetation Index) výrazně ovlivněny rozdíly ve spektrální šířce pásem, přičemž zvlášť důležité bylo červené pásmo. @teillet1997effects.

AVHRR (Advanced Very High Resolution Radiometer) je senzor umístěný na družicích NOAA, který snímá Zemi ve 4 až 6 (v závislosti na modelu) širokých spektrálních pásmech od viditelného až po infračervené spektrum a slouží zejména k monitorování vegetace, oceánů a atmosféry @kalluri2021advanced. Vzhledem k širším spektrálním pásmům byl AVHRR citlivější na atmosférickou vodní páru, která ovlivnila výsledky NDVI (Normalized Difference Vegetation Index) oproti dalším porovnávaným senzorům.@brown2006evaluation. 

MODIS (Moderate Resolution Imaging Spectroradiometer) je multispektrální senzor na družicích Terra a Aqua, který snímá Zemi ve 36 spektrálních pásmech, pokrývajících oblasti od viditelného po termální infračervené spektrum. Slouží k monitorování vegetace, oceánů, oblačnosti a dalších zemských a atmosférických podmínek s prostorovým rozlišením 250 až 1000 metrů @barnes2003status. Primárním důvodem nepřesností u výsledků NDVI byly mezi sensory MODIS a AVHRR označeny aerosoly a vodní páry. Ty ovlivňují pásma NIR a RED odlišnými způsoby v různých vlnových délkách. Finální shodu NDVI mezi sensory tak formuje šířka jejich pásem @van2006multi. 

Podobných výsledků bylo dosaženo při porovnání sensorů ETM+ a OLI, kde měla hlavní vliv na nekonzistenci výsledků NDVI šířka pásma NIR. To lze vysvětlit tím, že užší pásmo NIR u OLI je méně ovlivněno absorpcí vodní páry @ke2015characteristics. 

Aktuální multisenzorové aplikace NDVI tak mohou dosáhnout největšího přínosu, pokud se efektivně vyřeší atmosférické korekce a použijí se translační rovnice pro harmonizaci @van2006multi. 

== Harmonizace dat ze sensorů OLI a ETM+
Jako jeden z prvních, kdo řešil ucelený proces harmonizace senzorů OLI a ETM+ pro tvorbu časových řad, byl @flood2014continuity, který své analýzy prováděl na datech ze severovýchodní Austrálie. Podobný cíl sledoval také @roy2016characterization, který se zaměřil na snímky pokrývající celé kontinentální území Spojených států amerických. Stejnou problematikou se následně zabývalo několik dalších studií @perez2023landsat @cao2022harmonizing @chastain2019empirical. Ve všech těchto případech došlo k přímému porovnání jednotlivých spektrálních pásem, která byla následně statisticky analyzována prostřednictvím lineárních regresních modelů. 

Přestože výsledky vykazují vysokou spolehlivost, lze v nich identifikovat několik nedostatků. Jedním z nich je například absence cílené úpravy koeficientů pro specifické povrchy. Důsledkem aproximace nemusí koeficienty optimálně fungovat pro snímky z konkrétních lokalit na Zemi, jak uvádí například @flood2014continuity, který upozorňuje na nutnost obezřetnosti při jejich aplikaci v oblastech s odlišnými typy vegetace a půdy, než jaké jsou zastoupené na analyzovaných snímcích. Kromě rozdílů ve spektrální odezvě mezi senzory je rovněž sporná důvěryhodnost koeficientů pro pásma kratších vlnových délek, což souvisí s nedostatky v algoritmech atmosférické korekce, jak zmínil @roy2016characterization. Atmosférická korekce je totiž u senzoru ETM+ pro zelené a modré pásmo méně přesná než u senzoru OLI @VERMOTE2016.

Podle studie @xu2014compare je NDVI získaný ze senzoru OLI nejvíce odlišný od NDVI ze senzoru ETM+ v oblastech s nižším pokryvem vegetací, přičemž tento rozdíl se s rostoucí hodnotou NDVI zmenšuje. Pro dosažení konzistence se doporučuje cílená harmonizace. Aplikace koeficientů získaných z dat ze strukturálně rozdílných krajinných typů nemusí fungovat optimálně. Je proto žádoucí použít harmonizační model přizpůsobený specifické studované oblasti, neboť každý region vykazuje unikátní odchylky ve spektrální odezvě @cao2022harmonizing @flood2017comparing.

== Problematika sezónních maxim NDVI při sledování greening trendu
Optický dálkový průzkum Země je komplikován přítomností oblaků, sněhu, ledu či stínů, které zakrývají povrch. Pro zařazení kvalitních snímků do časových řad je nezbytné tyto vlivy maskovat @zhu2018cloud. V oblastech s náročnými povětrnostními podmínkami může během vegetační sezóny kvůli oblačnosti vznikat značný počet děr v dostupných datech @white2014landsat. Z toho důvodu je žádoucí aplikovat vhodný algoritmus skládání obrazu @white2014pixel.

Tyto algoritmy se dělí na tři základní podskupiny, kdy je výpočet proveden na základě jednoho pravidla (maximum či median), kombinace více pravidel nebo spektrální podobnosti. Metody založené na jednom pravidle jsou oblíbené nejen pro svou snadnou implementaci, ale i díky možnosti aplikace na rozsáhlé datové sady @qiu2023evaluation. Algoritmus výběru maximálního NDVI byl původně vyvinut pro senzor AVHRR @holben1986characteristics, avšak rychle našel uplatnění i v časových řadách Landsat a dodnes se používá v současných studiích @qiu2023evaluation.

Hodnoty maximálního NDVI během sezóny jsou však citlivé na dostupnost snímků a jejich načasování v rámci fenologického cyklu vegetace. S rostoucím počtem bezoblačných snímků tak dochází k asymptotickému nárůstu maxim NDVI @berner2020summer. To potvrdil i @bayle2024landsat, který tvrdí, že zvýšení dostupnosti pozorování v průběhu času může výrazně zkreslit greening trend, pokud se jako metrika používá maximální hodnota NDVI. K tomu mimo jiné dochází právě i vlivem překrývání satelitních platforem Landsat v čase.

Robustnější metodou oproti maximálním hodnotám NDVI může být jejich medián. Ten je odolnější vůči výkyvům v kvantitě dat a outlierům, ale nezachovává jejich integiru @ruefenacht2016comparison. Nicméně, jak upozorňuje @bayle2024landsat, i tato roční metrika může být postižena podobnými problémy a nemusí přesně zachytit časové změny vegetace. Pokud je k dispozici větší množství snímků za stejný časový úsek, zvyšuje se pravděpodobnost, že se zaznamenají vyšší hodnoty NDVI, což může ovlivnit nejen maximální hodnotu, ale i medián.

= Charakteristika studijního území
Studovali jsme oblast teritoria Ladakh v severní Indii (viz obrázek X). Průměrná nadmořská výška studovaného území je 4900 m n. m., přičemž nejvyšším bodem je hora Kangju Kangri, dosahující výšky 6725 m n. m., a nejnižším bodem je údolí řeky Chenab, ležící ve výšce 2100 m n. m.

Jedná se o vysokohorskou aridní zónu, která je díky suchému kontinentálnímu klimatu nezaledněná až do nadmořské výšky 6200 až 6400 m n. m. Tato oblast je specifická pro relativně velké plochy rozvinutých půd mezi 5600 a 6000 m n. m., které pokrývá řídká subnivální vegetace @dvorsky2015vascular. Z klimatického hlediska je oblast kolem města Leh (severní část studovaného území, ve výšce 3500 m n. m.) charakterizována dynamicky se měnícími teplotami, které v průběhu roku kolísají mezi 34,8 °C v létě a až −27,9 °C v zimě. Průměrná denní teplota se pohybuje kolem 7,3 °C. Průměrné denní množství srážek se pohybuje v rozmezí 0,5 až 1,5 mm/den. Tyto klimatické podmínky činí region Leh chladným a suchým @chevuturi2018climate.


#figure(
   image("images/mapa.png", width: 100%),
   kind: "img",
   supplement: "obr.",
   caption: "Mapa studovaného území s vyznačenými hranicemi scény (červený čtverec)",
)

= Metodika
V této kapitole je popsána příprava dat z družic Landsat 7 a Landsat 8 pro analýzu vegetačního indexu NDVI. Data jsou nejprve kalibrována a filtrována pro odstranění oblačnosti. Následně je provedena harmonizace spektrálních pásem a výpočet NDVI. Výsledky jsou zpracovány ve dvou formách: jako sezónní maxima NDVI pro porovnání mezi sezónami a jako NDVI pro každý snímek, což umožňuje srovnání dvojic a scén v sezóně.

Proces zpracování je znázorněn v diagramu na obrázku x

#figure(
   image("images/metodika.png", width: 80%),
   kind: "img",
   supplement: "obr.",
   caption: "Schéma pracovního postupu",
)
== Charakteristika vstupních dat
Data z obou senzorů byla zpracována v prostředí Google Earth Engine, který nabízí uživateli efektivní možnost cloudového zpracování velkého množství dat dálkového průzkumu Země s využitím programovacího jazyku Java Script. 

Byla použita atmosféricky korigovaná data v označení _Level 2, Collection 2, Tier 1_, a to jak pro Landsat 7, tak i Landsat 8. V obou případech se zároveň jednalo o zpracování na úrovni _Surface Reflectance_. Kompletní předzpracování snímků provedla US. Geological Survey pomocí metod _Landsat Ecosystem Disturbance Adaptive Processing System (LEDAPS)_ pro Landsat 7 a _Land Surface Reflectance Code (LaSRC)_ pro Landsat 8 @usgs_sr.

Základní myšlenkou modelu LEDAPS je, v prvním kroku, kalibrace syrových dat na horní část atmosféry (TOA) a následně atmosferická korekce pomocí metody MODIS/6S @masek_2006. Metoda LaSRC využívá pro výpočet aerosolové pásmo a pomocná klimatická data MODIS nebo VIIRS CMG společně s modelem radiačního přenosu @VERMOTE2016.

== Kalibrace dat a filtrace oblačnosti
Informace o skutečné odrazivosti povrchu (tzv. surface reflectance) byly získány po kalibraci dat na základě přepočtu DN hodnot o _scale factor_ a tzv. _additive offset_. @Gee_migration. DN (Digital Number) je číselná hodnota, která udává intenzitu odraženého světla, ale ještě neodpovídá skutečné odrazivosti povrchu. Scale factor je násobící činitel, kterým se DN hodnota upraví a additive offset je konstanta, která se k výsledku následně přičítá či odečítá. Tento krok byl zásadním předpokladem pro správnou aplikaci harmonizačních koeficientů a výpočtu NDVI. Průběh kalibrace optických pásem je zobrazen na obrázku x.

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
// Aplikace scaling faktoru a offsetu.
function applyScaleFactors(image) {
  var opticalBands = image.select('SR_B.').multiply(0.0000275).add(-0.2);
  opticalBands = opticalBands.clamp(0, 1); 
  return image.addBands(opticalBands, null, true);
};
```
],

   kind: "img",
   supplement: "obr.",
   caption: "Funkce pro kalibraci dat z kolekce 2",)

K filtraci oblačnosti byl využit tzv. _QA_PIXEL_. Pásmo Quality Assessment (QA) v sobě ukládá binární přepis informací o kvalitě jednotlivých pixelů v obraze a pomáhá tak identifikovat přítomnost oblaků, ledu, sněhu či vody ve snímku @usgs_qa. Na obrázku x je přiložen kód pro filtraci oblačnosti. Ten byl inspirován skriptem od @Gee_erickson. Bity pro _Cloud Confidence_ i _Cloud Shadow Confidence_ byly filtrovány s intenzitou _.gte(2)_.

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
function extractQABits(qaBand, bitStart, bitEnd) {
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
   caption: "Funkce pro maskování oblačnosti (Erickson 2018)",)

==  Aplikace harmonizačních koeficientů a výpočet NDVI
Použité koeficienty byly získány metodou nejmenších čtverců (OLS) při přímém porovnání pásem ze snímků ze Severní Ameriky  @roy2016characterization. Na základě těchto výsledků byly harmonizovány i studie zabývající se analýzou vysokohorské vegetace @anderson2020vegetation @fassnacht2019landsat @pastick2019spatiotemporal.

Aplikace koeficientů byla provedena pouze na snímky ze sensoru OLI (Landsat 8), které byly sladěny s ETM + (Landsat 7). Důvodem bylo umožnit potenciální rozšíření časové řady i o data z Landsatu 5 při aplikaci metodiky popsané v této práci. Použité koeficienty jsou zobrazeny v tabulce x a jejich použití v kódu je ilustrováno na obrázku x.

#figure(
   table(
   columns: (2),
   inset: 5pt,
   align: center + horizon,
   stroke: none,
   table.hline(),

[*Pásmo*], [*Vzorec*],
table.hline(),
[RED], [ETM + = *0.0123* + *0.9372* OLI], 
[NIR], [ETM + = *0.0448* + *0.8339* OLI],
[NDVI], [ETM + = *0.0029* + *0.9589* OLI], 
table.hline(),
   ),
   kind: "tab",
   supplement: "tab.",
   caption: "Harmonizační koeficienty pro Surface Reflectance (Roy et al. 2016)",
)

V této fázi byl vypočítan normalizovaný vegetační index (NDVI). Jedná se o jeden z nejpoužívanějších vegetačních indexů pro sledování zdraví a hustoty vegetace @huang2021commentary @li2021high @jiang2006analysis @bhandari2012feature. NDVI se získává dle vzorce: $ "NDVI"= ("NIR"-"RED")/("NIR"+"RED") $

Hodnoty NDVI se pohybují od -1 do 1. Nízké hodnoty, kolem 0.1 nebo méně, obvykle ukazují na suché oblasti, jako jsou kamenné či písečné pouště. Hodnoty v rozmezí 0.2 až 0.3, charakterizují křoviny a pastviny. Vysoké hodnoty, pohybující se mezi 0.6 a 0.8, indikují husté vegetační porosty, včetně mírných a tropických deštných lesů @weier2000measuring. Z důvodu potenciálně nízké hustoty vysokohorské vegetace je možné pro prahování použít i nižší hodnoty @anderson2020vegetation. Tato diplomová práce se zaměřuje na horské aridní oblasti. Vzhledem k tomu byl práh v kódu na obrázku x nastaven na hodnotu 0.1 a pixely s nižší hodnotou byly zamaskovány obdobně jako ve studii od @anderson2020vegetation.

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
function computeNdvi(image) {
  var ndvi = image.expression(
    '((NIR - RED) / (NIR +  RED))',
    {
      'NIR': image.select('NIR'),
      'RED': image.select('RED'),  
    }
  ).rename('NDVI').multiply(0.9589).add(0.0029);

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
   caption: "Funkce pro výpočet NDVI a prahování s aplikací harmonizačních koeficientů na získaném NDVI (pro harmonizaci pasem NIR a RED byl použit stejný postup pouze s jinými koeficienty)",)

Zpracování dat popsané výše bylo společné pro obě následující kapitoly. Tedy jak pro porovnání jednotlivých scén mezi sebou, tak i pro porovnání maximálních hodnot NDVI z celých sezón.

== Porovnání získaných hodnot NDVI jednotlivých scén
Tato část se zaměřovala na porovnání všech dostupných snímků v ramci jedné sezóny mezi sebou, kdy nebylo cílem porovnávat výsledky NDVI z různých sezón, ale primárně bezprostřední rozdíly v NDVI mezi oběma senzory s různým přístupem k harmonizaci od @roy2016characterization. Sezóna byla časově  definována na období mezi 1. květnem a 30. zářím. Zaroveň nebyla srovnávána maxima, ale přímo naměřené hodnoty NDVI.  

=== Porovnání scén v rámci jedné sezóny
Celá analýza probíhala ve _for cyklu_, který byl časově omezený na zmiňované období. Každý rok (2013 až 2021) byl tak zpracováván nezávisle na ostatních. To v praxi znamená, že nezamaskované pixely byly pozičně shodné pouze v rámci jedné sezóny, ale nikoli mezi sezónami. Tento fakt ale není pro potřeby porovnání jednotlivých scén omezující. Důvodem tohoto postupu byla vysoká oblačnost a kvůli tomu nulová šance filtrovat shodné pixely na snímcích ve všech sezónách současně. Maskování probíhalo dle obrázku x. K tomu byl použit další _for cyklus_, který pracoval na principu postupného přikládání snímků přes sebe a maskoval pixely, které se nenacházely na scénách ze všech sezón. Výstupem bylo nové pásmo _mask_, které bylo v dalším kroku použito pro tvorbu stratifikovaných bodů.

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

K tomuto účelu byla použita funkce _ee.Image.stratifiedSample_. Počet stratifikovaných bodů ale nebyl definován parametrem funkce, ale pomocí nastavení filtrovacího kritéria _CLOUD_COVER_ při importu snímků. Smyslem tohoto postupu bylo nastavit filtr tak, aby bylo pro následný export do tabulky ve formátu _.csv_  získáno 5000 bodů a zároveň odfiltrováno co nejméně snímků s vyšší oblačností.

=== Hromadné porovnání dvojic
Časové okno ve _for cyklu_ bylo zkráceno na 16 dní, což odpovídá časovému rozlišení družic Landsat. Díky tomu byl do výběru zařazen pouze jeden snímek z každého senzoru. Pro tuto dvojici snímků byl následně vypočítán index NDVI ve třech různých variantách: bez harmonizace, s harmonizací pásem a s harmonizací samotného NDVI, jak je popsáno v práci @roy2016characterization. Po tomto kroku následovalo maskování společných pixelů, k čemuž byl využit skript zobrazený na obrázku X. 

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
// Funkce pro vytvoření masky
function createMaskLandsat(imageCollection, l7, l8) {
  var image = imageCollection.toBands();
  var mask = l7.add(l8).rename('mask'); 
  return image.addBands(mask);
};
```
],

   kind: "img",
   supplement: "obr.",
   caption: "Funkce pro maskování dvojic",)

Pomocí funkce _ee.Image.stratifiedSample_ bylo pro každou dvojici vygenerováno 5000 stratifikovaných bodů, které byly vyexportovány do tabulky ve formátu _.csv_.

== Porovnání maximálních hodnot NDVI z celé sezóny
Cílem této části bylo získání maximální hodnoty NDVI pro každý pixel za celou sezónu, kdy sezóna byla časově definována na období mezi 1. květnem a 30. zářím.

Problematika zkreslení výsledku enviromentálních výzkumů při použití maximálních hodnot NDVI a návrhy její korekce byly již zkoumány @karlsen2018new @berner2020summer @wang2022off. Velmi málo studií se ale věnovalo greening trendu a jeho ovlivnění právě touto metodikou cíleně u vysokohorské vegetace @bayle2024landsat.

Analýza proběhla v principu ve třech samostatných větvích, kdy v jedné byly zpracovávány pouze snímky z Landsatu 7, v druhé pouze snímky z Landsatu 8 a nakonec snímky z obou nosičů dohromady. U sensoru OLI (L8) byla po výpočtu NDVI, provedena harmonizace na ETM+ (L7) @roy2016characterization. Všechny dostupné snímky v každé větvi byly překryty přes sebe a byla z nich vyfiltrována maxima pomocí reduceru dle obrázku x.

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

Celá filtrace proběhla ve _for cyklu_, který postup zopakoval pro celkem devět sezón za sebou (2013 až 2021). Výstupem byl tak pro každou větev _image_ s devíti pásmy, kdy každé odpovídalo jedné sezóně. 

Další fází této analýzy bylo získání společných pixelů pro celé sledované období z důvodu možnosti porovnání sezón mezi sebou. K tomu byl použit _for cyklus_ (obr. x). Princip maskování byl stejný jako v kapitole x.x..

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

Nově vytvořené pásmo _mask_, které definuje pozičně stejné pixely pro všechny snímky v sezóně, bylo použito jako vstup do funkce _ee.Image.stratifiedSample_, pomocí níž bylo získáno 5000 společných bodů pro všechny sezóny. Tyto body byly následně exportovány do tabulky ve formátu _.csv_. Každý bod v tabulce obsahoval maximální hodnoty NDVI pro všechny sezóny i větve zároveň.

== Statistická analýza
Statistická část probíhala v prostředí R Studio (verze R 4.3.1). Importováno bylo celkem pět balíčků, a to _ggplot2, reshape2, gridExtra, dplyr_ a _tidyr_. Cílem této kapitoly bylo statisticky vyhodnotit rozdíly mezi jednotlivými dvojicemi snímků pořízených během celé sezóny s různými přístupy k harmonizaci. Zaměřili jsme se také na porovnání maximálních hodnot indexu NDVI mezi sezónami, přičemž zvláštní pozornost byla věnována nárůstu množství dat způsobeného překryvem snímání mezi satelity Landsat 7 a Landsat 8. 

=== Analýza scén v rámci jedné sezóny
Byly vytvořeny souhrny pro každý snímek v sezóně, které zahrnovaly:
- *Kvartily:* V tomto případě byly hodnoty zpracovány ve standardní podobě (na rozdíl od kapitoly x.x.x.). 
- *Průměr:* Jako doplňující metrika ke kvartilům.

=== Analýza dvojic
Proběhlo sjednocení všech bodů do jednoho souboru. To umožnilo komplexní porovnání všech dostupných dvojic snímku v rámci celého studovaného období najenou. Následovala analýza, jejímž výstupem bylo:
- *Hodnocení přesnosti:* Toto hodnocení bylo prezentováno pomocí dvou klíčových metrik: _RMSE_ (Root Mean Square Error) a _ME_ (Mean Error) přímo mezi hodnotami bodů z obou senzorů s různým přístupem k harmonizaci.
- *Lineární regresi:* Pro všechny body byl spočítán lineární regresní model. Nezávisle na sobě byly testovány různé přístupy k harmonizci. Do tabulky byly zahrnuty parametry modelu: _Slope_ (udává sklon přímky), _Intercept_ (určuje posun na ose y při hodnotě nezávislé proměnné 0) a _R2 - koeficient determinace_ (ukazuje, jak dobře model vysvětluje variabilitu dat).
=== Analýza maximálních hodnot NDVI z celé sezóny
Jednotlivé sloupce byly separovány do vektorů, kde každý vektor zahrnoval vždy tři sloupce z určité sezóny - Landsat 7, Landsat 8 a jejich kombinaci. Toto rozdělení umožnilo zpracovat každý vektor nezávisle na sobě. Výstupem analýzy bylo:
- *Procentuální rozdělení bodů:* Bylo zjištěno kolik procent bodů mělo vyšší maximální hodnotu NDVI oproti druhému sensoru. Byly porovnány vždy pozičně shodné pixely. 
- *Kvartily:* Nejříve byly odečteny hodnoty NDVI Landsatu 7 od Landsatu 8 (L8 - L7). Odečet byl proveden pouze na pozičně shodných pixelech. Výsledky byly před výpočtem kvartilů sežazeny vzestupně.
- *Hodnocení přesnosti:* V podobě _RMSE_ (Root Mean Square Error) a _ME_ (Mean Error) přímo mezi hodnotami bodů z obou senzorů.
- *Lineární regresi:* Přes všechny body byl spočítán lineární regresní model. Do tabulky byly zahrnuty hodnoty _Slope_, _Intercept_ a _R2 - koeficient determinace_.

= Výsledky

= Diskuse

= Závěr a přínos práce

= Přehled literatury a použitých zdrojů
   #set par(first-line-indent: 0em, leading: 0.6em)
   #set block(spacing: 0.6em)
   #show bibliography: set text(size: 10pt)
   #bibliography("zdroje.bib", title: none, style: "citace_czu.csl")

= Přílohy
   #set par(first-line-indent: 2em, leading: 1em)
   #set block(spacing: 1.5em)


#set page(
margin: (
top: 1cm,
bottom: 2.5cm,
left: 3cm,
right: 1cm 
),
)

=== Příloha 
#figure(
   image("images/densita_1.svg", width: 100%)
)

#figure(
   image("images/densita_2.svg", width: 100%)
)

=== Příloha 
#figure(
   image("images/maxscatter_1.svg", width: 100%)
)

#figure(
   image("images/maxscatter_2.svg", width: 100%)
)

=== Příloha 1
#figure(
   image("images/sezony_1.svg", width: 100%)
)

#figure(
   image("images/sezony_2.svg", width: 100%)
)

#show figure: set text(size: 6.5pt)
#set page(columns: 2)

=== Příloha 2

#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(),
[*Datum*], [*Sensor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(),
[2013-05-04], [Landsat 8],[bez harmonizace], [0.259], [0.225], [0.161], [0.319],
[2013-05-04], [Landsat 8],[NIR a RED], [0.264], [0.237], [0.175], [0.324],
[2013-05-04], [Landsat 8],[NDVI], [0.252], [0.218], [0.158], [0.309],
[2013-05-20], [Landsat 8],[bez harmonizace], [0.291], [0.266], [0.187], [0.364],
[2013-05-20], [Landsat 8],[NIR a RED], [0.292], [0.272], [0.202], [0.358],
[2013-05-20], [Landsat 8],[NDVI], [0.282], [0.258], [0.182], [0.352],
[2013-06-05], [Landsat 8],[bez harmonizace], [0.378], [0.348], [0.244], [0.489],
[2013-06-05], [Landsat 8],[NIR a RED], [0.368], [0.343], [0.251], [0.464],
[2013-06-05], [Landsat 8],[NDVI], [0.366], [0.337], [0.237], [0.472],
[2013-06-21], [Landsat 8],[bez harmonizace], [0.459], [0.435], [0.315], [0.602],
[2013-06-21], [Landsat 8],[NIR a RED], [0.441], [0.418], [0.314], [0.564],
[2013-06-21], [Landsat 8],[NDVI], [0.443], [0.420], [0.305], [0.580],
[2013-06-29], [Landsat 7],[], [0.410], [0.383], [0.275], [0.545],
[2013-07-23], [Landsat 8],[bez harmonizace], [0.495], [0.467], [0.328], [0.671],
[2013-07-23], [Landsat 8],[NIR a RED], [0.473], [0.446], [0.323], [0.627],
[2013-07-23], [Landsat 8],[NDVI], [0.478], [0.451], [0.317], [0.647],
[2013-07-31], [Landsat 7],[], [0.405], [0.372], [0.253], [0.555],
[2013-08-24], [Landsat 8],[bez harmonizace], [0.411], [0.372], [0.273], [0.521],
[2013-08-24], [Landsat 8],[NIR a RED], [0.396], [0.364], [0.273], [0.494],
[2013-08-24], [Landsat 8],[NDVI], [0.397], [0.360], [0.264], [0.503],
[2013-09-01], [Landsat 7],[], [0.349], [0.312], [0.216], [0.454],
[2013-09-17], [Landsat 7],[], [0.305], [0.269], [0.182], [0.395],
   table.hline(),
),
)

#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(),
[*Datum*], [*Sensor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(),
[2014-05-07], [Landsat 8], [bez harmonizace], [0.271], [0.230], [0.172], [0.329],
[2014-05-07], [Landsat 8], [NIR a RED], [0.280], [0.245], [0.194], [0.331],
[2014-05-07], [Landsat 8], [NDVI], [0.263], [0.223], [0.168], [0.318],
[2014-05-15], [Landsat 7], [], [0.238], [0.199], [0.145], [0.285],
[2014-06-08], [Landsat 8], [bez harmonizace], [0.397], [0.362], [0.276], [0.487],
[2014-06-08], [Landsat 8], [NIR a RED], [0.387], [0.358], [0.282], [0.464],
[2014-06-08], [Landsat 8], [NDVI], [0.383], [0.350], [0.268], [0.470],
[2014-06-24], [Landsat 8], [bez harmonizace], [0.458], [0.422], [0.324], [0.573],
[2014-06-24], [Landsat 8], [NIR a RED], [0.437], [0.406], [0.319], [0.538],
[2014-06-24], [Landsat 8], [NDVI], [0.443], [0.408], [0.313], [0.552],
[2014-07-10], [Landsat 8], [bez harmonizace], [0.489], [0.454], [0.344], [0.630],
[2014-07-10], [Landsat 8], [NIR a RED], [0.467], [0.437], [0.339], [0.590],
[2014-07-10], [Landsat 8], [NDVI], [0.472], [0.439], [0.333], [0.607],
[2014-07-26], [Landsat 8], [bez harmonizace], [0.515], [0.477], [0.361], [0.671],
[2014-07-26], [Landsat 8], [NIR a RED], [0.489], [0.455], [0.354], [0.626],
[2014-07-26], [Landsat 8], [NDVI], [0.497], [0.460], [0.349], [0.647],
[2014-08-03], [Landsat 7], [], [0.433], [0.391], [0.296], [0.561],
[2014-08-11], [Landsat 8], [bez harmonizace], [0.486], [0.449], [0.340], [0.627],
[2014-08-11], [Landsat 8], [NIR a RED], [0.464], [0.432], [0.335], [0.587],
[2014-08-11], [Landsat 8], [NDVI], [0.469], [0.433], [0.329], [0.605],
[2014-08-19], [Landsat 7], [], [0.421], [0.380], [0.280], [0.548],
[2014-08-27], [Landsat 8], [bez harmonizace], [0.435], [0.390], [0.299], [0.544],
[2014-08-27], [Landsat 8], [NIR a RED], [0.416], [0.381], [0.296], [0.514],
[2014-08-27], [Landsat 8], [NDVI], [0.420], [0.377], [0.289], [0.525],
[2014-09-12], [Landsat 8], [bez harmonizace], [0.441], [0.403], [0.304], [0.567],
[2014-09-12], [Landsat 8], [NIR a RED], [0.421], [0.395], [0.303], [0.535],
[2014-09-12], [Landsat 8], [NDVI], [0.426], [0.390], [0.294], [0.547],
[2014-09-20], [Landsat 7], [], [0.366], [0.326], [0.243], [0.461],

   table.hline(),
),
)

#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(),
[*Datum*], [*Sensor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(),
[2015-05-10], [Landsat 8], [bez harmonizace], [0.248], [0.199], [0.140], [0.313],
[2015-05-10], [Landsat 8], [NIR a RED], [0.255], [0.216], [0.158], [0.315],
[2015-05-10], [Landsat 8], [NDVI], [0.241], [0.194], [0.137], [0.303],
[2015-06-19], [Landsat 7], [], [0.338], [0.297], [0.182], [0.472],
[2015-06-27], [Landsat 8], [bez harmonizace], [0.442], [0.415], [0.262], [0.615],
[2015-06-27], [Landsat 8], [NIR a RED], [0.424], [0.399], [0.266], [0.576],
[2015-06-27], [Landsat 8], [NDVI], [0.427], [0.401], [0.254], [0.593],
[2015-07-05], [Landsat 7], [], [0.395], [0.361], [0.222], [0.554],
[2015-07-29], [Landsat 8], [bez harmonizace], [0.506], [0.484], [0.300], [0.727],
[2015-07-29], [Landsat 8], [NIR a RED], [0.481], [0.461], [0.300], [0.676],
[2015-07-29], [Landsat 8], [NDVI], [0.489], [0.467], [0.291], [0.700],
[2015-08-30], [Landsat 8], [bez harmonizace], [0.463], [0.426], [0.278], [0.633],
[2015-08-30], [Landsat 8], [NIR a RED], [0.442], [0.410], [0.283], [0.592],
[2015-08-30], [Landsat 8], [NDVI], [0.447], [0.411], [0.270], [0.610],
[2015-09-07], [Landsat 7], [], [0.374], [0.319], [0.208], [0.502],
[2015-09-15], [Landsat 8], [bez harmonizace], [0.396], [0.346], [0.235], [0.527],
[2015-09-15], [Landsat 8], [NIR a RED], [0.382], [0.341], [0.245], [0.500],
[2015-09-15], [Landsat 8], [NDVI], [0.383], [0.334], [0.228], [0.508],
   table.hline(),
),
)

#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(),
[*Datum*], [*Sensor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(),
[2016-05-12], [Landsat 8], [bez harmonizace], [0.259], [0.210], [0.155], [0.313],
[2016-05-12], [Landsat 8], [NIR a RED], [0.256], [0.216], [0.159], [0.314],
[2016-05-12], [Landsat 8], [NDVI], [0.251], [0.204], [0.152], [0.303],
[2016-05-20], [Landsat 7], [], [0.226], [0.194], [0.142], [0.269],
[2016-05-28], [Landsat 8], [bez harmonizace], [0.313], [0.282], [0.212], [0.375],
[2016-05-28], [Landsat 8], [NIR a RED], [0.304], [0.277], [0.212], [0.361],
[2016-05-28], [Landsat 8], [NDVI], [0.303], [0.274], [0.206], [0.363],
[2016-06-13], [Landsat 8], [bez harmonizace], [0.386], [0.349], [0.264], [0.488],
[2016-06-13], [Landsat 8], [NIR a RED], [0.371], [0.339], [0.264], [0.460],
[2016-06-13], [Landsat 8], [NDVI], [0.373], [0.338], [0.256], [0.470],
[2016-07-07], [Landsat 7], [], [0.337], [0.291], [0.210], [0.447],
[2016-07-23], [Landsat 7], [], [0.359], [0.310], [0.217], [0.485],
[2016-07-31], [Landsat 8], [bez harmonizace], [0.418], [0.370], [0.265], [0.550],
[2016-07-31], [Landsat 8], [NIR a RED], [0.400], [0.358], [0.265], [0.517],
[2016-07-31], [Landsat 8], [NDVI], [0.404], [0.357], [0.257], [0.530],
[2016-08-16], [Landsat 8], [bez harmonizace], [0.373], [0.330], [0.241], [0.470],
[2016-08-16], [Landsat 8], [NIR a RED], [0.360], [0.324], [0.242], [0.446],
[2016-08-16], [Landsat 8], [NDVI], [0.361], [0.320], [0.234], [0.453],
[2016-09-09], [Landsat 7], [], [0.266], [0.219], [0.162], [0.326],
[2016-09-17], [Landsat 8], [bez harmonizace], [0.302], [0.250], [0.187], [0.369],
[2016-09-17], [Landsat 8], [NIR a RED], [0.297], [0.256], [0.192], [0.366],
[2016-09-17], [Landsat 8], [NDVI], [0.292], [0.242], [0.182], [0.357],
[2016-09-25], [Landsat 7], [], [0.222], [0.183], [0.137], [0.267],

   table.hline(),
),
)

#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(),
[*Datum*], [*Sensor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(),
[2017-05-15], [Landsat 8], [bez harmonizace], [0.287], [0.259], [0.172], [0.371],
[2017-05-15], [Landsat 8], [NIR a RED], [0.287], [0.265], [0.188], [0.361],
[2017-05-15], [Landsat 8], [NDVI], [0.278], [0.251], [0.168], [0.358],
[2017-06-08], [Landsat 7], [], [0.326], [0.307], [0.203], [0.423],
[2017-06-16], [Landsat 8], [bez harmonizace], [0.411], [0.391], [0.264], [0.538],
[2017-06-16], [Landsat 8], [NIR a RED], [0.394], [0.377], [0.262], [0.508],
[2017-06-16], [Landsat 8], [NDVI], [0.397], [0.378], [0.256], [0.519],
[2017-06-24], [Landsat 7], [], [0.372], [0.351], [0.233], [0.495],
[2017-07-02], [Landsat 8], [bez harmonizace], [0.484], [0.472], [0.327], [0.645],
[2017-07-02], [Landsat 8], [NIR a RED], [0.464], [0.450], [0.322], [0.603],
[2017-07-02], [Landsat 8], [NDVI], [0.467], [0.455], [0.317], [0.622],
[2017-07-10], [Landsat 7], [], [0.427], [0.408], [0.285], [0.580],
[2017-08-11], [Landsat 7], [], [0.347], [0.309], [0.222], [0.464],
[2017-08-27], [Landsat 7], [], [0.351], [0.318], [0.225], [0.465],
[2017-09-04], [Landsat 8], [bez harmonizace], [0.398], [0.358], [0.256], [0.526],
[2017-09-04], [Landsat 8], [NIR a RED], [0.387], [0.351], [0.262], [0.497],
[2017-09-04], [Landsat 8], [NDVI], [0.385], [0.346], [0.248], [0.508],
[2017-09-12], [Landsat 7], [], [0.314], [0.278], [0.197], [0.413],
[2017-09-20], [Landsat 8], [bez harmonizace], [0.357], [0.314], [0.227], [0.462],
[2017-09-20], [Landsat 8], [NIR a RED], [0.352], [0.315], [0.244], [0.442],
[2017-09-20], [Landsat 8], [NDVI], [0.346], [0.304], [0.221], [0.446],
[2017-09-28], [Landsat 7], [], [0.277], [0.242], [0.170], [0.364],
   table.hline(),
),
)

#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(),
[*Datum*], [*Sensor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(),
[2018-05-02], [Landsat 8], [bez harmonizace], [0.219], [0.200], [0.154], [0.266],
[2018-05-02], [Landsat 8], [NIR a RED], [0.218], [0.199], [0.159], [0.259],
[2018-05-02], [Landsat 8], [NDVI], [0.213], [0.194], [0.150], [0.258],
[2018-05-10], [Landsat 7], [], [0.215], [0.190], [0.135], [0.268],
[2018-05-26], [Landsat 7], [], [0.272], [0.240], [0.170], [0.349],
[2018-06-03], [Landsat 8], [bez harmonizace], [0.340], [0.308], [0.217], [0.441],
[2018-06-03], [Landsat 8], [NIR a RED], [0.326], [0.296], [0.215], [0.416],
[2018-06-03], [Landsat 8], [NDVI], [0.329], [0.298], [0.211], [0.426],
[2018-06-11], [Landsat 7], [], [0.314], [0.291], [0.205], [0.402],
[2018-06-19], [Landsat 8], [bez harmonizace], [0.404], [0.385], [0.264], [0.526],
[2018-06-19], [Landsat 8], [NIR a RED], [0.385], [0.369], [0.259], [0.496],
[2018-06-19], [Landsat 8], [NDVI], [0.390], [0.372], [0.256], [0.508],
[2018-07-05], [Landsat 8], [bez harmonizace], [0.462], [0.462], [0.304], [0.607],
[2018-07-05], [Landsat 8], [NIR a RED], [0.438], [0.435], [0.292], [0.569],
[2018-07-05], [Landsat 8], [NDVI], [0.446], [0.445], [0.294], [0.585],
[2018-07-29], [Landsat 7], [], [0.416], [0.413], [0.262], [0.565],
[2018-08-22], [Landsat 8], [bez harmonizace], [0.423], [0.413], [0.287], [0.549],
[2018-08-22], [Landsat 8], [NIR a RED], [0.403], [0.392], [0.279], [0.516],
[2018-08-22], [Landsat 8], [NDVI], [0.409], [0.399], [0.278], [0.530],
[2018-08-30], [Landsat 7], [], [0.373], [0.359], [0.250], [0.482],

   table.hline(),
),
)

#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(),
[*Datum*], [*Sensor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(),
[2019-05-05], [Landsat 8], [bez harmonizace], [0.303], [0.279], [0.205], [0.380],
[2019-05-05], [Landsat 8], [NIR a RED], [0.312], [0.294], [0.229], [0.381],
[2019-05-05], [Landsat 8], [NDVI], [0.294], [0.270], [0.200], [0.367],
[2019-05-13], [Landsat 7], [], [0.247], [0.223], [0.165], [0.306],
[2019-05-21], [Landsat 8], [bez harmonizace], [0.379], [0.354], [0.274], [0.469],
[2019-05-21], [Landsat 8], [NIR a RED], [0.374], [0.354], [0.283], [0.452],
[2019-05-21], [Landsat 8], [NDVI], [0.366], [0.342], [0.265], [0.452],
[2019-05-29], [Landsat 7], [], [0.318], [0.292], [0.222], [0.396],
[2019-06-14], [Landsat 7], [], [0.410], [0.386], [0.299], [0.513],
[2019-06-22], [Landsat 8], [bez harmonizace], [0.481], [0.454], [0.348], [0.605],
[2019-06-22], [Landsat 8], [NIR a RED], [0.458], [0.433], [0.342], [0.567],
[2019-06-22], [Landsat 8], [NDVI], [0.464], [0.438], [0.337], [0.583],
[2019-07-08], [Landsat 8], [bez harmonizace], [0.521], [0.495], [0.378], [0.660],
[2019-07-08], [Landsat 8], [NIR a RED], [0.495], [0.470], [0.368], [0.616],
[2019-07-08], [Landsat 8], [NDVI], [0.503], [0.477], [0.365], [0.636],
[2019-07-24], [Landsat 8], [bez harmonizace], [0.526], [0.499], [0.377], [0.678],
[2019-07-24], [Landsat 8], [NIR a RED], [0.500], [0.475], [0.368], [0.634],
[2019-07-24], [Landsat 8], [NDVI], [0.508], [0.482], [0.365], [0.653],
[2019-09-02], [Landsat 7], [], [0.406], [0.375], [0.286], [0.505],
[2019-09-10], [Landsat 8], [bez harmonizace], [0.482], [0.459], [0.345], [0.610],
[2019-09-10], [Landsat 8], [NIR a RED], [0.460], [0.441], [0.341], [0.572],
[2019-09-10], [Landsat 8], [NDVI], [0.465], [0.443], [0.334], [0.588],
[2019-09-18], [Landsat 7], [], [0.400], [0.378], [0.286], [0.499],
   table.hline(),
),
)

#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(),
[*Datum*], [*Sensor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(),
[2020-05-07], [Landsat 8], [bez harmonizace], [0.336], [0.315], [0.205], [0.437],
[2020-05-07], [Landsat 8], [NIR a RED], [0.330], [0.319], [0.218], [0.424],
[2020-05-07], [Landsat 8], [NDVI], [0.325], [0.305], [0.199], [0.422],
[2020-05-15], [Landsat 7], [], [0.246], [0.224], [0.158], [0.317],
[2020-05-23], [Landsat 8], [bez harmonizace], [0.346], [0.323], [0.239], [0.428],
[2020-05-23], [Landsat 8], [NIR a RED], [0.337], [0.320], [0.244], [0.413],
[2020-05-23], [Landsat 8], [NDVI], [0.335], [0.313], [0.232], [0.413],
[2020-06-08], [Landsat 8], [bez harmonizace], [0.432], [0.412], [0.310], [0.535],
[2020-06-08], [Landsat 8], [NIR a RED], [0.412], [0.398], [0.307], [0.507],
[2020-06-08], [Landsat 8], [NDVI], [0.417], [0.398], [0.300], [0.516],
[2020-06-16], [Landsat 7], [], [0.374], [0.355], [0.269], [0.467],
[2020-06-24], [Landsat 8], [bez harmonizace], [0.472], [0.452], [0.345], [0.593],
[2020-06-24], [Landsat 8], [NIR a RED], [0.450], [0.434], [0.338], [0.556],
[2020-06-24], [Landsat 8], [NDVI], [0.456], [0.436], [0.333], [0.571],
[2020-07-02], [Landsat 7], [], [0.422], [0.400], [0.302], [0.539],
[2020-07-10], [Landsat 8], [bez harmonizace], [0.501], [0.481], [0.366], [0.632],
[2020-07-10], [Landsat 8], [NIR a RED], [0.475], [0.457], [0.355], [0.591],
[2020-07-10], [Landsat 8], [NDVI], [0.483], [0.464], [0.354], [0.608],
[2020-07-18], [Landsat 7], [], [0.442], [0.419], [0.311], [0.571],
[2020-08-03], [Landsat 7], [], [0.431], [0.411], [0.301], [0.556],
[2020-08-11], [Landsat 8], [bez harmonizace], [0.475], [0.457], [0.340], [0.603],
[2020-08-11], [Landsat 8], [NIR a RED], [0.452], [0.438], [0.336], [0.566],
[2020-08-11], [Landsat 8], [NDVI], [0.459], [0.441], [0.329], [0.581],
[2020-09-12], [Landsat 8], [bez harmonizace], [0.399], [0.380], [0.278], [0.502],
[2020-09-12], [Landsat 8], [NIR a RED], [0.387], [0.375], [0.282], [0.481],
[2020-09-12], [Landsat 8], [NDVI], [0.385], [0.367], [0.269], [0.484],
[2020-09-20], [Landsat 7], [], [0.315], [0.298], [0.218], [0.394],
   table.hline(),
),
)

#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(),
[*Datum*], [*Sensor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(),
[2021-05-10],[Landsat 8], [bez harmonizace],[0.239],[0.219],[0.166],[0.290],
[2021-05-10],[Landsat 8], [NIR a RED],[0.246],[0.232],[0.182],[0.293],
[2021-05-10],[Landsat 8], [NDVI],[0.232],[0.213],[0.162],[0.281],
[2021-05-18],[Landsat 7], [],[0.246],[0.222],[0.159],[0.312],
[2021-05-26],[Landsat 8], [bez harmonizace],[0.341],[0.313],[0.233],[0.431],
[2021-05-26],[Landsat 8], [NIR a RED],[0.337],[0.315],[0.245],[0.417],
[2021-05-26],[Landsat 8], [NDVI],[0.330],[0.303],[0.226],[0.416],
[2021-06-11],[Landsat 8], [bez harmonizace],[0.399],[0.370],[0.286],[0.495],
[2021-06-11],[Landsat 8], [NIR a RED],[0.386],[0.362],[0.287],[0.470],
[2021-06-11],[Landsat 8], [NDVI],[0.385],[0.358],[0.277],[0.478],
[2021-06-19],[Landsat 7], [],[0.413],[0.390],[0.294],[0.525],
[2021-06-27],[Landsat 8], [bez harmonizace],[0.457],[0.428],[0.326],[0.580],
[2021-06-27],[Landsat 8], [NIR a RED],[0.437],[0.410],[0.320],[0.545],
[2021-06-27],[Landsat 8], [NDVI],[0.441],[0.413],[0.315],[0.559],
[2021-07-05],[Landsat 7], [],[0.430],[0.401],[0.301],[0.554],
[2021-07-13],[Landsat 8], [bez harmonizace],[0.523],[0.496],[0.377],[0.672],
[2021-07-13],[Landsat 8], [NIR a RED],[0.496],[0.472],[0.369],[0.626],
[2021-07-13],[Landsat 8], [NDVI],[0.505],[0.478],[0.364],[0.647],
[2021-08-30],[Landsat 8], [bez harmonizace],[0.459],[0.427],[0.325],[0.583],
[2021-08-30],[Landsat 8], [NIR a RED],[0.439],[0.412],[0.321],[0.548],
[2021-08-30],[Landsat 8], [NDVI],[0.443],[0.413],[0.315],[0.562],
[2021-09-07],[Landsat 7], [],[0.334],[0.308],[0.233],[0.420],
[2021-09-15],[Landsat 8], [bez harmonizace],[0.430],[0.396],[0.300],[0.549],
[2021-09-15],[Landsat 8], [NIR a RED],[0.414],[0.387],[0.303],[0.520],
[2021-09-15],[Landsat 8], [NDVI],[0.415],[0.383],[0.291],[0.530],
   table.hline(),
),
)