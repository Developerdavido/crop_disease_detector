class AppStrings {
  static const String apiPrompt = '''
      Determine if the crop is diseased based on the image.
      The image must contain a crop, plant, seed, leaf, fruit, root or stem
Determine the type of disease and its causative organism.
Suggest eradicative measures needed to kill disease
Based on the disease if found, determine the chemical control measures to be taken. give examples of chemical products where necessary
List the chemical products that can be used for control. this must only contain products not suggestions
Based on the disease if found determine the biological control measures to be taken. give examples where necessary
if disease is found or not, the answer must be returned in JSON format using the following structure:
'{
'disease_name' : \$diseaseName,
 'is_diseased': \$isDiseased,
 'causative_organism':\$causativeOrganism,
 'eradicative_measures':\$eradicativeMeasures,
 'chemical_control':\$chemicalControl,
'chemical_products':\$chemicalProducts,
'biological_control':\$biologicalControl,
 'extra_comments':\$extraComments,
 'id':\$uniqueId
 }'
uniqueId must be unique uuid of the type string.
diseaseName and causativeOrganism must be of the String type must be empty when no disease is found.
eradicativeMeasures must be of the type List<String> must be empty when no disease is found.
extraComments must be of the type String and if no disease is found must tell the reason why the image does not contain a diseased crop.
chemicalControl must be of type List<String> must be an empty list when no disease is found
chemicalProducts must be of type List<String> must be an empty list when no disease is found
biologicalControl must be of type List<String> must be an empty list when no disease is found
isDiseased must be of the type boolean must be false when no disease is found
      ''';
}
