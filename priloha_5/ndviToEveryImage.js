//////////////////////////////////////////////////////////////////////////////////
////////////////  NDVI pro každý snímek v rámci jedné sezóny ////////////////////
////////////////////////////////////////////////////////////////////////////////

// Modul funkcí
var functions = require('users/jezekvit/priloha_5:functions');

////////////////////////////////////////////////////////////////////////////////
// Prázdný image pro slučování sezón 
finalL7 = ee.Image();
finalL8 = ee.Image();
finalL8Harm = ee.Image();
finalL8Ndvi = ee.Image();

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
          ee.Filter.eq('WRS_ROW', 37),
          ee.Filter.lte('CLOUD_COVER', 55) // KRITERIUM pro filtraci snímků
          ))
      .filterDate(start, end);
     
  // Načtení dat Landsat 8 
  var landsat8 = ee.ImageCollection('LANDSAT/LC08/C02/T1_L2')
       .filter(ee.Filter.and(
          ee.Filter.eq('WRS_PATH', 147),
          ee.Filter.eq('WRS_ROW', 37),
          ee.Filter.lte('CLOUD_COVER', 55) // KRITERIUM pro filtraci snímků
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
  var l8CloudMaskedCollectionNdviHarm = l8CloudMaskedCollection.map(functions.computeNdviBandsL8); // harmonizace pásem NIR a RED
  var l8CloudMaskedCollectionNdviNdvi = l8CloudMaskedCollection.map(functions.computeNdviNdviL8); // harmonizace NDVI
  
  var l7 = l7CloudMaskedCollectionNdvi.select(['NDVI']);
  var l8 = l8CloudMaskedCollectionNdvi.select(['NDVI']);
  var l8Harm = l8CloudMaskedCollectionNdviHarm.select(['NDVIHarm']);
  var l8Ndvi = l8CloudMaskedCollectionNdviNdvi.select(['NDVINdvi']);

  ///////////////////////////////////////////////////////////////////////////////
  // Slučování snímků
  var imageL7 =l7.toBands();
  var imageL8 = l8.toBands();
  var imageL8Harm = l8Harm.toBands();
  var imageL8Ndvi = l8Ndvi.toBands();

  var finalL7 = finalL7.addBands(imageL7);
  var finalL8 = finalL8.addBands(imageL8);
  var finalL8Harm = finalL8Harm.addBands(imageL8Harm);
  var finalL8Ndvi = finalL8Ndvi.addBands(imageL8Ndvi);

} // Konec for cyklu

// Odstranění pásma "constant", pokud existuje
var finalL7Filtered = finalL7.select(finalL7.bandNames().filter(ee.Filter.neq('item', 'constant')));
var finalL8Filtered = finalL8.select(finalL8.bandNames().filter(ee.Filter.neq('item', 'constant')));
var finalL8FilteredHarm = finalL8Harm.select(finalL8Harm.bandNames().filter(ee.Filter.neq('item', 'constant')));
var finalL8FilteredNdvi = finalL8Ndvi.select(finalL8Ndvi.bandNames().filter(ee.Filter.neq('item', 'constant')));

// Hranice snímku
var geom = ee.Image(closestImage).geometry();

/////////////////////////////////////////////////////////////////////////////////

var finalImage = finalL7Filtered.addBands(finalL8Filtered).addBands(finalL8FilteredHarm).addBands(finalL8FilteredNdvi);

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

// Spojení snímku s maskou
var finalYear = finalImage.addBands(maskImage);

// Ořez snímků na základě geom
var finalYear = finalYear.clip(geom);

// Tvorba náhodných bodů
var samples = functions.createStratifiedSamples(finalYear, 5000, 'mask');

print('Samples:', samples); // cílem je zisk 5000 bodů

// Export csv
functions.exportCSV(samples, 'ndviToEveryImage', startExport);
