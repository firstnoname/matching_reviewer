import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/services/services.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileSubmitted>(_onSubmitted);
  }

  FutureOr<void> _onSubmitted(
      ProfileSubmitted event, Emitter<ProfileState> emit) async {
    await UserAPI()
        .updateUserInfo(event.userInfo)
        .then((value) => emit(ProfileUpdateSuccess()))
        .catchError((error) {
      print('update failure -> $error');
      emit(ProfileStateFailure(errorMsg: error.toString()));
    });
  }
}
