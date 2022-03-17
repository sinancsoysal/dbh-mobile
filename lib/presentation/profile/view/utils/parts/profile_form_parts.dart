part of '../../profile_view.dart';

BlocBuilder<ProfileBloc, ProfileState> buildNameTextfield() {
  return BlocBuilder<ProfileBloc, ProfileState>(
    builder: (context, state) {
      return CustomTextField(
          topic: LocaleKeys.profile_name,
          controller: RepositoryProvider.of<BlocRepositoryOfProfile>(context)
              .nameController);
    },
  );
}

BlocBuilder<ProfileBloc, ProfileState> buildSurnameTextfield() {
  return BlocBuilder<ProfileBloc, ProfileState>(
    builder: (context, state) {
      return CustomTextField(
          topic: LocaleKeys.profile_surname,
          controller: RepositoryProvider.of<BlocRepositoryOfProfile>(context)
              .surnameController);
    },
  );
}

BlocBuilder<ProfileBloc, ProfileState> buildUsernameTextfield() {
  return BlocBuilder<ProfileBloc, ProfileState>(
    builder: (context, state) {
      return CustomTextField(
          topic: LocaleKeys.profile_username,
          controller: RepositoryProvider.of<BlocRepositoryOfProfile>(context)
              .usernameController);
    },
  );
}

BlocBuilder<ProfileBloc, ProfileState> buildPermissionTextfield() {
  return BlocBuilder<ProfileBloc, ProfileState>(
    builder: (context, state) {
      return CustomTextField(
          enabled: false,
          topic: LocaleKeys.profile_permission,
          controller: RepositoryProvider.of<BlocRepositoryOfProfile>(context)
              .permissionController);
    },
  );
}

BlocBuilder<ProfileBloc, ProfileState> buildCurrentPasswordTextfield() {
  return BlocBuilder<ProfileBloc, ProfileState>(
    builder: (context, state) {
      return CustomTextField(
          topic: LocaleKeys.password_currentPassword,
          controller: RepositoryProvider.of<BlocRepositoryOfProfile>(context)
              .currentPasswordController);
    },
  );
}

BlocBuilder<ProfileBloc, ProfileState> buildNewPasswordTextfield() {
  return BlocBuilder<ProfileBloc, ProfileState>(
    builder: (context, state) {
      return CustomTextField(
          topic: LocaleKeys.password_newPassword,
          controller: RepositoryProvider.of<BlocRepositoryOfProfile>(context)
              .newPasswordController);
    },
  );
}

BlocBuilder<ProfileBloc, ProfileState> buildPhoneNumberTextfield() {
  return BlocBuilder<ProfileBloc, ProfileState>(
    builder: (context, state) {
      return CustomTextField(
          topic: LocaleKeys.profile_phoneNumber,
          controller: RepositoryProvider.of<BlocRepositoryOfProfile>(context)
              .phoneNumberController);
    },
  );
}

BlocBuilder<ProfileBloc, ProfileState> buildEmailTextfield() {
  return BlocBuilder<ProfileBloc, ProfileState>(
    builder: (context, state) {
      return CustomTextField(
          topic: LocaleKeys.profile_eMail,
          controller: RepositoryProvider.of<BlocRepositoryOfProfile>(context)
              .emailController);
    },
  );
}

CustomSettingsButton buildPasswordButton() {
  return CustomSettingsButton(
    text: LocaleKeys.password_currentPassword,
    icon: Icons.lock,
    trailingIcon: Icons.arrow_right,
    onTap: () => NavigationService.instance
        .navigateToPage(path: NavigationConstants.passwordView),
  );
}
