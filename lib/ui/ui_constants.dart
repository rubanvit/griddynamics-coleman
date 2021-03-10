import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class UIConstants {
  static const gray1 = Color(0xff333333);
  static const gray2 = Color(0xff545454);
  static const gray3 = Color(0xff828282);
  static const gray4 = Color(0xffBDBDBD);
  static const gray6 = Color(0xffF2F2F2);

  static const appbarBackground = Color(0xffeeeeee);
  static const lightOrange = Color(0xfffefaf4);
  static const orange = Color(0xfff2d19c);
  static const blue = Color(0xff5d99d6);
  static const bookmarkIconColor = Color(0xffb3aec7);
  static const outlinedButtonColor = Color(0xff006e00);

  static ThemeData materialTheme = ThemeData(
    // primarySwatch: Colors.purple,
    // accentColor: Colors.amber,
    appBarTheme: AppBarTheme(
      backgroundColor: appbarBackground,
      textTheme: ThemeData.light().textTheme.copyWith(
            title: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
    ),

    textTheme: ThemeData.light().textTheme.copyWith(

          headline3: const TextStyle(
            fontWeight: FontWeight.bold,
          ),

          headline5: const TextStyle(
            fontWeight: FontWeight.normal,
          ),

          button: const TextStyle(color: Colors.white),
        ),
  );
}
