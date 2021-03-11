import 'package:coleman/resources/colors.dart';
import 'package:coleman/ui/project_module/project_screen.dart';
import 'package:flutter/material.dart';
import 'create_expert/ui/create_expert.dart';
import 'injection.dart';
import 'login_module/ui/login_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.scaffold_background,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CreateExpertScreen(),
    );
  }
}

