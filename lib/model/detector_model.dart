

class DetectorModel {
  String? diseaseName;
  bool? isDiseased;
  String? causativeOrganism;
  List<String>? eradicativeMeasures;
  String? extraComments;
  String? id;

  DetectorModel({
    this.diseaseName,
    this.isDiseased = false,
    this.causativeOrganism,
    this.eradicativeMeasures,
    this.extraComments,
    this.id,
  });

  factory DetectorModel.fromJson(Map<String, dynamic> json) => DetectorModel(
    diseaseName: json["disease_name"],
    isDiseased: json["is_diseased"],
    causativeOrganism: json["causative_organism"],
    eradicativeMeasures: json["eradicative_measures"] == null ? [] : List<String>.from(json["eradicative_measures"]!.map((x) => x)),
    extraComments: json["extra_comments"],
    id: json["id"],
  );

}