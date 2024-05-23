

class DetectorModel {
  String? diseaseName;
  bool? isDiseased;
  String? causativeOrganism;
  List<String>? eradicativeMeasures;
  List<String>? chemicalControl;
  List<String>? chemicalProducts;
  List<String>? biologicalControl;
  String? extraComments;
  String? id;

  DetectorModel({
    this.diseaseName,
    this.isDiseased = false,
    this.causativeOrganism,
    this.eradicativeMeasures,
    this.chemicalControl,
    this.chemicalProducts,
    this.biologicalControl,
    this.extraComments,
    this.id,
  });

  factory DetectorModel.fromJson(Map<String, dynamic> json) => DetectorModel(
    diseaseName: json["disease_name"],
    isDiseased: json["is_diseased"],
    causativeOrganism: json["causative_organism"],
    chemicalProducts: json["chemical_products"] == null ? [] : List<String>.from(json["chemical_products"]!.map((x) => x)),
    chemicalControl: json["chemical_control"] == null ? [] : List<String>.from(json["chemical_control"]!.map((x) => x)),
    biologicalControl: json["biological_control"] == null ? [] : List<String>.from(json["biological_control"]!.map((x) => x)),
    eradicativeMeasures: json["eradicative_measures"] == null ? [] : List<String>.from(json["eradicative_measures"]!.map((x) => x)),
    extraComments: json["extra_comments"],
    id: json["id"],
  );

}