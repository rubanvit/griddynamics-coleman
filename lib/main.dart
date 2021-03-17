import 'package:coleman/navigation/navigation.dart';
import 'package:coleman/ui/common/colors.dart';
import 'package:flutter/material.dart';
import 'injection.dart';

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
      routes: AppNavigation.getNavigationRoutes(),
    );
  }
}
