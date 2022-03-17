part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends ProfileEvent {
  const NameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class SurnameChanged extends ProfileEvent {
  const SurnameChanged(this.surname);

  final String surname;

  @override
  List<Object> get props => [surname];
}

class UsernameChanged extends ProfileEvent {
  const UsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class PermissionChanged extends ProfileEvent {
  const PermissionChanged(this.permission);

  final String permission;

  @override
  List<Object> get props => [permission];
}

class PhoneNumberChanged extends ProfileEvent {
  const PhoneNumberChanged(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class ProfileSubmitted extends ProfileEvent {
  const ProfileSubmitted();

  @override
  List<Object> get props => [];
}

class EmailChanged extends ProfileEvent {
  const EmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}
