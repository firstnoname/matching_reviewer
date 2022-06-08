import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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

  FutureOr<void> _onSubmitProduct(
      SmeViewEventSubmitProduct event, Emitter<SmeViewState> emit) {}
}
