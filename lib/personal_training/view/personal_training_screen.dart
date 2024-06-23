import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class PersonalTrainingScreen extends ConsumerWidget {
  static String get routeName => "pt";

  const PersonalTrainingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      appbar: DefaultAppBar(
        title: 'PT샵',
        centerTitle: true,
      ),
      child: Center(
        child: Text('PT샵'),
      ),
    );
  }
}
