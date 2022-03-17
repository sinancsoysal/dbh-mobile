import 'package:formz/formz.dart';

enum ConfirmPasswordValidationError { empty }

class ConfirmPassword
    extends FormzInput<String, ConfirmPasswordValidationError> {
  const ConfirmPassword.pure() : super.pure('');
  const ConfirmPassword.dirty([String value = '']) : super.dirty(value);

  @override
  ConfirmPasswordValidationError? validator(String? value) {
    return value?.isNotEmpty == true
        ? null
        : ConfirmPasswordValidationError.empty;
  }
}
