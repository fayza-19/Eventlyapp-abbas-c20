

import 'package:flutter/material.dart';

import '../features/auth/login/login_screen.dart';
import '../features/auth/register/register_screen.dart';

abstract class RoutesManager {
   static const String loginscreen = "/loginsceen";
   static const String registerscreen = "/registerscreen";

static Route ? getRoute(RouteSettings settings){
  switch(settings.name){
    case RoutesManager.registerscreen :{
      return MaterialPageRoute(builder: (context)=> RegisterScreen());
    }
    case RoutesManager.loginscreen :{
      return MaterialPageRoute(builder: (context)=> LoginScreen());
    }
  }
}
}