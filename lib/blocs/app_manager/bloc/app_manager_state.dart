part of 'app_manager_bloc.dart';

@immutable
abstract class AppManagerState {}

class AppManagerInitial extends AppManagerState {}

class AppManagerStateUnauthenticate extends AppManagerState {}

class AppManagerStateAuthenticated extends AppManagerState {}

class AppManagerStateLoginSuccess extends AppManagerState {}
