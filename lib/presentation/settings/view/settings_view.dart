import '../../../config/routes/navigation_routes.dart';
import '../../../config/routes/navigation_service.dart';
import '../../../core/utils/constants/color_constants.dart';
import '../../../core/utils/constants/locale_keys.g.dart';
import '../../authentication/bloc/authentication_bloc/authentication_bloc.dart';
import '../../widgets/common/custom_scaffold.dart';
import '../../widgets/common/custom_settings_button.dart';
import '../../widgets/template_components/custom_app_bar.dart';
import '../../widgets/template_components/header_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  double get standardHorizontalPadding => 50.w;

  @override
  Widget build(BuildContext context) {
    GlobalKey<SliderMenuContainerState> menuKey =
        GlobalKey<SliderMenuContainerState>();
    return CustomScaffold(
      menuKey: menuKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HeaderContent(
            enableNotchPadding: true,
            topPadding: 18.h,
            child: CustomAppBar(
              sliderKey: menuKey,
              title: LocaleKeys.settings_settings,
              subTitle: LocaleKeys.settings_changePreferences,
            ),
          ),
          SizedBox(height: 90.h),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: standardHorizontalPadding),
            child: Column(
              children: [
                CustomSettingsButton(
                  text: LocaleKeys.settings_profile,
                  icon: Icons.account_circle_outlined,
                  trailingIcon: Icons.arrow_right,
                  onTap: () => NavigationService.instance
                      .navigateToPage(path: NavigationConstants.profileView),
                ),
                SizedBox(height: 21.h),
                CustomSettingsButton(
                  onTap: () {
                    NavigationService.instance
                        .navigateToPage(
                          path: NavigationConstants.settingsAppearanceView,
                        )
                        .whenComplete(() => setState(() {}));
                  },
                  text: LocaleKeys.settings_appearance,
                  icon: Icons.settings_display,
                  trailingIcon: Icons.arrow_right,
                ),
                SizedBox(height: 21.h),
                CustomSettingsButton(
                  buttonColor: ColorConstants.instance.cancelRed,
                  text: LocaleKeys.settings_logOut,
                  icon: Icons.lock,
                  onTap: () {
                    context.read<AuthenticationBloc>().add(
                          AuthenticationLogoutRequested(),
                        );
                    NavigationService.instance.navigateToPageClear(
                      path: NavigationConstants.loginView,
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
