class Vote {
  String voteId;
  String experienceId;
  String uId;
  String voteType;

  Vote({
    required this.voteId,
    required this.experienceId,
    required this.uId,
    required this.voteType,
  });

  factory Vote.fromMap(Map<String, dynamic> data) {
    return Vote(
      voteId: data['voteId'],
      experienceId: data['experienceId'],
      uId: data['uId'],
      voteType: data['vote_type'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'voteId': voteId,
      'experienceId': experienceId,
      'uId': uId,
      'vote_type': voteType,
    };
  }
}
