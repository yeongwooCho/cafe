import 'package:cafe/common/const/text_styles.dart';
import 'package:cafe/personal_training/component/personal_training_card.dart';
import 'package:cafe/personal_training/view/personal_training_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/personal_training_model.dart';

class HorizontalPageView extends StatelessWidget {
  final String title;
  final List<PersonalTrainingModel> pts;

  const HorizontalPageView({
    super.key,
    required this.title,
    required this.pts,
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
        SizedBox(
          height: 360.0,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.9),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: pts.length,
            itemBuilder: (context, index) {
              final pt = pts[index];

              return InkWell(
                onTap: () {
                  context.pushNamed(
                    PersonalTrainingDetailScreen.routeName,
                    pathParameters: {"id": pt.id},
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 8.0),
                  child: PersonalTrainingCard.fromModel(model: pt),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
