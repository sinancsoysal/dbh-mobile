import 'package:formz/formz.dart';

enum PermissionValidationError { empty }

class Permission extends FormzInput<String, PermissionValidationError> {
  const Permission.pure() : super.pure('');
  const Permission.dirty([String value = '']) : super.dirty(value);

  @override
  PermissionValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : PermissionValidationError.empty;
  }
}
