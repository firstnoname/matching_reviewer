part of 'sme_view_bloc.dart';

@immutable
abstract class SmeViewState {}

class SmeViewInitial extends SmeViewState {}

class SmeViewInProgress extends SmeViewState {}

class SmeViewStateFailure extends SmeViewState {}

class SmeViewStateGetProductListSuccess extends SmeViewState {
  final List<Matching> products;

  SmeViewStateGetProductListSuccess({required this.products});
}

class SmeViewStateSubmitSuccess extends SmeViewState {}
