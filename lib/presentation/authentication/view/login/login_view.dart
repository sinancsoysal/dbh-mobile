import '../../../../config/routes/navigation_routes.dart';
import '../../../../config/routes/navigation_service.dart';
import '../../../../core/utils/constants/locale_keys.g.dart';

import '../../bloc/login_bloc/bloc_repository_of_login.dart';
import '../utils/widgets/form_topic.dart';

import '../../bloc/authentication_bloc/authentication_repository.dart';
import '../../bloc/login_bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/widgets/shining_gradient_effect.dart';

import '../../../widgets/template_components/footer_button.dart';

import '../../../widgets/common/custom_textfield.dart';
import '../../../widgets/common/font_text_widget.dart';

import '../../../../core/utils/constants/color_constants.dart';
import '../../../../core/utils/constants/image_constants.dart';
import '../../../../core/utils/extensions/number/notch_and_indicator_padding_mutations_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';

part '../utils/parts/login/login_form_parts.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  double get standardHorizontalPadding => 50.w;

  double get footerHeight => 48.36.h;

  double get indicatorHeight => 4.h;

  double get indicatorGap => 15.h;

  double get formHeight => 442.h;

  double get designHeight => 640.h;

  Container buildBackGround() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: ColorConstants.instance.primaryBlueGradientLinear,
      ),
    );
  }

  BlocBuilder<LoginBloc, LoginState> buildTopLogo() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          top: state.formAvailableOnScreen
              ? 25.h.insertNotchPadding(context)
              : -56.h,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: state.formAvailableOnScreen ? 1 : 0,
            child: Image.asset(
              ImageConstants.instance.dbhSystems,
              height: 56.h,
              fit: BoxFit.fitHeight,
            ),
          ),
        );
      },
    );
  }

  AnimatedOpacity buildCenterLogo(LoginState state, BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: state.formAvailableOnScreen ? 0 : 1,
      child: buildDbhGloabalSolutionsLogo(context),
    );
  }

  Padding buildDbhGloabalSolutionsLogo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: footerHeight,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildDbhLogo(),
          SizedBox(height: 40.h),
          buildGlobalSolutionsLogo(),
        ],
      ),
    );
  }

  Image buildDbhLogo() {
    return Image.asset(
      ImageConstants.instance.dbh,
      height: 40.2.h,
      fit: BoxFit.fitHeight,
    );
  }

  Image buildGlobalSolutionsLogo() {
    return Image.asset(
      ImageConstants.instance.globalSolutions,
      height: 40.44.h,
      fit: BoxFit.fitHeight,
    );
  }

  SizedBox buildDraggableScrollableForm(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: NotificationListener<DraggableScrollableNotification>(
        onNotification: (DraggableScrollableNotification notification) {
          if (!context.read<LoginBloc>().formAvailable &&
              notification.extent > notification.minExtent) {
            context
                .read<LoginBloc>()
                .add(const LoginFormAvailableOnScreen(true));
          } else if (context.read<LoginBloc>().formAvailable &&
              notification.extent <= notification.minExtent) {
            context
                .read<LoginBloc>()
                .add(const LoginFormAvailableOnScreen(false));
          }
          return true;
        },
        child: DraggableScrollableSheet(
          initialChildSize:
              (footerHeight + indicatorGap + indicatorHeight + formHeight) /
                  designHeight,
          minChildSize:
              (footerHeight + indicatorGap + indicatorHeight) / designHeight,
          maxChildSize:
              (footerHeight + indicatorGap + indicatorHeight + formHeight) /
                  designHeight,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  buildSheetIndicator(),
                  SizedBox(height: indicatorGap),
                  buildLoginForm(context),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Image buildSheetIndicator() {
    return Image.asset(
      ImageConstants.instance.rectangle,
      fit: BoxFit.contain,
      height: 4.h,
      width: 50.w,
    );
  }

  Container buildLoginForm(BuildContext context) {
    return Container(
      color: ColorConstants.instance.white,
      height: formHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: standardHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40.h),
            FormTopic(
              title: LocaleKeys.authentication_login_login,
              subTitle: LocaleKeys.authentication_login_signInToYourAccount,
            ),
            SizedBox(height: 45.h),
            buildUsernameInput(),
            SizedBox(height: 30.h),
            buildPasswordInput(),
            SizedBox(height: 25.h),
            // const Spacer(),
            // buildDontHaveAnAccountText(
            //     text: LocaleKeys.authentication_login_iDontHaveAnAccount),
            // SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  Widget buildFooter(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => (previous.status != current.status ||
          previous.formAvailableOnScreen != current.formAvailableOnScreen),
      builder: (context, state) {
        return state.formAvailableOnScreen
            ? FooterButton(
                key: const Key('loginForm_continue_footerButton'),
                text: LocaleKeys.authentication_login_login,
                isActive: state.status.isValidated &&
                    !state.status.isSubmissionInProgress,
                onPressed: state.status.isValidated
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
              )
            : FooterButton.customColor(
                text: LocaleKeys.authentication_login_signInToYourAccount,
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => LoginBloc(
          context,
          blocRepositoryOfAuthentication:
              RepositoryProvider.of<BlocRepositoryOfAuthentication>(context),
          blocRepositoryOfLogin: BlocRepositoryOfLogin(),
        ),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.bottomCenter,
              fit: StackFit.expand,
              children: [
                buildBackGround(),
                ShiningGradiendEffect(),
                buildTopLogo(),
                buildCenterLogo(state, context),
                buildDraggableScrollableForm(context),
                buildFooter(context),
              ],
            );
          },
        ),
      ),
    );
  }
}
