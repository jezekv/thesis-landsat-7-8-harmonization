/*
==========================================================================================
README: Harmonizace dat družicových platforem Landsat 7 (ETM+) a Landsat 8 (OLI) při sledování horské vegetace

  Vedoucí práce: Ing. Jiří Prošek, Ph.D.
  Diplomant: Bc. Vít Ježek

Popis projektu:  
  Tento projekt je součástí diplomové práce.
  Skripty se zaměřují na hromadné zpracování snímků z platforem Landsat 7 a Landsat 8 popsané v metodice diplomové práce.
==========================================================================================
Seznam skriptů:
  1. functions:        kompletní seznam použitých funkcí
  2. maxNdvi:          viz kapitola: Porovnání maximálních hodnot NDVI z celé sezóny
  3. ndviToEveryImage: viz kapitola: Porovnání snímků v rámci jedné sezóny
  4. ndviToPair:       viz kapitola: Hromadné porovnání dvojic snímků
==========================================================================================
Omezení a poznámky:
  - projekt je připraven pro spuštění v GEE JavaScript API prostředí 
  - skripty jsou v případě správně nastavených vstupních parametrů (viz Jak používat) plně automatické
  - výstupem analýzy jsou hodnoty NDVI, které jsou uloženy ve formátu .csv tabulek
==========================================================================================
Jak používat:
  1. maxNdvi:          
    - nastavte časové rozmezí analýzy (`startDate`, `endDate`)
    - spusťte skript
    
  2. ndviToEveryImage: 
    - nastavte začátek časového okna (`firstDate`)
    - nastavte filtr oblačnosti pro výběr snímků podle kritéria (např. `CLOUD_COVER', 55) pro obě platformy
    - spusťte skript
    
  3. ndviToPair:
    - nastavte začátek časového okna (`firstDate`)
    - spusťte skript
==========================================================================================
*/
