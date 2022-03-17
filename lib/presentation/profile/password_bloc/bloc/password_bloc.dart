import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../../data/models/models/local/profile_view/validation_models.dart';
import 'bloc_repository_of_password.dart';

import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc(BlocRepositoryOfPassword blocRepositoryOfPassword)
      : _blocRepositoryOfPassword = blocRepositoryOfPassword,
        super(const PasswordState()) {
    on<CurrentPasswordChanged>(_onCurrrentPasswordChanged);
    on<NewPasswordChanged>(_onNewPasswordChanged);
    on<ConfirmNewPasswordChanged>(_onConfirmPassowordChanged);
    on<PasswordChangeSubmitted>(_onPasswordChangeSubmitted);
  }

  final BlocRepositoryOfPassword _blocRepositoryOfPassword;

  FutureOr<void> _onCurrrentPasswordChanged(
    CurrentPasswordChanged event,
    Emitter<PasswordState> emit,
  ) {
    final currentPassword = CurrentPassword.dirty(event.currentPassword);
    emit(
      state.copyWith(
        currentPassword: currentPassword,
        status: Formz.validate(
          [
            currentPassword,
            state.newPassword,
          ],
        ),
      ),
    );
  }

  FutureOr<void> _onNewPasswordChanged(
    NewPasswordChanged event,
    Emitter<PasswordState> emit,
  ) {
    final newPassword = NewPassword.dirty(
      state.newPassword.value.copyWith(
        password: event.newPaswword,
        confirmPassword: state.confirmPassword.value.confirmPassword,
      ),
    );
    final confirmNewPassword = NewPassword.dirty(
      state.confirmPassword.value.copyWith(
        password: event.newPaswword,
        confirmPassword: state.confirmPassword.value.confirmPassword,
      ),
    );
    emit(
      state.copyWith(
        newPassword: newPassword,
        confirmPassword: confirmNewPassword,
        status: Formz.validate(
          [newPassword, confirmNewPassword, state.currentPassword],
        ),
      ),
    );
  }

  FutureOr<void> _onConfirmPassowordChanged(
    ConfirmNewPasswordChanged event,
    Emitter<PasswordState> emit,
  ) {
    final confirmNewPassword = NewPassword.dirty(
      state.confirmPassword.value.copyWith(
        confirmPassword: event.confirmNewPassword,
        password: state.newPassword.value.password,
      ),
    );
    final newPassword = NewPassword.dirty(
      state.newPassword.value.copyWith(
        confirmPassword: event.confirmNewPassword,
        password: state.newPassword.value.password,
      ),
    );
    emit(
      state.copyWith(
        confirmPassword: confirmNewPassword,
        newPassword: newPassword,
        status: Formz.validate(
          [
            confirmNewPassword,
            newPassword,
            state.currentPassword,
          ],
        ),
      ),
    );
  }

  FutureOr<void> _onPasswordChangeSubmitted(
    PasswordChangeSubmitted event,
    Emitter<PasswordState> emit,
  ) {
    _blocRepositoryOfPassword.changePassword();
  }
}
