import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../../config/routes/navigation_routes.dart';
import '../../../../config/routes/navigation_service.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../data/models/models/api_result.dart';
import '../../../../data/models/models/local/register_view/validation_models.dart';
import '../../../../data/models/type_parameters/api_result_status_code.dart';
import 'bloc_repository_of_register.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(BuildContext context,
      {required BlocRepositoryOfRegister blocRepositoryOfRegister})
      : formAvailable = true,
        _blocRepositoryOfRegister = blocRepositoryOfRegister,
        _context = context,
        super(const RegisterState()) {
    on<UsernameChanged>(_onUsernameChanged);
    on<FirstNameChanged>(_onFirstNameChanged);
    on<LastNameChanged>(_onLastNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<RegisterSubmitted>(_onSubmitted);
    on<RegisterFormAvailableOnScreen>(_onRegisterFormAvailabiltyChanged);
  }

  final BlocRepositoryOfRegister _blocRepositoryOfRegister;
  final BuildContext _context;

  /// Indicates that if login form swiped up to the top and user able to
  /// see form details.
  bool formAvailable;

  FutureOr<void> _onUsernameChanged(
    UsernameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final username = Username.dirty(event.name);
    final List<FormzInput> stateFieldsWithChangedValue = [
      username,
      state.confirmPassword,
      state.email,
      state.lastName,
      state.password,
      state.phoneNumber,
      state.firstName,
    ];
    emit(
      state.copyWith(
        username: username,
        status: Formz.validate(stateFieldsWithChangedValue),
      ),
    );
  }

  FutureOr<void> _onPasswordChanged(
    PasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    final password = Password.dirty(event.password);
    final List<FormzInput> stateFieldsWithChangedValue = [
      password,
      state.firstName,
      state.confirmPassword,
      state.email,
      state.lastName,
      state.phoneNumber,
      state.username,
    ];

    emit(
      state.copyWith(
        password: password,
        status: Formz.validate(stateFieldsWithChangedValue),
      ),
    );
  }

  FutureOr<void> _onEmailChanged(
    EmailChanged event,
    Emitter<RegisterState> emit,
  ) {
    final email = Email.dirty(event.email);
    final List<FormzInput> stateFieldsWithChangedValue = [
      email,
      state.firstName,
      state.confirmPassword,
      state.lastName,
      state.password,
      state.phoneNumber,
      state.username,
    ];

    emit(
      state.copyWith(
        email: email,
        status: Formz.validate(stateFieldsWithChangedValue),
      ),
    );
  }

  FutureOr<void> _onFirstNameChanged(
      FirstNameChanged event, Emitter<RegisterState> emit) {
    final firstName = FirstName.dirty(event.firstName);
    final List<FormzInput> stateFieldsWithChangedValue = [
      firstName,
      state.confirmPassword,
      state.lastName,
      state.password,
      state.phoneNumber,
      state.username,
      state.email
    ];

    emit(
      state.copyWith(
        firstName: firstName,
        status: Formz.validate(stateFieldsWithChangedValue),
      ),
    );
  }

  FutureOr<void> _onLastNameChanged(
      LastNameChanged event, Emitter<RegisterState> emit) {
    final lastName = LastName.dirty(event.lastName);
    final List<FormzInput> stateFieldsWithChangedValue = [
      lastName,
      state.firstName,
      state.confirmPassword,
      state.password,
      state.phoneNumber,
      state.username,
      state.email
    ];

    emit(
      state.copyWith(
        lastName: lastName,
        status: Formz.validate(stateFieldsWithChangedValue),
      ),
    );
  }

  FutureOr<void> _onPhoneNumberChanged(
      PhoneNumberChanged event, Emitter<RegisterState> emit) {
    final phoneNumber = PhoneNumber.dirty(event.phoneNumber);
    final List<FormzInput> stateFieldsWithChangedValue = [
      phoneNumber,
      state.firstName,
      state.confirmPassword,
      state.lastName,
      state.password,
      state.username,
      state.email
    ];

    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        status: Formz.validate(stateFieldsWithChangedValue),
      ),
    );
  }

  FutureOr<void> _onConfirmPasswordChanged(
      ConfirmPasswordChanged event, Emitter<RegisterState> emit) {
    final confirmPassword = ConfirmPassword.dirty(event.confirmPassword);
    final List<FormzInput> stateFieldsWithChangedValue = [
      confirmPassword,
      state.firstName,
      state.lastName,
      state.password,
      state.phoneNumber,
      state.username,
      state.email
    ];

    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        status: Formz.validate(stateFieldsWithChangedValue),
      ),
    );
  }

  FutureOr<void> _onRegisterFormAvailabiltyChanged(
    RegisterFormAvailableOnScreen event,
    Emitter<RegisterState> emit,
  ) {
    formAvailable = event.available;
    emit(state.copyWith(formAvailableOnScreen: event.available));
  }

  FutureOr<void> _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        final DataState<ApiResult>? authSuccess =
            await _blocRepositoryOfRegister.register(
          name: state.firstName.value,
          password: state.password.value,
          email: state.email.value,
          phoneNumber: state.phoneNumber.value,
          username: state.username.value,
          firstName: state.firstName.value,
          lastName: state.lastName.value,
          confirmPassword: state.confirmPassword.value,
        );
        if (authSuccess != null && authSuccess.code != null) {
          if (authSuccess.code!.toApiResultStatusCode !=
              ApiResultStatusCode.success) {
            if (authSuccess.message != null) {
              _blocRepositoryOfRegister.showSnackBar(
                authSuccess.message!,
                _context,
              );
              emit(state.copyWith(status: FormzStatus.submissionFailure));
            }
          }
        } else {
          _blocRepositoryOfRegister.showSnackBar(
            ["Kayıt başarılı, giriş yapınız"],
            _context,
          );
          emit(state.copyWith(status: FormzStatus.submissionSuccess));

          NavigationService.instance
              .navigateToPageClear(path: NavigationConstants.loginView);
        }
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
