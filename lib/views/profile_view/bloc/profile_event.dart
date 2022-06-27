part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class ProfileSubmitted extends ProfileEvent {
  final User userInfo;

  ProfileSubmitted({required this.userInfo});
}