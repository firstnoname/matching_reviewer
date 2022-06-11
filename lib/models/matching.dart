import 'package:matching_reviewer/models/models.dart';

class Matching {
  final User? entrepreneur;
  final User? reviewer;
  final String? productExpertiseCategory;
  final String? productExpertiseSubCategory;
  final List<String?>? productPicsPath;
  final String? receiptPath;
  final Product? product;

  Matching(
      {this.entrepreneur,
      this.reviewer,
      this.productExpertiseCategory,
      this.productExpertiseSubCategory,
      this.productPicsPath,
      this.receiptPath,
      this.product});

  Map<String, dynamic> toMap() {
    return {
      'entrepreneur': entrepreneur?.toMap(),
      'reviewer': reviewer?.toMap(),
      'productExpertiseCategory': productExpertiseCategory,
      'productExpertiseSubCategory': productExpertiseSubCategory,
      'productPicsPath': productPicsPath,
      'receiptPath': receiptPath,
      'product': product?.toMap(),
    };
  }

  factory Matching.fromMap(Map<String, dynamic> map) {
    return Matching(
      entrepreneur: map['entrepreneur'] != null
          ? User.fromMap(map['entrepreneur'])
          : null,
      reviewer: map['reviewer'] != null ? User.fromMap(map['reviewer']) : null,
      productExpertiseCategory: map['productExpertiseCategory'] ?? '',
      productExpertiseSubCategory: map['productExpertiseSubCategory'] ?? '',
      productPicsPath: map['productPicsPath'] ?? [],
      receiptPath: map['receiptPath'],
      product: map['product'] != null ? Product.fromMap(map['product']) : null,
    );
  }
}
