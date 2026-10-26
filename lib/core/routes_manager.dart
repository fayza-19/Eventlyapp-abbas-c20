

import 'package:evently/features/create_event/create_event_screen.dart';
import 'package:evently/features/main_layout/main_layout.dart';
import 'package:evently/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/login/login_screen.dart';
import '../features/auth/register/register_screen.dart';

abstract class RoutesManager {
   static const String loginscreen = "/loginsceen";
   static const String registerscreen = "/registerscreen";
   static const String mainlayout = "/mainlayout";
   static const String createEvent = "/createEvent";
   static const String onboarding = "/onboarding";



   static Route ? getRoute(RouteSettings settings){
  switch(settings.name){
    case RoutesManager.registerscreen :{
      return MaterialPageRoute(builder: (context)=> RegisterScreen());
    }
    case RoutesManager.createEvent :{
      return MaterialPageRoute(builder: (context)=> CreateEventScreen());
    }
    case RoutesManager.loginscreen :{
      return MaterialPageRoute(builder: (context)=> LoginScreen());
    }
    case RoutesManager.mainlayout :{
      return MaterialPageRoute(builder: (context)=> MainLayout());
    }
    case RoutesManager.onboarding :{
      return MaterialPageRoute(builder: (context)=> OnboardingScreen());
    }

  }
}
}