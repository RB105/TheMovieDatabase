import 'package:flutter/material.dart';
import 'package:tmdb/view/home/home_page.dart';
import 'package:tmdb/view/screens/currenct_screen.dart';
import 'package:tmdb/view/screens/splash_screen.dart';

class RouteGeneretor {
  // *****
  // Singletone
  static final RouteGeneretor _generetor = RouteGeneretor._init();

  static RouteGeneretor get router => _generetor;

  RouteGeneretor._init();
  //***

  // generator
  Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case "splash":
        return _navigate(const SplashScreen());
      case "current":
        return _navigate(const CurrentScreen());
      // default route Home page
      default:
        return _navigate(const HomePage());
    }
  }

  // navigator
  MaterialPageRoute _navigate(Widget page) {
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }
}
