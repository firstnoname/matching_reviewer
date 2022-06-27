part of 'reviewer_bloc.dart';

@immutable
abstract class ReviewerState {}

class ReviewerInitial extends ReviewerState {}

class ReviewerStateGetProductSuccess extends ReviewerState {
  final List<Matching> products;

  ReviewerStateGetProductSuccess({required this.products});
}

class ReviewerStateUploadFileSuccess extends ReviewerState {}

class ReviewerStateFailure extends ReviewerState {}
