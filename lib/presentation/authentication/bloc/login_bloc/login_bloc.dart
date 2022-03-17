import 'package:bloc/bloc.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../data/models/models/remote/dbh_api/topics/user/auth_result.dart';
import '../../../../data/models/type_parameters/api_result_status_code.dart';
import 'bloc_repository_of_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../authentication_bloc/authentication_repository.dart';
import '../../../../data/models/models/local/login_view/validation_models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
    BuildContext context, {
    required BlocRepositoryOfAuthentication blocRepositoryOfAuthentication,
    required BlocRepositoryOfLogin blocRepositoryOfLogin,
  })  : formAvailable = true,
        _blocRepositoryOfAuthentication = blocRepositoryOfAuthentication,
        _blocRepositoryOfLogin = blocRepositoryOfLogin,
        _context = context,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginFormAvailableOnScreen>(_onLoginFormAvailabiltyChanged);
  }

  final BlocRepositoryOfAuthentication _blocRepositoryOfAuthentication;
  final BlocRepositoryOfLogin _blocRepositoryOfLogin;

  final BuildContext _context;

  /// Indicates that if login form swiped up to the top and user able to
  /// see form details.
  bool formAvailable;

  void _onLoginFormAvailabiltyChanged(
    LoginFormAvailableOnScreen event,
    Emitter<LoginState> emit,
  ) {
    formAvailable = event.available;
    emit(state.copyWith(formAvailableOnScreen: event.available));
  }

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(state.copyWith(
      username: username,
      status: Formz.validate([state.password, username]),
    ));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.username]),
    ));
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        final DataState<AuthResult>? authSuccess =
            await _blocRepositoryOfAuthentication.logIn(
          username: state.username.value,
          password: state.password.value,
        );
        if (authSuccess != null && authSuccess.code != null) {
          if (authSuccess.code!.toApiResultStatusCode !=
              ApiResultStatusCode.success) {
            if (authSuccess.message != null) {
              _blocRepositoryOfLogin.showSnackBar(
                authSuccess.message!,
                _context,
              );
              emit(state.copyWith(status: FormzStatus.submissionFailure));
            }
          }
        } else {
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
        }
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
