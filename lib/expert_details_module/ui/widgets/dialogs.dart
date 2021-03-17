import 'package:coleman/ui/common/colors.dart';
import 'package:coleman/ui/common/dimens.dart';
import 'package:coleman/ui/common/styles.dart';
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
                style: AppStyles.headerW400White,
              ),
            ),
            FittedBox(
              child: Text(
                _title2,
                style: AppStyles.headerW400White,
              ),
            ),
            ElevatedButton(
              style:
                  OutlinedButton.styleFrom(backgroundColor: Colors.transparent),
              onPressed: _onPressed,
              child: Text(
                _actionButtonTitle,
                style: AppStyles.headerW400Blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
