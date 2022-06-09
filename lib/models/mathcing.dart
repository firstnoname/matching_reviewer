import 'package:matching_reviewer/models/models.dart';

class Matching {
  final User? entrepreneur;
  final User? reviewer;
  final String productExpertiseCategory;
  final String productExpertiseSubCategory;
  final String? conditions;
  final DateTime? appointment;
  final List<String?>? productPicsPath;
  final String? receiptPath;

  Matching(
      {this.entrepreneur,
      this.reviewer,
      required this.productExpertiseCategory,
      required this.productExpertiseSubCategory,
      this.conditions,
      this.appointment,
      this.productPicsPath,
      this.receiptPath});

  Map<String, dynamic> toMap() {
    return {
      'entrepreneur': entrepreneur?.toMap(),
      'reviewer': reviewer?.toMap(),
      'productExpertiseCategory': productExpertiseCategory,
      'productExpertiseSubCategory': productExpertiseSubCategory,
      'conditions': conditions,
      'appointment': appointment,
      'productPicsPath': productPicsPath,
      'receiptPath': receiptPath,
    };
  }

  factory Matching.fromMap(Map<String, dynamic> map) {
    return Matching(
      entrepreneur: User.fromMap(map['entrepreneur']),
      reviewer: User.fromMap(map['reviewer']),
      productExpertiseCategory: map['productExpertiseCategory'],
      productExpertiseSubCategory: map['productExpertiseSubCategory'],
      conditions: map['conditions'],
      appointment: map['appointment'],
      productPicsPath: map['productPicsPath'],
      receiptPath: map['receiptPath'],
    );
  }
}
