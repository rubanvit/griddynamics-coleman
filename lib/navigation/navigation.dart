import 'package:coleman/expert_details_module/ui/expert_details.dart';
import 'package:coleman/ui/login_module/login_screen.dart';
import 'package:coleman/ui/project_module/project_screen.dart';
import 'package:coleman/ui/projects_list_module/projects_list.dart';
import 'package:flutter/material.dart';

class AppNavigation {
  static const LOGIN = '/';
  static const HOME = '/home';
  static const EXPERTS = '/experts';
  static const EXPERTS_DETAILS = '/details';

  static Map<String, WidgetBuilder> getNavigationRoutes() {
    //here can be different data according to platform
    return <String, WidgetBuilder>{
      AppNavigation.LOGIN: (_) => LoginScreen(),
      AppNavigation.HOME: (_) => ProjectsListScreen(),
      AppNavigation.EXPERTS: (_) => ProjectScreen(),
      AppNavigation.EXPERTS_DETAILS: (_) => ExpertDetailsScreen(),
    };
  }
}