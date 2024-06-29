class RatingModel {
  final int id;
  final String username;
  final int ratingPoint;
  final String content;
  final DateTime createAt;

  RatingModel({
    required this.id,
    required this.username,
    required this.ratingPoint,
    required this.content,
    required this.createAt,
  });

  RatingModel copyWith({
    int? id,
    String? username,
    int? ratingPoint,
    String? content,
    DateTime? createAt,
  }) {
    return RatingModel(
      id: id ?? this.id,
      username: username ?? this.username,
      ratingPoint: ratingPoint ?? this.ratingPoint,
      content: content ?? this.content,
      createAt: createAt ?? this.createAt,
    );
  }
}
