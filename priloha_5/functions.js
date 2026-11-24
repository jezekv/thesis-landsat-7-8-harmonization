var params = {
  "radix": 2, // filtr pro binary (base 2) data
  "thresholdValue": 0.1 // práh NDVI
};

// Seznam funkcí

////////////////////////////
// Maska oblačnosti Landsat

// Funkce pro extrakci QA_PIXEL bitů
var extractQABits = function(qaBand, bitStart, bitEnd) {
  var numBits = bitEnd - bitStart + 1;
  var qaBits = qaBand.rightShift(bitStart).mod(Math.pow(params.radix, numBits));
  return qaBits;
};

// Funkce pro vytvoření masky pro QA_PIXEL bitovou kombinaci
exports.createMask = function(image) {
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

///////////////////////////
// Aplikace scaling faktoru.
exports.applyScaleFactors = function(image) {
  var opticalBands = image.select('SR_B.').multiply(0.0000275).add(-0.2);
  opticalBands = opticalBands.clamp(0, 1);
  return image.addBands(opticalBands, null, true);
};

///////////////////////////
// Funkce NDVI + threshold; bez harmonizace
exports.computeNdvi = function(image) {
  var ndvi = image.expression(
    '((NIR - RED) / (NIR +  RED))',
    {
      'NIR': image.select('NIR'),
      'RED': image.select('RED'),  
    }
  ).rename('NDVI');
  var thresholdMask = ndvi.gt(params.thresholdValue);
  var updatedMask = ndvi.updateMask(thresholdMask);
  var addNDVI = image.addBands(updatedMask);
  var maskedBands = updatedMask.mask();
  return addNDVI.updateMask(maskedBands);
};

///////////////////////////
// Funkce NDVI + threshold; L8 -> L7  - kalibrace (Roy et al. 2016)  OLS pásma 
// Red: ETM + = 0.0123 + 0.9372 OLI 
// Nir: ETM + = 0.0448 + 0.8339 OLI

exports.computeNdviBandsL8 = function(image) {
  var ndvi = image.expression(
    '((NIR - RED) / (NIR +  RED))',
    {
      'NIR': image.select('NIR').multiply(0.8339).add(0.0448),
      'RED': image.select('RED').multiply(0.9372).add(0.0123),  
    }
  ).rename('NDVIHarm');
  
  var thresholdMask = ndvi.gt(params.thresholdValue);
  var updatedMask = ndvi.updateMask(thresholdMask);
  var addNDVI = image.addBands(updatedMask);
  var maskedBands = updatedMask.mask();
  return addNDVI.updateMask(maskedBands);
};

///////////////////////////
// Funkce NDVI + threshold; L8 -> L7 - kalibrace (Roy et al. 2016) OLS ndvi
// NDVI: ETM + = 0.0029 + 0.9589 OLI

exports.computeNdviNdviL8 = function(image) {
  var ndvi = image.expression(
    '((NIR - RED) / (NIR +  RED))',
    {
      'NIR': image.select('NIR'),
      'RED': image.select('RED'),  
    }
  ).rename('NDVINdvi').multiply(0.9589).add(0.0029);
  
  var thresholdMask = ndvi.gt(params.thresholdValue);
  var updatedMask = ndvi.updateMask(thresholdMask);
  var addNDVI = image.addBands(updatedMask);
  var maskedBands = updatedMask.mask();
  return addNDVI.updateMask(maskedBands);
};

///////////////////////////
// Funkce pro vytvoření masky u dvojic snímků
exports.createMaskPair = function(imageCollection, l7, l8) {
  var image = imageCollection.toBands();
  var mask = l7.add(l8).rename('mask'); 
  return image.addBands(mask);
};

///////////////////////////
// Funkce pro tvorbu náhodných bodů
exports.createStratifiedSamples = function(image, numPoints, mask) {
  var samples = image.stratifiedSample({
    numPoints: numPoints,
    classBand: mask,
    scale: 30,
    geometries: true
  });

  return samples;
};

///////////////////////////
// Export csv
exports.exportCSV = function (samples, name, startExport) {
   Export.table.toDrive({
      collection: samples,
      description: name + startExport,
      folder: 'Export',
      fileFormat: 'CSV'
   });
};
