import 'package:cafe/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/const/text_styles.dart';
import '../../common/utils/data_utils.dart';
import '../model/product_model.dart';
import '../view/product_detail_screen.dart';

class HorizontalItemList extends StatelessWidget {
  final List<ProductModel> products;

  const HorizontalItemList({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.0,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return GestureDetector(
            onTap: () {
              context.pushNamed(
                ProductDetailScreen.routeName,
                pathParameters: {'id': product.id.toString()},
              );
            },
            child: SizedBox(
              width: 140.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    product.mainImageUrl,
                    fit: BoxFit.cover,
                    height: 140.0,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    product.title,
                    style: MyTextStyle.descriptionRegular,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    product.manufacturingCompany,
                    style: MyTextStyle.minimumRegular.copyWith(
                      color: MyColor.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '${DataUtils.convertPriceToMoneyString(price: product.price)} 원',
                    style: MyTextStyle.bodyBold,
                  ),
                  Text(
                    '구매가격 ${DataUtils.convertPriceToMoneyString(price: product.purchasePrice)}',
                    style: MyTextStyle.minimumRegular.copyWith(
                      color: MyColor.darkGrey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16.0);
        },
      ),
    );
  }
}
