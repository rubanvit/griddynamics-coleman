import 'package:coleman/resources/colors.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class UIConstants {

  static ThemeData materialTheme = ThemeData(
    // primarySwatch: Colors.purple,
    // accentColor: Colors.amber,
    appBarTheme: AppBarTheme(
      color: AppColors.appbarBackground,
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
    dividerTheme: DividerThemeData(
      color: AppColors.gray3,
      thickness: 1,
    ),
  );
}
