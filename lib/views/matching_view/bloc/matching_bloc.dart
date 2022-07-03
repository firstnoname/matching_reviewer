import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/services/services.dart';

part 'matching_event.dart';

part 'matching_state.dart';

class MatchingBloc extends Bloc<MatchingEvent, MatchingState> {
  String? selectedCategory;
  String? selectedSubCategory;
  User? selectedOptionOne;
  User? selectedOptionTwo;
  late Matching _matchingInfo;

  User get optionOne => selectedOptionOne!;

  User get optionTwo => selectedOptionTwo!;

  List<Matching> _products = [];

  MatchingBloc() : super(MatchingInitial()) {
    try {
      on<MatchingEventInit>(_onInit);
      on<MatchingEventSelectedRole>(_onSelectedRole);
      on<MatchingSelectedCategory>(_onSelectedCategory);
      on<MatchingEventSelectOptionOne>(_onSelectedOptionOne);
      on<MatchingEventSelectOptionTwo>(_onSelectedOptionTwo);
      on<MatchingEventApproved>(_onSelectedApprove);
    } catch (e) {
      debugPrint('error on MatchingBLoC. value -> ${e.toString()}');
    }
  }

  FutureOr<void> _onInit(
      MatchingEventInit event, Emitter<MatchingState> emit) async {
    _products = await MatchingAPI().getMatchingList();
    emit(MatchingStateGetProductSuccess(matchingList: _products));
  }

  Future<FutureOr<void>> _onSelectedRole(
      MatchingEventSelectedRole event, Emitter<MatchingState> emit) async {
    emit(MatchingSelectRoleSuccess());
  }

  Future<FutureOr<void>> _onSelectedCategory(
      MatchingSelectedCategory event, Emitter<MatchingState> emit) async {
    selectedCategory = event.selectedCategory;
    selectedSubCategory = event.selectedSubCategory;

    _products = await MatchingAPI()
        .getMatchingByCategory(subCategory: event.selectedSubCategory);

    emit(MatchingStateGetOptionsOneSuccess(products: _products));
  }

  Future<FutureOr<void>> _onSelectedOptionOne(
      MatchingEventSelectOptionOne event, Emitter<MatchingState> emit) async {
    selectedOptionOne = event.matching.entrepreneur;
    _matchingInfo = event.matching;

    // get user for options two.
    List<User> _users = [];
    _users = await UserAPI().getUsers(
        userRole: UserRoles.reviewer.name,
        category: event.matching.productExpertiseCategory,
        subCategory: event.matching.productExpertiseSubCategory);

    debugPrint('user for options two -> ${_users.length}');

    emit(MatchingStateSelectOptionOneSuccess(userList: _users));
  }

  FutureOr<void> _onSelectedOptionTwo(
      MatchingEventSelectOptionTwo event, Emitter<MatchingState> emit) {
    selectedOptionTwo = event.optionTwo;
    _matchingInfo.reviewer = event.optionTwo;
    emit(MatchingStateSelectOptionTwoSuccess());
  }

  Future<FutureOr<void>> _onSelectedApprove(
      MatchingEventApproved event, Emitter<MatchingState> emit) async {
    bool isAddedMatching =
        await MatchingAPI().updateMatchingInfo(matchingInfo: _matchingInfo);

    if (isAddedMatching) {
      _products.removeWhere((product) => product.id == _matchingInfo.id);
      emit(MatchingStateApproveSuccess(products: _products));
    } else {
      emit(MatchingStateFailure());
    }
  }
}
