import 'package:flutter/material.dart';
import 'package:travel_app/representation/screen/hotel_screen.dart';
import 'package:travel_app/representation/screen/intro_screen.dart';
import 'package:travel_app/representation/screen/main_screen.dart';
import 'package:travel_app/representation/screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
  HotelScreen.routeName: (context) => const HotelScreen()
};
