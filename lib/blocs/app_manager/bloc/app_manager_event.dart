part of 'app_manager_bloc.dart';

@immutable
abstract class AppManagerEvent {}

class AppManagerEventLoginSucceed extends AppManagerEvent {}

class AppManagerEventUserRegisterStart extends AppManagerEvent {}