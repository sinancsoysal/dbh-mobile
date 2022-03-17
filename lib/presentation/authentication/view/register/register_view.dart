import '../../../../config/routes/navigation_routes.dart';
import '../../../../config/routes/navigation_service.dart';
import '../../../../core/utils/constants/locale_keys.g.dart';

import '../../../../domain/usecases/remote/dbh_api/topics/user/user_use_case_register_user.dart';
import '../../../../injector.dart';
import '../../bloc/register_bloc/bloc_repository_of_register.dart';
import '../../bloc/register_bloc/register_bloc.dart';
import '../utils/widgets/form_topic.dart';
import '../utils/widgets/shining_gradient_effect.dart';
import '../../../widgets/common/custom_textfield.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/template_components/footer_button.dart';

import '../../../widgets/common/font_text_widget.dart';

import '../../../../core/utils/constants/color_constants.dart';
import '../../../../core/utils/constants/image_constants.dart';
import '../../../../core/utils/extensions/number/notch_and_indicator_padding_mutations_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';

part '../utils/parts/register_form_parts.dart';

enum RegisterForms { page1, page2 }

class RegisterView extends StatefulWidget {
  const RegisterView({
    Key? key,
    required this.blocRepositoryOfRegister,
  }) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
  final BlocRepositoryOfRegister blocRepositoryOfRegister;
}

class _RegisterViewState extends State<RegisterView>
    with SingleTickerProviderStateMixin, _SizeUtils {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  Container buildBackGround() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: ColorConstants.instance.primaryBlueGradientLinear,
      ),
    );
  }

  BlocBuilder<RegisterBloc, RegisterState> buildTopLogo() {
    return BlocBuilder<RegisterBloc, RegisterState>(
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

  AnimatedOpacity buildCenterLogo(RegisterState state, BuildContext context) {
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
          if (!context.read<RegisterBloc>().formAvailable &&
              notification.extent > notification.minExtent) {
            context
                .read<RegisterBloc>()
                .add(const RegisterFormAvailableOnScreen(true));
          } else if (context.read<RegisterBloc>().formAvailable &&
              notification.extent <= notification.minExtent) {
            context
                .read<RegisterBloc>()
                .add(const RegisterFormAvailableOnScreen(false));
          }
          return true;
        },
        child: DraggableScrollableSheet(
          initialChildSize: initialFormSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  buildSheetIndicator(),
                  SizedBox(height: indicatorGap),
                  buildRegisterForm(context),
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

  Container buildRegisterForm(BuildContext context) {
    return Container(
      color: ColorConstants.instance.white,
      height: formHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 23.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20.w,
              ),
              GestureDetector(
                onTap: () {
                  NavigationService.instance
                      .navigateToPageClear(path: NavigationConstants.loginView);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 14.sp,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              FormTopic(
                title: LocaleKeys.authentication_register_register,
                subTitle: LocaleKeys.authentication_register_createAnAccount,
              ),
            ],
          ),
          SizedBox(height: 23.h),
          buildForms(),
          buildPageSwitcherIcons(),
          SizedBox(height: 25.h),
        ],
      ),
    );
  }

  Expanded buildForms() {
    return Expanded(
      child: TabBarView(
        controller: _controller,
        children: [
          buildFormPage1(),
          buildFormPage2(),
        ],
      ),
    );
  }

  Padding buildFormPage1() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: standardHorizontalPadding),
      child: RegisterForms.page1.getForm,
    );
  }

  Padding buildFormPage2() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: standardHorizontalPadding),
      child: RegisterForms.page2.getForm,
    );
  }

  SnackBar buildRegisterErrorSnackBar(BuildContext context, String text) {
    return SnackBar(
      padding: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 49.h.ejectIndicatorPadding(context)),
      content: FontText.jost(
        text: text,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: ColorConstants.instance.blank,
    );
  }

  Widget buildFooter(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => (previous.status != current.status ||
          previous.formAvailableOnScreen != current.formAvailableOnScreen),
      builder: (context, state) {
        return state.formAvailableOnScreen
            ? FooterButton(
                key: const Key('RegisterForm_continue_footerButton'),
                text: LocaleKeys.authentication_register_register,
                isActive: state.status.isValidated &&
                    !state.status.isSubmissionInProgress,
                onPressed: state.status.isValidated
                    ? () {
                        context
                            .read<RegisterBloc>()
                            .add(const RegisterSubmitted());
                      }
                    : null,
              )
            : FooterButton.customColor(
                text: LocaleKeys.authentication_register_createAnAccount,
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RepositoryProvider(
        create: (context) => BlocRepositoryOfRegister(
          injector<UserRegisterUseCase>(),
        ),
        child: BlocProvider(
          create: (context) => RegisterBloc(
            context,
            blocRepositoryOfRegister: BlocRepositoryOfRegister(
              injector<UserRegisterUseCase>(),
            ),
          ),
          child: BlocBuilder<RegisterBloc, RegisterState>(
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
      ),
    );
  }

  buildPageSwitcherIcons() {
    return Padding(
      padding: EdgeInsets.only(
        top: 14,
        bottom: 20.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildPreviousFormIcon(),
          buildNextFormIcon(),
        ],
      ),
    );
  }

  GestureDetector buildPreviousFormIcon() {
    return GestureDetector(
      onTap: () {
        _controller.animateTo(0);
      },
      child: Icon(
        Icons.arrow_left,
        size: 20.h,
      ),
    );
  }

  GestureDetector buildNextFormIcon() {
    return GestureDetector(
      onTap: () {
        _controller.animateTo(1);
      },
      child: Icon(
        Icons.arrow_right,
        size: 20.h,
      ),
    );
  }
}

extension GetForm on RegisterForms {
  Form get getForm {
    switch (this) {
      case RegisterForms.page1:
        return Form(
          child: Column(
            children: [
              buildFirstNameInput(),
              SizedBox(height: 8.h),
              buildLastNameInput(),
              SizedBox(height: 8.h),
              buildEmailInput(),
              SizedBox(height: 8.h),
              buildPhoneNumberInput()
            ],
          ),
        );

      case RegisterForms.page2:
        return Form(
          child: Column(
            children: [
              buildUsernameInput(),
              SizedBox(height: 8.h),
              buildPasswordInput(),
              SizedBox(height: 8.h),
              buildConfirmPasswordInput(),
            ],
          ),
        );
    }
  }
}

mixin _SizeUtils {
  double get standardHorizontalPadding => 50.w;

  double get footerHeight => 48.36.h;

  double get indicatorHeight => 4.h;

  double get indicatorGap => 15.h;

  double get formHeight => 442.h;

  double get designHeight => 640.h;

  double get minChildSize =>
      (footerHeight + indicatorGap + indicatorHeight) / designHeight;

  double get maxChildSize =>
      (footerHeight + indicatorGap + indicatorHeight + formHeight) /
      designHeight;
  double get initialFormSize => maxChildSize;
}
