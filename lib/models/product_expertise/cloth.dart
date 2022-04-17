import 'dart:convert';

class Cloth {
  bool? shirt;
  bool? trouser;
  bool? cap;
  bool? scarf;
  bool? skirt;
  bool? shoes;
  bool? belt;
  bool? accessory;
  bool? bag;

  Cloth({
    this.shirt,
    this.trouser,
    this.cap,
    this.scarf,
    this.skirt,
    this.shoes,
    this.belt,
    this.accessory,
    this.bag,
  });

  String toJson() => json.encode(toMap());

  factory Cloth.fromJson(String source) => Cloth.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'shirt': shirt,
      'trouser': trouser,
      'cap': cap,
      'scarf': scarf,
      'skirt': skirt,
      'shoes': shoes,
      'belt': belt,
      'accessory': accessory,
      'bag': bag,
    };
  }

  factory Cloth.fromMap(Map<String, dynamic> map) {
    return Cloth(
      shirt: map['shirt'],
      trouser: map['trouser'],
      cap: map['cap'],
      scarf: map['scarf'],
      skirt: map['skirt'],
      shoes: map['shoes'],
      belt: map['belt'],
      accessory: map['accessory'],
      bag: map['bag'],
    );
  }
}
