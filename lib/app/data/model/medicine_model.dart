class MedicineModel {
  final String id;
  final String dosage;
  final String medicineName;
  final String time;
  final int? notificationId;

  MedicineModel({
    required this.id,
    required this.dosage,
    required this.time,
    required this.medicineName,
    this.notificationId,
  });

  factory MedicineModel.fromJson(
    final Map<String, dynamic> json, {
    required String id,
  }) {
    return MedicineModel(
      id: id,
      dosage: json['dosage'] ?? '',
      time: json['time'] ?? '',
      medicineName: json['medicine_name'] ?? '',
      notificationId: json['notification_id'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'medicine_name': medicineName,
      'dosage': dosage,
      'time': time,
      'notification_id': notificationId,
    };
  }
}
