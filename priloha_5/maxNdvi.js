//////////////////////////////////////////////////////////////////////////////////
////////////////////  Maximální hodnoty NDVI z celé sezóny  /////////////////////
////////////////////////////////////////////////////////////////////////////////

// Modul funkcí
var functions = require('users/jezekvit/priloha_5:functions');

////////////////////////////////////////////////////////////////////////////////

var startDate = ee.Date('2013-05-01'); // URČENÍ ČASOVÉHO ROZMEZÍ
var endDate = ee.Date('2013-09-30');

////////////////////////////////////////////////////////////////////////////////

// Prázdný image pro slučování sezón 
finalCombination = ee.Image();
finalL7 = ee.Image();
finalL8 = ee.Image();

// For cyklus
for (var i = 0; i < 9; i++) {
  var start = startDate.advance(i * 1, 'year');
  var end = endDate.advance(i * 1, 'year') ;
  var startExport = start.format('YYYY').getInfo();
  
  // Načtení dat Landsat 7 
  var landsat7 = ee.ImageCollection('LANDSAT/LE07/C02/T1_L2')
      .filter(ee.Filter.and(
          ee.Filter.eq('WRS_PATH', 147),
          ee.Filter.eq('WRS_ROW', 37)
          ))
      .filterDate(start, end);
     
  // Načtení dat Landsat 8 
  var landsat8 = ee.ImageCollection('LANDSAT/LC08/C02/T1_L2')
       .filter(ee.Filter.and(
          ee.Filter.eq('WRS_PATH', 147),
          ee.Filter.eq('WRS_ROW', 37)
          ))
      .filterDate(start, end);
  
  // Aplikace masky oblačnosti
  var l7CloudMaskedCollection = landsat7.map(functions.createMask);
  var l8CloudMaskedCollection = landsat8.map(functions.createMask);
      
  // Aplikace scale factor a offset    
  var l7CloudMaskedCollection = l7CloudMaskedCollection.map(functions.applyScaleFactors);
  var l8CloudMaskedCollection = l8CloudMaskedCollection.map(functions.applyScaleFactors);    
      
  // Výběr pásem pro výpočet NDVI
  var l7CloudMaskedCollection = l7CloudMaskedCollection.select(['SR_B3','SR_B4'], ['RED','NIR']);
  var l8CloudMaskedCollection = l8CloudMaskedCollection.select(['SR_B4','SR_B5'], ['RED','NIR']);    
      
  // Výpočet NDVI pomocí funkce
  var l7CloudMaskedCollectionNdvi = l7CloudMaskedCollection.map(functions.computeNdvi);
  var l8CloudMaskedCollectionNdvi = l8CloudMaskedCollection.map(functions.computeNdviNdviL8); // harmonizace NDVI
  
  var seasonl7 = l7CloudMaskedCollectionNdvi.select(['NDVI']);
  var seasonl8 = l8CloudMaskedCollectionNdvi.select(['NDVINdvi']);
  
  // Sloučení Image Collections
  var combination =  seasonl7.merge(seasonl8);
  
  ////////////////////////////////////////////////////////////////////////////////
  // Redukce
  
  // Image z kolekce
  var imageCombination = combination.toBands();
  var imageL7 = seasonl7.toBands();
  var imageL8 = seasonl8.toBands();
 
  // redukce pro získání maximálních hodnot pro každý pixel
  var maxCombination = imageCombination.reduce(ee.Reducer.max()).rename(startExport + '_comb');
  var maxL7 = imageL7.reduce(ee.Reducer.max()).rename(startExport + '_L7');
  var maxL8 = imageL8.reduce(ee.Reducer.max()).rename(startExport + '_L8');
  
  var finalCombination = finalCombination.addBands(maxCombination).select('20.*');
  var finalL7 = finalL7.addBands(maxL7).select('20.*');
  var finalL8 = finalL8.addBands(maxL8).select('20.*');
} // Konec for cyklu

// Hranice snímku (nutné pro možnost tvorby stratified samples) 
var geom = ee.Image(landsat8.first()).geometry();

////////////////////////////////////////////////////////////////////////////////

// Výběr prvního pásma jako vstupu do for cyklu 
var firstBand = finalCombination.select(0);

// Maska
for (var i = 1; i <= 8 ; i++) {
  var currentBand = finalCombination.select(i);
  firstBand = firstBand.add(currentBand);
}

var maskImage = firstBand.select(0).rename('mask');
var maskImage = maskImage.select(0).multiply(0).int();

// Spojení všech sezón
var allSeasons = finalCombination.addBands(finalL7).addBands(finalL8).addBands(maskImage);

// Ořez snímků na základě geom
var allSeasons = allSeasons.clip(geom);

// Tvorba náhodných bodů
var samples = functions.createStratifiedSamples(allSeasons, 5000, 'mask');

print('Samples:', samples); // 5000 bodů

// Export csv
functions.exportCSV(samples, 'maxNDVI_', 'Landsat');
