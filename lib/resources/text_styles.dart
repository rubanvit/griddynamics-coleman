import 'dart:ui';

import 'package:coleman/resources/colors.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';

class AppStyles {

  static TextStyle? headerBoldBlack(BuildContext context) => Theme.of(context)
      .textTheme
      .headline5
      ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black);

  static const TextStyle bodyBoldWhite = TextStyle(
    color: AppColors.white,
    fontSize: Dimens.normal,
    fontWeight: FontWeight.bold,
  );

  static ButtonStyle redButtonStyle(BuildContext context) => ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color?>(AppColors.buttonColor));

  static TextStyle? redButtonTextStyle(BuildContext context) =>
      Theme.of(context)
          .textTheme
          .bodyText1
          ?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold);
}
