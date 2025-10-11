class UserModel{
  final String uid;
  final String? name;
  final String? email;
  final String? mobileNumber;

  UserModel({
    required this.uid,
    this.email,
    this.name,
    this.mobileNumber
});

  factory UserModel.fromJson(final Map<String,dynamic> json){
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      mobileNumber: json['mobile_number']
    );
  }



}