class SafeStreetLocation {
  String locationId;
  String locationName;
  String latitude;
  String longitude;
  String locationSafeStreetRating;
  List<dynamic> experienceRatingId;
  String upvotes;
  String downvotes;

  SafeStreetLocation(
    this.locationId,
    this.locationName,
    this.latitude,
    this.longitude,
    this.locationSafeStreetRating,
    this.experienceRatingId,
    this.upvotes,
    this.downvotes,
  );

  factory SafeStreetLocation.fromMap(Map<String, dynamic> data) {
    print(data);
    return SafeStreetLocation(
      data['locationId'],
      data['locationName'],
      data['latitude'],
      data['longitude'],
      data['locationSafeStreetRating'],
      data['experienceRatingId'],
      data['upvotes'],
      data['downvotes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'locationId': locationId,
      'locationName': locationName,
      'latitude': latitude,
      'longitude': longitude,
      'locationSafeStreetRating': locationSafeStreetRating,
      'experienceRatingId': experienceRatingId,
      'upvotes': upvotes,
      'downvotes': downvotes,
    };
  }
}
