import 'package:cafe/user/model/address_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/image_path.dart';
import '../model/user_model.dart';

final userProvider = StateNotifierProvider<UserStateNotifier, UserModelBase>(
  (ref) => UserStateNotifier(),
);

class UserStateNotifier extends StateNotifier<UserModelBase> {
  UserStateNotifier() : super(UserModelLoading()) {
    initItems();
  }

  void updateInfo({
    required String name,
    required String phone,
    required String email,
  }) {
    state = (state as UserModel).copyWith(
      name: name,
      phone: phone,
      email: email,
    );
  }

  void updateRecentlyViewedItems({
    required String recentlyViewedItem,
  }) {
    final user = state as UserModel;
    if (user.recentlyViewedItems.contains(recentlyViewedItem)) {
      print(1);
      state = user.copyWith(recentlyViewedItems: [
        ...user.recentlyViewedItems
            .where((element) => element != recentlyViewedItem),
        recentlyViewedItem,
      ]);
    } else {
      print(2);
      state = user.copyWith(recentlyViewedItems: [
        ...user.recentlyViewedItems,
        recentlyViewedItem,
      ]);
    }
    print(3);

    print((state as UserModel).recentlyViewedItems);
  }

  void initItems() {
    state = UserModel(
      id: 0,
      email: 'fitness0701@naver.com',
      username: 'fitness0701',
      password: 'fitness0701',
      name: '김고호',
      phone: '01012341234',
      profileImage: ImagePath.user,
      recentlyViewedItems: [],
      address: AddressModel(
        id: 1,
        name: '김고호',
        phone: '010-1234-1234',
        address: '서울특별시 종로구 세종대로 172',
        detailAddress: '103동 502호',
        memo: '부재시 경비실에 맡겨주세요.',
      ),
    );
  }
}
