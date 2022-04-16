import 'dart:convert';

class Cosmetic {
  bool? hairCosmetic;
  bool? faceCosmetics;
  bool? bodyCosmetics;
  bool? fragrances;
  bool? miscelaneousCosmetic;
  bool? other;

  Cosmetic({
    this.hairCosmetic = false,
    this.faceCosmetics = false,
    this.bodyCosmetics = false,
    this.fragrances = false,
    this.miscelaneousCosmetic = false,
    this.other = false,
  });

  String toJson() => json.encode(toMap());

  factory Cosmetic.fromJson(String source) =>
      Cosmetic.fromMap(json.decode(source));

  factory Cosmetic.fromMap(Map<String, dynamic> map) {
    return Cosmetic(
      hairCosmetic: map['hair_cosmetic'],
      faceCosmetics: map['face_cosmetics'],
      bodyCosmetics: map['body_cosmetics'],
      fragrances: map['fragrances'],
      miscelaneousCosmetic: map['miscelaneous_cosmetic'],
      other: map['other'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hair_cosmetic': hairCosmetic,
      'face_cosmetics': faceCosmetics,
      'body_cosmetics': bodyCosmetics,
      'fragrances': fragrances,
      'miscelaneous_cosmetic': miscelaneousCosmetic,
      'other': other,
    };
  }
}
