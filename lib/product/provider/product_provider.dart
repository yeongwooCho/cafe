import 'package:cafe/user/model/user_model.dart';
import 'package:cafe/user/provider/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/utils/data_utils.dart';
import '../model/product_model.dart';
import 'category_provider.dart';

final productRandomProvider = Provider<List<ProductModel>>((ref) {
  final products = ref.watch(productProvider);
  final selectedCategory = ref.watch(categorySelectedProvider);

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
      '스쿼트 렉 + 무게 30 * 4 + 깔판2': 8700,
      '스쿼트 렉 + 무게 30 * 4 + 깔판3': 13400,
      '스쿼트 렉 + 무게 30 * 4 + 깔판4': 11480,
      '스쿼트 렉 + 무게 30 * 4 + 깔판5': 9300,
      '스쿼트 렉 + 무게 30 * 4 + 깔판6': 7300,
      '스쿼트 렉 + 무게 30 * 4 + 깔판7': 8400,
      '스쿼트 렉 + 무게 30 * 4 + 깔판8': 10200,
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
          'asset/img/product/$index/3.png',
        ],
        isLike: false,
        user: user,
        likes: 122 - index,
        createdAt: createdAt.subtract(Duration(days: index)),
      ),
    );
  }
}
