import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/extensions/number/notch_and_indicator_padding_mutations_extension.dart';

class HeaderContent extends StatelessWidget {
  static double get _standartHeight => 87.h;
  static double get _standartHeightWithExtra => 131.h;

  final double _height;
  final bool enableNotchPadding;
  final double topPadding;
  final bool _addNotchPaddingToExtraFieldHeight;

  ///Provives a frame for CustomAppBar.
  ///
  ///Use [HeaderContent.withSubContent] for extra space additional
  /// to CustomAppBar.
  ///
  HeaderContent({
    Key? key,
    required this.child,
    this.enableNotchPadding = false,
    double? topPadding,
  })  : topPadding = topPadding ?? 18.0.h,
        _height = _standartHeight + (topPadding ?? 18.0.h),
        _addNotchPaddingToExtraFieldHeight = false,
        super(key: key);

  ///Extra height can bee added to header customly using [customExtraHeight] field.
  ///
  /// If [customExtraHeight] null 44.h added as default
  ///
  HeaderContent.withSubContent({
    Key? key,
    required this.child,

    /// Uses [_standartHeightWithExtra] if [customExtraHeight] is null.
    ///
    double? customExtraHeight,
    this.enableNotchPadding = false,
    double? topPadding,
  })  : _height = customExtraHeight != null
            ? _standartHeight + customExtraHeight
            : _standartHeightWithExtra + (topPadding ?? 18.0.h),
        _addNotchPaddingToExtraFieldHeight = true,
        topPadding = topPadding ?? 18.0.h,
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: topPadding),
      height: _height +
          ((enableNotchPadding && _addNotchPaddingToExtraFieldHeight)
              ? 0.0.insertNotchPadding(context)
              : 0),
      child: Padding(
        padding: enableNotchPadding
            ? EdgeInsets.only(top: 0.0.h.insertNotchPadding(context))
            : EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
