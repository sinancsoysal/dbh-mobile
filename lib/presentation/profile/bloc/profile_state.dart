part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.status = FormzStatus.pure,
    this.name = const Name.pure(),
    this.surname = const Surname.pure(),
    this.permission = const Permission.pure(),
    this.currentPassword = const CurrentPassword.pure(),
    this.newPassword = const NewPassword.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.email = const Email.pure(),
    this.username = const Username.pure(),
  });

  final FormzStatus status;
  final Name name;
  final Surname surname;
  final Username username;
  final Permission permission;
  final CurrentPassword currentPassword;
  final NewPassword newPassword;
  final PhoneNumber phoneNumber;
  final Email email;
  ProfileState copyWith({
    FormzStatus? status,
    Name? name,
    Surname? surname,
    Username? username,
    Permission? permission,
    CurrentPassword? currentPassword,
    NewPassword? newPassword,
    PhoneNumber? phoneNumber,
    Email? email,
  }) {
    return ProfileState(
      status: status ?? this.status,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      username: username ?? this.username,
      permission: permission ?? this.permission,
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
    );
  }

  @override
  List<Object> get props => [
        status,
        name,
        surname,
        username,
        permission,
        currentPassword,
        newPassword,
        phoneNumber,
        email,
      ];
}
