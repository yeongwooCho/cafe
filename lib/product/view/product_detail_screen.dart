import 'package:cafe/cart/provider/cart_provider.dart';
import 'package:cafe/order/view/create_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hidable/hidable.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/component/default_button.dart';
import '../../common/component/divider_container.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../common/utils/data_utils.dart';
import '../../user/model/user_model.dart';
import '../component/horizontal_item_list.dart';
import '../component/rating_container.dart';
import '../model/product_model.dart';
import '../provider/product_provider.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  static String get routeName => 'product_detail';

  final int id;

  const ProductDetailScreen({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productDetailProvider(widget.id));
    final productPrefer = ref.watch(productPreferProvider);

    final fullWidth = MediaQuery.of(context).size.width;
    final safeTopPadding = MediaQuery.of(context).padding.top;

    return DefaultLayout(
      appbar: Hidable(
        preferredWidgetSize:
            Size.fromHeight(DefaultAppBar.defaultAppBarHeight + safeTopPadding),
        controller: scrollController,
        child: const DefaultAppBar(title: ''),
      ),
      bottomNavigationBar: Hidable(
        controller: scrollController,
        preferredWidgetSize: const Size.fromHeight(68),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    width: 1.0,
                    color: MyColor.middleGrey,
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    ref.read(productProvider.notifier).updateLike(
                          productId: product.id,
                          isLike: !product.isLike,
                        );
                  },
                  icon: product.isLike
                      ? PhosphorIcon(
                          PhosphorIcons.heart(PhosphorIconsStyle.fill),
                          color: MyColor.heart,
                          size: 32.0,
                        )
                      : PhosphorIcon(
                          PhosphorIcons.heart(),
                          color: MyColor.middleGrey,
                          size: 32.0,
                        ),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: PrimaryButton(
                  onPressed: () {
                    ref.read(cartProvider.notifier).removeAll();

                    ref
                        .read(cartProvider.notifier)
                        .addProduct(product: product, amount: 1);

                    context.pushNamed(CreateOrderScreen.routeName);
                  },
                  child: const Text('구매하기'),
                ),
              ),
            ],
          ),
        ),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              product.mainImageUrl,
              width: fullWidth,
              height: fullWidth,
              fit: BoxFit.fitWidth,
            ),
            renderProductInfo(product: product),
            const DividerContainer(),
            renderDescriptionImages(
              detailImages: product.detailImageUrls,
              periodOfUse: product.periodOfUse,
              warranty: product.warranty,
              address: product.user.address.address,
              typeOfTransaction: product.typeOfTransaction,
            ),
            const SizedBox(height: 40.0),
            const DividerContainer(),
            const RatingContainer(),
            const DividerContainer(),
            renderSellerInfo(user: product.user),
            const DividerContainer(),
            const Padding(
              padding: EdgeInsets.only(
                  left: 24.0, right: 24.0, top: 40.0, bottom: 8.0),
              child: Text(
                '추천 상품',
                style: MyTextStyle.bodyTitleMedium,
              ),
            ),
            HorizontalItemList(products: productPrefer),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }

  Widget renderProductInfo({
    required ProductModel product,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                product.title,
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(width: 12.0),
              Text(
                '(제조사: ${product.manufacturingCompany})',
                style: MyTextStyle.descriptionRegular.copyWith(
                  color: MyColor.darkGrey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Text(
                '${DataUtils.convertPriceToMoneyString(price: product.price)} 원',
                style: MyTextStyle.bigTitleBold,
              ),
              const SizedBox(width: 12.0),
              Text(
                '(구매가격 ${DataUtils.convertPriceToMoneyString(price: product.purchasePrice)} 원)',
                style: MyTextStyle.descriptionRegular.copyWith(
                  color: MyColor.darkGrey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${DateTime.now().difference(product.createdAt).inDays}일 전',
                style: MyTextStyle.minimumRegular.copyWith(
                  color: MyColor.darkGrey,
                ),
              ),
              Row(
                children: [
                  PhosphorIcon(
                    PhosphorIcons.heart(PhosphorIconsStyle.fill),
                    color: MyColor.darkGrey,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    '${product.likes}',
                    style: MyTextStyle.minimumRegular.copyWith(
                      color: MyColor.darkGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget renderDescriptionImages({
    required List<String> detailImages,
    required String periodOfUse,
    required String warranty,
    required String address,
    required String typeOfTransaction,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24.0, top: 40.0, bottom: 8.0),
          child: Text(
            '상품 정보',
            style: MyTextStyle.bigTitleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 8.0),
          child: Column(
            children: [
              _renderTitleAndDescription(
                title: '사용기간',
                description: '$periodOfUse 개월',
              ),
              _renderTitleAndDescription(
                title: '보증기간',
                description: '$warranty 개월',
              ),
              _renderTitleAndDescription(
                title: '판매자 위치',
                description: address,
              ),
              _renderTitleAndDescription(
                title: '거래방식',
                description: typeOfTransaction,
              ),
            ],
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: detailImages.length,
          itemBuilder: (context, index) {
            return Container(
              color: MyColor.darkGrey,
              child: Image.asset(
                detailImages[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget renderSellerInfo({
    required UserModel user,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '판매자 정보',
                style: MyTextStyle.bodyTitleMedium,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  '판매중인 상품보기',
                  style: MyTextStyle.bodyRegular.copyWith(
                    color: MyColor.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Image.asset(
                user.profileImage,
                width: 100.0,
                height: 100.0,
              ),
              const SizedBox(width: 12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.nickname,
                    style: MyTextStyle.bigTitleBold,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '등급: ${user.grade}',
                    style: MyTextStyle.descriptionRegular,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _renderTitleAndDescription({
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.0,
            child: Text(
              title,
              style: MyTextStyle.descriptionMedium,
            ),
          ),
          Expanded(
            child: Text(
              description,
              style: MyTextStyle.descriptionRegular,
            ),
          ),
        ],
      ),
    );
  }
}
