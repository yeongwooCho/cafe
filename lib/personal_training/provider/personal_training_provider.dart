import 'package:cafe/personal_training/model/personal_training_detail_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/image_path.dart';
import '../../common/utils/data_utils.dart';
import '../model/personal_training_model.dart';

final personalTrainingDetailProvider =
    Provider.family<PersonalTrainingDetailModel, String>((ref, id) {
  final pt = ref
      .watch(personalTrainingProvider)
      .firstWhere((element) => element.id == id);
  return pt as PersonalTrainingDetailModel;
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

  List<String> titles = [
    '피트니스 파워 하우스',
    '헬스 플래닛',
    '비전 피트니스',
    '헬스 데스티니',
    '피트니스 이노베이션',
    '챔피언 짐',
    '엘리트 피트니스',
    '제이브로 짐',
    '헬스 포커스',
    '피트니스 킹덤',
    '헬스 리젼드',
    '익스퍼트 짐',
    '피트니스 마스터',
  ];

  List<String> descriptions = [
    "성공적인 피트니스 비즈니스를 시작할 준비가 되셨나요? 완벽한 시설을 갖춘 피트니스 센터를 인수하세요!",
    "최상의 위치와 최신 장비를 자랑하는 피트니스 센터, 지금 바로 새로운 주인을 기다리고 있습니다.",
    "안정적인 회원 기반과 높은 수익성을 가진 피트니스 센터, 지금 인수하세요.",
    "모든 것이 준비된 피트니스 센터에서 당신의 꿈을 실현하세요!",
    "운동을 사랑하는 새로운 주인을 기다리는 피트니스 센터, 지금 바로 문의하세요.",
    "성공적인 피트니스 센터 운영을 위한 완벽한 기회, 놓치지 마세요.",
    "다양한 피트니스 프로그램과 최신 장비를 갖춘 피트니스 센터, 지금 바로 인수하세요.",
    "건강과 웰빙을 추구하는 비즈니스, 피트니스 센터를 인수할 최고의 기회입니다.",
    "안정적인 매출과 충성도 높은 회원을 보유한 피트니스 센터, 새로운 주인을 기다립니다.",
    "모든 것이 갖춰진 피트니스 센터, 당신의 비즈니스 꿈을 현실로 만들어 드립니다.",
    "최고의 위치에서 성공적인 피트니스 비즈니스를 운영할 기회를 잡으세요.",
    "피트니스 산업에서의 성공을 위한 준비된 공간, 지금 바로 인수하세요.",
    "회원이 많고 시설이 잘 갖춰진 피트니스 센터, 새로운 주인을 기다리고 있습니다.",
  ];

  List<PersonalTrainingModel> getItems() {
    return List.generate(
      titles.length,
      (index) => PersonalTrainingDetailModel(
        id: DataUtils.getUuid(),
        title: titles[index],
        description: descriptions[index],
        mainImageUrl: '${ImagePath.ptDirectory}$index.png',
        ratingPoint: 4.9,
        ratingCount: 343,
        openingHours: '11:00 ~ 20:00',
        location: '서울특별시 종로구 세종대로 172',
        categoryStatus: CategoryStatus.special,
        shop: ShopInfo(
          businessType: '헬스클럽',
          roadNameAddress: '서울특별시 관악구 난곡로 84 (신림동)',
          localAddress: '서울특별시 관악구 신림동 668-11 큰믿음유신교회',
          premium: 14000,
          deposit: 5000,
          monthlyRent: 400,
          administrationCost: 50,
        ),
        seller: SellerInfo(
          name: '헬스클럽',
          locationOfBuilding: '서울특별시 관악구 난곡로 84 (신림동)',
          registrationNumber: '1310424302918',
          representative: '김세준',
          contactInfo: '01012341234',
        ),
        detailImages: [
          '${ImagePath.ptDirectory}3.png',
          '${ImagePath.ptDirectory}6.png',
          '${ImagePath.ptDirectory}9.png',
          '${ImagePath.ptDirectory}11.png',
          '${ImagePath.ptDirectory}12.png',
        ],
      ),
    );
  }
}
