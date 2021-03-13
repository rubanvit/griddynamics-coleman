import 'package:coleman/domain/models/expert_details.dart';
import 'package:coleman/resources/colors.dart';
import 'package:coleman/resources/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ExpertDetailsTimeCallBack = void Function(ExpertDetailsTime);

extension ExpertDetailsTimeExtension on ExpertDetailsTime {
  ElevatedButton toWidget({required ExpertDetailsTimeCallBack onPressed}) {
    final buttonBorderColor = isAvailable ? AppColors.outlinedButtonColor : AppColors.gray4.withOpacity(0.5);

    return ElevatedButton(
      onPressed: isAvailable ? () => onPressed(this) : null,
      style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: buttonBorderColor, width: Dimens.nano),
              borderRadius:
                  const BorderRadius.all(Radius.circular(Dimens.micro)))),
      child: Text(
        '$localTime',
        style: const TextStyle(color: AppColors.black),
      ),
    );
  }
}
