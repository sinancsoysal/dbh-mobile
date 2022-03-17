import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class ShiningGradiendEffect extends Stack {
  ShiningGradiendEffect({Key? key})
      : super(
          key: key,
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            buildShiningLinearGradient(),
            buildShiningRadialGradient(),
          ],
        );
}

Positioned buildShiningLinearGradient() {
  return Positioned(
    height: 748.h,
    width: 421.5.w,
    child: Transform.rotate(
      angle: math.pi / 6,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.transparent,
              Color.fromRGBO(191, 202, 255, .1),
              Color.fromRGBO(191, 202, 255, .1),
              Colors.transparent,
            ],
            stops: [
              0.1,
              0.2,
              0.8,
              0.9,
            ],
          ),
        ),
      ),
    ),
  );
}

Container buildShiningRadialGradient() {
  return Container(
    height: 500.h,
    decoration: const BoxDecoration(
      gradient: RadialGradient(
        colors: [Color.fromRGBO(99, 111, 212, .31), Colors.transparent],
      ),
    ),
  );
}
