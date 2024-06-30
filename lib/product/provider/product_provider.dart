import 'package:cafe/user/model/user_model.dart';
import 'package:cafe/user/provider/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/utils/data_utils.dart';
import '../model/product_model.dart';
import 'product_category_provider.dart';

final productRandomProvider = Provider<List<ProductModel>>((ref) {
  final products = ref.watch(productProvider);
  final selectedCategory = ref.watch(productCategorySelectedProvider);

  final randomProducts =
      DataUtils.getRandomShuffledList<ProductModel>(products);
  return randomProducts;
});

final productPreferProvider = Provider<List<ProductModel>>((ref) {
  final products = ref.watch(productProvider);

  final pairProducts = DataUtils.getRandomShuffledList<ProductModel>(products);
  return pairProducts.take(4).toList();
});

final productDetailProvider = Provider.family<ProductModel, int>((ref, id) {
  final product =
      ref.watch(productProvider).firstWhere((element) => element.id == id);
  return product;
});

final productProvider =
    StateNotifierProvider<ProductStateNotifier, List<ProductModel>>((ref) {
  return ProductStateNotifier(ref: ref);
});

class ProductStateNotifier extends StateNotifier<List<ProductModel>> {
  Ref ref;

  ProductStateNotifier({
    required this.ref,
  }) : super([]) {
    state = getItems();
  }

  void updateLike({
    required int productId,
    required bool isLike,
  }) {
    state = state.map((element) {
      if (element.id == productId) {
        return element.copyWith(isLike: isLike);
      } else {
        return element;
      }
    }).toList();
  }

  List<ProductModel> getItems() {
    final products = {
      'JEA 덤벨 세트': 210000,
      'ROGUE 원판 3종 세트': 120000,
      'WEA 펙 덱 플라이 머신': 630000,
      'CRUNCH 바벨 세트': 88000,
      'PELO 헬스 자전거': 660000,
      'ATA 스피드 줄넘기': 54000,
      'ntanva 헬스 자전거': 880000,
      'MAV 티바로우': 320000,
      'ROGE 백 익스텐션': 770000,
      'CONCEPT 로잉머신': 1220000,
      'YORK 바벨 & 원판 세트': 208000,
      'ROGE 바벨 & 원판 세트': 182000,
      '스쿼트밴드 힙밴드 하체 운동': 34000,
      '크로스핏 메디신볼': 205000,
      'YAKA 30KG 덤벨': 120000,
      'GAP 스쿼트 렉': 792000,
      'PARA 덤벨 세트': 240000,
      'AGORA 레드 덤벨 3KG': 52000,
      'SOLID 바벨 바 10KG': 68000,
      'GAG 스쿼트 렉 세트': 1430000,
      'KASLE 케틀벨 3종 세트': 93000,
      'KASLE 헬스 기구': 3200000,
    };

    final user = ref.watch(userProvider) as UserModel;

    final now = DateTime.now();
    final createdAt = DateTime(now.year, now.month, now.day, 0, 0, 0);

    return List.generate(
      products.length,
      (index) => ProductModel(
        id: index,
        title: products.keys.toList()[index],
        price: products.values.toList()[index],
        mainImageUrl: 'asset/img/product/$index.png',
        detailImageUrls: [
          'asset/img/product/$index/0.png',
          'asset/img/product/$index/1.png',
          'asset/img/product/$index/2.png',
        ],
        isLike: false,
        user: user,
        likes: DataUtils.getRandomDouble(min: 243.0, range: 500).toInt(),
        createdAt: createdAt.subtract(Duration(
          days: DataUtils.getRandomDouble(min: 1.0, range: 10).toInt(),
        )),
      ),
    );
  }
}
