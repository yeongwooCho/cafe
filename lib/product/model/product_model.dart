import '../../user/model/user_model.dart';

class ProductModel {
  final int id;
  final UserModel user;
  final String title;
  final String manufacturingCompany;
  final int price;
  final int purchasePrice;
  final String periodOfUse;
  final String warranty;
  final String typeOfTransaction;
  final String mainImageUrl;
  final List<String> detailImageUrls;
  final bool isLike;
  final int likes;
  final DateTime createdAt;

  ProductModel({
    required this.id,
    required this.user,
    required this.title,
    required this.manufacturingCompany,
    required this.price,
    required this.purchasePrice,
    required this.periodOfUse,
    required this.warranty,
    required this.typeOfTransaction,
    required this.mainImageUrl,
    required this.detailImageUrls,
    required this.isLike,
    required this.likes,
    required this.createdAt,
  });

  ProductModel copyWith({
    int? id,
    UserModel? user,
    String? title,
    String? manufacturingCompany,
    int? price,
    int? purchasePrice,
    String? periodOfUse,
    String? warranty,
    String? typeOfTransaction,
    String? mainImageUrl,
    List<String>? detailImageUrls,
    bool? isLike,
    int? likes,
    DateTime? createdAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      user: user ?? this.user,
      title: title ?? this.title,
      manufacturingCompany: manufacturingCompany ?? this.manufacturingCompany,
      price: price ?? this.price,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      periodOfUse: periodOfUse ?? this.periodOfUse,
      warranty: warranty ?? this.warranty,
      typeOfTransaction: typeOfTransaction ?? this.typeOfTransaction,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      detailImageUrls: detailImageUrls ?? this.detailImageUrls,
      isLike: isLike ?? this.isLike,
      likes: likes ?? this.likes,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
