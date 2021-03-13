import 'package:coleman/create_expert/ui/create_expert.dart';
import 'package:coleman/resources/colors.dart';
import 'package:coleman/ui/project_module/project_screen.dart';
import 'package:flutter/material.dart';
import 'injection.dart';
import 'ui/login_module/login_screen.dart';

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
      routes: <String, WidgetBuilder>{
        AppNavigation.LOGIN: (_) => LoginScreen(),
        AppNavigation.HOME: (_) => CreateExpertScreen(),
      },
    );
  }
}

class AppNavigation{
  static const LOGIN = '/';
  static const HOME = '/home';
}
