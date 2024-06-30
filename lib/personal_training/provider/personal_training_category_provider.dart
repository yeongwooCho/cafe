import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PersonalTrainingCategoryStatus {
  entire('전체'),
  metropolitanArea('수도권'),
  metropolitanCity('광역시'),
  localArea('지방권');

  const PersonalTrainingCategoryStatus(this.label);

  final String label;
}

final personalTrainingCategorySelectedProvider =
    StateProvider<PersonalTrainingCategoryStatus>(
  (ref) => PersonalTrainingCategoryStatus.entire,
);

final personalTrainingCategoriesProvider =
    StateProvider<List<PersonalTrainingCategoryStatus>>(
  (ref) => [
    PersonalTrainingCategoryStatus.entire,
    PersonalTrainingCategoryStatus.metropolitanArea,
    PersonalTrainingCategoryStatus.metropolitanCity,
    PersonalTrainingCategoryStatus.localArea,
  ],
);
