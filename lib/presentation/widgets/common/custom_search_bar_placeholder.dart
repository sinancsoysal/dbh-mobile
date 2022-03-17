import '../../../core/utils/constants/color_constants.dart';
import '../../../core/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_text_widget.dart';

class CustomSearchBar extends StatelessWidget {
  final double horizontalPadding;
  final bool hasTrailing;
  final EdgeInsets margin;
  final String placeHolderText;
  CustomSearchBar({
    Key? key,
    double? horizontalPadding,
    bool? hasTrailing,
    EdgeInsets? margin,
    required this.placeHolderText,
  })  : horizontalPadding = horizontalPadding ?? 36.w,
        hasTrailing = hasTrailing ?? true,
        margin = margin ?? EdgeInsets.only(bottom: 3.0.h),
        super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return buildSearchBar(
      horizontalPadding,
      hasTrailing,
    );
  }

  Padding buildSearchBar(
    double horizontalPadding,
    bool hasTrailing,
  ) {
    return Padding(
      padding: margin,
      child: Material(
        elevation: 1,
        child: Container(
          color: ColorConstants.instance.blank,
          height: 44.h,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Row(
            children: [
              buildSearchFieldLeadingIcon(
                ImageConstants.instance.searchIcon,
              ),
              SizedBox(width: 34.w),
              buildSearchBarPlaceHolderText(),
              const Spacer(),
              if (hasTrailing)
                buildSearchFieldTrailingIcon(
                  ImageConstants.instance.microphoneIcon,
                ),
            ],
          ),
        ),
      ),
    );
  }

  FontText buildSearchBarPlaceHolderText() {
    return FontText.jost(
      translate: false,
      text: placeHolderText,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
  }

  Image buildSearchFieldLeadingIcon(String image) {
    return Image.asset(
      image,
      color: ColorConstants.instance.primaryBlue,
      fit: BoxFit.contain,
      height: 21.39.h,
      width: 21.43.w,
    );
  }

  Image buildSearchFieldTrailingIcon(String image) {
    return Image.asset(
      image,
      fit: BoxFit.contain,
      height: 23.22.h,
      width: 17.16.w,
    );
  }
}
