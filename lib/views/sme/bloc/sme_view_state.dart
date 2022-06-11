part of 'sme_view_bloc.dart';

@immutable
abstract class SmeViewState {}

class SmeViewInitial extends SmeViewState {}

class SmeViewStateFailure extends SmeViewState {}

class SmeViewStateGetProductListSuccess extends SmeViewState {}

class SmeViewStateSubmitProductSuccess extends SmeViewState {
  final Matching matchingInfo;

  SmeViewStateSubmitProductSuccess({required this.matchingInfo});
}
