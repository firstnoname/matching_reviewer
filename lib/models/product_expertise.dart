import 'dart:convert';

import 'package:matching_reviewer/models/product_expertise/product_expertise.dart';

class ProductExpertise {
  Food? food;
  Cosmetic? cosmetic;
  Cloth? cloth;
  Service? service;

  ProductExpertise({this.food, this.cosmetic, this.cloth, this.service});

  factory ProductExpertise.fromMap(Map<String, dynamic> map) {
    return ProductExpertise(
      food: Food.fromMap(map['food']),
      cosmetic: Cosmetic.fromMap(map['cosmetic']),
      cloth: Cloth.fromMap(map['cloth']),
      service: Service.fromMap(map['service']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductExpertise.fromJson(String source) =>
      ProductExpertise.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'food': food?.toMap(),
      'cosmetic': cosmetic?.toMap(),
      'cloth': cloth?.toMap(),
      'service': service?.toMap(),
    };
  }
}
