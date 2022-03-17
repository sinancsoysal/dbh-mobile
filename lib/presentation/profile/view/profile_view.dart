import '../../../config/routes/navigation_routes.dart';
import '../../../config/routes/navigation_service.dart';
import '../../../core/utils/constants/locale_keys.g.dart';
import '../../../domain/usecases/remote/dbh_api/topics/user/user_use_case_update_profile.dart';
import '../../../injector.dart';
import '../../authentication/bloc/authentication_bloc/authentication_repository.dart';
import '../../widgets/common/custom_settings_button.dart';

import '../bloc/bloc_repository_of_profile.dart';
import '../bloc/profile_bloc.dart';
import '../../widgets/common/custom_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/drawer/custom_drawer.dart';
import '../../widgets/template_components/custom_app_bar.dart';
import '../../widgets/template_components/footer_button.dart';
import '../../widgets/template_components/header_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part '../view/utils/parts/profile_form_parts.dart';

enum ProfileForms { page1, page2 }

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

late TabController _controller;

class _ProfileViewState extends State<ProfileView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  double get coverImageHeight => 128.h;
  double get profilePhotoRadius => 75.h;
  double get standardHorizontalPadding => 50.w;

  final GlobalKey<SliderMenuContainerState> _key =
      GlobalKey<SliderMenuContainerState>();
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => BlocRepositoryOfProfile(
        injector<UserUpdateProfileUseCase>(),
        context,
      )..initControllers(
          (context).read<BlocRepositoryOfAuthentication>().getUser(),
        ),
      child: BlocProvider(
        create: (context) => ProfileBloc(
          repository: context.read<BlocRepositoryOfProfile>(),
        ),
        child: Scaffold(
          body: SliderMenuContainer(
            sliderMenuOpenSize: 297.w,
            key: _key,
            hasAppBar: false,
            sliderMenu: CustomDrawer(),
            sliderMain: Column(
              children: [
                buildHeader(),
                SizedBox(height: 65.h),
                buildBody(),
                buildPageSwitcherIcons(),
                buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildBody() {
    return Expanded(
      child: TabBarView(
        controller: _controller,
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: standardHorizontalPadding),
            child: ProfileForms.page1.getForm,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: standardHorizontalPadding),
            child: ProfileForms.page2.getForm,
          ),
        ],
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

  buildFooter() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return FooterButton(
          text: LocaleKeys.profile_save,
          onPressed: () {
            context.read<ProfileBloc>().add(const ProfileSubmitted());
          },
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
      title: LocaleKeys.profile_profile,
      subTitle: LocaleKeys.profile_changeProfileInformation,
    );
  }
}

extension GetForm on ProfileForms {
  Form get getForm {
    switch (this) {
      case ProfileForms.page1:
        return Form(
          child: Column(
            children: [
              buildNameTextfield(),
              SizedBox(height: 8.h),
              buildSurnameTextfield(),
              SizedBox(height: 8.h),
              buildUsernameTextfield(),
            ],
          ),
        );

      case ProfileForms.page2:
        return Form(
          child: Column(
            children: [
              SizedBox(height: 8.h),
              buildPermissionTextfield(),
              SizedBox(height: 8.h),
              buildPhoneNumberTextfield(),
              SizedBox(height: 8.h),
              buildEmailTextfield(),
              SizedBox(height: 29.h),
              buildPasswordButton()
            ],
          ),
        );
    }
  }
}
