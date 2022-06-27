part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeEventInit extends HomeEvent {}

class HomeEventFailure extends HomeEvent {}

class HomeEventReadProducts extends HomeEvent {}