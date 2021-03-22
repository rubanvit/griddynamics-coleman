import 'package:coleman/navigation/navigation.dart';
import 'package:coleman/ui/common/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();

  const Locale _enLocale = Locale('en', 'US');
  const Locale _ruLocale = Locale('ru', 'RU');

  runApp(EasyLocalization(
      supportedLocales: const [_enLocale, _ruLocale],
      path: 'assets/translations',
      fallbackLocale: _enLocale,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Coleman',
      theme: UIConstants.materialTheme,
      routes: AppNavigation.getNavigationRoutes(),
    );
  }
}
