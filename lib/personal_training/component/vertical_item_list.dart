import 'package:cafe/personal_training/component/personal_training_card.dart';
import 'package:cafe/personal_training/view/personal_training_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/layout/default_layout.dart';
import '../model/personal_training_model.dart';

class VerticalItemList extends StatelessWidget {
  final List<PersonalTrainingModel> pts;

  const VerticalItemList({
    super.key,
    required this.pts,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
            top: 8.0, bottom: 40.0, right: 16.0, left: 16.0),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          final pt = pts[index];
          return GestureDetector(
            onTap: () {
              context.pushNamed(
                PersonalTrainingDetailScreen.routeName,
                pathParameters: {"id": pt.id},
              );
            },
            child: PersonalTrainingCard.fromModel(model: pt),
          );
        },
        separatorBuilder: (_, index) {
          return const SizedBox(height: 20.0);
        },
        itemCount: pts.length,
      ),
    );
  }
}
