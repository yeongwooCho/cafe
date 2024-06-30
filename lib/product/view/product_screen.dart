import 'package:cafe/common/const/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/image_path.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../component/category_container.dart';
import '../component/horizontal_item_list.dart';
import '../model/product_model.dart';
import '../provider/product_provider.dart';

class ProductScreen extends ConsumerWidget {
  static String get routeName => "product";

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productPrefer = ref.watch(productPreferProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '중고거래'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(ImagePath.productBanner),
            const SizedBox(height: 60.0),
            const CategoryContainer(),
            const SizedBox(height: 40.0),
            _TitleAndHorizontalItemList(
              title: '현재 HOT한 상품 TOP7',
              products: productPrefer,
            ),
            _TitleAndHorizontalItemList(
              title: '신상품',
              products: productPrefer,
            ),
            _TitleAndHorizontalItemList(
              title: '인기 국산기구',
              products: productPrefer,
            ),
            _TitleAndHorizontalItemList(
              title: '인기 외산기구',
              products: productPrefer,
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleAndHorizontalItemList extends StatelessWidget {
  final String title;
  final List<ProductModel> products;

  const _TitleAndHorizontalItemList({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            title,
            style: MyTextStyle.bodyTitleMedium,
          ),
        ),
        const SizedBox(height: 8.0),
        HorizontalItemList(products: products),
        const SizedBox(height: 40.0),
      ],
    );
  }
}
