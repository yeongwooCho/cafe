import 'package:cafe/common/component/show/show_custom_toast.dart';
import 'package:cafe/common/const/colors.dart';
import 'package:cafe/common/const/text_styles.dart';
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
        .where((element) => element.id % 2 == 0)
        .toList();

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '내 상품',
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () {
                showCustomToast(context, msg: '서비스 준비중입니다.');
              },
              child: Text(
                '상품등록하기',
                style: MyTextStyle.descriptionRegular.copyWith(
                  color: MyColor.primary,
                ),
              ),
            ),
          ),
        ],
      ),
      child: VerticalItemGrid(products: products),
    );
  }
}
