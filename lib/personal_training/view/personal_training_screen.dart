import 'package:cafe/common/const/colors.dart';
import 'package:cafe/common/const/text_styles.dart';
import 'package:cafe/personal_training/component/horizontal_page_view.dart';
import 'package:cafe/personal_training/view/ai_reference_screen.dart';
import 'package:cafe/personal_training/view/personal_training_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/const/image_path.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../provider/personal_training_provider.dart';

class PersonalTrainingScreen extends ConsumerWidget {
  static String get routeName => "personal_training";

  const PersonalTrainingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pts = ref.watch(personalTrainingProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: 'PT샵'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(ImagePath.personalTrainingBanner),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  _renderContainerButton(
                    topOfTitle: '전체보기',
                    downOfTitle: 'PT샵',
                    onTap: () {
                      context.goNamed(PersonalTrainingListScreen.routeName);
                    },
                  ),
                  const SizedBox(width: 8.0),
                  _renderContainerButton(
                    topOfTitle: 'AI 추천',
                    downOfTitle: 'PT샵',
                    onTap: () {
                      context.goNamed(AIReferenceScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            HorizontalPageView(
              title: '서울시 인근 추천',
              pts: pts,
            ),
            const SizedBox(height: 40.0),
            HorizontalPageView(
              title: '금주의 신규 매물',
              pts: pts,
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }

  Widget _renderContainerButton({
    required String topOfTitle,
    required String downOfTitle,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: MyColor.middleGrey,
              ),
              borderRadius: BorderRadius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                Text(
                  topOfTitle,
                  style: MyTextStyle.bodyMedium.copyWith(
                    color: MyColor.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  downOfTitle,
                  style: MyTextStyle.bodyRegular,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

