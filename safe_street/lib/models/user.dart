import 'package:firebase_auth/firebase_auth.dart';

class SafeStreetUser {
  String uId;
  String fullName;
  String emailId;
  String gender;
  String age;
  String aadharNo;
  String country;
  String city;

  SafeStreetUser(
    this.uId,
    this.fullName,
    this.emailId,
    this.gender,
    this.age,
    this.aadharNo,
    this.country,
    this.city,
  );

  factory SafeStreetUser.fromJson(Map<String, dynamic> json) => SafeStreetUser(
        json['uid'] ?? "",
        json['fullname'] ?? "",
        json['emailid'] ?? "",
        json['gender'] ?? "",
        json['age'] ?? "",
        json['adhaarnumber'] ?? "",
        json['country'] ?? "",
        json['city'] ?? "",
      );

  Map<String, dynamic> toJson() => _SafeStreetUserToJson(this);

  Map<String, dynamic> _SafeStreetUserToJson(SafeStreetUser instance) =>
      <String, dynamic>{
        'uid': FirebaseAuth.instance.currentUser!.uid,
        'name': instance.fullName,
        'emailid': instance.emailId,
        'gender': instance.gender,
        'age': instance.age,
        'adhaarnumber': instance.aadharNo,
        'country': instance.country,
        'city': instance.city,
      };
}
