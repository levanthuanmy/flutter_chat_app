import 'package:flutter/material.dart';

class UIConstant {
  static Color primary = const Color.fromRGBO(74, 98, 224, 1);
  static Color secondary = const Color.fromRGBO(110, 110, 110, 1);

  /// Disabled background color
  static Color tertiary = const Color.fromRGBO(229, 229, 229, 1);
  static Color white = Colors.white;

  static Color black = Colors.black;

  static const double borderRadius = 10;

  static double fontSize12 = 12;
  static double fontSize14 = 14;
  static double fontSize16 = 16;
  static double fontSize18 = 18;
  static double fontSize24 = 24;
  static double fontSize32 = 32;

  static FontWeight fontWeightLight = FontWeight.w300;
  static FontWeight fontWeightNormal = FontWeight.w400;
  static FontWeight fontWeightMedium = FontWeight.w500;
  static FontWeight fontWeightSemiBold = FontWeight.w600;
  static FontWeight fontWeightBold = FontWeight.w700;

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
