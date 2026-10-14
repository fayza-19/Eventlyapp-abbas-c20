import 'package:evently/config/themes/theme.dart';
import 'package:evently/core/routes_manager.dart';
import 'package:evently/features/auth/login/login_screen.dart';
import 'package:evently/features/auth/register/register_screen.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/lang_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/prefsmanager/prefesmanager.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  PrefsManager.init();
  await  Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => LangProvider()),
    ],
    child: const Evently(),
  ),);
}
class Evently extends StatelessWidget {
  const Evently({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LangProvider langProvider = Provider.of<LangProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesManager.onboarding,
      onGenerateRoute: RoutesManager.getRoute,
      theme:ThemeManager.light ,
      darkTheme: ThemeManager.dark,
      themeMode: themeProvider.currentTheme
      ,localizationsDelegates: AppLocalizations.localizationsDelegates
      , supportedLocales: [
      Locale('en'),
      Locale('ar'),
    ],
      locale: Locale(langProvider.currentLanguage),
    );
  }
}


