import 'dart:convert';

class Food {
  bool freshFood;
  bool processedFood;

  Food({this.freshFood = false, this.processedFood = false});

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source));

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      freshFood: map['fresh_food'] ?? false,
      processedFood: map['processed_food'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fresh_food': freshFood,
      'processed_food': processedFood,
    };
  }
}
