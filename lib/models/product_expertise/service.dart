import 'dart:convert';

class Service {
  bool? accomodation;
  bool? tour;
  bool? restaurant;
  bool? cafe;
  bool? other;

  Service({
    this.accomodation,
    this.tour,
    this.restaurant,
    this.cafe,
    this.other,
  });

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'accomodation': accomodation,
      'tour': tour,
      'restaurant': restaurant,
      'cafe': cafe,
      'other': other,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      accomodation: map['accomodation'],
      tour: map['tour'],
      restaurant: map['restaurant'],
      cafe: map['cafe'],
      other: map['other'],
    );
  }
}
