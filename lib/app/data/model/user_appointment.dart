class UserAppointmentModel{

  final String ?appointmentStatus;
  final String ?date;
  final String ?doctorImage;
  final String ?doctorName;
  final String ?time;
  final String ?doctorUid;

  UserAppointmentModel({
    this.appointmentStatus,
    this.date,
    this.doctorImage,
    this.doctorName,
    this.time,
    this.doctorUid
});


  factory UserAppointmentModel.fromJson(final Map<String,dynamic> json){
    return UserAppointmentModel(
      appointmentStatus: json['appointment_status'],
      date: json['date'],
      doctorImage: json['doctor_image'],
      doctorName: json['doctor_name'],
      doctorUid: json['doctor_uid'],
      time: json['time']
    );
  }

}