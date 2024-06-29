import '../../user/model/user_model.dart';

class ProductModel {
  final int id;
  final UserModel user;
  final String title;
  final int price;
  final String mainImageUrl;
  final List<String> detailImageUrls;
  final bool isLike;
  final int likes;
  final DateTime createdAt;

  ProductModel({
    required this.id,
    required this.user,
    required this.title,
    required this.price,
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
    int? price,
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
      price: price ?? this.price,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      detailImageUrls: detailImageUrls ?? this.detailImageUrls,
      isLike: isLike ?? this.isLike,
      likes: likes ?? this.likes,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
