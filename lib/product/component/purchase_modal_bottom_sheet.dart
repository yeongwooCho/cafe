import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/cart/provider/cart_provider.dart';
import '../../common/component/default_button.dart';
import '../../common/component/show/show_custom_toast.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/utils/data_utils.dart';
import '../../order/view/create_order_screen.dart';
import '../model/product_model.dart';

class PurchaseModalBottomSheet extends ConsumerStatefulWidget {
  final ProductModel product;

  const PurchaseModalBottomSheet({
    super.key,
    required this.product,
  });

  @override
  ConsumerState<PurchaseModalBottomSheet> createState() =>
      _PurchaseModalBottomSheetState();
}

class _PurchaseModalBottomSheetState
    extends ConsumerState<PurchaseModalBottomSheet> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyColor.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.0),
        ),
      ),
      width: double.infinity,
      height: 360.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Image.asset(
                    widget.product.mainImageUrl,
                    width: 120.0,
                    height: 120.0,
                  ),
                  const SizedBox(width: 12.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.title,
                        style: MyTextStyle.bodyRegular,
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Text(
                          //   "${DataUtils.convertPriceToMoneyString(
                          //     price: widget.product.price *
                          //         (100 - widget.product.sale) ~/
                          //         100,
                          //   )} 원",
                          //   style: MyTextStyle.bigTitleBold,
                          // ),
                          const SizedBox(width: 8.0),
                          Text(
                            '${DataUtils.convertPriceToMoneyString(
                              price: widget.product.price,
                            )} 원',
                            style: MyTextStyle.descriptionRegular.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: MyColor.darkGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '수량 선택',
                  style: MyTextStyle.bodyMedium,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (count > 1) {
                          setState(() {
                            count--;
                          });
                        }
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: MyColor.middleGrey,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PhosphorIcon(
                            PhosphorIcons.minus(),
                            size: 20.0,
                            color: MyColor.text,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      count.toString(),
                      style: MyTextStyle.bigTitleRegular,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: MyColor.middleGrey,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PhosphorIcon(
                            PhosphorIcons.plus(),
                            size: 20.0,
                            color: MyColor.text,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 40.0),
            Row(
              children: [
                Expanded(
                  child: SecondaryButton(
                    onPressed: () {
                      ref.read(cartProvider.notifier).addProduct(
                            product: widget.product,
                            amount: count,
                          );

                      context.pop();

                      showCustomToast(context, msg: '장바구니에 상품을 담았습니다.');
                    },
                    child: const Text('장바구니 담기'),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: PrimaryButton(
                    onPressed: () {
                      ref
                          .read(cartProvider.notifier)
                          .updateAllSelected(isSelected: false);
                      ref
                          .read(cartProvider.notifier)
                          .addProduct(product: widget.product, amount: count);
                      context.goNamed(CreateOrderScreen.routeName);
                    },
                    child: const Text('바로 구매하기'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
