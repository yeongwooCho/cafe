import 'package:cafe/common/component/default_button.dart';
import 'package:cafe/common/layout/default_app_bar.dart';
import 'package:cafe/common/layout/default_layout.dart';
import 'package:cafe/personal_training/provider/personal_training_provider.dart';
import 'package:cafe/personal_training/view/request_consultation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/const/colors.dart';
import '../component/horizontal_page_view.dart';

class AIReferenceCompletionScreen extends ConsumerWidget {
  static String get routeName => 'ai_reference_completion';

  const AIReferenceCompletionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pts = ref.watch(personalTrainingProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: 'AI 추천결과'),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              color: MyColor.barrier,
            )
          ],
          color: MyColor.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: PrimaryButton(
            onPressed: () {
              context.goNamed(RequestConsultationScreen.routeName);
            },
            child: const Text('상담 예약'),
          ),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40.0),
            HorizontalPageView(
              title: '종합 추천',
              pts: pts.sublist(0, 4),
            ),
            const SizedBox(height: 40.0),
            HorizontalPageView(
              title: '수익률 기준 추천',
              pts: pts.sublist(4, 6),
            ),
            const SizedBox(height: 40.0),
            HorizontalPageView(
              title: '위치 기준 추천',
              pts: pts.sublist(6, 8),
            ),
            const SizedBox(height: 40.0),
            HorizontalPageView(
              title: '손익 분기점 기준 추천',
              pts: pts.sublist(7, 9),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
