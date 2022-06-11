import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/services/services.dart';
import 'package:meta/meta.dart';

part 'matching_event.dart';

part 'matching_state.dart';

class MatchingBloc extends Bloc<MatchingEvent, MatchingState> {
  UserRoles? _selectedRole;
  String? selectedCategory;
  String? selectedSubCategory;
  User? selectedOptionOne;
  User? selectedOptionTwo;

  User get optionOne => selectedOptionOne!;

  User get optionTwo => selectedOptionTwo!;

  MatchingBloc() : super(MatchingInitial()) {
    try {
      on<MatchingEventSelectedRole>(_onSelectedRole);
      on<MatchingSelectedCategory>(_onSelectedCategory);
      on<MatchingEventSelectOptionOne>(_onSelectedOptionOne);
      on<MatchingEventSelectOptionTwo>(_onSelectedOptionTwo);
      on<MatchingEventApproved>(_onSelectedApprove);
    } catch (e) {
      print('error on MatchingBLoC. value -> ${e.toString()}');
    }
  }

  Future<FutureOr<void>> _onSelectedRole(
      MatchingEventSelectedRole event, Emitter<MatchingState> emit) async {
    _selectedRole = event.selectedRole;
    emit(MatchingSelectRoleSuccess());
  }

  Future<FutureOr<void>> _onSelectedCategory(
      MatchingSelectedCategory event, Emitter<MatchingState> emit) async {
    selectedCategory = event.selectedCategory;
    selectedSubCategory = event.selectedSubCategory;
    // get user list (entrepreneur or reviewer).
    List<User> _users = [];

    _users = await UserAPI().getUsers(
        userRole: _selectedRole?.name,
        category: event.selectedCategory,
        subCategory: event.selectedSubCategory);
    emit(MatchingStateGetOptionsOneSuccess(
        role: _selectedRole ?? UserRoles.entrepreneur, users: _users));
  }

  Future<FutureOr<void>> _onSelectedOptionOne(
      MatchingEventSelectOptionOne event, Emitter<MatchingState> emit) async {
    selectedOptionOne = event.optionOne;

    // get user for options two.
    List<User> _users = [];
    _users = await UserAPI().getUsers(
        userRole: _selectedRole?.name == UserRoles.entrepreneur.name
            ? UserRoles.reviewer.name
            : UserRoles.entrepreneur.name,
        category: selectedCategory,
        subCategory: selectedSubCategory);

    print('user for options two -> ${_users.length}');

    emit(MatchingStateSelectOptionOneSuccess(userList: _users));
  }

  FutureOr<void> _onSelectedOptionTwo(
      MatchingEventSelectOptionTwo event, Emitter<MatchingState> emit) {
    selectedOptionTwo = event.optionTwo;
    // emit(MatchingStateSelectOptionTwoSuccess());
  }

  Future<FutureOr<void>> _onSelectedApprove(
      MatchingEventApproved event, Emitter<MatchingState> emit) async {
    // call api to add matching info

    bool isAddedMatching = await MatchingAPI().addMatching(
        reviewer: _selectedRole == UserRoles.reviewer
            ? selectedOptionOne!
            : selectedOptionTwo!,
        entrepreneur: _selectedRole == UserRoles.entrepreneur
            ? selectedOptionOne!
            : selectedOptionTwo!,
        category: selectedCategory!,
        subCategory: selectedSubCategory!,
        appointment: DateTime(1990),
        conditions: '');

    if (isAddedMatching) {
      emit(MatchingStateApproveSuccess());
    } else {
      emit(MatchingStateFailure());
    }
  }
}
