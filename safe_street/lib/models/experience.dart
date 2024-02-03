class Experience {
  String experienceId;
  String scoreId;
  int upvotes;
  int downvotes;
  String experienceText;

  Experience({
    required this.experienceId,
    required this.scoreId,
    required this.upvotes,
    required this.downvotes,
    required this.experienceText,
  });

  factory Experience.fromMap(Map<String, dynamic> data) {
    return Experience(
      experienceId: data['experienceId'],
      scoreId: data['scoreId'],
      upvotes: data['upvotes'],
      downvotes: data['downvotes'],
      experienceText: data['experience_text'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'experienceId': experienceId,
      'scoreId': scoreId,
      'upvotes': upvotes,
      'downvotes': downvotes,
      'experience_text': experienceText,
    };
  }
}
