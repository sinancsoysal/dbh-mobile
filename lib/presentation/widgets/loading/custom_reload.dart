import '../../../core/utils/constants/image_constants.dart';
import '../../../core/utils/constants/locale_keys.g.dart';
import '../common/font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomReload extends Column {
  CustomReload({Key? key})
      : super(
          key: key,
          children: [
            SizedBox.square(
              dimension: 50.sp,
              child: Image.asset(
                ImageConstants.instance.reloadIcon,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            const FontText.jost(text: LocaleKeys.loading_couldntReload)
          ],
        );
}
