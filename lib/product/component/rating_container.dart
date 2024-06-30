import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/utils/data_utils.dart';
import '../model/rating_model.dart';
import '../provider/rating_provider.dart';

class RatingContainer extends ConsumerWidget {
  const RatingContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratings = ref.watch(ratingProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '리뷰',
            style: MyTextStyle.bodyTitleMedium,
          ),
          const SizedBox(height: 8.0),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final rating = ratings[index];

              return RatingCard(rating: rating);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8.0);
            },
            itemCount: 5,
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 48.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                5,
                (index) => CircleAvatar(
                  backgroundColor: index == 0 ? MyColor.primary : MyColor.empty,
                  child: Text(
                    (index + 1).toString(),
                    style: MyTextStyle.bodyRegular.copyWith(
                      color: index == 0 ? MyColor.white : MyColor.text,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RatingCard extends StatelessWidget {
  final RatingModel rating;

  const RatingCard({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: MyColor.middleGrey,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  rating.username,
                  style: MyTextStyle.bodyTitleRegular,
                ),
                Row(
                  children: [
                    PhosphorIcon(
                      PhosphorIcons.star(PhosphorIconsStyle.fill),
                      size: 20.0,
                      color: MyColor.primary,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      rating.ratingPoint.toString(),
                      style: MyTextStyle.bodyRegular.copyWith(
                        color: MyColor.primary,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 4.0),
            Text(
              DataUtils.convertDateTimeToDateString(datetime: rating.createAt),
              style: MyTextStyle.descriptionRegular.copyWith(
                color: MyColor.darkGrey,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              rating.content,
              style: MyTextStyle.descriptionRegular,
            ),
          ],
        ),
      ),
    );
  }
}
