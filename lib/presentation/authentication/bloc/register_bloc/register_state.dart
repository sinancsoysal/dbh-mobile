part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.status = FormzStatus.pure,
    this.firstName = const FirstName.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.username = const Username.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.lastName = const LastName.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.formAvailableOnScreen = true,
  });

  final FormzStatus status;
  final FirstName firstName;
  final Email email;
  final Password password;
  final Username username;
  final PhoneNumber phoneNumber;
  final LastName lastName;
  final ConfirmPassword confirmPassword;

  final bool formAvailableOnScreen;

  @override
  List<Object> get props => [
        status,
        firstName,
        email,
        password,
        username,
        phoneNumber,
        lastName,
        confirmPassword,
        formAvailableOnScreen
      ];

  RegisterState copyWith({
    FormzStatus? status,
    FirstName? firstName,
    Email? email,
    Password? password,
    Username? username,
    PhoneNumber? phoneNumber,
    LastName? lastName,
    ConfirmPassword? confirmPassword,
    bool? formAvailableOnScreen,
  }) {
    return RegisterState(
      status: status ?? this.status,
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      lastName: lastName ?? this.lastName,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formAvailableOnScreen:
          formAvailableOnScreen ?? this.formAvailableOnScreen,
    );
  }
}
