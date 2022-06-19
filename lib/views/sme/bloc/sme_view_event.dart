part of 'sme_view_bloc.dart';

@immutable
abstract class SmeViewEvent {}

class SmeViewEventInitial extends SmeViewEvent {}

class SmeViewEventGetProductList extends SmeViewEvent {}

class SmeViewEventSubmitProduct extends SmeViewEvent {
  final User entrepreneur;
  final String category;
  final String subCategory;
  final DateTime appointment;
  final String conditions;
  final String prodName;
  final List? images;
  final PaymentType paymentType;
  final Uint8List paymentSlip;

  SmeViewEventSubmitProduct(
      {required this.entrepreneur,
      required this.category,
      required this.subCategory,
      required this.appointment,
      required this.conditions,
      required this.prodName,
      this.images,
      required this.paymentType,
      required this.paymentSlip});
}
