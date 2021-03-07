import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class UIConstants {

  static const gray1 = Color(0xff333333);
  static const gray2 = Color(0xff545454);
  static const gray3 = Color(0xff828282);
  static const gray4 = Color(0xffBDBDBD);
  static const gray6 = Color(0xffF2F2F2);

  static const appbarBackground = Color(0xffeeeeee);

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
          title: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          button: const TextStyle(color: Colors.white),
        ),
  );
}
