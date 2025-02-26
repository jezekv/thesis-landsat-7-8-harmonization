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
Harmonizace dat družicových platforem\ 
Landsat 7 (ETM+) a Landsat 8 (OLI)\ 
při sledování horské vegetace\
\
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

// Zadání
#set page(
paper: "a4",
margin: (
   top: 0cm,
   bottom: 1.5cm,
   left: 2cm,
   right: 0cm 
),
)

#image("zadani.svg", width: 100%)
#image("zadani_1.svg", width: 100%)

#set page(
paper: "a4",
margin: (
   top: 2.5cm,
   bottom: 2.5cm,
   left: 4cm,
   right: 2.5cm 
),
)
// Konec zadání

// Prohlášení
#set text(11pt)
#set align(start)
#set par(justify: true,
         first-line-indent: 0em)
         
*ČESTNÉ PROHLÁŠENÍ*\
Prohlašuji, že jsem diplomovou práci na téma:
Harmonizace dat družicových platforem Landsat 7 (ETM+) a Landsat 8 (OLI) při sledování horské vegetace vypracoval samostatně a~citoval jsem všechny informační
zdroje, které jsem v práci použil a které jsem rovněž uvedl na konci práce v seznamu použitých
informačních zdrojů.

Jsem si vědom, že na moji diplomovou práci se plně vztahuje zákon č. 121/2000 Sb.,
o~právu autorském, o právech souvisejících s právem autorským a o změně některých zákonů, ve~znění pozdějších předpisů, především ustanovení § 35 odst. 3 tohoto zákona, tj. o užití tohoto díla.

Jsem si vědom, že odevzdáním diplomové práce souhlasím s jejím zveřejněním podle
zákona č. 111/1998 Sb., o vysokých školách a o změně a doplnění dalších zákonů, ve znění
pozdějších předpisů, a to i bez ohledu na výsledek její obhajoby.

Svým podpisem rovněž prohlašuji, že elektronická verze práce je totožná s verzi tištěnou a~že
s údaji uvedenými v práci bylo nakládáno v souvislosti s GDPR.
\
\
\
V Praze dne xx března 2025
\
#set align(right)
..............................................\
(podpis autora práce)
#pagebreak()

// Poděování
#set align(start)
*PODĚKOVÁNÍ*\

Rád bych upřímně poděkoval panu Ing. Jiřímu Proškovi, Ph.D. nejen za odborné vedení a~cenné rady, ale také za jeho ochotu a především za lidský přístup. Spolupráce s ním byla inspirativní a motivující. Mé díky patří také panu Ing. Vojtěchu Bartákovi, Ph.D. za jeho pomoc se statistickou analýzou.

#pagebreak()

// Abstrakty
#set align(start + top)
*Abstrakt*

Dálkový průzkum Země představuje neocenitelný nástroj pro sledování změn vegetace na globální i regionální úrovni. Data ze satelitů Landsat jsou pro analýzu těchto trendů široce využívána, a to díky kombinaci stejného prostorového rozlišení, volné dostupnosti a desítky let dlouhé časové řadě. Tato dlouhodobá kontinuita však přináší komplikace, neboť jednotlivé generace satelitů jsou vybaveny odlišnými senzory a pro spolehlivé odhady dlouhodobých trendů vývoje vegetace je nezbytná jejich harmonizace. Další nejistoty pak přináší nekonzistentní frekvence snímání. Tato práce se zaměřuje na analýzu vlivu harmonizace hodnot normalizovaného vegetačního indexu (NDVI) mezi senzory Landsat 7 (ETM+) a Landsat 8 (OLI) při sledování vegetace v horské aridní oblasti Ladakh v letech 2013 až 2021. Současně je zkoumán význam dvojnásobného časového rozlišení, získaného díky překryvu obou platforem, prostřednictvím maximální sezónní hodnoty NDVI. Pro přípravu a analýzu snímků na úrovni Surface Reflectance je využita platforma Google Earth Engine. Výsledky ukazují, že hlavním zdrojem nekonzistence mezi senzory je rozdílná šířka pásma NIR. Efekt harmonizace na základě koeficientů ze studie @roy2016characterization je nejvýraznější během vegetačního maxima, ale přesto nezaručuje úplnou konzistenci mezi senzory. Harmonizace na úrovni již vypočítaného NDVI dosáhla mediánových hodnot 0.036 (ME) a 0.090 (RMSE). Větší množství dostupných snímků během překryvu platforem zvyšuje pravděpodobnost získání reálné hodnoty sezónního maxima NDVI, nicméně přesnost tohoto odhadu závisí na dostupnosti klíčového snímku z období vegetačního maxima. Jeho absence může vést k nepřesným odhadům. Tato práce přispívá k lepšímu pochopení problematiky sledování vegetace ve specifických podmínkách horských aridních oblastí a naznačuje potřebu optimalizovat harmonizační metody a integrovat doplňkové datové zdroje.
\
\
*Klíčová slova:* NDVI, DPZ, cloudové zpracování dat

#pagebreak()

*Abstract*

dodělat před tiskem po závěrečné opravě!
\
\
*Keywords:* NDVI, remote sensing, cloud-based data processing
#pagebreak()

///////////
// Obsah

#set block(spacing: 1em) // outline bug
#show outline.entry.where(
   level: 1
): it => {
   v(11pt, weak: true)
   strong(it)
}

#outline(
   indent: 2em
)
#pagebreak()
#set block(spacing: 1.8em)
////////////////////////////////////////
// Text
#set par(first-line-indent: 2em)
#set page(numbering: "1") 
#show figure: set text(size: 10.11pt) //tabulky v textové části

= Úvod
Globální trend zvyšujícího se nárůstu vegetačního pokryvu na Zemi, známý jako greening trend, nabývá v posledních desetiletích na důležitosti @GUTIERREZHERNANDEZ2025101377 @CHEN2024e02791 @Chen_2019 @ZHAO2018198. Jednou z postižených oblastí jsou horské subnivální ekosystémy (oblast mezi horní hranicí lesa a sněžnou čárou), kde může greening trend vyvolat strukturální ekologické změny specifických druhů nízké vegetace, které mohou vést k dlouhodobým environmentálním dopadům @choler2024waning @anderson2020vegetation @fassnacht2019landsat @filippa2019climatic @liu2021continuous.

Vzhledem k tomu, že tyto změny probíhají na rozsáhlých územích, představují satelitní data z dálkového průzkumu Země cenný nástroj pro jejich monitorování, a to z důvodu globálního pokrytí a možnosti tvorby časových řad. Pro zajištění konzistence naměřených hodnot normalizovaného vegetačního indexu (NDVI) u senzorů na platformách Landsat 7 a Landsat 8 je však nutná jejich harmonizace. Ta je nezbytná kvůli rozdílům v šířce jednotlivých spektrálních pásem a odlišné citlivosti senzorů @holden2016analysis @roy2016characterization @li2013cross @flood2014continuity.

Zároveň existuje jen omezený počet studií, které se zabývají greening trendem u vysokohorské aridní vegetace v kontextu s rostoucím počtem dostupných satelitních snímků během sezóny. Například studie @bayle2024landsat zdůrazňuje potřebu cíleného výzkumu těchto specifických oblastí, protože vyšší četnost snímání může ovlivnit interpretaci dlouhodobých trendů vegetačního pokryvu.

Tato práce se věnuje výše popsaným fenoménům z hlediska omezení a správnosti aplikací široce používaných harmonizačních koeficientů ze studie @roy2016characterization v oblastech aridních horských ekosystémů. Kromě toho se zaměřuje na význam dvojnásobného časového rozlišení (8 dní) získaného díky překryvu snímání platforem Landsat 7 a Landsat 8. Je analyzováno, jak větší kvantita snímků ovlivňuje celosezónní charakteristiky NDVI a jak mohou tyto změny vést ke zkreslení odhadů při dlouhodobém monitorování vegetace. 

= Cíle práce
Cílem diplomové práce je prozkoumat klíčové aspekty konzistence naměřených hodnot NDVI získaných ze senzorů ETM+ (Landsat 7) a OLI (Landsat 8) v aridní vysokohorské oblasti Ladakh v letech 2013 až 2021. Přitom bude věnována pozornost následujícím výzkumným otázkám:

+ Jak ovlivňují rozdíly v charakteristikách senzorů (zejména šířka spektrálních pásem) naměřené hodnoty NDVI mezi platformami Landsat 7 (ETM+) a Landsat 8 (OLI) a do jaké míry lze tyto rozdíly minimalizovat pomocí harmonizace dat?

+ Jaký vliv má dostupnost většího množství snímků během překryvu platforem Landsat 7 a Landsat 8 na přesnost a spolehlivost identifikace sezónních maxim NDVI ve specifických časových obdobích?

= Literární rešerše
== Mise Landsat
Satelity Landsat snímají zemský povrch nepřetržitě již více než 50 let. Poskytují tak nejdelší časovou řadu pozorování ze všech globálních vesmírných misí @roy2014landsat. Již v prvních letech po zavedení programu začala vznikat nová metodika pro mapování změn krajinného pokryvu a vyhledávání přírodních zdrojů @goward1997landsat. Většinu času bylo snímky možné získat pouze komerčně. Zlom nastal v roce 2008, kdy byla data poskytnuta zdarma online pro všechny uživatele. To způsobilo značné navýšení uplatnění nejen v aplikační sféře, ale také ve vědeckém sektoru @wulder2012opening @woodcock2008free. Vzhledem k neustálému rozšiřování mise se role Landsatu jako nástroje pro globální pozorování Země i nadále zvyšuje @zhu2019benefits. 

Satelit Landsat 7 byl na oběžnou dráhu vypuštěn v roce 1999 jako nástupce Landsatu 5. Měl opakovací cyklus 16 dní a nesl s sebou několik vylepšení. Kromě zdokonaleného senzoru ETM+ i takzvaný _long-term acquisition plan_ (LTAP) a _image assessment system_ (IAS) @loveland2012landsat. Principem LTAP bylo automatizované vybírání vhodných míst na Zemi pro pravidelnou aktualizaci globálního archivu bezoblačných a dobře osvětlených scén @arvidson2001landsat. Algoritmy metody IAS zase vylepšily geometrickou a radiometrickou přesnost @basislandsat. V roce 2003 selhal na snímači _scan line corrector_ (SLC). Ten kompenzoval dopředný pohyb satelitu za účelem zpětného snímání senzoru. Z toho důvodu na snímcích chybí přibližně 22 % plochy ve formě pravidelných pruhů @scaramuzza2005landsat. Po roce 2017 došlo u Landsatu 7 k postupnému driftu na oběžné dráze směrem k dřívějšímu času akvizice, což ovlivnilo úhly osvětlení. Přesto byla změna NDVI v roce 2020 ve srovnání s Landsatem 8 zanedbatelná (méně než 0.003) @qiu2021can. Nominální mise Landsat 7 byla ukončena v roce 2022 přechodem satelitu na nižší oběžnou dráhu @landsat7end.

Satelit Landsat 8 začal zaznamenávat povrch Země v roce 2013. Hlavní změnou oproti předchozím generacím satelitů byl nový vylepšený optický snímač OLI a termální infračervený senzor TIRS @roy2014landsat. Jak OLI, tak TIRS jsou senzory typu _pushbroom_. Jejich použití vedlo ke zlepšení geometrické přesnosti a poměru signálu k šumu @irons2012next. Landsat 8 má opakovací cyklus snímání 16 dní a je umístěn na stejné oběžné dráze jako již vyřazený Landsat 5 @roy2014landsat. V kombinaci s Landsatem 7 bylo tak umožněno zachytit každé místo na rovníku s intervalem 8 dní a ve vyšších zeměpisných šířkách, v důsledku tzv. _poleward convergence_, kdy se dráhy satelitů směrem k pólům sbíhají, i častěji @kovalskyy2013global.  

První generace satelitů Landsat byla vybavena snímačem _Multispectral Scanner_ (MSS), který měl ve srovnání s novějšími snímači (TM – _Thematic Mapper_, ETM+ a OLI) nejen horší prostorové rozlišení (60 metrů), ale také odlišná spektrální pásma, pokrývající jiné oblasti vlnových délek. Z tohoto důvodu je možné vytvářet konzistentní časové řady až od nástupu satelitu Landsat 4 @banskota2014forest. Aktuálně na oběžné dráze aktivně snímají pouze dva satelity, a to Landsat 8 a Landsat 9. Kompletní přehled jednotlivých misí Landsat a jejich období provozu je znázorněno na obrázku 1. 

#figure(
   image("images/landsat.png", width: 100%),
   kind: "img",
   supplement: "obr.",
   caption: "Časová osa misí Landsat.",
)

Kolem roku 2030 by měla být zahájena mise Landsat Next, která nabídne lepší prostorové rozlišení s více specificky zaměřenými pásmy a díky konstelaci třech satelitů i šestidenní interval snímání @wulder2022fifty @landsatnext.

== Specifikace senzorů
=== Enhanced Thematic Mapper Plus (ETM+) 
Senzor ETM+ je pevný osmipásmový multispektrální radiometr patřící do skupiny _whiskbroom_ skenerů. U tohoto typu se detektory při snímání pohybují ze strany na stranu, aby pokryly celou oblast záběru, čímž připomínají pohyb při zametání. Snímač pracuje s 8bitovou hloubkou záznamu @SaylerL7. Oproti předchozí verzi představil ETM+ několik novinek. Primární inovací bylo přidání panchromatického pásma s prostorovým rozlišením 15 metrů a výrazně lepší rozlišení u TIR pásma @nasaetm. Dále senzor obsahuje dva přístroje: _full aperture solar calibrator_ (FASC) a _partial aperture solar calibrator_ (PASC) zajištující solární kalibraci a řadu dalších vylepšení, která garantují maximální radiometrickou chybu měření do 5 % @markham1994radiometric. Jednotlivá pásma senzoru ETM+ a jejich vlnové délky jsou uvedeny v tabulce 1.

#figure(
   table(
   row-gutter: -2pt,
   columns: (4),
   inset: 5pt,
   align: center + horizon,
   stroke: none,
   table.hline(stroke: 0.7pt),
   [*Pásmo*], [*Vlnová délka (µm)*], [*Název*], [*Rozlišení (m)*],
   table.hline(stroke: 0.7pt),
   [1], [0.45 - 0.52], [Blue], [30],
   [2], [0.52 - 0.60], [Green], [30],
   [3], [0.63 - 0.69], [Red], [30],
   [4], [0.77 - 0.90], [Near Infrared (NIR)], [30],
   [5], [1.55 - 1.75], [Shortwave Infrared (SWIR1)], [30],
   [6], [10.40 - 12.50], [Thermal Infrared (TIR)], [60],
   [7], [2.08 - 2.35], [Shortwave Infrared (SWIR2)], [30],
   [8], [0.52 - 0.90], [Panchromatic], [15],
   table.hline(stroke: 0.7pt),
   ),
   kind: "tab",
   supplement: "tab.",
   caption: "Spektrální pásma senzoru ETM+ (Landsat 7).",
)

=== Operational Land Imager (OLI)
Senzor OLI představoval na poli radiometrů významný technologický pokrok. Oproti ETM+, který využíval oscilující zrcadla (_whiskbroom_), zde byly použity dlouhé lineární řady detektorů zarovnané na ohniskové rovině přístroje. Tyto detektory pracují společně se čtyřzrcadlovým astigmatickým teleskopem, který zajišťuje přesné zaostření obrazu. Díky tomu bylo možné z architektury odstranit několik pohyblivých částí a zároveň zlepšit citlivost. Tato technologie se nazývá _pushbroom_ @VaughnL8. OLI je multispektrální radiometr snímající devět pásem ve 12bitové hloubce @irons2012next. Novinkou jsou dvě pásma. _Coastal Aerosol_ určené pro pozorování atmosférických podmínek v pobřežních zónách a _Cirrus_ pro detekci vysoké oblačnosti @nasaoli. Z hlediska radiometrické chybovosti byly požadavky na OLI srovnatelné s ETM+. Avšak u poměru signálu k šumu (SNR) byly stanoveny přísněji @VaughnL8. Jednotlivá pásma senzoru OLI a jejich vlnové délky jsou uvedeny v tabulce 2.

#figure(
   table(
   row-gutter: -2pt,
   columns: (4),
   inset: 5pt,
   align: center + horizon,
   stroke: none,
   table.hline(stroke: 0.7pt),
   [*Pásmo*], [*Vlnová délka (µm)*], [*Název*], [*Rozlišení (m)*],
   table.hline(stroke: 0.7pt),
   [1], [0.43 - 0.45], [Coastal Aerosol], [30],
   [2], [0.45 - 0.51], [Blue], [30],
   [3], [0.53 - 0.59], [Green], [30],
   [4], [0.64 - 0.67], [Red], [30],
   [5], [0.85 - 0.88], [Near Infrared (NIR)], [30],
   [6], [1.57 - 1.65], [Shortwave Infrared (SWIR1)], [30],
   [7], [2.11 - 2.29], [Shortwave Infrared (SWIR2)], [30],
   [8], [0.50 - 0.68], [Panchromatic], [15],
   [9], [1.36 - 1.38], [Cirrus], [30],
   table.hline(stroke: 0.7pt),
   ),
   kind: "tab",
   supplement: "tab.",
   caption: "Spektrální pásma senzoru OLI (Landsat 8).",
)

=== Rozdíly mezi senzory
Ačkoli byl senzor OLI navržen s ohledem na kompatibilitu se staršími snímači ETM+ a TM, tak se vzhledem k inovacím mírně liší @irons2012next. Přidáním dalšího pásma na modrém konci spektra u OLI se změnilo číslování. Pásma TM a ETM+ označená jako 1, 2, 3, 4, 5, 7 odpovídají reflexním pásmům OLI 2, 3, 4, 5, 6, 7 v tomto pořadí @flood2014continuity. Několik pásem u OLI bylo zúženo, aby se vyhnula atmosférickým absorpčním zónám. Největší změna se týká pásma 5 OLI, které bylo upraveno tak, aby vyloučilo absorpční pás vodní páry při 0,825 μm uprostřed pásma 4 ETM+. Modifikováno bylo i panchromatické pásmo a SWIR1 se SWIR2 @VaughnL8. Spektrální odezvy jednotlivých pásem jsou zobrazeny na obrázku 2.

#show figure.caption: set align(left)
#figure(
   image("images/OLI_ETM+.png", width: 100%),
   kind: "img",
   supplement: "obr.",
   caption: " Relativní spektrální odezvy pro pásma Landsat 7 (ETM+) a Landsat 8 (OLI). Spektrální odezva pro každé pásmo je zobrazena s číslem pásma ve stejné barvě (Flood 2014).",
)
#show figure.caption: set align(center)

== Spektrální rozdíly mezi pásmy a jejich dopad na vegetační indexy
Běžně používané vegetační indexy jsou založeny na vztahu spektra červeného a blízkého infračerveného záření, a to z důvodu citlivosti na fotosyntetická barviva a morfologii listu @ELVIDGE199538. I přes snadnou aplikaci mají tyto kombinace řadu nevýhod. Příkladem může být nízká citlivost a nedostatečná spektrální věrnost při zachycování jemných variací při použití širokých spektrálních pásem, která nebyla specificky korigována. U satelitů Landsat snižuje citlivost také menší prostorové rozlišení 30 metrů @xue2017significant @huete2012vegetation. Navzdory nižšímu prostorovému i spektrálnímu rozlišení tyto senzory i tak poskytují konzistentní a včasné informace o regionálních trendech @huete2012vegetation.

Hodnoty vegetačních indexů odvozených ze snímků z různých satelitních senzorů se liší na základě rozdílů mezi analogickými spektrálními pásmy používanými k jejich generování @teillet2008spectral.

AVIRIS (_Airborne Visible/Infrared Imaging Spectrometer_) je hyperspektrální senzor umístěný na letadlech, který snímá odrazivost povrchu Země v celém viditelném a blízkém infračerveném spektru s prostorovým rozlišením 20 metrů @green1998imaging. Při porovnání dat ze senzoru AVIRIS se spektrálními pásmy specifickými pro další satelitní senzory byly výsledky NDVI výrazně ovlivněny rozdíly ve spektrální šířce pásem, přičemž zvlášť důležité bylo červené pásmo. @teillet1997effects.

AVHRR (_Advanced Very High Resolution Radiometer_) je senzor umístěný na družicích NOAA, který snímá Zemi ve 4 až 6 (v závislosti na modelu) širokých spektrálních pásmech od viditelného až po infračervené spektrum a slouží zejména k monitorování vegetace, oceánů a atmosféry @kalluri2021advanced. Vzhledem k širším spektrálním pásmům byl AVHRR citlivější na atmosférickou vodní páru, která ovlivnila výsledky NDVI oproti dalším porovnávaným senzorům @brown2006evaluation. 

MODIS (_Moderate Resolution Imaging Spectroradiometer_) je multispektrální senzor na družicích Terra a Aqua, který snímá Zemi ve 36 spektrálních pásmech, pokrývajících oblasti od viditelného po termální infračervené spektrum. Slouží k monitorování vegetace, oceánů, oblačnosti a dalších zemských a atmosférických podmínek s prostorovým rozlišením 250 až 1000 metrů @barnes2003status. Primárním důvodem nepřesností u výsledků NDVI byly mezi senzory MODIS a AVHRR označeny aerosoly a vodní páry. Ty ovlivňují pásma NIR a RED odlišnými způsoby v různých vlnových délkách. Finální shodu NDVI mezi senzory tak formuje šířka jejich pásem @van2006multi. 

Podobných výsledků bylo dosaženo při porovnání senzorů ETM+ a OLI, kde měla hlavní vliv na nekonzistenci výsledků NDVI šířka pásma NIR. To lze vysvětlit tím, že užší pásmo NIR u OLI je méně ovlivněno absorpcí vodní páry @ke2015characteristics. Získané vegetační indexy jsou mezi oběma senzory sice silně korelované, ale přesto mírně odlišné @li2013cross @mancino2020cross. Výsledky NDVI zároveň vykazují větší rozdíly ve srovnání s hodnotami odrazivosti jednotlivých pásem. To je způsobeno tím, že zkreslení v pásmech NIR a RED se systematicky projevuje ve stejném směru. Tento efekt se ještě více projeví při výpočtu indexu @holden2016analysis.

Aktuální multisenzorové aplikace NDVI tak mohou dosáhnout největšího přínosu, pokud se efektivně vyřeší atmosférické korekce a použijí se translační rovnice pro harmonizaci @van2006multi @simms2013multisensor. 

== Harmonizace dat ze senzorů ETM+ a OLI
Jako jeden z prvních, kdo řešil ucelený proces harmonizace senzorů OLI a ETM+ pro tvorbu časových řad, byl @flood2014continuity, který své analýzy prováděl na datech ze severovýchodní Austrálie. Podobný cíl sledovali také @roy2016characterization, kteří se zaměřili na snímky pokrývající celé kontinentální území Spojených států amerických. Stejnou problematikou se následně zabývalo několik dalších studií @perez2023landsat @cao2022harmonizing @chastain2019empirical. Ve všech těchto případech došlo k přímému porovnání jednotlivých spektrálních pásem, která byla následně statisticky analyzována prostřednictvím lineárních regresních modelů. 

Přestože výsledky vykazují vysokou spolehlivost, lze v nich identifikovat několik nedostatků. Jedním z nich je například absence cílené úpravy koeficientů pro specifické povrchy. Důsledkem aproximace nemusí koeficienty optimálně fungovat pro snímky z konkrétních lokalit na Zemi, jak uvádí například @flood2014continuity, který upozorňuje na nutnost obezřetnosti při jejich aplikaci v oblastech s odlišnými typy vegetace a půdy, než jaké jsou zastoupené na analyzovaných snímcích. Kromě rozdílů ve spektrální odezvě mezi senzory je rovněž sporná důvěryhodnost koeficientů pro pásma kratších vlnových délek, což souvisí s nedostatky v algoritmech atmosférické korekce, jak zmínili @roy2016characterization. Atmosférická korekce je totiž u senzoru ETM+ pro zelené a modré pásmo méně přesná než u senzoru OLI @VERMOTE2016.

Podle studie @xu2014compare je NDVI získaný ze senzoru OLI nejvíce odlišný od NDVI ze senzoru ETM+ v oblastech s nižším pokryvem vegetací. Tento rozdíl se s rostoucí hodnotou NDVI zmenšuje. Pro dosažení konzistence je proto doporučena cílená harmonizace. Aplikace univerzálních koeficientů, odvozených ze strukturálně rozdílných krajinných typů, nemusí vždy fungovat optimálně. Z tohoto důvodu je vhodnější použít harmonizační model přizpůsobený konkrétní studované oblasti, neboť každý region vykazuje specifické odchylky ve spektrální odezvě @cao2022harmonizing @flood2017comparing.

Alternativu představili @berner2023landsatts, kteří pro harmonizaci snímků použili polynomickou regresi. Tento přístup dokáže reagovat na potenciální nelinearity a lépe se přizpůsobuje datové sadě uživatele. Koeficienty jsou navíc přizpůsobeny prostředí arktické tundry a boreálním lesům. Tím se, na rozdíl od globálně aplikovatelných metod, snižuje riziko chyby. Tento model byl použit například ve studii @choler2024waning. 

== Základní celosezónní metriky založené na NDVI
Optický dálkový průzkum Země je komplikován přítomností oblaků, sněhu, ledu či stínů, které zakrývají povrch. Pro zařazení kvalitních snímků do časových řad je nezbytné tyto vlivy maskovat @zhu2018cloud. V oblastech s náročnými povětrnostními podmínkami může během vegetační sezóny kvůli oblačnosti vznikat značné množství mezer v dostupných datech. @white2014landsat. Z toho důvodu je žádoucí aplikovat vhodný algoritmus skládání obrazu @white2014pixel.

Tyto algoritmy se dělí na tři základní podskupiny, kdy je výpočet proveden na základě jednoho pravidla (maximum či medián), kombinace více pravidel nebo spektrální podobnosti. Metody založené na jednom pravidle jsou oblíbené nejen pro svou snadnou implementaci, ale i díky možnosti aplikace na rozsáhlé datové sady @qiu2023evaluation. Algoritmus výběru maximálního NDVI byl původně vyvinut pro senzor AVHRR @holben1986characteristics, avšak rychle našel uplatnění i v časových řadách Landsat a dodnes se používá v současných studiích @qiu2023evaluation.

Maximální hodnoty NDVI jsou během sezóny citlivé na dostupnost snímků a jejich načasování v rámci fenologického cyklu vegetace. S rostoucím počtem bezoblačných snímků tak dochází k asymptotickému nárůstu maxim NDVI @berner2020summer. To potvrdili i @bayle2024landsat, kteří tvrdí, že zvýšení dostupnosti pozorování v průběhu času může výrazně zkreslit greening trend, pokud se jako metrika používá maximální hodnota NDVI. K tomu mimo jiné dochází právě i vlivem překrývání satelitních platforem Landsat v čase.

Robustnější metodou oproti maximálním hodnotám NDVI může být jejich medián. Ten je odolnější vůči výkyvům v kvantitě dat a outlierům, ale nezachovává jejich integritu @ruefenacht2016comparison. Nicméně, jak upozorňují @bayle2024landsat, i tato roční metrika může být postižena podobnými problémy a nemusí přesně zachytit časové změny vegetace. Pokud je k dispozici větší množství snímků za stejný časový úsek, zvyšuje se pravděpodobnost, že se zaznamenají vyšší hodnoty NDVI, což může ovlivnit nejen maximální hodnotu, ale i medián.

= Charakteristika studijního území
Byla studována oblast teritoria Ladakh v severní Indii (viz obrázek 3). Průměrná nadmořská výška studovaného území je 4900 m n. m., přičemž nejvyšším bodem je hora Kangju Kangri, dosahující výšky 6725 m n. m., a nejnižším bodem je údolí řeky Chenab, ležící ve výšce 2100 m n. m.

Jedná se o vysokohorskou aridní zónu, která je díky suchému kontinentálnímu klimatu nezaledněná až do nadmořské výšky 6200 až 6400 m n. m. Tato oblast je specifická pro relativně velké plochy rozvinutých půd mezi 5600 a 6000 m n. m., které pokrývá řídká subnivální vegetace @dvorsky2015vascular. Z klimatického hlediska je oblast kolem města Leh (severní část studovaného území, ve výšce 3500 m n. m.) charakterizována dynamicky se měnícími teplotami, které v průběhu roku kolísají mezi 34,8 °C v létě a až −27,9 °C v zimě. Průměrná denní teplota se pohybuje kolem 7,3 °C. Průměrné denní množství srážek se pohybuje v rozmezí 0,5 až 1,5 mm/den. Tyto klimatické podmínky činí region Leh chladným a suchým @chevuturi2018climate.


#figure(
   image("images/mapa.png", width: 100%),
   kind: "img",
   supplement: "obr.",
   caption: "Mapa studovaného území s vyznačenými hranicemi scény (červený čtverec).",
)

= Metodika
V této kapitole je popsána příprava dat z platforem Landsat 7 a Landsat 8 pro analýzu vegetačního indexu NDVI. Data jsou nejprve kalibrována a maskována pro odstranění oblačnosti. Následně je provedena harmonizace společně s výpočtem NDVI. Výsledky jsou vyhodnoceny ve dvou formách: jako NDVI pro každý snímek a jako sezónní maxima NDVI. Proces zpracování je znázorněn v diagramu na obrázku 4. Kompletní kód je k dispozici v příloze 5.

#figure(
   image("images/metodika.png", width: 80%),
   kind: "img",
   supplement: "obr.",
   caption: "Schéma pracovního postupu.",
)
== Charakteristika vstupních dat
Data z obou senzorů byla zpracována v prostředí Google Earth Engine s využitím programovacího jazyku Java Script. 

Byla použita atmosféricky korigovaná data v označení _Level 2, Collection 2, Tier 1_, a to jak pro Landsat 7, tak i Landsat 8. V obou případech se zároveň jednalo o zpracování na úrovni _Surface Reflectance_. Kompletní předzpracování snímků provedla US. Geological Survey pomocí metod _Landsat Ecosystem Disturbance Adaptive Processing System_ (LEDAPS) pro Landsat 7 a _Land Surface Reflectance Code_ (LaSRC) pro Landsat 8 @usgs_sr.

Principem modelu LEDAPS je kalibrace syrových dat na horní část atmosféry (TOA) a následně atmosférická korekce pomocí metody MODIS/6S @masek_2006. Metoda LaSRC využívá pro výpočet aerosolové pásmo a pomocná klimatická data MODIS nebo VIIRS CMG společně s modelem radiačního přenosu @VERMOTE2016.

== Kalibrace dat a maskování oblačnosti
Informace o skutečné odrazivosti povrchu (_Surface Reflectance_) byly získány po kalibraci dat na základě přepočtu DN hodnot o tzv. _scale factor_ a _additive offset_ @Gee_migration. DN (_Digital Number_) je číselná hodnota, která udává intenzitu odraženého světla, ale ještě neodpovídá skutečné odrazivosti povrchu. _Scale factor_ je násobící činitel, kterým se DN hodnota upraví a _additive offset_ je konstanta, která se k výsledku následně přičítá či odečítá. Průběh kalibrace optických pásem je zobrazen na obrázku 5.

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
   caption: "Funkce pro kalibraci dat z kolekce 2.",)

K maskování oblačnosti byl využit tzv. _QA_PIXEL_. Pásmo _Quality Assessment_ (QA) v sobě ukládá binární přepis informací o kvalitě jednotlivých pixelů v obraze a pomáhá tak identifikovat přítomnost oblaků, ledu, sněhu či vody ve snímku @usgs_qa. Na obrázku 6 je přiložen kód pro maskování oblačnosti. Ten byl vytvořen na základě skriptu od @Gee_erickson. Bity pro _Cloud Confidence_ i _Cloud Shadow Confidence_ byly filtrovány s intenzitou _.gte(2)_.

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
   caption: "Funkce pro maskování oblačnosti (Erickson 2018).",)

== Aplikace harmonizačních koeficientů a výpočet NDVI
Byly použity harmonizační koeficienty ze studie @roy2016characterization. Stejným způsobem byly harmonizovány i studie zabývající se analýzou vysokohorské vegetace @anderson2020vegetation @fassnacht2019landsat @pastick2019spatiotemporal, které strukturálně odpovídají charakteru území analyzovaného v této práci.

Aplikace koeficientů byla provedena pouze na snímcích ze senzoru OLI (Landsat 8), které byly sladěny s ETM+ (Landsat 7). Důvodem bylo umožnit potenciální rozšíření časové řady i o data z Landsatu 5 při aplikaci metodiky popsané v této práci. Použité koeficienty jsou zobrazeny v tabulce 3 a jejich použití v kódu je ilustrováno na obrázku 7.

#figure(
   table(
   row-gutter: -2pt,
   columns: (2),
   inset: 5pt,
   align: center + horizon,
   stroke: none,
   table.hline(stroke: 0.7pt),

[*Pásmo*], [*Vzorec*],
table.hline(stroke: 0.7pt),
[RED], [ETM+ = *0.0123* + *0.9372* OLI], 
[NIR], [ETM+ = *0.0448* + *0.8339* OLI],
[NDVI], [ETM+ = *0.0029* + *0.9589* OLI], 
table.hline(stroke: 0.7pt),
   ),
   kind: "tab",
   supplement: "tab.",
   caption: "Harmonizační koeficienty pro Surface Reflectance (Roy et al. 2016).",
)

Současně byl vypočítán normalizovaný vegetační index (NDVI). Jedná se o jeden z nejpoužívanějších vegetačních indexů pro sledování zdraví a hustoty vegetace @huang2021commentary @li2021high @jiang2006analysis @bhandari2012feature. NDVI se získává dle vzorce: $ "NDVI"= ("NIR"-"RED")/("NIR"+"RED") $

Hodnoty NDVI se pohybují v rozmezí od -1 do 1. Nízké hodnoty, kolem 0.1 nebo méně, obvykle ukazují na suché oblasti, jako jsou kamenné či písečné pouště. Hodnoty v rozmezí 0.2 až 0.3 charakterizují křoviny a pastviny. Vysoké hodnoty, pohybující se mezi 0.6 a 0.8, indikují husté vegetační porosty, včetně mírných a tropických deštných lesů @weier2000measuring. 

Tato práce se zaměřuje na horské aridní oblasti. S ohledem na to byl práh NDVI v kódu na obrázku 7 nastaven na hodnotu 0.1 a pixely s nižší hodnotou byly zamaskovány. Stejný přístup byl použit i ve studii @anderson2020vegetation.

#show figure.caption: set align(left)
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
var thresholdValue = 0.1; // práh NDVI

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
   caption: "Funkce pro výpočet NDVI s prahováním a aplikací harmonizačních koeficientů na získaném NDVI (pro harmonizaci pásem NIR a RED byl použit stejný postup pouze s jinými koeficienty).",)
#show figure.caption: set align(center)

== Porovnání získaných hodnot NDVI jednotlivých snímků
Bylo provedeno porovnání všech dostupných snímků v rámci jedné sezóny. Cílem nebylo srovnávat výsledky NDVI mezi různými sezónami, ale primárně analyzovat bezprostřední rozdíly v NDVI mezi oběma senzory s různým přístupem k harmonizaci dle studie @roy2016characterization. Sezóna byla definována na období mezi 1. květnem a 30. zářím. Zároveň nebyla srovnávána sezónní maxima, ale přímo naměřené hodnoty NDVI.  

=== Porovnání snímků v rámci jedné sezóny
Celá analýza probíhala ve _for cyklu_. Každá sezóna (2013 až 2021) byla zpracovávána nezávisle na ostatních. To znamená, že nezamaskované pixely byly pozičně shodné pouze v rámci jedné sezóny, ale nikoli mezi sezónami. Důvodem byla častá přítomnost oblačnosti na snímcích.

Filtrace probíhala dle kódu na obrázku 8. K tomu byl použit další _for cyklus_, který pracoval na principu postupného přikládání snímků přes sebe a maskoval pixely, které se nenacházely na všech dostupných snímcích ze sezóny zároveň. Výstupem bylo nové pásmo _mask_, které bylo použito pro tvorbu stratifikovaných bodů.

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
   caption: "For cyklus pro filtraci společných pixelů.",)

Počet stratifikovaných bodů nebyl definován parametrem funkce, ale pomocí nastavení filtrovacího kritéria _CLOUD_COVER_ při importu snímků. Smyslem tohoto postupu bylo filtr nastavit tak, aby bylo získáno 5000 bodů a zároveň bylo odfiltrováno co nejméně oblačnějších snímků.

=== Hromadné porovnání dvojic snímků
Časové okno ve _for cyklu_ bylo zkráceno na 16 dní. Díky tomu byly do výběru zařazeny vždy dva snímky (jeden z Landsatu 7 a jeden z Landsatu 8). Pro tuto dvojici snímků byl následně vypočítán index NDVI ve třech různých variantách: bez harmonizace, s harmonizací pásem NIR a RED a s harmonizací samotného NDVI, jak je popsáno v práci @roy2016characterization. Následovala filtrace společných pixelů, k čemuž byl využit skript zobrazený na obrázku 9. Pro každou dvojici bylo vygenerováno 5000 stratifikovaných bodů.

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
function createMaskPair(imageCollection, l7, l8) {
  var image = imageCollection.toBands();
  var mask = l7.add(l8).rename('mask'); 
  return image.addBands(mask);
};
```
],

   kind: "img",
   supplement: "obr.",
   caption: "Funkce pro filtraci společných pixelů u dvojic snímků.",)

== Porovnání maximálních hodnot NDVI z celé sezóny
Problematika zkreslení výsledků enviromentálních výzkumů při použití maximálních hodnot NDVI a návrhy její korekce již byly zkoumány @karlsen2018new @berner2020summer @wang2022off. Velmi málo studií se ale věnovalo greening trendu a jeho ovlivnění právě touto metrikou přímo u vysokohorské aridní vegetace. Zároveň bylo doporučeno se těmto oblastem dále cíleně věnovat @bayle2024landsat. 

Pro každý pixel byly získány maximální hodnoty NDVI ze všech dostupných snímků v sezóně, která byla definována jako období od 1. května do 30. září. Analýza proběhla ve třech samostatných větvích, kdy v první byly zpracovávány pouze snímky z Landsatu 7, ve druhé pouze snímky z Landsatu 8 a nakonec snímky z obou platforem dohromady. Byla provedena harmonizace na úrovni NDVI dle @roy2016characterization. Všechny dostupné snímky v každé větvi byly vzájemně překryty a jejich maxima byla vyfiltrována pomocí reduceru, jak je znázorněno na obrázku 10. Celá filtrace proběhla ve _for cyklu_, který postup zopakoval pro všechny sezóny (2013 až 2021). Výstupem byl pro každou větev _image_ s devíti pásmy, kdy každé odpovídalo jedné sezóně. 

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
   caption: "Aplikace reduceru pro získání maximálních hodnot NDVI.",)

Následně byly filtrovány společné pixely pro celé sledované časové období (viz obrázek 11). Princip maskování byl stejný jako v kapitole 5.4.1. Nově vytvořené pásmo _mask_ bylo použito k získání 5000 stratifikovaných bodů. Každý bod nesl informaci o maximální hodnotě NDVI pro všechny sezóny i větve zároveň.

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
   caption: "For cyklus pro filtraci společných pixelů.",)

== Statistická analýza
Statistická část probíhala v prostředí R Studio (verze R 4.3.1). Importovány byly balíčky  _ggplot2, reshape2, gridExtra, dplyr_, _tidyr_ a _purrr_.

=== Analýza porovnání snímků v rámci jedné sezóny
Byly vytvořeny souhrny pro každý snímek v sezóně, které zahrnovaly:
- *Kvartily:* Výpočet byl proveden jako vážený průměr mezi dvěma sousedními hodnotami v datech seřazených vzestupně pomocí algoritmu _type 7_ @quantile. Bylo použito pojmenování na základě předlohy:

#align(center)[
   #box[
      #set par(leading: 0.7em)
      #align(left)[
         *Q1*  – 25. percentil\ 
         *Medián*  – 50. percentil\
         *Q3*  – 75. percentil
      ]
   ]
]

- *Aritmetický průměr:* Jako doplňující metrika ke kvartilům dle @mean.

=== Analýza hromadného porovnání dvojic snímků
Pro každou dvojici snímků bylo provedeno:
- *Hodnocení přesnosti:* V podobě RMSE (_Root Mean Square Error_), která měří průměrnou velikost chyb (s ohledem na kvadratické odchylky, což znamená, že větší chyby jsou penalizovány více), a ME (_Mean Error_), která udává jejich průměrnou odchylku. Zatímco RMSE poskytuje informaci o tom, jak velké jsou chyby v průměru, ME ukazuje, zda senzor systematicky nadhodnocuje nebo podhodnocuje. Výpočty byly provedeny dle stanovených vzorců níže:

$ "RMSE"= sqrt(1/n sum_(i=1)^n k("L8" – "L7")^2) $

$ "ME"= 1/n sum_(i=1)^n k("L8" – "L7")\ "kde L7 (Landsat 7) a L8 (Landsat 8) představují hodnoty NDVI. " $

=== Analýza porovnání maximálních hodnot NDVI z celé sezóny
Data byla organizována do vektorů podle roku pořízení, přičemž každý vektor obsahoval tři hodnoty NDVI pro každý stratifikovaný bod (z Landsatu 7, Landsatu 8 a jejich kombinaci). Toto rozdělení umožnilo zpracovat každou sezónu nezávisle na sobě. Výstupem analýzy bylo:
- *Procentuální rozdělení bodů:* Bylo zjištěno kolik procent bodů mělo vyšší maximální hodnotu NDVI oproti druhému senzoru. Porovnány byly vždy pozičně shodné body. 
- *Kvartily:* Byly odečteny hodnoty NDVI Landsatu 7 od Landsatu 8 (L8 - L7). Odečet byl proveden na pozičně shodných bodech. Výsledky byly před výpočtem kvartilů seřazeny vzestupně. Výpočet proběhl dle algoritmu _type 7_ @quantile.
- *Hodnocení přesnosti:* V podobě RMSE (_Root Mean Square Error_) a ME (_Mean Error_) dle stejného postupu jako u kapitoly 5.6.2.

- *Lineární regrese:* Pro všechny pozorované hodnoty byl spočítán lineární regresní model kde:

#align(center)[
   #box[
      #set par(leading: 0.7em)
      #align(left)[
         - Landsat 7 byla *vysvětlující proměnná* (nezávislá)
         - Landsat 8 byla *vysvětlovaná proměnná* (závislá)
      ]
   ]
]

Do přehledu byly zahrnuty klíčové statistické hodnoty, včetně sklonu (_Slope_), který vyjadřuje míru změny závislé proměnné vzhledem k nezávislé; průsečíku (_Intercept_), který určuje hodnotu závislé proměnné, když je nezávislá proměnná rovna nule; korelačního koeficientu (_R_), který měří sílu a směr lineární závislosti mezi proměnnými; a koeficientu determinace (_R2_), který ukazuje, jak dobře model vysvětluje variabilitu dat.

= Výsledky
Pro studované území je charakteristické, že vyšší hodnoty NDVI se soustřeďují převážně do horských údolí. Tento jev je způsoben přítomností říčních toků. Typickým příkladem je údolí řeky Chenab v jihozápadní části území, kde NDVI dosahuje nejvyšších hodnot (viz obrázek 12). Naopak nižší hodnoty NDVI jsou dominantní na horských hřebenech, kde jsou podmínky pro růst vegetace omezené. Rozložení vegetace je tedy ovlivněno reliéfem a dostupností vody.

#show figure.caption: set align(left)
#figure(
   image("images/ndvi_map.png", width: 100%),
   kind: "img",
   supplement: "obr.",
   caption: "Mapa zobrazuje medián maximálních sezónních hodnot NDVI ze všech studovaných sezón znázorněný na stínovaném reliéfu.",
)

Intenzita vegetační aktivity se mezi jednotlivými vegetačními sezónami liší (viz obrázek 13). Medián hodnot NDVI ve vegetačním maximu mezi roky 2016 a 2019 vykazuje rozdíl téměř 0.15. Přestože v datech existují mezery způsobené vyřazením oblačných snímků, sezónní dynamika vegetace vykazuje konzistentní průběh s maximy v letních měsících.

#show figure.caption: set align(left)
#figure(
   image("images/sezony.png", width: 93%),
   kind: "img",
   supplement: "obr.",
   caption: "Graf znázorňuje průběhy všech vegetačních sezón pomocí křivek vytvořených polynomickou regresí 3. stupně. Vstupní data tvoří mediány hodnot NDVI ze všech dostupných snímků pořízených platformami Landsat 7 a Landsat 8 (viz příloha 2). Použité snímky z Landsatu 8 jsou harmonizovány na úrovni NDVI dle (Roy et al. 2016).",
)

== Výsledky porovnání snímků v rámci jedné sezóny
Byl analyzován vývoj NDVI během vegetačních sezón v letech 2013 až 2021 se zaměřením na vliv a chování harmonizačních koeficientů aplikovaných podle metody @roy2016characterization. Kompletní výsledky z této kapitoly jsou k dispozici v přílohách 1 a 2.

Ve všech analyzovaných sezónách je patrné systematické nadhodnocení naměřených hodnot NDVI u senzoru Landsat 8, a to i po aplikaci harmonizačních koeficientů (viz příloha 1). Tento trend je nejzřetelnější na ilustrační sezóně 2020 (viz obrázek 14). Harmonizace má na začátku a na konci této sezóny téměř nulový vliv, zatímco její efekt se zvyšuje v průběhu července.

Při porovnání rozdílů mezi průměry vybraných dvojic snímků vykazuje harmonizace pásem NIR a RED stejné výsledky jako harmonizace NDVI (celkový rozdíl: 0.033). Při porovnání mediánů však harmonizace NDVI dosahuje lepších výsledků (0.034 oproti 0.038). V obou případech je patrný progres oproti variantě bez harmonizace (průměr: 0.047; medián: 0.046), jak je uvedeno v tabulce 4.

Ve všech analyzovaných sezónách je také pozorován sezónní trend vývoje NDVI podle měsíce v roce, přičemž maximálních hodnot dosahuje obvykle v průběhu druhé poloviny července. Za zmínku stojí anomálie v chování srpnových snímků ze sezóny 2017. Snímek z Landsatu 7 pořízený 11. srpna vykazuje nižší hodnoty průměru (0.347; 0.351) i mediánu (0.309; 0.318) než snímek pořízený později, 27. srpna (viz příloha 2), což neodpovídá obvyklému sezónnímu vývoji NDVI v ostatních letech.

#show figure.caption: set align(left)
#figure(
   image("images/sezona_2020.png", width: 80%),
   kind: "img",
   supplement: "obr.",
   caption: "Boxploty vizualizují hodnoty NDVI stratifikovaných bodů jednotlivých snímků ze sezóny 2020. V případě trojice boxplotů u Landsatu 8 se jedná o stejný snímek, ale s různým přístupem k harmonizaci (Roy et al. 2016). Barevné body spojené čarami představují aritmetický průměr. Jednotlivá měření jsou seřazena na časové ose podle data snímání (osa x).",
)
\
#show figure: set text(size: 10pt)
#let pru = [*Průměr*]
#let clk = [*průměr celkem*]
#let med = [*Medián*]
#figure(
table(
   row-gutter: -2pt,
   columns: (8),
   inset: 5pt,
   align: center + horizon,
   stroke: none,
   table.hline(stroke: 0.7pt),

   table.hline(y: 1, start: 2, end: 8, stroke: 0.7pt),
[*Rok*],   [*Počet dvojic*],  table.cell(colspan: 3, pru),  table.cell(colspan: 3, med),

[],   [],   [*bez harm.*], [*NIR a RED*], [*NDVI*],[*bez harm.*], [*NIR a RED*], [*NDVI*],
table.hline(stroke: 0.7pt),
[2013],  [3],           [0.067],   [0.049],   [0.051],   [0.069],   [0.054],   [0.055],
[2014],  [4],           [0.044],   [0.031],   [0.030],   [0.044],   [0.039],   [0.032],
[2015],  [2],           [0.035],   [0.019],   [0.021],   [0.041],   [0.030],   [0.028],
[2016],  [3],           [0.043],   [0.034],   [0.032],   [0.036],   [0.036],   [0.027],
[2017],  [4],           [0.047],   [0.033],   [0.033],   [0.045],   [0.035],   [0.032],
[2018],  [3],           [0.027],   [0.015],   [0.016],   [0.027],   [0.016],   [0.017],
[2019],  [4],           [0.068],   [0.057],   [0.054],   [0.067],   [0.061],   [0.054],
[2020],  [6],           [0.064],   [0.046],   [0.049],   [0.065],   [0.052],   [0.051],
[2021],  [4],           [0.026],   [0.015],   [0.013],   [0.023],   [0.018],   [0.012],
   table.hline(stroke: 0.7pt),
table.cell(colspan: 2, clk, align:left), [*0.047*],   [*0.033*],   [*0.033*],   [*0.046*],   [*0.038*],   [*0.034*],
table.hline(stroke: 0.7pt),
),
kind: "tab",
   supplement: "tab.",
   caption: "Tabulka zobrazuje průměrné rozdíly průměrů a mediánů NDVI mezi dvojicemi snímků Landsat 7 a Landsat 8 s různým přístupem k harmonizaci (Roy et al. 2016). V každé analyzované sezóně byly vybrány všechny dostupné, časově přímo navazující, dvojice snímků. Pokud bylo u stejného snímku k dispozici více možných dvojic, byla vybrána ta s menším rozdílem hodnot NDVI.",
)

== Výsledky hromadného porovnání dvojic snímků
Vliv harmonizačních koeficientů @roy2016characterization byl studován na souhrnných datech ze všech dostupných dvojic snímků. Pro analýzu byla vždy vybrána dvojice snímků (jeden z Landsatu 7 a jeden z Landsatu 8) s minimálním časovým odstupem snímání, konkrétně 8 dní.

Celkem bylo analyzováno 66 dvojic snímků z let 2013 až 2021. Při hodnocení dat pomocí metriky RMSE je na obrázku 15 patrné přiblížení k absolutní konzistenci mezi senzory. Konkrétně se hodnota mediánu snížila z 0.097 na 0.088 (harmonizace pásem NIR a RED), respektive na 0.090 (harmonizace NDVI). U metriky ME je situace podobná. K přiblížení ke konzistenci mezi senzory došlo však pouze po harmonizaci NDVI (medián z 0.047 na 0.036). Nicméně 25 % bodů stále vykazovalo odchylku vyšší než 0.053 (viz tabulka 5).

#figure(
   image("images/dvojice.png", width: 90%),
   kind: "img",
   supplement: "obr.",
   caption: "Boxploty znázorňují výsledky RMSE a ME ze všech analyzovaných dvojic snímků. Všechny boxploty v trojici jsou vytvořeny stejným způsobem, ale s různými metodami harmonizace (Roy et al. 2016). Červená čára vyznačuje linii úplné shody mezi senzory.",
)
\
#show figure: set text(size: 10pt)
#figure(
table(
   row-gutter: -2pt,
   columns: (5),
   inset: 5pt,
   align: center + horizon,
   stroke: none,
   table.hline(stroke: 0.7pt),
[*Metoda*],[*Harmonizace*], [*Q1*], [*Medián*], [*Q3*], 
   table.hline(stroke: 0.7pt),
[RMSE], [bez harmonizace], [0.080], [0.097], [0.116],
[RMSE], [pásma NIR a RED], [0.076], [0.088], [0.106],
[RMSE], [NDVI], [0.074], [0.090], [0.108],
[ME], [bez harmonizace], [0.032], [0.047], [0.062],
[ME], [pásma NIR a RE], [0.028], [0.046], [0.062],
[ME], [NDVI], [0.024], [0.036], [0.053],
   table.hline(stroke: 0.7pt),
),
kind: "tab",
   supplement: "tab.",
   caption: "Tabulka obsahuje hodnoty statistických parametrů zobrazených na obrázku 15.",
)

== Výsledky porovnání maximálních hodnot NDVI z celé sezóny
Bylo analyzováno chování metriky sezónního maxima NDVI, odvozené ze všech dostupných snímků během analyzované vegetační sezóny. Pozornost byla zaměřena na zhodnocení přínosu zvýšené frekvence snímání díky překryvu platforem Landsat 7 a Landsat 8 a na posouzení vlivu harmonizačních koeficientů @roy2016characterization. Kompletní výsledky z této kapitoly jsou k dispozici v přílohách 3 a 4.

Maximální hodnoty NDVI naměřené pomocí Landsatu 8 byly ve srovnání s Landsatem 7 vyšší (viz obrázek 16 a příloha 3). Rozdíly jsou patrné nejen u modální hodnoty, ale také u aritmetického průměru. Tvar křivek pro kategorii "Kombinace" odpovídá tvarům křivek Landsatu 8, což naznačuje, že u většiny bodů byly hodnoty naměřené Landsatem 8 vyšší. V sezóně 2015 to bylo dokonce 96.72 % bodů (viz tabulka 6). Výjimkami jsou sezóny 2017 a 2018 (75 %). 

Většina měření napříč všemi sezónami se koncentruje v nízkých hodnotách NDVI (přibližně do 0.3), které odpovídají horské řídké vegetaci. Lokální maximum je patrné v intervalu hodnot 0.75 až 0.8, což je dobře viditelné v sezóně 2019 (viz obrázek 16). Pravděpodobně se jedná o měření z drobných zemědělských polí. 

Z analýzy scatter plotu vyplývá, že Landsat 8 systematicky nadhodnocuje hodnoty NDVI i přes aplikaci harmonizačních koeficientů, a to v celém jeho rozsahu (viz příloha 4). Zajímavým výsledkem je také skutečnost, že u Landsatu 8 byly opakovaně naměřeny submaximální hodnoty NDVI blížící se hodnotě 1, což se u Landsatu 7 neobjevilo. Na ilustrační sezóně 2019 (viz obrázek 16) je dobře viditelný také větší rozptyl měření od regresní přímky směrem k vyšším hodnotám NDVI u Landsatu 8. To značí prohlubování rozdílu mezi oběma senzory, ale pouze jedním směrem.

Přímky lineárních modelů prochází souběžně s přímkami absolutní shody. Specifickým příkladem je sezóna 2018, kde došlo k protnutí obou přímek (viz příloha 4). Všimněte si zároveň výsledků R2, který ale v této sezóně dosahuje nejhoršího výsledku (0.757) ze všech vytvořených regresních modelů (viz tabulka 6). 

Při porovnání přímých rozdílů mezi sledovanými body z obou senzorů je viditelný systematický posun. Například na kvartilu Q3 ze sezóny 2016, 2019 a 2021 se body liší až o 0.1 NDVI a u sezóny 2015 dokonce o 0.12 NDVI. Na kvartilu Q1 se body v sezóně 2015 odchylují o 0.039 NDVI, což je zároveň i největší naměřený rozdíl (viz tabulka 6).

#figure(
   image("images/maX_2019_2.png", width: 80%),
   kind: "img",
   supplement: "obr.",
   caption: "Grafy zobrazují výsledky za rok 2019. (a) Density plot znázorňuje rozložení stratifikovaných bodů maximálních hodnot NDVI. Kategorie ''Kombinace'' představuje vyšší z maximálních hodnot NDVI mezi snímky z Landsatu 7 a Landsatu 8 v prostorově shodných pixelech. Svislé přímky vizualizují pozici aritmetického průměru. (b) Scatter plot ilustruje rozdíly v maximálních hodnotách NDVI mezi Landsatem 7 a Landsatem 8. Červená čára představuje linii absolutní shody. Modrá čára zobrazuje výsledek lineární regrese.",
)
#show figure: set text(size: 8.49pt)
#figure(
table(
   columns: (12),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(stroke: 0.7pt),
[*Rok*], [*Landsat 7 (%)*], [*Landsat 8 (%)*], [*Q1*], [*Medián*], [*Q3*], [*RMSE*], [*ME*], [*Slope*], [*Intercept*], [*R*], [*R2*],
   table.hline(stroke: 0.7pt),
[2013], [9.70], [90.30], [0.023], [0.043], [0.080], [0.111], [0.061], [0.983], [0.066], [0.912], [0.832],
[2014], [10.36], [89.64], [0.018], [0.038], [0.073], [0.100], [0.057], [0.995], [0.058], [0.932], [0.869],
[2015], [3.28], [96.72], [0.039], [0.072], [0.120], [0.124], [0.091], [1.012], [0.087], [0.925], [0.856],
[2016], [11.14], [88.86], [0.021], [0.050], [0.099], [0.113], [0.070], [1.030], [0.062], [0.916], [0.840],
[2017], [25.00], [75.00], [0.000], [0.028], [0.064], [0.090], [0.040], [0.979], [0.046], [0.928], [0.862],
[2018], [24.62], [75.38], [0.001], [0.028], [0.075], [0.115], [0.045], [0.914], [0.071], [0.870], [0.757],
[2019], [7.50], [92.50], [0.027], [0.057], [0.105], [0.116], [0.077], [1.016], [0.072], [0.920], [0.847],
[2020], [20.06], [79.94], [0.006], [0.027], [0.057], [0.099], [0.042], [0.980], [0.049], [0.920], [0.847],
[2021], [16.00], [84.00], [0.013], [0.041], [0.097], [0.134], [0.072], [1.032], [0.063], [0.882], [0.778],

   table.hline(stroke: 0.7pt),
),
kind: "tab",
   supplement: "tab.",
   caption: "Tabulka zobrazuje hodnoty statistických parametrů z analýzy maximálních hodnot NDVI. Sloupce Landsat 7 a Landsat 8 vyjadřují procento bodů, u nichž měl daný senzor vyšší maximální hodnotu NDVI ve srovnání s druhým senzorem.",
)

= Diskuse
Senzory ETM+ a OLI se v kontextu výpočtu vegetačních indexů liší primárně ve snímání pásma NIR, které je u OLI spektrálně užší, aby se vyhnulo absorpčnímu pásu vodní páry při 0,825 μm @VaughnL8. Pásmo NIR je tak pravděpodobně hlavní příčinou nekonzistence mezi senzory při výpočtu NDVI @ke2015characteristics @li2013cross @mancino2020cross @holden2016analysis. Z toho vyplývá, že pro zajištění podmínek umožňujících srovnání snímků z obou senzorů je klíčové provést harmonizaci dat. Pokud k harmonizaci nedojde, hrozí, že do analýzy budou zavedeny systematické chyby.

== Harmonizace snímků

V této práci byly použity harmonizační koeficienty ze studie @roy2016characterization. Výsledky ukázaly, že jejich vliv je při aplikaci na snímky z těchto specifických horských oblastí nedostatečný. Účinek harmonizace byl sice větší v době vegetačního maxima při nárůstu hodnot NDVI, ale i tak nebyla mezi senzory zajištěna úplná konzistence. To odpovídá předpokladům @flood2014continuity, který tvrdí, že koeficienty nemusí fungovat optimálně v oblastech, jež se strukturálně liší od snímků použitých pro jejich tvorbu. Ve studii @roy2016characterization byly použity snímky z kontinentálního území Spojených států amerických. Lze tak předpokládat, že nasazené harmonizační koeficienty nejsou pro účely této práce optimálně zvolené.

Pro aplikaci harmonizačních koeficientů od @roy2016characterization bylo rozhodnuto na základě jejich použití ve studiích @anderson2020vegetation a @fassnacht2019landsat. Analyzují totiž strukturálně velmi podobné oblasti. Dle výstupů z této práce lze předpokládat, že výsledky zmíněných studií mohou být zatíženy chybou. 

Testovány byly dva různé přístupy k harmonizaci. Prvním byla harmonizace pásem NIR a RED, ze kterých byl následně vypočítán index NDVI. Druhý přístup spočíval v harmonizaci již vypočítaného NDVI. Na základě výsledků této práce se ukazuje, že je výhodnější aplikovat koeficienty na již vypočítaný index NDVI. Zlepšení se však projevilo pouze u metriky ME, a to v podobě poklesu mediánu z 0.047 na 0.036 (viz tabulka 5).

Použité harmonizační koeficienty pravděpodobně ovlivnily i analýzu maximálních hodnot NDVI. Výsledky jednoznačně ukazují, že Landsat 8 naměřil ve všech sezónách vyšší sezónní maxima NDVI ve srovnání s Landsatem 7. Tento trend potvrzuje i studie @xu2014compare, která zdůraznila, že nejvýraznější rozdíly mezi senzory byly zaznamenány především při nízkých hodnotách NDVI (vyšší hodnoty naměřil senzor OLI). Vzhledem k charakteru vegetace studované v této práci, kde výsledky NDVI ve většině případů dosahovaly hodnoty přibližně do 0.3 (viz příloha 3), je pravděpodobné, že právě v tomto rozsahu došlo k největším rozdílům v měření. Tomu odpovídá i výše zmíněný trend, kdy účinek harmonizace byl největší v době vegetačního maxima při nárůstu hodnot NDVI. Z toho lze usuzovat, že vliv harmonizačních koeficientů @roy2016characterization se zvyšuje s rostoucími hodnotami NDVI. 

== Kvantita snímání

@bayle2024landsat uvádí, že roční odhady maximální hodnoty NDVI se systematicky zvyšují s počtem dostupných snímků za vegetační sezónu. K podobnému závěru dospěli i @berner2020summer. Podle studií @bayle2024landsat a @rumpf2022white může zkreslení odhadu maximálních sezónních hodnot NDVI v alpínské zóně Alp (nad 2400 m n. m.), odvozených ze snímků Landsat, tvořit až 50 % celkového pozorovaného greening trendu. Hlavní příčinou je omezený, avšak postupně rostoucí počet dostupných pozorování během krátké vegetační sezóny.

Tato práce studovala období překryvu platforem Landsat 7 a Landsat 8 (2013 až 2021), aby mohla problematiku zvětšení kvantity snímání popsat. Na základě pozorování sezón 2014 a 2019 se zdá, že zásadním snímkem pro výběr maximálních hodnot NDVI je snímek Landsatu 8 z druhé poloviny července (viz příloha 1). Vykazuje totiž nejvyšší hodnoty. Studie @phenolo a @rajan2019understanding, které analyzovaly vegetaci nacházející se ve studovaném území této práce, odhadly vegetační maximum v podobném termínu. Všimněte si například grafu pro sezónu 2017 (viz příloha 1). Vzhledem k nedostupnosti bezoblačného snímků Landsatu 8 z tohoto období pravděpodobně v roce 2017 nebyly zachyceny skutečné maximální hodnoty NDVI. I přes to, že popisované výsledky byly analyzovány odlišným způsobem, vstupní data zůstala nezměněná a tím se snížila šance, že z oblačného snímku byl vybrán větší podíl bodů pro hledání sezónního maxima NDVI.

Na grafu ze sezóny 2017 (viz příloha 4) je patrné, že křivka lineární regrese se blíží přímce absolutní shody, což naznačuje absenci klíčového snímků z Landsatu 8 – již bylo popsáno, že použitá harmonizace nedokáže nadhodnocení Landsatu 8 dobře regulovat, a proto je v tomto případě pro analýzu důležitější než Landsat 7. Tento jev se potvrzuje i vyšším poměrem maximálních hodnot NDVI naměřených z Landsatu 7 ve srovnání s Landsatem 8, který dosahuje 25 % (viz tabulka 6). Zmíněný výsledek představuje největší podíl bodů z Landsatu 7 ze všech analyzovaných sezón. Stejný trend nastal pravděpodobně i v letech 2018 a 2020, u kterých byl klíčový snímek z Landsatu 8 taktéž oblačný. Vykazují totiž podobné výkyvy.

Na základě těchto poznatků lze usoudit, že pro výběr sezónního maxima NDVI je důležité správně detekovat vegetační maximum, zajistit měření z tohoto časového období a nespoléhat se pouze na počet dostupných snímků. Pokud nebudou k dispozici data z klíčového časového okna, i velké množství snímků z jiných časových termínů nebude dostatečné k provedení přesné analýzy.

Je možné uvažovat například o dodatečném doplnění o data ze satelitu Sentinel-2. Jejich křížovému porovnání se satelity Landsat 7 a Landsat 8 se již věnovalo několik prací @cao2022harmonizing @perez2023landsat @chastain2019empirical @flood2017comparing. Podle závěrů zmíněných studií byly navrženy metody harmonizace. Další z alternativních možností je použití datasetu _Harmonized Landsat and Sentinel-2_ (HLS) @claverie2018harmonized. Lze ale předpokládat, že i v těchto případech bude klíčové postup dobře optimalizovat pro specifické vysokohorské aridní oblasti. 

Pro hledání sezónního maxima NDVI byl jako další zdroj ve studii @bayle2024landsat integrován produkt MODIS MOD09QA/Terra s denní akvizicí a 250metrovým rozlišením. Byly použity osmidenní kompozity pro rozšíření dostupných snímků z platforem Landsat 7 a Landsat 8. I přes to, že vzhledem k časovému rozlišení mohla být mezera v období vegetačního maxima vyplněna, je nezbytné zmínit fakt, že tak výrazně odlišné prostorové rozlišení u senzoru MODIS může výslednou hodnotu NDVI zkreslit. Tento jev popsali kupříkladu @rs4010160 a @jiang2006analysis ve svých studiích.

== Perspektivy budoucího výzkumu

Dostupnost klíčového snímku během vegetačního maxima je pravděpodobně hlavním omezujícím faktorem pro metriku sezónního maxima NDVI. Jako alternativu lze použít sezónní medián NDVI, který je odolnější vůči extrémním hodnotám, ale podle studie @bayle2024landsat může být také ovlivněn dostupností snímků v průběhu vegetační sezóny. To platí zejména v letech s vysokou oblačností, kdy nedostatek dat může významně ovlivnit jeho spolehlivost. Pro odstranění nepřesností by mohly být využity další metody analýzy vývoje vegetace v dlouhodobém měřítku, které pracují s dostupnými měřeními NDVI komplexněji.

Například ve studiích @Khalefa02092024 a @bashir2020spatio byla k analýze dlouhodobých trendů NDVI využita lineární regrese. Současně byla zkoumána korelace s klíčovými klimatickými faktory, jako jsou srážky a teplota. @forkel2013trend použili čtyři metody detekce trendů v NDVI: _Annual Aggregation_ (AAT), _Season-Trend Model_ (STM), _Mean Annual Cycle_ (MAC) a _Singular Spectrum Analysis_ (SSA). @yang2019factors analyzovali trendy v časových řadách NDVI pomocí různých statistických metod, jako jsou Mann–Kendallův test či Theil–Senova analýza.

Na závěr bych chtěl opět zdůraznit důležitost správně provedené harmonizace. Pokud budou měření z jednoho ze senzorů vykazovat systematicky rozdílné hodnoty NDVI, budou finální odhady sezónního maxima NDVI zatíženy nejistotou. Dle výsledků této práce jsou měření NDVI z Landsatu 8 oproti Landsatu 7 nadhodnocena, i přes aplikaci koeficientů (viz obrázek 15). Pro dosažení přesných výsledků, které nebudou ovlivněny nevhodnou harmonizací, doporučuji pro aridní vysokohorské zóny, které byly studovány v této práci, použít jinou sadu koeficientů získanou z charakteristicky podobných oblastí, nebo zvážit postup založený na použití polynomické regrese @berner2023landsatts @choler2024waning, který poskytuje vyšší míru přizpůsobení.

= Závěr a přínos práce
Tato práce se zaměřila na zhodnocení vlivu harmonizace naměřených hodnot NDVI ze senzorů Landsat 7 (ETM+) a Landsat 8 (OLI) při sledování vegetace ve vysokohorské aridní oblasti Ladakh a na analýzu vlivu překryvu těchto satelitních platforem z pohledu větší kvantity dat pro sledování sezónních maxim NDVI. Byla provedena hromadná příprava a analýza snímků na úrovni _Surface Reflectance_ v cloudovém prostředí Google Earth Engine. Datové sady zahrnovaly časově blízké snímky pořízené v intervalu dvou přeletů (8 dní) z obou družicových platforem a souhrnné charakteristiky reprezentované maximální hodnotou indexu NDVI za vegetační sezónu. 

Senzory ETM+ a OLI se ve výpočtu NDVI liší primárně kvůli užší šířce spektrálního pásma NIR u senzoru OLI. Tato odlišnost vede k nadhodnocení NDVI u Landsatu 8, a to zejména v oblastech s nízkými naměřenými hodnotami NDVI. Proces harmonizace dat je pro minimalizaci těchto rozdílů  zásadní. Harmonizační koeficienty ze studie @roy2016characterization nemusí být pro aridní vysokohorské oblasti dostatečně přesné, protože byly původně kalibrovány na snímcích z jiných regionů. Efekt harmonizace byl sice výraznější zejména v průběhu vegetačního maxima, avšak ani v tomto období nebylo dosaženo konzistence mezi sensory. Při hromadném porovnání všech dvojic a jejich hodnocení pomocí ME a RMSE dosahovala harmonizace na úrovni již vypočítaného NDVI hodnoty mediánu 0.036 (ME) a 0.090 (RMSE). Účinnost harmonizace je závislá na vhodném výběru koeficientů, které by měly být optimálně přizpůsobeny konkrétnímu prostředí.

Větší množství dostupných snímků během překryvu platforem zvyšuje pravděpodobnost zachycení skutečných sezónních maximálních hodnot NDVI, což potvrzuje i studie @bayle2024landsat. Nicméně zásadní je, aby snímky pokrývaly období vegetačního maxima a byly vhodně harmonizovány. Výsledky této práce ukazují, že absence klíčového snímku z druhé poloviny července, jak uvádí analýzy z let 2017, 2018 a 2020, může zkreslit odhad maximální hodnoty NDVI, i když je k dispozici větší množství dat. Medián NDVI, jako sezónní metrika, na rozdíl od sezónního maxima NDVI zmírňuje citlivost na extrémní hodnoty, avšak stále podléhá omezením spojených s harmonizací a časovým pokrytím.
Použití dalších zdrojů, jako jsou snímky z platforem Sentinel-2 nebo MODIS, by mohlo rozšířit časové pokrytí, ale rozdíly ve spektrálním a prostorovém rozlišení mohou způsobit další nejistoty.

Tato práce přispěla k rozšíření povědomí o problematice sledování vegetace v horských aridních oblastech s využitím dat dálkového průzkumu Země. Harmonizované časové řady NDVI z platforem Landsat 7 a Landsat 8 mohou být užitečné pro analýzu dlouhodobých vegetačních trendů v těchto oblastech při splnění nekolika omezujících faktorů. Pro přesnější sezónní analýzy je vhodné řešit problematiku z pohledu fenologického cyklu komplexně, optimalizovat harmonizační metody a integrovat doplňkové datové zdroje. Přístup však vyžaduje přizpůsobení metodologie specifickým podmínkám daných oblastí. Na základě těchto změn ale mohou být eliminovány i nedostatky zmíněných sezónních metrik.

= Přehled literatury a použitých zdrojů
   #set par(first-line-indent: 0em, leading: 0.6em)
   #set block(spacing: 1em)
   #show bibliography: set text(size: 10pt)
   #bibliography("zdroje.bib", title: none, style: "citace_czu.csl")

//////////////////////////////////////////////////////
#set page(
margin: (
top: 1cm,
bottom: 2.5cm,
left: 3cm,
right: 1cm 
),
)

= Přílohy
   #set par(first-line-indent: 0em, leading: 1em)
   #set block(spacing: 1.5em)

*Příloha 1*\
_Boxploty vizualizují hodnoty NDVI stratifikovaných bodů jednotlivých snímků v sezóně. V případě trojice boxplotů u Landsatu 8 se jedná o stejný snímek, ale s různým přístupem k harmonizaci (Roy et al. 2016). Barevné body spojené čarami představují aritmetický průměr. Jednotlivá měření jsou seřazena na časové ose podle data snímání (osa x)._

#figure(
   image("images/sezona_1.png", width: 105%)
)

#figure(
   image("images/sezona_2.png", width: 105%)
)

#show figure: set text(size: 6.5pt)
#set page(columns: 2)

#place(
top + left,
float: true,
scope: "parent",
)[
*Příloha 2*\
_Tabulky obsahují hodnoty statistických parametrů zobrazených v boxplotech v příloze 1._
]

#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(stroke: 0.7pt),
[*Datum*], [*Senzor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(stroke: 0.7pt),
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
   table.hline(stroke: 0.7pt),
),
)

#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(stroke: 0.7pt),
[*Datum*], [*Senzor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(stroke: 0.7pt),
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

   table.hline(stroke: 0.7pt),
),
)
\
\ //odsazení prvního grafu
\
\
\
\
\
\
#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(stroke: 0.7pt),
[*Datum*], [*Senzor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(stroke: 0.7pt),
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
   table.hline(stroke: 0.7pt),
),
)

#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(stroke: 0.7pt),
[*Datum*], [*Senzor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(stroke: 0.7pt),
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

   table.hline(stroke: 0.7pt),
),
)

#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(stroke: 0.7pt),
[*Datum*], [*Senzor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(stroke: 0.7pt),
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
   table.hline(stroke: 0.7pt),
),
)

#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(stroke: 0.7pt),
[*Datum*], [*Senzor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(stroke: 0.7pt),
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

   table.hline(stroke: 0.7pt),
),
)

#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(stroke: 0.7pt),
[*Datum*], [*Senzor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(stroke: 0.7pt),
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
   table.hline(stroke: 0.7pt),
),
)

#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(stroke: 0.7pt),
[*Datum*], [*Senzor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(stroke: 0.7pt),
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
   table.hline(stroke: 0.7pt),
),
)

#figure(
   table(
   columns: (7),
   inset: 3pt,
   align: center + horizon,
   stroke: none,
   table.hline(stroke: 0.7pt),
[*Datum*], [*Senzor*],[*Harmonizace*], [*Průměr*], [*Medián*], [*Q1*], [*Q3*],
table.hline(stroke: 0.7pt),
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
   table.hline(stroke: 0.7pt),
),
)

#set page(columns: 1)

*Příloha 3*\
_Grafy hustoty znázorňují rozložení stratifikovaných bodů maximálních hodnot NDVI. Kategorie "Kombinace" představuje vyšší z maximálních hodnot NDVI mezi snímky z Landsatu 7 a Landsatu 8 v prostorově shodných pixelech. Svislé přímky vizualizují pozici aritmetického průměru._

#figure(
   image("images/densita_1.png", width: 105%)
)

#figure(
   image("images/densita_2.png", width: 105%)
)

#pagebreak()

*Příloha 4*\
_Bodové grafy ilustrují rozdíly v maximálních hodnotách NDVI mezi Landsatem 7 a Landsatem 8. Červená čára představuje linii absolutní shody. Modrá čára zobrazuje výsledek lineární regrese._

#figure(
   image("images/maxscatter_1.png", width: 108%)
)

#figure(
   image("images/maxscatter_2.png", width: 105%)
)
\
\
\
*Příloha 5*\
_Odkaz na Google Earth Engine repozitář:_\
https://code.earthengine.google.com/?accept_repo=users/jezekvit/priloha_5