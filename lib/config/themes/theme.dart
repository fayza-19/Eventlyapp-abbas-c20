import 'package:flutter/material.dart';
import '../../core/colors_manager.dart';
class ThemeManager {
  static final ThemeData light = ThemeData(
    primaryColor: ColorsManager.darkBlue,
    appBarTheme: AppBarTheme(
      foregroundColor: ColorsManager.black,
      backgroundColor: ColorsManager.whitef4,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),
    ),
    scaffoldBackgroundColor: ColorsManager.whitef4,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.blue,
      unselectedItemColor: ColorsManager.darkgrey,
      // showSelectedLabels: true,
      // showUnselectedLabels: true,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.darkBlue,
      foregroundColor: ColorsManager.white,
      shape: StadiumBorder(),
    ),
    cardTheme: CardThemeData(
      color: ColorsManager.whitef4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: ColorsManager.lightgray, width: 1)
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorsManager.darkgrey, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorsManager.darkgrey, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
      prefixIconColor: ColorsManager.darkgrey,
      hintStyle: TextStyle(
        color: ColorsManager.darkgrey,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.symmetric(vertical: 14),
        backgroundColor: ColorsManager.darkBlue,
        foregroundColor: ColorsManager.white,
        textStyle: TextStyle(
          color: ColorsManager.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
    ),

    iconTheme: IconThemeData(color: ColorsManager.darkBlue),

    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color:  ColorsManager.darkBlue),

      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: ColorsManager.darkBlue,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: ColorsManager.darkgrey,
      ),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ColorsManager.darkBlue),

      titleSmall: TextStyle(
        color: ColorsManager.black,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      titleMedium: TextStyle(
        color: ColorsManager.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),
      labelLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorsManager.darkgrey,
      ),
      labelMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      displaySmall: TextStyle(
        color: ColorsManager.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    primaryColor: ColorsManager.blue,
    appBarTheme: AppBarTheme(
      foregroundColor: ColorsManager.white,
      backgroundColor: ColorsManager.dark,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
    ),
    scaffoldBackgroundColor: ColorsManager.dark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.dark,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.blue,
      unselectedItemColor: ColorsManager.darkgrey,
      // showSelectedLabels: true,
      // showUnselectedLabels: true,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.blue,
      foregroundColor: ColorsManager.white,
      shape: StadiumBorder(),
    ),
    cardTheme: CardThemeData(

      color: ColorsManager.dark,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: ColorsManager.darkBlue, width: 2)
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorsManager.darkBlue, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorsManager.darkBlue, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
      prefixIconColor: ColorsManager.grey,
      suffixIconColor: ColorsManager.grey,
      hintStyle: TextStyle(
        color: ColorsManager.grey,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.symmetric(vertical: 14),
        backgroundColor: ColorsManager.blue,
        foregroundColor: ColorsManager.white,
        textStyle: TextStyle(
          color: ColorsManager.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
    ),

    iconTheme: IconThemeData(color: ColorsManager.darkBlue),

    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ColorsManager.white),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color:  ColorsManager.blue),
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: ColorsManager.grey,
      ),
      titleSmall: TextStyle(
        color: ColorsManager.white,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      titleMedium: TextStyle(
        color: ColorsManager.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),

      labelLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),

      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorsManager.grey,
      ),

      labelMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ColorsManager.white),
      displaySmall: TextStyle(
        color: ColorsManager.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}