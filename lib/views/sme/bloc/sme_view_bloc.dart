import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/models.dart';
import '../../../services/services.dart';

part 'sme_view_event.dart';

part 'sme_view_state.dart';

class SmeViewBloc extends Bloc<SmeViewEvent, SmeViewState> {
  SmeViewBloc() : super(SmeViewInitial()) {
    on<SmeViewEventInitial>(_onInitial);
    on<SmeViewEventGetProductList>(_onGetProductList);
    on<SmeViewEventSubmitProduct>(_onSubmitProduct);
  }

  FutureOr<void> _onInitial(SmeViewEvent event, Emitter<SmeViewState> emit) {
    print('SmeViewBloc init');
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
            appointment: event.appointment, conditions: event.conditions));

    bool isAddedMatching =
        await MatchingAPI().addMatching(matchingInfo: matchingInfo);

    if (isAddedMatching) {
      emit(SmeViewStateSubmitProductSuccess(matchingInfo: matchingInfo));
    } else {
      emit(SmeViewStateFailure());
    }
  }
}
