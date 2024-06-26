import 'package:cafe/personal_training/model/personal_training_model.dart';

class PersonalTrainingDetailModel extends PersonalTrainingModel {
  PersonalTrainingDetailModel({
    required super.id,
    required super.title,
    required super.description,
    required super.mainImageUrl,
    required super.ratingPoint,
    required super.ratingCount,
    required super.openingHours,
    required super.location,
    required super.categoryStatus,
  });
}
