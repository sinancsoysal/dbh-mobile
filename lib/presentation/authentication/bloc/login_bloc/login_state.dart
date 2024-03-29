part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState(
      {this.status = FormzStatus.pure,
      this.username = const Username.pure(),
      this.password = const Password.pure(),
      this.formAvailableOnScreen = true});

  final FormzStatus status;
  final Username username;
  final Password password;
  final bool formAvailableOnScreen;

  LoginState copyWith(
      {FormzStatus? status,
      Username? username,
      Password? password,
      bool? formAvailableOnScreen}) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      formAvailableOnScreen:
          formAvailableOnScreen ?? this.formAvailableOnScreen,
    );
  }

  @override
  List<Object> get props => [status, username, password, formAvailableOnScreen];
}
