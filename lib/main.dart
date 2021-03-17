import 'package:coleman/navigation/navigation.dart';
import 'package:coleman/ui/common/constants.dart';
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
      title: 'Coleman',
      theme: UIConstants.materialTheme,
      routes: AppNavigation.getNavigationRoutes(),
    );
  }
}
