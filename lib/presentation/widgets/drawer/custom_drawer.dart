import '../../../config/routes/navigation_routes.dart';
import '../../../config/routes/navigation_service.dart';
import '../../../core/utils/constants/locale_keys.g.dart';
import '../../../data/data_sources/local/preferences_manager.dart';
import '../../../data/models/dtos/remote/dbh_api/topics/area/area_dto.dart';

import '../../authentication/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/constants/color_constants.dart';
import '../../../core/utils/constants/image_constants.dart';
import '../../../core/utils/extensions/number/notch_and_indicator_padding_mutations_extension.dart';
import '../common/font_text_widget.dart';
import 'package:flutter/material.dart';

import 'drawer_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  final bool isFinancePathActive;
  CustomDrawer({
    Key? key,
  })
      :
      ///With isFinancePathActive, we can manipulate the drawer tile list.
      //ToDo: Check this line and widget.
        isFinancePathActive=PreferencesManager.instance.getStringValue(
      PreferencesKeys.selectedApplicationRoute
  )==NavigationConstants.financeView,
        super(
          key: key
      );

  double get coverImageHeight => 56.h;
  double get coverTotalHeight => 131.h;
  double get profilePhotoRadius => 60.w;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildDrawerBackgroundAndCover(context),
        buildDrawerOptions(context,
            drawerTiles: isFinancePathActive
                ?_financeViewDrawerTiles
                :_homeCostControlDrawerTiles
        ),
        buildDrawerLogoutButton(context),
      ],
    );
  }

  Container buildDrawerBackgroundAndCover(BuildContext context) {
    return Container(
      decoration: buildDrawerBackground(),
      child: buildDrawerCover(context),
    );
  }

  BoxDecoration buildDrawerBackground() => BoxDecoration(
      gradient: ColorConstants.instance.primaryBlueGradientLinear);

  Align buildDrawerCover(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: ColorConstants.instance.darkPrimaryBlue,
            height: coverTotalHeight.insertNotchPadding(context),
          ),
          Image.asset(
            ImageConstants.instance.dbhSystems,
            fit: BoxFit.cover,
            height: coverImageHeight,
          ),
        ],
      ),
    );
  }

  FontText buildUserName({required String text}) {
    return FontText.jost(
      text: text,
      fontWeight: FontWeight.bold,
      color: ColorConstants.instance.white,
    );
  }

  FontText buildPhoneNumber({
    required String text,
  }) {
    return FontText.jost(
      text: text,
      fontWeight: FontWeight.bold,
      color: ColorConstants.instance.white,
      fontSize: 10,
    );
  }

  Positioned buildDrawerOptions(
    BuildContext context, {
    required List<DrawerTile> drawerTiles,
  }) {
    return Positioned(
      top: coverTotalHeight.insertNotchPadding(context) + 32.h,
      left: 40.w,
      child: Wrap(
        spacing: 25.h,
        direction: Axis.vertical,
        children: drawerTiles,
      ),
    );
  }

  Positioned buildDrawerLogoutButton(BuildContext context) {
    return Positioned(
      bottom: 5.h.insertIndicatorPadding(context),
      right: 10.w,
      child: GestureDetector(
        onTap: () async {
          context
              .read<AuthenticationBloc>()
              .add(AuthenticationLogoutRequested());
        },
        child: FontText.jost(
          text: LocaleKeys.slideMenu_logout,
          fontWeight: FontWeight.bold,
          color: ColorConstants.instance.white,
        ),
      ),
    );
  }

  final List<DrawerTile> _homeCostControlDrawerTiles = [
    _homeDrawerTile(
        onPressed: () {
          String areaName = PreferencesManager.instance
              .getStringValue(PreferencesKeys.xareaName);
          String areaId =
          PreferencesManager.instance.getStringValue(PreferencesKeys.xarea);

          NavigationService.instance.navigateToPageClear(
            path: NavigationConstants.homeCostControlView,
            data: AreaDto(id: areaId, title: areaName),
          );
        }
    ),
    _profileViewDrawerTile,
    _invoicesViewDrawerTile,
    _searchViewDrawerTile,
    _activityLogViewDrawerTile,
    _settingsViewDrawerTile,
    _appSelectionAndLocationMergedViewDrawerTile
  ];

  final List<DrawerTile> _financeViewDrawerTiles=[
    _homeDrawerTile(
        onPressed: () {
          String areaName = PreferencesManager.instance.getStringValue(PreferencesKeys.xareaName);
          String areaId = PreferencesManager.instance.getStringValue(PreferencesKeys.xarea);

          NavigationService.instance.navigateToPageClear(
            path: NavigationConstants.financeView,
            data: AreaDto(id: areaId, title: areaName),
          );
        }
    ),
    _profileViewDrawerTile,
    _activityLogViewDrawerTile,
    _settingsViewDrawerTile,
    _appSelectionAndLocationMergedViewDrawerTile
  ];
}

DrawerTile _homeDrawerTile({required Function() onPressed})=>DrawerTile(
  text: LocaleKeys.slideMenu_home,
  image: ImageConstants.instance.drawerHomeIcon,
  onPressed: onPressed,
);

DrawerTile get _profileViewDrawerTile=>DrawerTile(
  text: LocaleKeys.slideMenu_profile,
  image: ImageConstants.instance.drawerProfileIcon,
  onPressed: () {
    NavigationService.instance
        .navigateToPageClear(path: NavigationConstants.profileView);
  },
);

DrawerTile get _invoicesViewDrawerTile=>DrawerTile(
  text: LocaleKeys.slideMenu_invoices,
  image: ImageConstants.instance.drawerReportsIcon,
  onPressed: () {
    NavigationService.instance
        .navigateToPageClear(path: NavigationConstants.invoicesView);
  },
);

DrawerTile get _searchViewDrawerTile=>DrawerTile(
  text: LocaleKeys.slideMenu_search,
  image: ImageConstants.instance.drawerSearchIcon,
  onPressed: () {
    NavigationService.instance
        .navigateToPageClear(path: NavigationConstants.searchView);
  },
);

DrawerTile get _activityLogViewDrawerTile=>DrawerTile(
  text: LocaleKeys.slideMenu_activityLog,
  image: ImageConstants.instance.drawerActivityLog,
  onPressed: () {
    NavigationService.instance
        .navigateToPageClear(path: NavigationConstants.activityLogView);
  },
);

DrawerTile get _settingsViewDrawerTile=>DrawerTile(
  text: LocaleKeys.slideMenu_settings,
  image: ImageConstants.instance.drawerSettingsIcon,
  onPressed: () {
    NavigationService.instance
        .navigateToPageClear(path: NavigationConstants.settingsView);
  },
);

DrawerTile get _appSelectionAndLocationMergedViewDrawerTile=>DrawerTile(
  text: LocaleKeys.slideMenu_apps,
  image: ImageConstants.instance.drawerAppsIcon,
  onPressed: () {
    NavigationService.instance.navigateToPageClear(
        path: NavigationConstants.appSelectionAndLocationMergedView);
  },
);
