part of 'password_bloc.dart';

class PasswordState extends Equatable {
  final FormzStatus status;

  final CurrentPassword currentPassword;
  final NewPassword newPassword;
  final NewPassword confirmPassword;

  const PasswordState({
    this.status = FormzStatus.pure,
    this.currentPassword = const CurrentPassword.pure(),
    this.newPassword = const NewPassword.pure(),
    this.confirmPassword = const NewPassword.pure(),
  });

  PasswordState copyWith({
    FormzStatus? status,
    CurrentPassword? currentPassword,
    NewPassword? newPassword,
    NewPassword? confirmPassword,
  }) {
    return PasswordState(
        status: status ?? this.status,
        currentPassword: currentPassword ?? this.currentPassword,
        newPassword: newPassword ?? this.newPassword,
        confirmPassword: confirmPassword ?? this.confirmPassword);
  }

  @override
  List<Object> get props =>
      [status, currentPassword, newPassword, confirmPassword];
}
