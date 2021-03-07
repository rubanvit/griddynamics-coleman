import 'package:coleman/ui/ui_helper.dart';
import 'package:flutter/material.dart';

class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text('Coleman'),
    );

    return UIHelper.defaultMaterialApp(appBar: appbar, home: Text('Test text'));
  }
}
