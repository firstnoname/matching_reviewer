import 'package:matching_reviewer/models/models.dart';

enum MatchingCaseStatus { enable, disable }

class Matching {
  String? id;
  final User? entrepreneur;
  User? reviewer;
  final String? productExpertiseCategory;
  final String? productExpertiseSubCategory;
  Product? product;
  final Payment? payment;
  MatchingCaseStatus? status;

  Matching(
      {this.id,
      this.entrepreneur,
      this.reviewer,
      this.productExpertiseCategory,
      this.productExpertiseSubCategory,
      this.product,
      this.payment,
      this.status});

  Map<String, dynamic> toMap() {
    return {
      'entrepreneur': entrepreneur?.toMap(),
      'reviewer': reviewer?.toMap(),
      'productExpertiseCategory': productExpertiseCategory,
      'productExpertiseSubCategory': productExpertiseSubCategory,
      'product': product?.toMap(),
      'payment': payment?.toMap(),
      'status': status == null
          ? MatchingCaseStatus.enable.name
          : status == MatchingCaseStatus.enable
              ? MatchingCaseStatus.enable
              : MatchingCaseStatus.disable.name,
    };
  }

  factory Matching.fromMap(Map<String, dynamic> map) {
    return Matching(
      id: map['id'],
      entrepreneur: map['entrepreneur'] != null
          ? User.fromMap(map['entrepreneur'])
          : null,
      reviewer: map['reviewer'] != null ? User.fromMap(map['reviewer']) : null,
      productExpertiseCategory: map['productExpertiseCategory'] ?? '',
      productExpertiseSubCategory: map['productExpertiseSubCategory'] ?? '',
      product: map['product'] != null ? Product.fromMap(map['product']) : null,
      payment: map['payment'] != null ? Payment.fromMap(map['payment']) : null,
      status: map['status'] == MatchingCaseStatus.enable.name
          ? MatchingCaseStatus.enable
          : MatchingCaseStatus.disable,
    );
  }
}
