import 'package:flutter/cupertino.dart';

extension NotchAndIndicatorPaddingMutationsExtension on double {
  double insertIndicatorPadding(BuildContext context) =>
      this + MediaQuery.of(context).viewPadding.bottom;

  double ejectIndicatorPadding(BuildContext context) =>
      this - MediaQuery.of(context).viewPadding.bottom;

  double insertNotchPadding(BuildContext context) =>
      this + MediaQuery.of(context).viewPadding.top;

  double ejectNotchPadding(BuildContext context) =>
      this - MediaQuery.of(context).viewPadding.top;
}
