import 'package:flutter/material.dart';

class AppColors{
  static const white = Colors.white;
  static const lighter_gray = Color(0xffF2F2F2);
  static const light_gray = Color(0xff828282);
  static const gray = Color(0xff3C3C43);
  static const dark_gray = Color(0xff333333);
  static const black = Color(0xff000000);
  static const orange = Color(0xffF2994A);
  static const dark_green = Color(0xffA7A836);
  static const dark_red = Color(0xff76041c);
  static const light_purple = Color(0xffc2bbd2);
  static const scaffold_background = Color(0xffececec);
  static const blue = Color(0xff1a73ca);
  static const green = Color(0xff36955d);

  static const gray1 = Color(0xff333333);
  static const gray2 = Color(0xff545454);
  static const gray3 = Color(0xff828282);
  static const gray4 = Color(0xffBDBDBD);
  static const gray6 = Color(0xffF2F2F2);

  static const appbarBackground = Color(0xff202f45);
  static const appbarMenuButtonColor = Color(0xffffffff);
  static const lightOrange = Color(0xfffefaf4);
  static const bookmarkIconColor = Color(0xffb3aec7);
  static const outlinedButtonColor = Color(0xff006e00);
  static const buttonColor = Color(0xff6c141f);
  static const formBackgroundColor = Color(0xffe9f0fd);
  static const formUnfocusedBorderColor = Color(0xffbdb5ca);
  static const formFocusedBorderColor = Color(0xff000568);

  static MaterialColor createMaterialColor(Color color) {
    List<double> strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
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