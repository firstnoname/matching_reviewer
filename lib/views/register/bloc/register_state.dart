part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterStateInProgress extends RegisterState {}

class RegisterStateFailure extends RegisterState {
  final String message;

  RegisterStateFailure({required this.message});
}

class RegisterStateSucceed extends RegisterState {}


