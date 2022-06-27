import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String? productName;
  final String? conditions;
  final DateTime? appointment;
  List? pictures;
  String? reviewedFormPath;

  Product(
      {this.productName,
      this.conditions,
      this.appointment,
      this.pictures,
      this.reviewedFormPath});

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'conditions': conditions,
      'appointment': appointment,
      'pictures': pictures?.map((e) => e.toString()),
      'reviewedFormPath': reviewedFormPath
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        productName: map['productName'],
        conditions: map['conditions'],
        appointment: (map['appointment'] as Timestamp).toDate(),
        pictures: map['pictures'],
        reviewedFormPath: map['reviewedFormPath']);
  }
}
