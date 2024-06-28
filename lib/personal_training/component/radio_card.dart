import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';

class RadioCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isSelected;

  const RadioCard({
    super.key,
    required this.title,
    required this.description,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: isSelected ? MyColor.primary : MyColor.middleGrey,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                isSelected
                    ? PhosphorIcon(
                        PhosphorIcons.radioButton(PhosphorIconsStyle.fill),
                        size: 24.0,
                        color: MyColor.primary,
                      )
                    : PhosphorIcon(
                        PhosphorIcons.radioButton(),
                        size: 24.0,
                      ),
                const SizedBox(width: 4.0),
                Text(
                  title,
                  style: MyTextStyle.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Text(
              description,
              style: MyTextStyle.minimumRegular.copyWith(
                color: MyColor.darkGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
