class PasswordConfirmationObject {
  final String? password;
  final String? confirmPassword;

  const PasswordConfirmationObject({this.password, this.confirmPassword});

  PasswordConfirmationObject copyWith({
    String? password,
    String? confirmPassword,
  }) {
    return PasswordConfirmationObject(
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
