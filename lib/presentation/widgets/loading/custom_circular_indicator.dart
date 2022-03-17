import '../../../core/utils/constants/locale_keys.g.dart';
import '../common/font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircularIndicator extends Column {
  CustomCircularIndicator({Key? key}) : super(
    key: key,
    children: [
      _customCircularIndicatorProgressIndicator,
      _customCircularIndicatorSpacer,
      _customCircularIndicatorLoadingText
    ],
  );

  CustomCircularIndicator.centered({
    Key? key
  }) : super(
    key: key,
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _customCircularIndicatorProgressIndicator,
      _customCircularIndicatorSpacer,
      _customCircularIndicatorLoadingText
    ],
  );
}

SizedBox get _customCircularIndicatorProgressIndicator=>SizedBox.square(
  dimension: 50.sp,
  child: CircularProgressIndicator(
    strokeWidth: 4.h,
    color: Colors.black,
    backgroundColor: Colors.black.withOpacity(.5),
  ),
);

SizedBox get _customCircularIndicatorSpacer=>SizedBox(height: 15.h);

FontText get _customCircularIndicatorLoadingText=>const FontText.jost(text: LocaleKeys.loading_loading);
