import 'dart:convert';

import 'package:matching_reviewer/models/product_expertise/product_expertise.dart';

class ProductExpertise {
  Food? food;
  Cosmetic? cosmetic;

  ProductExpertise({this.food, this.cosmetic});

  factory ProductExpertise.fromMap(Map<String, dynamic> map) {
    return ProductExpertise(
      food: Food.fromMap(map['food']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductExpertise.fromJson(String source) =>
      ProductExpertise.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'food': food?.toMap(),
    };
  }
}
