import 'dart:async';

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
    on<SmeViewEventGetProductList>(_onGetProductList);
    on<SmeViewEventSubmitProduct>(_onSubmitProduct);
  }

  Future<FutureOr<void>> _onInitial(
      SmeViewEvent event, Emitter<SmeViewState> emit) async {
    _products = await MatchingAPI().getMatchingList(userId: userID);

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
            pictures: event.images));

    bool isAddedMatching =
        await MatchingAPI().addMatching(matchingInfo: matchingInfo);

    if (isAddedMatching) {
      _products.add(matchingInfo);
      emit(SmeViewStateGetProductListSuccess(products: _products));
    } else {
      emit(SmeViewStateFailure());
    }
  }
}
