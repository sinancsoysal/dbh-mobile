import 'package:mobile/core/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CommonRefreshIndicator extends RefreshIndicator {
  CommonRefreshIndicator({
    Key? key,
    required Widget child,
    required RefreshCallback onRefresh
  }) : super(
      key: key,
      onRefresh: onRefresh,
      backgroundColor: ColorConstants.instance.white.withOpacity(0.2),
      color: ColorConstants.instance.darkPrimaryBlue,
      child: child
  );
}
