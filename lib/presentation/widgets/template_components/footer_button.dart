import '../../../core/utils/constants/color_constants.dart';
import '../common/font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FooterButton extends StatelessWidget {
  FooterButton({
    Key? key,
    required this.text,
    this.isActive = true,
    this.onPressed,
  })  : _buttonColor = !isActive
            ? ColorConstants.instance.blank
            : ColorConstants.instance.primaryBlue,
        _textColor = !isActive
            ? ColorConstants.instance.darkGray
            : ColorConstants.instance.white,
        super(key: key);

  FooterButton.customColor({
    Key? key,
    required this.text,
    Color? buttonColor,
    Color? textColor,
    this.onPressed,
  })  : _buttonColor = buttonColor ?? ColorConstants.instance.white,
        _textColor = textColor ?? Colors.black,
        isActive = true,
        super(key: key);

  final String text;
  final bool isActive;
  final GestureTapCallback? onPressed;
  final Color _buttonColor;
  final Color _textColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 49.h,
          alignment: Alignment.center,
          color: _buttonColor,
          child: FontText.jost(
            text: text,
            color: _textColor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
