part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterEventFailure extends RegisterEvent {}

class RegisterEventInProgress extends RegisterEvent {}

class RegisterEventSelectImage extends RegisterEvent {}

class RegisterEventSubmittedForm extends RegisterEvent {
  final User userInfo;

  RegisterEventSubmittedForm({required this.userInfo});
}

