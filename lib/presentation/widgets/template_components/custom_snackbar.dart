import '../../../core/utils/constants/color_constants.dart';
import '../../../core/utils/extensions/number/notch_and_indicator_padding_mutations_extension.dart';
import '../common/font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSnackBar extends SnackBar {
  final BuildContext _context;
  final bool isSuccess;

  CustomSnackBar(BuildContext context, String? text,
      {Key? key, this.isSuccess = false})
      : _context = context,
        super(
          key: key,
          padding: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
          margin:
              EdgeInsets.fromLTRB(0, 0, 0, 50.h.ejectIndicatorPadding(context)),
          content: FontText.jost(
            translate: false,
            text: text ?? "Hata",
            textAlign: TextAlign.center,
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: isSuccess
              ? const Color.fromRGBO(214, 246, 219, 1)
              : ColorConstants.instance.blank,
        );

  CustomSnackBar.fromList(BuildContext context, List<String>? text,
      {Key? key, this.isSuccess = false})
      : _context = context,
        super(
          key: key,
          padding: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
          margin:
              EdgeInsets.fromLTRB(0, 0, 0, 50.h.ejectIndicatorPadding(context)),
          content: FontText.jost(
              translate: false,
              text: _getErrorFromList(text) ?? "Hata",
              textAlign: TextAlign.center),
          behavior: SnackBarBehavior.floating,
          backgroundColor: isSuccess
              ? const Color.fromRGBO(214, 246, 219, 1)
              : ColorConstants.instance.blank,
        );

  static String? _getErrorFromList(List<String>? errors) {
    String errorMessage;
    try {
      errorMessage = errors!.reduce(
        (value, element) => value + "\n" + element,
      );
      return errorMessage;
    } catch (_) {
      return null;
    }
  }

  void get show {
    ScaffoldMessenger.of(_context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        this,
      );
  }
}
