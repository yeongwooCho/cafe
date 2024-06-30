import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '카테고리',
            style: MyTextStyle.bodyTitleMedium,
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              _CategoryButton(
                leftTitle: '국산',
                rightTitle: '기구',
                description: '판매',
                onTap: () {},
              ),
              const SizedBox(width: 8.0),
              _CategoryButton(
                leftTitle: '국산',
                rightTitle: '기구',
                description: '구매',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              _CategoryButton(
                leftTitle: '외산',
                rightTitle: '기구',
                description: '판매',
                onTap: () {},
              ),
              const SizedBox(width: 8.0),
              _CategoryButton(
                leftTitle: '외산',
                rightTitle: '기구',
                description: '구매',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final String leftTitle;
  final String rightTitle;
  final String description;
  final VoidCallback onTap;

  const _CategoryButton({
    super.key,
    required this.leftTitle,
    required this.rightTitle,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: MyColor.middleGrey,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      leftTitle,
                      style: MyTextStyle.bodyRegular.copyWith(
                        color: MyColor.primary,
                      ),
                    ),
                    Text(
                      rightTitle,
                      style: MyTextStyle.bodyRegular,
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Text(
                  description,
                  style: MyTextStyle.bigTitleBold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
