import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:matching_reviewer/services/services.dart';
import 'package:meta/meta.dart';

import '../../../../models/models.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<Matching> _products = [];

  HomeBloc() : super(HomeInitial()) {
    on<HomeEventReadProducts>(_onRead);
    on<HomeEventCloseCase>(_onCloseCase);
  }

  FutureOr<void> _onRead(
      HomeEventReadProducts event, Emitter<HomeState> emit) async {
    _products = await MatchingAPI().getMatchingList(isReviewerNull: false);

    emit(HomeStateReadProductsSuccess(products: _products));
  }

  FutureOr<void> _onCloseCase(
      HomeEventCloseCase event, Emitter<HomeState> emit) async {
    emit(HomeStateInProgress());
    int i = _products.indexWhere((prod) => prod.id == event.prodIdToDisable);
    _products[i].status = MatchingCaseStatus.disable;

    bool isSuccess =
        await MatchingAPI().updateMatchingStatus(matchingInfo: _products[i]);

    if (isSuccess) {
      emit(HomeStateUpdateProdSuccess(products: _products));
    } else {
      emit(HomeStateFailure());
    }
  }
}
