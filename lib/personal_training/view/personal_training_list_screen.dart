import 'package:cafe/common/component/horizontal_button_list.dart';
import 'package:cafe/personal_training/provider/personal_training_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/component/divider_container.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class PersonalTrainingListScreen extends ConsumerWidget {
  static String get routeName => 'personal_training_list';

  const PersonalTrainingListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pt = ref.watch(personalTrainingProvider);
    final imageWidth = (MediaQuery.of(context).size.width - 48 - 16) / 3;

    return DefaultLayout(
      appbar: const DefaultAppBar(title: 'PT샵 리스트'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HorizontalButtonList(buttons: [
              HorizontalButtonModel(
                title: 'afsd',
                onTap: () {},
              ),
            ]),
            const DividerContainer(),
            const DividerContainer(),
          ],
        ),
      ),
    );
  }
}
