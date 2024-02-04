class Location {
  String locationId;
  String locationName;
  String locationAddress;
  String locationSafeStreetRating;
  Map<dynamic, dynamic> experienceRatingId;
  String upvotes;
  String downvotes;

  Location(
    this.locationId,
    this.locationName,
    this.locationAddress,
    this.locationSafeStreetRating,
    this.experienceRatingId,
    this.upvotes,
    this.downvotes,
  );

  factory Location.fromMap(Map<String, dynamic> data) {
    return Location(
      data['locationId'],
      data['locationName'],
      data['locationAddress'],
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
      'locationAddress': locationAddress,
      'locationSafeStreetRating': locationSafeStreetRating,
      'experienceRatingId': experienceRatingId,
      'upvotes': upvotes,
      'downvotes': downvotes,
    };
  }
}
