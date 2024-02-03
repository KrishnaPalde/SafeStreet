class User {
  String uId; // Update the field name here
  String aadharNo;
  // Add other details as needed

  User({
    required this.uId, // Update the parameter name here
    required this.aadharNo,
    // Add other details as needed
  });

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      uId: data['uid'],
      aadharNo: data['aadhar_no'],
      // Map other details as needed
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uId,
      'aadhar_no': aadharNo,
      // Add other details as needed
    };
  }
}
