import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:matching_reviewer/models/models.dart' as appModels;
import 'package:matching_reviewer/services/services.dart';
import 'package:meta/meta.dart';

part 'app_manager_event.dart';
part 'app_manager_state.dart';

class AppManagerBloc extends Bloc<AppManagerEvent, AppManagerState> {
  late Authentication _appAuth;

  Authentication get appAuth => _appAuth;

  User? _currentUser;
  User? get currentUser => _currentUser;

  appModels.User? _member;
  get member => _member;

  AppManagerBloc() : super(AppManagerInitial()) {
    _appAuth = Authentication(this);

    on<AppManagerEventLoginSucceed>(_onLoginSucceed);
    on<AppManagerEventUserRegisterStart>(_onUserRegisterStart);
  }

  void updateCurrentUserProfile(User? userAuth, appModels.User? member) {
    _member = member;
    _currentUser = userAuth;
  }

  FutureOr<void> _onUserRegisterStart(AppManagerEventUserRegisterStart event, Emitter<AppManagerState> emit) {
  }

  FutureOr<void> _onLoginSucceed(
      AppManagerEventLoginSucceed event, Emitter<AppManagerState> emit) {
    emit(AppManagerStateLoginSuccess());
  }

  
}
