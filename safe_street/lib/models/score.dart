class Score {
  String scoreId;
  String uId;
  double score;
  String type;
  String location;

  Score({
    required this.scoreId,
    required this.uId,
    required this.score,
    required this.type,
    required this.location,
  });

  factory Score.fromMap(Map<String, dynamic> data) {
    return Score(
      scoreId: data['scoreId'],
      uId: data['uid'],
      score: data['score'],
      type: data['type'],
      location: data['location_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'scoreId': scoreId,
      'uId': uId,
      'score': score,
      'type': type,
      'location': location,
    };
  }
}
