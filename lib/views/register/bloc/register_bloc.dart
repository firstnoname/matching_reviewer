import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:matching_reviewer/models/user.dart';
import 'package:matching_reviewer/services/services.dart';
import 'package:matching_reviewer/utilities/utilities.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  late Uint8List? _imageBytes;

  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEventSelectImage>(_onSelectImage);
    on<RegisterEventSubmittedForm>(_onSubmittedForm);
  }

  FutureOr<void> _onSelectImage(
      RegisterEventSelectImage event, Emitter<RegisterState> emit) async {
    _imageBytes = await ImagePicker().getImageBytes();
    emit(RegisterStateSelectImageSuccess(imageBytes: _imageBytes));
  }

  Future<FutureOr<void>> _onSubmittedForm(
      RegisterEventSubmittedForm event, Emitter<RegisterState> emit) async {
    final _path = "profile_users/${event.userInfo.id}";

    String? _uploadedProfilePath =
        await ImageApi().uploadFile(_imageBytes!, _path);

    if (_uploadedProfilePath.isNotEmpty) {
      event.userInfo.imageProfilePath = _uploadedProfilePath;
      bool _isUserInfoSuccess =
          await UserAPI().addUser(userInfo: event.userInfo);
      if (_isUserInfoSuccess) {
        emit(RegisterStateSucceed());
      }
    }

    emit(RegisterStateFailure(
        message: 'Something went wrong, Add user failure.'));
  }
}
