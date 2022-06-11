class Product {
  final String? conditions;
  final DateTime? appointment;
  final List? pictures;

  Product({this.conditions, this.appointment, this.pictures});

  Map<String, dynamic> toMap() {
    return {
      'conditions': conditions,
      'appointment': appointment,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      conditions: map['conditions'],
      appointment: map['appointment'],
    );
  }
}
