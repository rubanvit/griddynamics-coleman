import 'package:coleman/resources/ui_constants.dart';
import 'package:flutter/material.dart';

class UIHelper {
  static Widget defaultMaterialApp(
      {required Widget home, required AppBar appBar}) {
    return MaterialApp(
      theme: UIConstants.materialTheme,
      home: Scaffold(
        appBar: appBar,
        body: home,
      ),
    );
  }
}
