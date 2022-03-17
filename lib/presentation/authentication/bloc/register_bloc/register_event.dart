part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class UsernameChanged extends RegisterEvent {
  final String name;

  const UsernameChanged(this.name);
  @override
  List<Object> get props => [name];
}

class EmailChanged extends RegisterEvent {
  final String email;

  const EmailChanged(this.email);
  @override
  List<Object> get props => [email];
}

class PasswordChanged extends RegisterEvent {
  final String password;

  const PasswordChanged(this.password);
  @override
  List<Object> get props => [password];
}

class RegisterFormAvailableOnScreen extends RegisterEvent {
  const RegisterFormAvailableOnScreen(this.available);

  final bool available;

  @override
  List<Object> get props => [available];
}

class FirstNameChanged extends RegisterEvent {
  final String firstName;

  const FirstNameChanged(this.firstName);
  @override
  List<Object> get props => [firstName];
}

class LastNameChanged extends RegisterEvent {
  final String lastName;

  const LastNameChanged(this.lastName);
  @override
  List<Object> get props => [lastName];
}

class PhoneNumberChanged extends RegisterEvent {
  final String phoneNumber;

  const PhoneNumberChanged(this.phoneNumber);
  @override
  List<Object> get props => [phoneNumber];
}

class ConfirmPasswordChanged extends RegisterEvent {
  final String confirmPassword;

  const ConfirmPasswordChanged(this.confirmPassword);
  @override
  List<Object> get props => [confirmPassword];
}

class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();
}
