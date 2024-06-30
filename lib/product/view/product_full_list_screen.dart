import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../component/vertical_item_grid.dart';
import '../provider/category_provider.dart';
import '../provider/product_provider.dart';

class ProductFullListScreen extends ConsumerWidget {
  static String get routeName => "product_full_list";

  const ProductFullListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    final categories = ref.watch(categoriesProvider);
    final selectedCategory = ref.watch(categorySelectedProvider);
    final randomProducts = ref.watch(productRandomProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '상품 리스트'),
      child: Column(
        children: [
          SizedBox(
            height: 84.0,
            child: ListView.separated(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final category = categories[index];

                return Container(
                  decoration: BoxDecoration(
                    color:
                        selectedCategory == category ? MyColor.primary : null,
                    border: Border.all(
                      width: 1.0,
                      color: selectedCategory == category
                          ? MyColor.empty
                          : MyColor.middleGrey,
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      ref.read(categorySelectedProvider.notifier).state =
                          category;
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        category.label,
                        style: MyTextStyle.bodyRegular.copyWith(
                          color: selectedCategory == category
                              ? MyColor.white
                              : null,
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 8.0);
              },
              itemCount: categories.length,
            ),
          ),
          Expanded(
            child: VerticalItemList(
              products: selectedCategory == categories.first
                  ? products
                  : randomProducts,
            ),
          ),
        ],
      ),
    );
  }
}
