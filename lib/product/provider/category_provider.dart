import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CategoryStatus {
  domesticSales('국산 기구 판매'),
  domesticPurchase('국산 기구 구매'),
  foreignSales('외산 기구 판매'),
  foreignPurchase('외산 기구 판매');

  const CategoryStatus(this.label);

  final String label;
}

final categorySelectedProvider = StateProvider<CategoryStatus>(
  (ref) => CategoryStatus.domesticSales,
);

final categoriesProvider = StateProvider<List<CategoryStatus>>(
  (ref) => [
    CategoryStatus.domesticSales,
    CategoryStatus.domesticPurchase,
    CategoryStatus.foreignSales,
    CategoryStatus.foreignPurchase,
  ],
);
