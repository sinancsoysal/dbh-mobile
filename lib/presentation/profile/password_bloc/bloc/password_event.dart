part of 'password_bloc.dart';

abstract class PasswordEvent extends Equatable {
  const PasswordEvent();

  @override
  List<Object> get props => [];
}

class CurrentPasswordChanged extends PasswordEvent {
  const CurrentPasswordChanged(this.currentPassword);

  final String currentPassword;

  @override
  List<Object> get props => [currentPassword];
}

class NewPasswordChanged extends PasswordEvent {
  const NewPasswordChanged(this.newPaswword);

  final String newPaswword;

  @override
  List<Object> get props => [newPaswword];
}

class ConfirmNewPasswordChanged extends PasswordEvent {
  const ConfirmNewPasswordChanged(this.confirmNewPassword);

  final String confirmNewPassword;

  @override
  List<Object> get props => [confirmNewPassword];
}

class PasswordChangeSubmitted extends PasswordEvent {
  const PasswordChangeSubmitted();

  @override
  List<Object> get props => [];
}
