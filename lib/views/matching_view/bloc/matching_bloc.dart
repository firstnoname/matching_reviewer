import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/services/services.dart';
import 'package:meta/meta.dart';

part 'matching_event.dart';

part 'matching_state.dart';

class MatchingBloc extends Bloc<MatchingEvent, MatchingState> {
  MatchingBloc() : super(MatchingInitial()) {
    on<MatchingEventSelectRole>(_onSelectRole);
  }

  Future<FutureOr<void>> _onSelectRole(
      MatchingEventSelectRole event, Emitter<MatchingState> emit) async {
    // get user list (entrepreneur or reviewer).
    List<User> _users = [];
    if (event.isReviewer) {
      _users = await UserAPI().getUsers(userRole: event.isReviewer ? 'reviewer' : 'entrepreneur');
      emit(MatchingStateGetUsersSuccess(users: _users));
    } else {
      emit(MatchingStateGetUsersSuccess(users: _users));
    }
  }
}
