import 'package:coleman/resources/colors.dart';
import 'package:coleman/resources/dimens.dart';
import 'package:coleman/resources/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final String _title;
  final String _title2;
  final String _actionButtonTitle;
  final VoidCallback _onPressed;

  const AppDialog(
      {Key? key,
      required String title,
      required String title2,
      required String actionButtonTitle,
      required VoidCallback onPressed})
      : _title = title,
        _title2 = title2,
        _actionButtonTitle = actionButtonTitle,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.normal)),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(
              child: Text(
                _title,
                style: AppTextStyle.headerW400White,
              ),
            ),
            FittedBox(
              child: Text(
                _title2,
                style: AppTextStyle.headerW400White,
              ),
            ),
            ElevatedButton(
              style:
                  OutlinedButton.styleFrom(backgroundColor: Colors.transparent),
              onPressed: _onPressed,
              child: Text(
                _actionButtonTitle,
                style: AppTextStyle.headerW400Blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
