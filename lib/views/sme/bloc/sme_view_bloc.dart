import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/models.dart';
import '../../../services/services.dart';

part 'sme_view_event.dart';

part 'sme_view_state.dart';

class SmeViewBloc extends Bloc<SmeViewEvent, SmeViewState> {
  SmeViewBloc() : super(SmeViewInitial()) {
    on<SmeViewEvent>(_onInitial);
    on<SmeViewEventGetProductList>(_onGetProductList);
    on<SmeViewEventSubmitProduct>(_onSubmitProduct);
  }

  FutureOr<void> _onInitial(SmeViewEvent event, Emitter<SmeViewState> emit) {}

  FutureOr<void> _onGetProductList(
      SmeViewEventGetProductList event, Emitter<SmeViewState> emit) {}

  Future<FutureOr<void>> _onSubmitProduct(
      SmeViewEventSubmitProduct event, Emitter<SmeViewState> emit) async {
    bool isAddedMatching = await MatchingAPI().addMatching(
        entrepreneur: event.entrepreneur,
        category: event.category,
        subCategory: event.subCategory,
        conditions: event.conditions,
        appointment: event.appointment);

    if (isAddedMatching) {
      emit(SmeViewStateSubmitProductSuccess());
    } else {
      emit(SmeViewStateFailure());
    }
  }
}
