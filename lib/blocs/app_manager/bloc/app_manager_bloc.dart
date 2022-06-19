import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:matching_reviewer/models/models.dart' as app_models;
import 'package:matching_reviewer/services/services.dart';
import 'package:meta/meta.dart';

part 'app_manager_event.dart';

part 'app_manager_state.dart';

class AppManagerBloc extends Bloc<AppManagerEvent, AppManagerState> {
  late Authentication _appAuth;

  Authentication get appAuth => _appAuth;

  User? _currentUser;

  User? get currentUser => _currentUser;

  app_models.User? _member;

  get member => _member;

  AppManagerBloc() : super(AppManagerInitial()) {
    _appAuth = Authentication(this);

    on<AppManagerEventFirebaseAuthenticated>(_onFirebaseAuthenticated);
    on<AppManagerEventUserRegisterStart>(_onUserRegisterStart);
    on<AppManagerEventLoginSucceed>(_onLoginSucceed);
    on<AppManagerEventLoginFailure>(_onLoginFailure);
  }

  void updateCurrentUserProfile(User? userAuth, app_models.User? member) {
    _member = member;
    _currentUser = userAuth;
  }

  FutureOr<void> _onFirebaseAuthenticated(
      AppManagerEventFirebaseAuthenticated event,
      Emitter<AppManagerState> emit) {
    appAuth.checkCurrentUserProfile();
  }

  FutureOr<void> _onUserRegisterStart(
      AppManagerEventUserRegisterStart event, Emitter<AppManagerState> emit) {
    emit(AppManagerStateRegisterStart());
  }

  FutureOr<void> _onLoginSucceed(
      AppManagerEventLoginSucceed event, Emitter<AppManagerState> emit) {
    emit(AppManagerStateLoginSuccess());
  }

  FutureOr<void> _onLoginFailure(
      AppManagerEventLoginFailure event, Emitter<AppManagerState> emit) {
    emit(AppManagerStateUnAuthenticate());
  }
}
