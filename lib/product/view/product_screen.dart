import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class ProductScreen extends ConsumerWidget {
  static String get routeName => "product";

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '중고거래',
        centerTitle: true,
      ),
      child: Center(
        child: Text('중고거래'),
      ),
    );
  }
}
