part of '../../register/register_view.dart';

BlocBuilder<RegisterBloc, RegisterState> buildFirstNameInput() {
  return BlocBuilder<RegisterBloc, RegisterState>(
    buildWhen: (previous, current) => previous.firstName != current.firstName,
    builder: (context, state) => CustomTextField(
      topic: LocaleKeys.authentication_register_name,
      controller: RepositoryProvider.of<BlocRepositoryOfRegister>(context)
          .firstNameController,
      key: const Key('registerForm_firstNameInput_textField'),
      onChanged: (firstName) =>
          context.read<RegisterBloc>().add(FirstNameChanged(firstName)),
    ),
  );
}

BlocBuilder<RegisterBloc, RegisterState> buildPasswordInput() {
  return BlocBuilder<RegisterBloc, RegisterState>(
    buildWhen: (previous, current) => previous.password != current.password,
    builder: (context, state) => CustomTextField(
      topic: LocaleKeys.authentication_register_password,
      controller: RepositoryProvider.of<BlocRepositoryOfRegister>(context)
          .passwordController,
      key: const Key('registerForm_passwordInput_textField'),
      onChanged: (password) =>
          context.read<RegisterBloc>().add(PasswordChanged(password)),
    ),
  );
}

BlocBuilder<RegisterBloc, RegisterState> buildEmailInput() {
  return BlocBuilder<RegisterBloc, RegisterState>(
    buildWhen: (previous, current) => previous.email != current.email,
    builder: (context, state) => CustomTextField(
      topic: LocaleKeys.authentication_register_email,
      controller: RepositoryProvider.of<BlocRepositoryOfRegister>(context)
          .emailController,
      key: const Key('registerForm_emailInput_textField'),
      onChanged: (email) =>
          context.read<RegisterBloc>().add(EmailChanged(email)),
    ),
  );
}

BlocBuilder<RegisterBloc, RegisterState> buildUsernameInput() {
  return BlocBuilder<RegisterBloc, RegisterState>(
    buildWhen: (previous, current) => previous.username != current.username,
    builder: (context, state) => CustomTextField(
      topic: LocaleKeys.authentication_register_username,
      controller: RepositoryProvider.of<BlocRepositoryOfRegister>(context)
          .userNameController,
      key: const Key('registerForm_usernameInput_textField'),
      onChanged: (username) =>
          context.read<RegisterBloc>().add(UsernameChanged(username)),
    ),
  );
}

BlocBuilder<RegisterBloc, RegisterState> buildPhoneNumberInput() {
  return BlocBuilder<RegisterBloc, RegisterState>(
    buildWhen: (previous, current) =>
        previous.phoneNumber != current.phoneNumber,
    builder: (context, state) => CustomTextField(
      topic: LocaleKeys.authentication_register_phoneNumber,
      controller: RepositoryProvider.of<BlocRepositoryOfRegister>(context)
          .phoneNumberController,
      key: const Key('registerForm_phoneNumberInput_textField'),
      onChanged: (phoneNumber) =>
          context.read<RegisterBloc>().add(PhoneNumberChanged(phoneNumber)),
    ),
  );
}

BlocBuilder<RegisterBloc, RegisterState> buildLastNameInput() {
  return BlocBuilder<RegisterBloc, RegisterState>(
    buildWhen: (previous, current) => previous.lastName != current.lastName,
    builder: (context, state) => CustomTextField(
      topic: LocaleKeys.authentication_register_surname,
      controller: RepositoryProvider.of<BlocRepositoryOfRegister>(context)
          .surnameController,
      key: const Key('registerForm_lastNameInput_textField'),
      onChanged: (surname) =>
          context.read<RegisterBloc>().add(LastNameChanged(surname)),
    ),
  );
}

BlocBuilder<RegisterBloc, RegisterState> buildConfirmPasswordInput() {
  return BlocBuilder<RegisterBloc, RegisterState>(
    buildWhen: (previous, current) =>
        previous.confirmPassword != current.confirmPassword,
    builder: (context, state) => CustomTextField(
      topic: LocaleKeys.authentication_register_passwordConfirmation,
      controller: RepositoryProvider.of<BlocRepositoryOfRegister>(context)
          .passwordConfirmationController,
      key: const Key('registerForm_confirmPasswordInput_textField'),
      onChanged: (confirmPassword) => context
          .read<RegisterBloc>()
          .add(ConfirmPasswordChanged(confirmPassword)),
    ),
  );
}
