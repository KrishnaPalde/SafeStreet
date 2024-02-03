class Vote {
  String voteId;
  String experienceId;
  String voteType;

  Vote({
    required this.voteId,
    required this.experienceId,
    required this.voteType,
  });

  factory Vote.fromMap(Map<String, dynamic> data) {
    return Vote(
      voteId: data['voteId'],
      experienceId: data['experienceId'],
      voteType: data['vote_type'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'voteId': voteId,
      'experienceId': experienceId,
      'vote_type': voteType,
    };
  }
}
