enum CategoryStatus {
  special('수도권'),
  metropolitan('광역시'),
  governing('지방권');

  const CategoryStatus(this.label);

  final String label;
}

class PersonalTrainingModel {
  final String id;
  final String title;
  final String description;
  final String mainImageUrl;
  final double ratingPoint;
  final int ratingCount;
  final String openingHours;
  final String location;
  final int price;
  final CategoryStatus categoryStatus;

  PersonalTrainingModel({
    required this.id,
    required this.title,
    required this.description,
    required this.mainImageUrl,
    required this.ratingPoint,
    required this.ratingCount,
    required this.openingHours,
    required this.location,
    required this.price,
    required this.categoryStatus,
  });

  PersonalTrainingModel copyWith({
    String? id,
    String? title,
    String? description,
    String? mainImageUrl,
    double? ratingPoint,
    int? ratingCount,
    String? openingHours,
    String? location,
    int? price,
    CategoryStatus? categoryStatus,
  }) {
    return PersonalTrainingModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      ratingPoint: ratingPoint ?? this.ratingPoint,
      ratingCount: ratingCount ?? this.ratingCount,
      openingHours: openingHours ?? this.openingHours,
      location: location ?? this.location,
      price: price ?? this.price,
      categoryStatus: categoryStatus ?? this.categoryStatus,
    );
  }
}
