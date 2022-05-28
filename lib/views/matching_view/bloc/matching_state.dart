part of 'matching_bloc.dart';

@immutable
abstract class MatchingState {}

class MatchingInitial extends MatchingState {}

class MatchingStateFailure extends MatchingState {}

class MatchingSelectRoleSuccess extends MatchingState {}

class MatchingStateGetOptionsOneSuccess extends MatchingState {
  final UserRoles role;
  final List<User> users;

  MatchingStateGetOptionsOneSuccess({required this.role, required this.users});
}

class MatchingStateSelectOptionOneSuccess extends MatchingState {
  final List<User> userList;

  MatchingStateSelectOptionOneSuccess({required this.userList});
}

class MatchingStateSelectOptionTwoSuccess extends MatchingState {}

class MatchingStateApproveSuccess extends MatchingState {}