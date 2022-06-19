part of 'app_manager_bloc.dart';

@immutable
abstract class AppManagerState {}

class AppManagerInitial extends AppManagerState {}

class AppManagerStateFailure extends AppManagerState {}

class AppManagerStateUnAuthenticate extends AppManagerState {}

class AppManagerStateAuthenticated extends AppManagerState {}

class AppManagerStateRegisterStart extends AppManagerState {}

class AppManagerStateLoginSuccess extends AppManagerState {}
