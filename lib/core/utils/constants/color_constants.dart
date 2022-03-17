import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants? _instance;

  static ColorConstants get instance => _instance ??= ColorConstants._init();

  ColorConstants._init();

  Color get primaryBlue => const Color.fromRGBO(31, 75, 153, 1);

  Color get white => const Color.fromRGBO(255, 255, 255, 1);

  Color get blank => const Color(0xFFEEEEEE);

  Color get darkGray => const Color.fromRGBO(136, 136, 136, 1);

  Color get _primaryBlueDarkFirstGradient =>
      const Color.fromRGBO(51, 68, 101, 1);

  Color get darkPrimaryBlue => const Color.fromRGBO(28, 37, 49, 1);

  Color get cancelRed => const Color.fromRGBO(235, 82, 82, 1);

  LinearGradient get primaryBlueGradientLinear => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          _primaryBlueDarkFirstGradient,
          darkPrimaryBlue,
        ],
        stops: const [
          0.0,
          1.0,
        ],
      );
  RadialGradient get primaryBlueGradientRadial => RadialGradient(
          colors: [
            _primaryBlueDarkFirstGradient,
            darkPrimaryBlue,
          ],
          center: const Alignment(0.0, 2),
          focal: const Alignment(1, 1),
          focalRadius: 2,
          radius: 2);
}
