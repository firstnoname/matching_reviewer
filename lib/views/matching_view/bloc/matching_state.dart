part of 'matching_bloc.dart';

@immutable
abstract class MatchingState {}

class MatchingInitial extends MatchingState {}

class MatchingStateFailure extends MatchingState {}

class MatchingSelectRoleSuccess extends MatchingState {}

class MatchingStateGetOptionsOneSuccess extends MatchingState {
  final List<Matching> products;

  MatchingStateGetOptionsOneSuccess({required this.products});
}

class MatchingStateSelectOptionOneSuccess extends MatchingState {
  final List<User> userList;

  MatchingStateSelectOptionOneSuccess({required this.userList});
}

class MatchingStateSelectOptionTwoSuccess extends MatchingState {}

class MatchingStateApproveSuccess extends MatchingState {
  final List<Matching> products;

  MatchingStateApproveSuccess({required this.products});
}
