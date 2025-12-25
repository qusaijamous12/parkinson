class MedicineModel {
  final String dosage;
  final String medicineName;
  final String time;

  MedicineModel({
    required this.dosage,
    required this.time,
    required this.medicineName
  });

  factory MedicineModel.fromJson(final Map<String, dynamic> json){
    return MedicineModel(dosage: json['dosage'], time: json['time'], medicineName: json['medicine_name']);
  }

}