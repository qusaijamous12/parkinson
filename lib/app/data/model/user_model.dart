class UserModel{
  final String uid;
  final String? name;
  final String? email;
  final String? mobileNumber;
  final String? imageUrl;
  final String? userType;

  UserModel({
    required this.uid,
    this.email,
    this.name,
    this.mobileNumber,
    this.imageUrl,
    this.userType
});

  factory UserModel.fromJson(final Map<String,dynamic> json){
    return UserModel(
      uid: json['uid'],
      name: json['user_name'],
      email: json['email'],
      mobileNumber: json['mobile_number'],
      userType: json['user_type'],
      imageUrl: json['profile_image']
    );
  }



}