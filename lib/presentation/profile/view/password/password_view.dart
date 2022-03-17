import '../../../../core/utils/constants/color_constants.dart';
import '../../../../core/utils/constants/locale_keys.g.dart';
import '../../../../domain/usecases/remote/dbh_api/topics/user/user_use_case_change_password.dart';
import '../../../../injector.dart';
import '../../password_bloc/bloc/bloc_repository_of_password.dart';
import '../../password_bloc/bloc/password_bloc.dart';
import '../../../widgets/common/custom_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/drawer/custom_drawer.dart';
import '../../../widgets/template_components/custom_app_bar.dart';
import '../../../widgets/template_components/footer_button.dart';
import '../../../widgets/template_components/header_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';

class PasswordView extends StatefulWidget {
  const PasswordView({Key? key}) : super(key: key);

  @override
  State<PasswordView> createState() => _PasswordViewState();
}

class _PasswordViewState extends State<PasswordView> {
  double get standardHorizontalPadding => 50.w;

  final GlobalKey<SliderMenuContainerState> _key =
      GlobalKey<SliderMenuContainerState>();
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => BlocRepositoryOfPassword(
        injector<UserChangePasswordUseCase>(),
        context: context,
      ),
      child: BlocProvider(
        create: (context) => PasswordBloc(
          RepositoryProvider.of<BlocRepositoryOfPassword>(context),
        ),
        child: Builder(builder: (context) {
          return Scaffold(
            body: SliderMenuContainer(
              sliderMenuOpenSize: 297.w,
              key: _key,
              hasAppBar: false,
              sliderMenu: CustomDrawer(),
              sliderMain: Column(
                children: [
                  buildHeader(),
                  SizedBox(height: 65.h),
                  buildChangePaswordForm(),
                  const Spacer(),
                  buildFooter(context),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Padding buildChangePaswordForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: standardHorizontalPadding),
      child: BlocBuilder<PasswordBloc, PasswordState>(
        builder: (context, state) {
          return Form(
            key: RepositoryProvider.of<BlocRepositoryOfPassword>(context)
                .formKey,
            child: Column(
              children: [
                BlocBuilder<PasswordBloc, PasswordState>(
                  builder: (context, state) {
                    return CustomTextField(
                      controller: context
                          .read<BlocRepositoryOfPassword>()
                          .currentPasswordController,
                      obscureText: true,
                      topic: LocaleKeys.password_currentPassword,
                      validationObject: state.currentPassword,
                      onChanged: (currentPassword) => context
                          .read<PasswordBloc>()
                          .add(CurrentPasswordChanged(currentPassword)),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                BlocBuilder<PasswordBloc, PasswordState>(
                  // buildWhen: (previous, current) =>
                  //     previous.newPassword != current.currentPassword,
                  builder: (context, state) {
                    return CustomTextField(
                      controller: context
                          .read<BlocRepositoryOfPassword>()
                          .newPasswordController,
                      obscureText: true,
                      validationObject: state.newPassword,
                      topic: LocaleKeys.password_newPassword,
                      onChanged: (newPassword) => context
                          .read<PasswordBloc>()
                          .add(NewPasswordChanged(newPassword)),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                BlocBuilder<PasswordBloc, PasswordState>(
                  // buildWhen: (previous, current) =>
                  //     previous.currentPassword != current.currentPassword,
                  builder: (context, state) {
                    return CustomTextField(
                      controller: context
                          .read<BlocRepositoryOfPassword>()
                          .confirmNewPasswordController,
                      obscureText: true,
                      validationObject: state.confirmPassword,
                      topic: LocaleKeys.password_confirmNewPassword,
                      onChanged: (confirmPassword) => context
                          .read<PasswordBloc>()
                          .add(ConfirmNewPasswordChanged(confirmPassword)),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  buildFooter(BuildContext context) {
    return BlocBuilder<PasswordBloc, PasswordState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: FooterButton.customColor(
                text: LocaleKeys.password_goBack,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                buttonColor: ColorConstants.instance.cancelRed,
                textColor: Colors.white,
              ),
            ),
            Expanded(
              child: FooterButton.customColor(
                text: LocaleKeys.password_updatePassword,
                buttonColor: state.status.isValid
                    ? ColorConstants.instance.primaryBlue
                    : ColorConstants.instance.blank,
                textColor: state.status.isValid ? Colors.white : Colors.black38,
                onPressed: () {
                  if (state.status.isValid) {
                    context
                        .read<PasswordBloc>()
                        .add(const PasswordChangeSubmitted());
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }

  HeaderContent buildHeader() {
    return HeaderContent(
      enableNotchPadding: true,
      topPadding: 18.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          buildAppBar(),
        ],
      ),
    );
  }

  CustomAppBar buildAppBar() {
    return CustomAppBar(
      sliderKey: _key,
      title: LocaleKeys.password_password,
      subTitle: LocaleKeys.password_updatePassword,
    );
  }
}
