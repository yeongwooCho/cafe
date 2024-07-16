import 'package:cafe/personal_training/model/personal_training_model.dart';

class PersonalTrainingDetailModel extends PersonalTrainingModel {
  final ShopInfo shop;
  final SellerInfo seller;
  final bool isVisibleSeller;
  final List<String> detailImages;

  PersonalTrainingDetailModel({
    required super.id,
    required super.title,
    required super.description,
    required super.mainImageUrl,
    required super.ratingPoint,
    required super.ratingCount,
    required super.openingHours,
    required super.location,
    required super.categoryStatus,
    required this.shop,
    required this.seller,
    required this.isVisibleSeller,
    required this.detailImages,
  });
}

class ShopInfo {
  final String businessType; // 업종
  final String roadNameAddress; // 도로명 주소
  final String localAddress; // 지번 주소
  final int premium; // 권리금
  final int deposit; // 보증금
  final int monthlyRent; // 월세
  final int administrationCost;

  ShopInfo({
    required this.businessType,
    required this.roadNameAddress,
    required this.localAddress,
    required this.premium,
    required this.deposit,
    required this.monthlyRent,
    required this.administrationCost,
  }); // 관리비
}

class SellerInfo {
  final String name; // 사업 명칭
  final String locationOfBuilding; // 소재지
  final String registrationNumber; // 등록 번호
  final String representative; // 대표자
  final String contactInfo;

  SellerInfo({
    required this.name,
    required this.locationOfBuilding,
    required this.registrationNumber,
    required this.representative,
    required this.contactInfo,
  }); // 연락처
}