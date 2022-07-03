part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeStateInProgress extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeStateFailure extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeStateReadProductsSuccess extends HomeState {
  final List<Matching> products;

  HomeStateReadProductsSuccess({required this.products});

  @override
  List<Object?> get props => [products];
}

class HomeStateUpdateProdSuccess extends HomeState {
  final List<Matching> products;

  HomeStateUpdateProdSuccess({required this.products});

  @override
  List<Object?> get props => [products];
}
