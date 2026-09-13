
import 'package:evently/core/colors_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager{
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.whitef4,
    inputDecorationTheme: InputDecorationThemeData(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorsManager.grey, width: 1)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorsManager.grey, width: 1)
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red, width: 1)
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red, width: 1)
      ),
        hintStyle: TextStyle(color: ColorsManager.darkgrey , fontSize: 14 , fontWeight: FontWeight.normal),
      prefixIconColor: ColorsManager.darkgrey,


    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
        backgroundColor: ColorsManager.darkBlue ,
        foregroundColor: ColorsManager.white,
        textStyle: TextStyle(color:ColorsManager.white,fontWeight: FontWeight.w500 ,fontSize:20 )
      )
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize:20 , fontWeight: FontWeight.w500 , color: ColorsManager.darkBlue )
      ,bodySmall: TextStyle(fontSize:14 , fontWeight: FontWeight.normal , color: ColorsManager.darkgrey )

    )
  );
  static ThemeData dark = ThemeData();

}