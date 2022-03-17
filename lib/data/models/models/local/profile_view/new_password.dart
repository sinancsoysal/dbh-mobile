import '../../../../../core/utils/constants/locale_keys.g.dart';
import 'package:formz/formz.dart';

import 'confirmation_object/password_confirmation_object.dart';

enum NewPasswordValidationError {
  emptyConfirmPassword,
  emptyPassword,
  passwordsNotMatch
}

extension PasswordValidatorVaue on NewPasswordValidationError {
  String get value {
    switch (this) {
      case NewPasswordValidationError.emptyConfirmPassword:
        return LocaleKeys.validationErrors_emptyPassword;
      case NewPasswordValidationError.emptyPassword:
        return LocaleKeys.validationErrors_emptyPassword;
      case NewPasswordValidationError.passwordsNotMatch:
        return LocaleKeys.validationErrors_notMatching;
    }
  }
}

class NewPassword extends FormzInput<PasswordConfirmationObject, String> {
  const NewPassword.pure() : super.pure(const PasswordConfirmationObject());
  const NewPassword.dirty(
      [PasswordConfirmationObject value = const PasswordConfirmationObject()])
      : super.dirty(value);

  @override
  String? validator(PasswordConfirmationObject? value) {
    if (value?.confirmPassword?.isEmpty ?? true) {
      return NewPasswordValidationError.emptyConfirmPassword.value;
    } else if (value?.password?.isEmpty ?? true) {
      return NewPasswordValidationError.emptyPassword.value;
    } else if (value?.password != value?.confirmPassword) {
      return NewPasswordValidationError.passwordsNotMatch.value;
    }
  }
}
