class Score {
  String scoreId;
  String uId;
  //String experienceId;
  double score;
  String type;
  String location;

  Score({
    required this.scoreId,
    required this.uId,
    //this.experienceId,
    required this.score,
    required this.type,
    required this.location,
  });

  factory Score.fromMap(Map<String, dynamic> data) {
    return Score(
      scoreId: data['scoreId'],
      uId: data['uId'],
      //experienceId: data['experienceId'],
      score: data['score'],
      type: data['type'],
      location: data['location'],
    );
  }

  get experience => null;

  Map<String, dynamic> toMap() {
    return {
      'scoreId': scoreId,
      'uId': uId,
      //'experienceId': experienceId,
      'score': score,
      'type': type,
      'location': location,
    };
  }
}
