import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';

import '../../../core/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_text_widget.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.topic,
    this.controller,
    bool? obscureText,
    this.onChanged,
    this.enabled,
    this.validator,
    this.validationObject,
  })  : obscureText = obscureText ?? false,
        super(key: key);

  final String topic;
  final TextEditingController? controller;
  final bool? obscureText;
  final ValueChanged<String>? onChanged;
  final bool? enabled;
  final FormFieldValidator<String>? validator;
  final FormzInput? validationObject;
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FontText.jost(
            text: topic,
            fontSize: 12,
            color: ColorConstants.instance.darkGray,
          ),
          SizedBox(height: 9.h),
          SizedBox(
            height: 36.h,
            child: TextFormField(
              validator: validator,
              enabled: enabled,
              onChanged: onChanged,
              style: TextStyle(
                  fontFamily: "Jost",
                  fontSize: 12.sp,
                  color: enabled ?? true
                      ? null
                      : ColorConstants.instance.darkGray),
              obscureText: obscureText!,
              controller: controller,
              key: key,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: topic.tr(),
                filled: true,
                fillColor: ColorConstants.instance.blank,
              ),
            ),
          ),
          if (validationObject?.invalid ?? false)
            SizedBox(
              height: 16.h,
              child: FontText.jost(
                text: validationObject?.error ?? "",
                color: ColorConstants.instance.cancelRed,
              ),
            ),
        ],
      ),
    );
  }
}
