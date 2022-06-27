import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/models.dart';
import '../../../services/services.dart';

part 'sme_view_event.dart';

part 'sme_view_state.dart';

class SmeViewBloc extends Bloc<SmeViewEvent, SmeViewState> {
  final String userID;
  List<Matching> _products = [];

  SmeViewBloc({required this.userID}) : super(SmeViewInitial()) {
    on<SmeViewEventInitial>(_onInitial);
    on<SmeViewEventInProgress>(_onInProgress);
    on<SmeViewEventGetProductList>(_onGetProductList);
    on<SmeViewEventSubmitProduct>(_onSubmitProduct);
  }

  Future<FutureOr<void>> _onInitial(
      SmeViewEvent event, Emitter<SmeViewState> emit) async {
    _products = await MatchingAPI().getMatchingListByUserId(userId: userID);

    emit(SmeViewStateGetProductListSuccess(products: _products));
  }

  FutureOr<void> _onGetProductList(
      SmeViewEventGetProductList event, Emitter<SmeViewState> emit) {}

  Future<FutureOr<void>> _onSubmitProduct(
      SmeViewEventSubmitProduct event, Emitter<SmeViewState> emit) async {
    Matching matchingInfo = Matching(
      entrepreneur: event.entrepreneur,
      productExpertiseCategory: event.category,
      productExpertiseSubCategory: event.subCategory,
      product: Product(
          productName: event.prodName,
          appointment: event.appointment,
          conditions: event.conditions,
          pictures: event.images),
      payment: Payment(
          payType: event.paymentType.name,
          payDate: DateTime.now(),
          payImage: event.paymentSlip),
    );

    matchingInfo = await MatchingAPI().addMatching(matchingInfo: matchingInfo);

    if (matchingInfo.id != null) {
      emit(SmeViewStateSubmitSuccess());
      add(SmeViewEventInProgress(createdProduct: matchingInfo));
    } else {
      emit(SmeViewStateFailure());
    }
  }

  FutureOr<void> _onInProgress(
      SmeViewEventInProgress event, Emitter<SmeViewState> emit) {
    _products.add(event.createdProduct);
    emit(SmeViewStateGetProductListSuccess(products: _products));
  }
}
