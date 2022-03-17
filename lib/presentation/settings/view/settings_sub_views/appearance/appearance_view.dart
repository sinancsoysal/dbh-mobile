import '../../../../../core/utils/constants/application_constants.dart';
import '../../../../../core/utils/constants/color_constants.dart';
import '../../../../../core/utils/constants/locale_keys.g.dart';
import '../../../../widgets/common/custom_scaffold.dart';
import '../../../../widgets/common/custom_settings_button.dart';
import '../../../../widgets/common/font_text_widget.dart';
import '../../../../widgets/template_components/custom_app_bar.dart';
import '../../../../widgets/template_components/header_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:easy_localization/easy_localization.dart';

class AppearanceView extends StatelessWidget {
  const AppearanceView({Key? key}) : super(key: key);
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
              title: LocaleKeys.appearance_apeearance,
              subTitle: LocaleKeys.appearance_customizeTheLook,
            ),
          ),
          SizedBox(height: 90.h),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: standardHorizontalPadding),
            child: Column(
              children: [
                CustomSettingsButton(
                  text: LocaleKeys.appearance_language,
                  icon: Icons.language,
                  trailingIcon: Icons.arrow_right,
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: standardHorizontalPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 17.h),
                            FontText.jost(
                              text: LocaleKeys.appearance_language,
                              color: ColorConstants.instance.darkGray,
                            ),
                            SizedBox(height: 10.h),
                            CustomSettingsButton(
                              translate: false,
                              buttonColor:
                                  context.locale == AppConstants.enLocale
                                      ? ColorConstants.instance.primaryBlue
                                      : ColorConstants.instance.blank,
                              contentColor:
                                  context.locale == AppConstants.enLocale
                                      ? ColorConstants.instance.white
                                      : Colors.black,
                              text: 'English',
                              onTap: () {
                                context.setLocale(AppConstants.enLocale);
                              },
                            ),
                            SizedBox(height: 10.h),
                            CustomSettingsButton(
                              translate: false,
                              buttonColor:
                                  context.locale == AppConstants.trLocale
                                      ? ColorConstants.instance.primaryBlue
                                      : ColorConstants.instance.blank,
                              contentColor:
                                  context.locale == AppConstants.trLocale
                                      ? ColorConstants.instance.white
                                      : Colors.black,
                              text: 'Türkçe',
                              onTap: () {
                                context.setLocale(AppConstants.trLocale);
                              },
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).viewPadding.bottom),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
