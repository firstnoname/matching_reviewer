part of 'matching_bloc.dart';

@immutable
abstract class MatchingEvent {}

class MatchingEventInitial extends MatchingEvent {}

class MatchingEventSelectedRole extends MatchingEvent {
  final UserRoles selectedRole;

  MatchingEventSelectedRole({required this.selectedRole});
}

class MatchingSelectedCategory extends MatchingEvent {
  final String selectedCategory;
  final String selectedSubCategory;

  MatchingSelectedCategory(
      {required this.selectedCategory, required this.selectedSubCategory});
}

class MatchingEventSelectOptionOne extends MatchingEvent {
  final Matching matching;

  MatchingEventSelectOptionOne({required this.matching});
}

class MatchingEventSelectOptionTwo extends MatchingEvent {
  final User optionTwo;

  MatchingEventSelectOptionTwo({required this.optionTwo});
}

class MatchingEventApproved extends MatchingEvent {}
