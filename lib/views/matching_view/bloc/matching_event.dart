part of 'matching_bloc.dart';

@immutable
abstract class MatchingEvent {}

class MatchingEventSelectRole extends MatchingEvent {
  final bool isReviewer;

  MatchingEventSelectRole({required this.isReviewer});
}
