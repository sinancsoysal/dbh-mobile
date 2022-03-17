import '../../../core/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_text_widget.dart';

class CustomSettingsButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String text;
  final IconData? icon;
  final IconData? trailingIcon;
  final Color? _buttonColor;
  final Color? _contentColor;
  final bool translate;

  CustomSettingsButton({
    Key? key,
    this.onTap,
    required this.text,
    this.icon,
    this.trailingIcon,
    Color? buttonColor,
    Color? contentColor,
    this.translate = true,
  })  : _buttonColor = buttonColor ?? ColorConstants.instance.primaryBlue,
        _contentColor = contentColor ?? ColorConstants.instance.white,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36.h,
        padding: EdgeInsets.fromLTRB(16.w, 0, 9.w, 0),
        alignment: Alignment.centerLeft,
        color: _buttonColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (icon != null) Icon(icon, color: _contentColor),
                SizedBox(width: 17.h),
                FontText.jost(
                  translate: translate,
                  text: text,
                  fontSize: 12,
                  color: _contentColor,
                ),
              ],
            ),
            if (trailingIcon != null) Icon(trailingIcon, color: _contentColor),
          ],
        ),
      ),
    );
  }
}
