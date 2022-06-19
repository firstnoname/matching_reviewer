import 'package:cloud_firestore/cloud_firestore.dart';

enum PaymentType { discussions, noDiscussions }

class Payment {
  DateTime? payDate;
  dynamic payImage;
  String? payType;

  Payment({this.payDate, this.payImage, this.payType});

  Map<String, dynamic> toMap() {
    return {
      'payDate': payDate,
      'payImage': payImage,
      'payType': payType,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      payDate: (map['payDate'] as Timestamp).toDate(),
      payImage: map['payImage'],
      payType: map['payType'] == PaymentType.discussions
          ? PaymentType.discussions.name
          : PaymentType.noDiscussions.name,
    );
  }
}
