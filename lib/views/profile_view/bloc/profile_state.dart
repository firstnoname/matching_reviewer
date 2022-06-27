part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileStateFailure extends ProfileState {
  final String errorMsg;

  ProfileStateFailure({required this.errorMsg});
}

class ProfileUpdateSuccess extends ProfileState {}
