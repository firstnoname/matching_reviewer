part of 'matching_bloc.dart';

@immutable
abstract class MatchingState {}

class MatchingInitial extends MatchingState {}

class MatchingStateGetUsersSuccess extends MatchingState {
  final List<User> users;

  MatchingStateGetUsersSuccess({required this.users});
}
