import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../component/vertical_item_grid.dart';
import '../provider/product_provider.dart';

class MyProductListScreen extends ConsumerWidget {
  static String get routeName => "my_product_list";

  const MyProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref
        .watch(productProvider)
        .where((element) => element.id % 4 == 0)
        .toList();

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '내 상품'),
      child: Expanded(
        child: VerticalItemGrid(products: products),
      ),
    );
  }
}
