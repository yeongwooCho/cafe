import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ProductCategoryStatus {
  domesticSales('국산 기구 판매'),
  domesticPurchase('국산 기구 구매'),
  foreignSales('외산 기구 판매'),
  foreignPurchase('외산 기구 판매');

  const ProductCategoryStatus(this.label);

  final String label;
}

final productCategorySelectedProvider = StateProvider<ProductCategoryStatus>(
  (ref) => ProductCategoryStatus.domesticSales,
);

final productCategoriesProvider = StateProvider<List<ProductCategoryStatus>>(
  (ref) => [
    ProductCategoryStatus.domesticSales,
    ProductCategoryStatus.domesticPurchase,
    ProductCategoryStatus.foreignSales,
    ProductCategoryStatus.foreignPurchase,
  ],
);
