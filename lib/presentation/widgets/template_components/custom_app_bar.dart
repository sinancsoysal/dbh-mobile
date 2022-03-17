import '../../../core/utils/constants/color_constants.dart';
import '../../../core/utils/constants/image_constants.dart';
import '../common/font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.sliderKey,
    required this.title,
    this.subTitle,
    this.leadigPadding = 16,
    this.hasMenuButton = true,
    this.translateSubTitle = true,
  }) : super(key: key);

  final GlobalKey<SliderMenuContainerState> sliderKey;
  final String title;
  final String? subTitle;
  final double leadigPadding;
  final bool hasMenuButton;
  final bool translateSubTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: leadigPadding.w,
        ),
        if (hasMenuButton) buildDrawerMenuButton(),
        SizedBox(width: 43.w),
        buildAppbarContent(),
      ],
    );
  }

  GestureDetector buildDrawerMenuButton() {
    return GestureDetector(
      onTap: () => sliderKey.currentState!.isDrawerOpen
          ? sliderKey.currentState!.closeDrawer()
          : sliderKey.currentState!.openDrawer(),
      child: Image.asset(
        ImageConstants.instance.menuIcon,
        fit: BoxFit.contain,
        width: 25.w,
      ),
    );
  }

  Column buildAppbarContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle(),
        SizedBox(
          height: 12.h,
        ),
        buildSubTitle(),
      ],
    );
  }

  FontText buildTitle() {
    return FontText.inter(
      text: title,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }

  FontText buildSubTitle() {
    return FontText.jost(
      translate: translateSubTitle,
      text: subTitle ?? "",
      fontSize: 14,
      color: ColorConstants.instance.darkGray,
    );
  }
}
