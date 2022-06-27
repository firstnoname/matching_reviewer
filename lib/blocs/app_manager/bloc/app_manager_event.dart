part of 'app_manager_bloc.dart';

@immutable
abstract class AppManagerEvent with NoIndicator {}

class AppManagerEventFirebaseAuthenticated extends AppManagerEvent {}

class AppManagerEventUserRegisterStart extends AppManagerEvent {}

class AppManagerEventLoginSucceed extends AppManagerEvent {}

class AppManagerEventLoginFailure extends AppManagerEvent {
  final String message;

  AppManagerEventLoginFailure({required this.message});
}
