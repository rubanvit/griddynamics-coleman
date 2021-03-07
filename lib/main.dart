import 'package:coleman/ui/project_module/project_screen.dart';
import 'package:flutter/material.dart';
import 'injection.dart';
import 'login_module/ui/login_screen.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coleman',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: ProjectScreen(),
      home: LoginScreen(),
    );
  }
}
