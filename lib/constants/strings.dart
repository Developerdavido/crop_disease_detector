class AppStrings {
  static const String apiPrompt = '''
      Determine of the crop is diseased based on the image.
      The image must contain a crop, plant, seed, leaf, fruit, root or stem
Determine the type of disease and its causative organism.
Suggest eradicative measures needed to kill disease
if disease is found or not, return the answer in JSON using the following structure:
'{'disease_name' : \$diseaseName,
 'is_diseased': \$isDiseased,
 'causative_organism':\$causativeOrganism,
 'eradicative_measures':\$eradicativeMeasures,
 'extra_comments':\$extraComments,
 'id':\$uniqueId}'

uniqueId should be unique 15 sequence of characters and numbers and of type string
diseaseName, causativeOrganism and extraComments should be of the String type.
eradicativeMeasures must be of the type List<String>,
isDiseased should be of the type boolean
      ''';
}
