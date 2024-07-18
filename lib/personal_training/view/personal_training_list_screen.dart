import 'package:cafe/personal_training/component/vertical_item_list.dart';
import 'package:cafe/personal_training/provider/personal_training_category_provider.dart';
import 'package:cafe/personal_training/provider/personal_training_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class PersonalTrainingListScreen extends ConsumerWidget {
  static String get routeName => 'personal_training_list';

  const PersonalTrainingListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pts = ref.watch(personalTrainingProvider);
    // final randomProducts = ref.watch(productRandomProvider);
    final categories = ref.watch(personalTrainingCategoriesProvider);
    final selectedCategory =
        ref.watch(personalTrainingCategorySelectedProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '헬스장 리스트'),
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
                      ref
                          .read(
                              personalTrainingCategorySelectedProvider.notifier)
                          .state = category;
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
            child: VerticalItemList(pts: pts),
          ),
        ],
      ),
    );
  }
}
