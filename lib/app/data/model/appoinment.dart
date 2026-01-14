import 'package:cloud_firestore/cloud_firestore.dart';

import '../../shared/utils/utils.dart';

class AppointmentModel {
  final String? contactNumber;
  final DateTime? date;       // Changed from String? to DateTime?
  final String? patinetName;
  final String? patinetUid;
  final String? status;
  final String? time;

  AppointmentModel({
    this.contactNumber,
    this.date,
    this.patinetName,
    this.patinetUid,
    this.status,
    this.time,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    DateTime? appointmentDate;
    if (json['date'] != null) {
      Utils.printLog('YES!');
      if (json['date'] is Timestamp) {
        Utils.printLog('YES!1');
        appointmentDate = (json['date'] as Timestamp).toDate();
      } else if (json['date'] is String) {
        Utils.printLog('No');
        appointmentDate = DateTime.tryParse(json['date']);
      }
    }

    return AppointmentModel(
      contactNumber: json['contact_number'],
      date: appointmentDate,
      patinetName: json['patient_name'],
      patinetUid: json['patient_uid'],
      status: json['status'],
      time: json['time'],
    );
  }

  // Optional: convert back to JSON
  Map<String, dynamic> toJson() {
    return {
      'contact_number': contactNumber,
      'date': date != null ? Timestamp.fromDate(date!) : null,
      'patient_name': patinetName,
      'patient_uid': patinetUid,
      'status': status,
      'time': time,
    };
  }
}
