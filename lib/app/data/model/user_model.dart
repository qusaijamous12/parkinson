class UserModel {
  final String uid;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? birthDate;
  final String? email;
  final String? mobileNumber;
  final String? imageUrl;
  final String? userType;
  final String? doctorType;
  final String? major;
  final num? rate;

  UserModel({
    required this.uid,
    this.email,
    this.name,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.mobileNumber,
    this.imageUrl,
    this.userType,
    this.doctorType,
    this.major,
    this.rate,
  });

  factory UserModel.fromJson(final Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['user_name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      birthDate: json['birth_date'],
      email: json['email'],
      mobileNumber: json['mobile_number'],
      userType: json['user_type'],
      doctorType: json['doctor_type'],
      imageUrl: json['profile_image'],
      major: json['major'],
      rate: json['rate'],
    );
  }
}
