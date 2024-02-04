import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:safe_street/models/experience.dart';
import 'package:safe_street/models/location.dart';
import 'package:safe_street/models/score.dart';
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

Future<void> uploadUserRatingAndExperience(Score rating, Experience experience,
    [SafeStreetLocation? location]) async {
  final snapshot = await FirebaseFirestore.instance
      .collection('locations')
      .where('locationName', isEqualTo: rating.location)
      .get();

  if (snapshot.docs.isNotEmpty) {
    String docID = snapshot.docs.first.id;
    final data = await FirebaseFirestore.instance
        .collection('locations')
        .doc(docID)
        .get();
    var experienceRatingData =
        data.data()!['experienceRatingId'] as List<dynamic>;
    Map<String, dynamic> newExperience = {
      "rating": rating.score,
      "experience": experience.experienceText,
      "upvotes": experience.upvotes,
      "downvotes": experience.downvotes,
    };
    print(experienceRatingData);
    experienceRatingData.add(newExperience);
    print(experienceRatingData);
    await FirebaseFirestore.instance.collection('locations').doc(docID).update(
      {
        "experienceRatingId": experienceRatingData,
      },
    );
  } else {
    if (location == null) {
      return;
    }
    var doc = await FirebaseFirestore.instance.collection('locations').doc();
    location.locationId = doc.id;
    location.experienceRatingId = [
      {
        "rating": rating.score,
        "experience": experience.experienceText,
        "upvotes": experience.upvotes,
        "downvotes": experience.downvotes,
      }
    ];
    await doc.set(location.toMap());
  }
}

Future<Map<String, dynamic>> getLocationDetails(String locationName) async {
  print(locationName);
  final data = await FirebaseFirestore.instance
      .collection('locations')
      .where('locationName', isEqualTo: locationName)
      .get();
  print(data.docs.length);
  if (data.docs.isNotEmpty) {
    // final SafeStreetLocation loc =
    //     SafeStreetLocation.fromMap(data.docs.first.data());
    // print(loc.toMap());
    // return loc;
    return data.docs.first.data();
  } else {
    return {};
  }
}

Stream<QuerySnapshot<Map<String, dynamic>>> getLocationDetailsStream(
    String locationName) {
  return FirebaseFirestore.instance
      .collection('locations')
      .where('locationName', isEqualTo: locationName)
      .snapshots();
}

Future<void> upvoteExperience(SafeStreetLocation loc, int i) async {
  final data = await FirebaseFirestore.instance
      .collection('locations')
      .doc(loc.locationId)
      .get();
  List<dynamic> updateData = data.data()!['experienceRatingId'];
  var oldVal = int.parse(updateData[i]['upvotes'].toString());
  int newVal = oldVal + 1;
  updateData[i]['upvotes'] = newVal.toString();
  await FirebaseFirestore.instance
      .collection('locations')
      .doc(loc.locationId)
      .update({'experienceRatingId': updateData});
}

Future<void> downvoteExperience(SafeStreetLocation loc, int i) async {
  final data = await FirebaseFirestore.instance
      .collection('locations')
      .doc(loc.locationId)
      .get();
  List<dynamic> updateData = data.data()!['experienceRatingId'];
  var oldVal = int.parse(updateData[i]['downvotes'].toString());
  int newVal = oldVal + 1;
  updateData[i]['downvotes'] = newVal.toString();
  await FirebaseFirestore.instance
      .collection('locations')
      .doc(loc.locationId)
      .update({'experienceRatingId': updateData});
}
