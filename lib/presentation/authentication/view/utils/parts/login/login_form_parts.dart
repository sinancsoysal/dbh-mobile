part of '../../../login/login_view.dart';

double get standardHorizontalPadding => 50.w;
double get formHeight => 442.h;

GestureDetector buildDontHaveAnAccountText({required String text}) {
  return GestureDetector(
    onTap: () {
      NavigationService.instance
          .navigateToPageClear(path: NavigationConstants.registerView);
    },
    child: Center(
      child: FontText.jost(
        text: text,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

BlocBuilder<LoginBloc, LoginState> buildUsernameInput() {
  return BlocBuilder<LoginBloc, LoginState>(
    buildWhen: (previous, current) => previous.username != current.username,
    builder: (context, state) => CustomTextField(
      topic: LocaleKeys.authentication_login_username,
      key: const Key('loginForm_usernameInput_textField'),
      onChanged: (username) =>
          context.read<LoginBloc>().add(LoginUsernameChanged(username)),
    ),
  );
}

BlocBuilder<LoginBloc, LoginState> buildPasswordInput() {
  return BlocBuilder<LoginBloc, LoginState>(
    buildWhen: (previous, current) => previous.password != current.password,
    builder: (context, state) => CustomTextField(
      obscureText: true,
      topic: LocaleKeys.authentication_login_password,
      key: const Key('loginForm_passwordInput_textField'),
      onChanged: (password) =>
          context.read<LoginBloc>().add(LoginPasswordChanged(password)),
    ),
  );
}
