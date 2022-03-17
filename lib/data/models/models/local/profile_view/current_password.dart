import '../../../../../core/utils/constants/locale_keys.g.dart';
import 'package:formz/formz.dart';

enum CurrentPasswordValidationError { empty }

extension CurrentPasswordValidationValue on CurrentPasswordValidationError {
  String get value {
    switch (this) {
      case CurrentPasswordValidationError.empty:
        return LocaleKeys.validationErrors_emptyPassword;
    }
  }
}

class CurrentPassword extends FormzInput<String, String> {
  const CurrentPassword.pure() : super.pure('');
  const CurrentPassword.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String? value) {
    if (value?.isEmpty ?? true) {
      return CurrentPasswordValidationError.empty.value;
    }
  }
}
