import 'package:flutter_riverpod/flutter_riverpod.dart';

final categorySelectedProvider = StateProvider<String>(
  (ref) => '',
);

final categoriesProvider = StateProvider<List<String>>(
  (ref) => [
    '국산 기구 판매',
    '국산 기구 구매',
    '외산 기구 판매',
    '외산 기구 판매',
  ],
);
