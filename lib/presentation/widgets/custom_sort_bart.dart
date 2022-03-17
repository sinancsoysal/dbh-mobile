import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile.dart';
import '../../core/utils/constants/locale_keys.g.dart';
import '../../core/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/font_text_widget.dart';

class CustomSortBar extends StatelessWidget {
  CustomSortBar({
    Key? key,
    EdgeInsets? padding,
    this.onDate,
    this.onAdmin,
    this.onManager,
    this.onUser,
  })  : padding = padding ?? EdgeInsets.only(left: 75.w, right: 15.w),
        super(key: key);

  final EdgeInsets padding;
  final GestureTapCallback? onDate;
  final GestureTapCallback? onAdmin;
  final GestureTapCallback? onManager;
  final GestureTapCallback? onUser;

  @override
  Widget build(BuildContext context) {
    return buildActivityLogSortOptions();
  }

  Container buildActivityLogSortOptions() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0.h),
      color: ColorConstants.instance.blank,
      child: ConfigurableExpansionTile(
        header: buildHeader(),
        headerExpanded: buildHeaderExpanded(),
        children: [
          buildOptions(),
        ],
      ),
    );
  }

  Flexible buildHeader() {
    return Flexible(
      child: Container(
        height: 44.h,
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            FontText.jost(
              text: LocaleKeys.sort_sortBy,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  Flexible buildHeaderExpanded() {
    return Flexible(
      child: Container(
        height: 44.h,
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            FontText.jost(
              text: LocaleKeys.sort_sortBy,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            Icon(Icons.arrow_drop_up),
          ],
        ),
      ),
    );
  }

  Container buildOptions() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(51.w, 10.h, 21.w, 10.h),
      child: Wrap(
        runSpacing: 10.h,
        children: [
          if (onDate != null)
            buildSortOption(optionType: LocaleKeys.sort_date, onTap: onDate),
          if (onAdmin != null)
            buildSortOption(optionType: LocaleKeys.sort_admin, onTap: onAdmin),
          if (onUser != null)
            buildSortOption(optionType: LocaleKeys.sort_user, onTap: onUser),
          if (onManager != null)
            buildSortOption(
                optionType: LocaleKeys.sort_manager, onTap: onManager),
        ],
      ),
    );
  }

  GestureDetector buildSortOption(
      {required String optionType, required GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FontText.jost(
            text: optionType,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: ColorConstants.instance.darkGray,
          ),
          Icon(
            Icons.north_west,
            size: 10.sp,
          ),
        ],
      ),
    );
  }
}
