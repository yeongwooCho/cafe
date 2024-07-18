import 'package:cafe/common/component/custom_ink_well_button.dart';
import 'package:cafe/common/component/custom_text_form_field.dart';
import 'package:cafe/common/component/default_button.dart';
import 'package:cafe/common/const/text_styles.dart';
import 'package:cafe/common/layout/default_app_bar.dart';
import 'package:cafe/common/layout/default_layout.dart';
import 'package:cafe/personal_training/view/ai_reference_completion_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AIReferenceScreen extends StatefulWidget {
  static String get routeName => 'ai_reference';

  const AIReferenceScreen({super.key});

  @override
  State<AIReferenceScreen> createState() => _AIReferenceScreenState();
}

class _AIReferenceScreenState extends State<AIReferenceScreen> {
  String investment = '';
  String profitRate = '';

  final List<String> preferLocation = [
    '서울(강서)',
    '서울(강동)',
    '서울(강북)',
    '서울(강남)',
    '수도권(경기)',
    '광역시',
    '비수도권',
  ];
  String selectedPreferLocation = '';

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: 'AI 추천'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'AI 카페가\n고객님이 입력해 주신 기준에 따라\n헬스장을 추천해 드립니다.',
                style: MyTextStyle.bigTitleBold,
              ),
              const SizedBox(height: 40.0),
              const Text(
                '예상 초기투자금액(권리금 + 보증금)',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 4.0),
              CustomTextFormField(
                onChanged: (String value) {
                  setState(() {
                    investment = value;
                  });
                },
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                textAlign: TextAlign.end,
                suffixText: '만원',
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 20.0),
              const Text(
                '최저 수익률',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 4.0),
              CustomTextFormField(
                onChanged: (String value) {
                  setState(() {
                    profitRate = value;
                  });
                },
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                textAlign: TextAlign.end,
                suffixText: '%',
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 20.0),
              const Text(
                '선호 지역',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 4.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                  preferLocation.length,
                  (index) => CustomInkWellButton(
                    title: preferLocation[index],
                    onTap: () {
                      setState(() {
                        selectedPreferLocation = preferLocation[index];
                      });
                    },
                    isSelected: selectedPreferLocation == preferLocation[index],
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              PrimaryButton(
                onPressed: () {
                  context.goNamed(AIReferenceCompletionScreen.routeName);
                },
                child: const Text('추천받기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
