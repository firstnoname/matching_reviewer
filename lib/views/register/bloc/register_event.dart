part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegsiterEventFailure extends RegisterEvent {}

class RegisterEventInProgress extends RegisterEvent {}

class RegisterEventSubmittedForm extends RegisterEvent {}

