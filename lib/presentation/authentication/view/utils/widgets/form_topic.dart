import '../../../../../core/utils/constants/color_constants.dart';
import '../../../../widgets/common/font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormTopic extends Column {
  final String title;
  final String subTitle;
  FormTopic({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(
          crossAxisAlignment: CrossAxisAlignment.start,
          key: key,
          children: [
            FontText.inter(
              text: title,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10.h),
            FontText.jost(
              text: subTitle,
              fontSize: 14,
              color: ColorConstants.instance.darkGray,
            ),
          ],
        );
}
