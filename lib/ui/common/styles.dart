import 'dart:ui';

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

  static OutlineInputBorder buildOutLineBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimens.micro),
      borderSide: BorderSide(color: color),
    );
  }

  static const TextStyle bodyBoldBlack =  TextStyle(
    color: AppColors.black,
    fontSize: Dimens.normal,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle body2BoldBlack =  TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyW400Grey =  TextStyle(
    color: AppColors.light_gray,
    fontSize: Dimens.normal,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle body2W400Green =  TextStyle(
    color: AppColors.green,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle body2W400Black =  TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle headerW400White =  TextStyle(
    color: AppColors.white,
    fontSize: Dimens.big,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle headerW400Blue =  TextStyle(
    color: AppColors.blue,
    fontSize: Dimens.big,
    fontWeight: FontWeight.w400,
  );
}

