import 'package:formz/formz.dart';

enum PhoneNumberValidationError { empty }

class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumber.pure() : super.pure('');
  const PhoneNumber.dirty([String value = '']) : super.dirty(value);

  @override
  PhoneNumberValidationError? validator(String? value) {
    return null;
  }
}
