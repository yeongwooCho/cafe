import 'package:cafe/common/const/colors.dart';
import 'package:cafe/common/const/text_styles.dart';
import 'package:cafe/personal_training/component/horizontal_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                  _renderContainerButton(title: 'PT샵\n전체보기', onTap: () {}),
                  const SizedBox(width: 8.0),
                  _renderContainerButton(title: 'AI 추천\nPT샵', onTap: () {}),
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
    required String title,
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
            child: Text(
              title,
              style: MyTextStyle.bodyRegular,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

