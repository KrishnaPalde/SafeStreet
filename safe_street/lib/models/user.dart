class User {
  String uId;
  String fullName;
  String emailId;
  String gender;
  int age;
  String aadharNo;

  User({
    required this.uId,
    required this.fullName,
    required this.emailId,
    required this.gender,
    required this.age,
    required this.aadharNo,
  });

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      uId: data['uId'],
      fullName: data['fullName'],
      emailId: data['emailId'],
      gender: data['gender'],
      age: data['age'],
      aadharNo: data['aadharNo'],
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
    };
  }
}
