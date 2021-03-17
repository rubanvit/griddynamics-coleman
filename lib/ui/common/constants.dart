import 'package:coleman/ui/common/colors.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class UIConstants {

  static ThemeData materialTheme = ThemeData(
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: AppColors.appbarBackground,
      textTheme: ThemeData.dark().textTheme.copyWith(
            title: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
    ),

    textTheme: ThemeData.light().textTheme.copyWith(
          headline1: const TextStyle(height: 1.3),
          headline2: const TextStyle(height: 1.3),
          headline3: const TextStyle(height: 1.3),
          headline4: const TextStyle(height: 1.3),
          headline5: const TextStyle(height: 1.3),
          headline6: const TextStyle(height: 1.3),
          bodyText1: const TextStyle(height: 1.3),
          bodyText2: const TextStyle(height: 1.3),
        ),

    dividerTheme: DividerThemeData(color: AppColors.gray3, thickness: 1),
  );
}
