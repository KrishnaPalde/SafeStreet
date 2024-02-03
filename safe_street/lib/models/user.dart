class User {
  String uId;
  String fullName;
  String emailId;
  String gender;
  int age;
  String aadharNo;
  String country;
  String city;

  User({
    required this.uId,
    required this.fullName,
    required this.emailId,
    required this.gender,
    required this.age,
    required this.aadharNo,
    required this.country,
    required this.city,
  });

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      uId: data['uId'],
      fullName: data['fullName'],
      emailId: data['emailId'],
      gender: data['gender'],
      age: data['age'],
      aadharNo: data['aadharNo'],
      country: data['country'],
      city: data['city'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'fullName': fullName,
      'emailId': emailId,
      'gender': gender,
      'age': age,
      'aadharNo': aadharNo,
      'country': country,
      'city': city,
    };
  }
}
