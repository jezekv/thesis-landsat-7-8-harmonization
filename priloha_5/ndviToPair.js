//////////////////////////////////////////////////////////////////////////////////
///////////////////////// NDVI pro dvojici snímků ///////////////////////////////
////////////////////////////////////////////////////////////////////////////////

// Modul funkcí
var functions = require('users/jezekvit/priloha_5:functions');

////////////////////////////////////////////////////////////////////////////////

// Výběr prvního snímku Landsat 8
var firstDate = ee.Date('2013-05-01'); // ZAČÁTEK OKNA
var lastDate = firstDate.advance(1, 'month'); // pouze pro potřeby výběru

var landsat8 = ee.ImageCollection('LANDSAT/LC08/C02/T1_L2')
       .filter(ee.Filter.and(
          ee.Filter.eq('WRS_PATH', 147),
          ee.Filter.eq('WRS_ROW', 37)
          ))
      .filterDate(firstDate, lastDate);

// Definice časového okna dle prvního snímku
var closestImage = landsat8.sort('system:time_start').first();

var startDate = ee.Date(closestImage.get('DATE_ACQUIRED'));
var endDate = startDate.advance(16, 'day');

////////////////////////////////////////////////////////////////////////////////

// For cyklus
for (var i = 0; i < 9; i++) {
  var start = startDate.advance(i * 16, 'day');
  var end = endDate.advance(i * 16, 'day') ;
  var startExport = start.format('YYYY-MM-dd').getInfo();

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
      
  ///////////////////////////////////////////////////////////////////////////////
  // Aplikace scaling faktoru
  var landsat7 = landsat7.map(functions.applyScaleFactors);
  var landsat8 = landsat8.map(functions.applyScaleFactors);

  // Aplikace masky oblačnosti
  var l7CloudMaskedCollection = landsat7.map(functions.createMask);
  var l8CloudMaskedCollection = landsat8.map(functions.createMask);
  
  // Výběr pásem do exportu
  var l7CloudMaskedCollection = l7CloudMaskedCollection.select(['SR_B3','SR_B4'], ['RED','NIR']);
  var l8CloudMaskedCollection = l8CloudMaskedCollection.select(['SR_B4','SR_B5'], ['RED','NIR']);
  
   // Výpočet NDVI
  var l7CloudMaskedCollectionNdvi = l7CloudMaskedCollection.map(functions.computeNdvi);
  var l8CloudMaskedCollectionNdvi = l8CloudMaskedCollection.map(functions.computeNdvi); // bez harmonizace
  var l8CloudMaskedCollectionNdviBands = l8CloudMaskedCollection.map(functions.computeNdviBandsL8); // harmonizace pásem NIR a RED
  var l8CloudMaskedCollectionNdviNdvi = l8CloudMaskedCollection.map(functions.computeNdviNdviL8); // harmonizace NDVI
  
  var l7Ndvi = l7CloudMaskedCollectionNdvi.select(['NDVI']);
  var l8Ndvi = l8CloudMaskedCollectionNdvi.select(['NDVI']);
  var l8NdviBands = l8CloudMaskedCollectionNdviBands.select(['NDVIHarm']);
  var l8NdviNdvi = l8CloudMaskedCollectionNdviNdvi.select(['NDVINdvi']);

////////////////////////////////////////////////////////////////////////////////
// Sloučení kolekcí
  var mergedCollection =  l7Ndvi.merge(l8Ndvi).merge(l8NdviBands).merge(l8NdviNdvi);
  var sortedCollection = mergedCollection.sort('system:time_start');

// Pásma pro tvorbu masky
  var ImgL7 = l7Ndvi.toBands();
  var ImgL8 = l8Ndvi.toBands();
  var l7 = ImgL7.select(0).multiply(0).int();
  var l8 = ImgL8.select(0).multiply(0).int();
  
  // Vytvoření masky
  var maskedImage = functions.createMaskPair(sortedCollection, l7, l8);
 
  // Tvorba náhodných bodů
  var samples = functions.createStratifiedSamples(maskedImage, 5000, 'mask');

  // Export csv
 functions.exportCSV(samples, 'pair_', startExport);

} // Konec for cyklu
