import 'package:evently/config/themes/theme.dart';
import 'package:evently/core/routes_manager.dart';
import 'package:evently/features/auth/login/login_screen.dart';
import 'package:evently/features/auth/register/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( Evently());
}

class Evently extends StatelessWidget {
  const Evently({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesManager.loginscreen,
      onGenerateRoute: RoutesManager.getRoute,
      theme:ThemeManager.light ,
      darkTheme: ThemeManager.dark,
      themeMode: ThemeMode.light,
      locale: Locale('en'),

    );
  }
}


