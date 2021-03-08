import 'dart:ui';

import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimens.dart';

class AppTextStyle {
  static const TextStyle hint =  TextStyle(
    color: AppColors.white,
    fontSize: Dimens.medium,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle headerBoldBlack =  TextStyle(
    color: AppColors.black,
    fontSize: Dimens.big,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyBoldWhite =  TextStyle(
    color: AppColors.white,
    fontSize: Dimens.normal,
    fontWeight: FontWeight.bold,
  );
}

