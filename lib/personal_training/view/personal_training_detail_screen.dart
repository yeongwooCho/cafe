import 'dart:ui';

import 'package:cafe/common/const/colors.dart';
import 'package:cafe/common/utils/data_utils.dart';
import 'package:cafe/personal_training/component/personal_training_card.dart';
import 'package:cafe/personal_training/provider/personal_training_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/component/divider_container.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class PersonalTrainingDetailScreen extends ConsumerWidget {
  static String get routeName => 'personal_training_detail';

  final String id;

  const PersonalTrainingDetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pt = ref.watch(personalTrainingDetailProvider(id));
    final imageWidth = (MediaQuery.of(context).size.width - 48 - 16) / 3;

    return DefaultLayout(
      appbar: DefaultAppBar(title: pt.title),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: PersonalTrainingCard.fromModel(
                model: pt,
                isDetail: true,
              ),
            ),
            const DividerContainer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'PT샵 소개',
                    style: MyTextStyle.bodyTitleMedium,
                  ),
                  const SizedBox(height: 8.0),
                  _renderTitleAndDescription(
                      title: '업종', description: pt.shop.businessType),
                  _renderTitleAndDescription(
                      title: '도로명 주소', description: pt.shop.roadNameAddress),
                  _renderTitleAndDescription(
                      title: '지번 주소', description: pt.shop.localAddress),
                  _renderTitleAndDescription(
                      title: '권리금',
                      description:
                          '${DataUtils.convertPriceToMoneyString(price: pt.shop.premium)} 만원'),
                  _renderTitleAndDescription(
                      title: '보증금',
                      description:
                          '${DataUtils.convertPriceToMoneyString(price: pt.shop.deposit)} 만원'),
                  _renderTitleAndDescription(
                      title: '월세',
                      description:
                          '${DataUtils.convertPriceToMoneyString(price: pt.shop.monthlyRent)} 만원'),
                  _renderTitleAndDescription(
                    title: '관리비',
                    description:
                        '${DataUtils.convertPriceToMoneyString(price: pt.shop.administrationCost)} 만원',
                  ),
                ],
              ),
            ),
            const DividerContainer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '판매자 정보',
                    style: MyTextStyle.bodyTitleMedium,
                  ),
                  const SizedBox(height: 8.0),
                  Stack(
                    children: [
                      Column(
                        children: [
                          _renderTitleAndDescription(
                              title: '명칭', description: pt.seller.name),
                          _renderTitleAndDescription(
                              title: '소재지',
                              description: pt.seller.locationOfBuilding),
                          _renderTitleAndDescription(
                              title: '등록번호',
                              description: pt.seller.registrationNumber),
                          _renderTitleAndDescription(
                              title: '대표자',
                              description: pt.seller.representative),
                          _renderTitleAndDescription(
                              title: '연락처', description: pt.seller.contactInfo),
                        ],
                      ),
                      if (!pt.isVisibleSeller)
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Container(
                                color: Colors.black.withOpacity(0),
                                child: Center(
                                  child: Container(
                                    color: MyColor.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '판매자에 의해 비공개 되었습니다.',
                                        style: MyTextStyle.descriptionMedium
                                            .copyWith(
                                          color: MyColor.darkGrey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const DividerContainer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '상세이미지',
                    style: MyTextStyle.bodyTitleMedium,
                  ),
                  const SizedBox(height: 12.0),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: pt.detailImages
                        .map(
                          (e) => Image.asset(e,
                              fit: BoxFit.fitHeight,
                              width: imageWidth,
                              height: imageWidth),
                        )
                        .toList(),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget _renderTitleAndDescription({
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.0,
            child: Text(
              title,
              style: MyTextStyle.descriptionMedium,
            ),
          ),
          Expanded(
            child: Text(
              description,
              style: MyTextStyle.descriptionRegular,
            ),
          ),
        ],
      ),
    );
  }
}
