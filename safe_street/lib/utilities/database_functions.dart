import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safe_street/models/user.dart';
import 'package:safe_street/utilities/static_data.dart';

Future<int> signInUserToSafeStreet(email, password) async {
  int status = 1;
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    status = 0;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      status = -1;
    } else if (e.code == 'wrong-password') {
      status = -2;
    } else {
      status = -3;
    }
  }
  return status;
}

Future<int> createAccountWithSafeStreet(
    email, password, fullname, adhaar) async {
  int status = 1;
  try {
    print("a");
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(credential.user!.uid);
    final SafeStreetUser user = SafeStreetUser(
        credential.user!.uid,
        fullname,
        email,
        '',
        '',
        adhaar,
        StaticData.selectedCountry,
        StaticData.selectedCity.text.toString());
    FirebaseFirestore.instance
        .collection('Users')
        .doc(credential.user!.uid)
        .set(user.toJson());
    status = 0;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      status = -1;
    } else if (e.code == 'email-already-in-use') {
      status = -2;
    }
  } catch (e) {
    status = -3;
  }
  return status;
}

Future<SafeStreetUser> getUserDetailsFromFirebase() async {
  final data = await FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid.toString())
      .get();
  final SafeStreetUser u =
      SafeStreetUser.fromJson(data.data() as Map<String, dynamic>);
  return u;
}
