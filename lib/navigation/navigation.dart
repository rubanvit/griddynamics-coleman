import 'package:coleman/create_expert/ui/create_expert.dart';
import 'package:coleman/ui/login_module/login_screen.dart';
import 'package:coleman/ui/project_module/project_screen.dart';
import 'package:flutter/material.dart';

class AppNavigation {
  static const LOGIN = '/';
  static const HOME = '/home';
  static const EXPERTS = '/experts';

  static Map<String, WidgetBuilder> getNavigationRoutes() {
    //here can be different data according to platform
    return <String, WidgetBuilder>{
      AppNavigation.LOGIN: (_) => LoginScreen(),
      AppNavigation.HOME: (_) => CreateExpertScreen(),
      AppNavigation.EXPERTS: (_) => ProjectScreen(),
    };
  }
}