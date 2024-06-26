import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/image_path.dart';
import '../../common/utils/data_utils.dart';
import '../model/personal_training_model.dart';

final personalTrainingDetailProvider =
    Provider.family<PersonalTrainingModel, String>((ref, id) {
  final pt = ref
      .watch(personalTrainingProvider)
      .firstWhere((element) => element.id == id);
  return pt;
});

final personalTrainingProvider = StateNotifierProvider<
    PersonalTrainingStateNotifier, List<PersonalTrainingModel>>((ref) {
  return PersonalTrainingStateNotifier();
});

class PersonalTrainingStateNotifier
    extends StateNotifier<List<PersonalTrainingModel>> {
  PersonalTrainingStateNotifier() : super([]) {
    state = getItems();
  }

  List<PersonalTrainingModel> getItems() {
    return List.generate(
      6,
      (index) => PersonalTrainingModel(
        id: DataUtils.getUuid(),
        title: '피트니스 파워 하우스',
        description: '동해물과 백두산이 마르고 닳도록 하느님.asdfasdfasdf..',
        mainImageUrl: '${ImagePath.ptDirectory}0.png',
        ratingPoint: 4.9,
        ratingCount: 343,
        openingHours: '11:00 ~ 20:00',
        location: '서울특별시 종로구 세종대로 172',
        categoryStatus: CategoryStatus.special,
      ),
    );
  }
}
