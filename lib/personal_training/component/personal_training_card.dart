import 'package:cafe/common/utils/data_utils.dart';
import 'package:cafe/personal_training/model/personal_training_model.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';

class PersonalTrainingCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String mainImageUrl;
  final double ratingPoint;
  final int ratingCount;
  final String openingHours;
  final String location;
  final int price;

  final bool isDetail; // 상세 페이지 여부
  final String? heroKey; // 히어로 위젯 키

  const PersonalTrainingCard({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.mainImageUrl,
    required this.ratingPoint,
    required this.ratingCount,
    required this.openingHours,
    required this.location,
    required this.price,
    this.isDetail = false,
    this.heroKey,
  });

  factory PersonalTrainingCard.fromModel({
    required PersonalTrainingModel model,
    bool isDetail = false,
  }) {
    return PersonalTrainingCard(
      heroKey: model.id,
      id: model.id,
      title: model.title,
      description: model.description,
      mainImageUrl: model.mainImageUrl,
      ratingPoint: model.ratingPoint,
      ratingCount: model.ratingCount,
      openingHours: model.openingHours,
      location: model.location,
      price: model.price,
      isDetail: isDetail,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width - 48;

    return Container(
      decoration: BoxDecoration(
        color: MyColor.empty,
        boxShadow: isDetail
            ? []
            : [
                const BoxShadow(
                  color: MyColor.shadow,
                  blurRadius: 6.0,
                ),
              ],
      ),
      child: ClipRRect(
        borderRadius:
            isDetail ? BorderRadius.circular(0.0) : BorderRadius.circular(16.0),
        child: Container(
          color: MyColor.white,
          child: Column(
            children: [
              // Hero(
              //   tag: ObjectKey(heroKey),
              //   child: Image.asset(
              //     mainImageUrl,
              //     fit: BoxFit.fill,
              //     height: 200.0,
              //     width: isDetail ? double.infinity : cardWidth,
              //     // height: 200.0,
              //   ),
              // ),
              Image.asset(
                mainImageUrl,
                fit: BoxFit.fill,
                height: 200.0,
                width: isDetail ? double.infinity : cardWidth,
                // height: 200.0,
              ),
              SizedBox(
                width: isDetail ? double.infinity : cardWidth,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    right: 16.0,
                    bottom: 8.0,
                    left: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        title,
                        style: MyTextStyle.bodyTitleMedium,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        description,
                        style: MyTextStyle.bodyRegular,
                        overflow: isDetail ? null : TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12.0),
                      _DescriptionContainer(
                        ratingPoint: ratingPoint,
                        ratingCount: ratingCount,
                        openingHours: openingHours,
                        location: location,
                        price: price,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DescriptionContainer extends StatelessWidget {
  final double ratingPoint;
  final int ratingCount;
  final String openingHours;
  final String location;
  final int price;

  const _DescriptionContainer({
    super.key,
    required this.ratingPoint,
    required this.ratingCount,
    required this.openingHours,
    required this.location,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            renderIconAndTitle(
              title: "${ratingPoint.toStringAsFixed(2)} ($ratingCount)",
              icon: PhosphorIcons.star(PhosphorIconsStyle.fill),
            ),
            const SizedBox(width: 12.0),
            renderIconAndTitle(
              title: openingHours,
              icon: PhosphorIcons.clock(),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        renderIconAndTitle(
          title: location,
          icon: PhosphorIcons.mapPinArea(),
        ),
        const SizedBox(height: 4.0),
        renderIconAndTitle(
          title: '매도 가격: ${DataUtils.convertPriceToMoneyString(price: price)} 원',
          icon: PhosphorIcons.currencyKrw(),
        ),
      ],
    );
  }

  Widget renderIconAndTitle({
    required IconData icon,
    required String title,
  }) {
    return Row(
      children: [
        PhosphorIcon(
          icon,
          size: 24.0,
          color: MyColor.third,
        ),
        const SizedBox(width: 4.0),
        Text(
          title,
          style: MyTextStyle.descriptionRegular.copyWith(
            color: MyColor.darkGrey,
          ),
        ),
      ],
    );
  }
}
