import 'package:matching_reviewer/models/models.dart';

class Matching {
  final User? entrepreneur;
  final User? reviewer;
  final String productExpertiseCategory;
  final String productExpertiseSubCategory;
  final List<String?>? productPicsPath;
  final String? receiptPath;
  final Product? product;

  Matching(
      {this.entrepreneur,
      this.reviewer,
      required this.productExpertiseCategory,
      required this.productExpertiseSubCategory,
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
      entrepreneur: User.fromMap(map['entrepreneur']),
      reviewer: User.fromMap(map['reviewer']),
      productExpertiseCategory: map['productExpertiseCategory'],
      productExpertiseSubCategory: map['productExpertiseSubCategory'],
      productPicsPath: map['productPicsPath'],
      receiptPath: map['receiptPath'],
      product: Product.fromMap(map['product']),
    );
  }
}
