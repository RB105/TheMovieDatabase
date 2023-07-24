import 'package:flutter/material.dart';
import 'package:tmdb/view/home_page.dart';
import 'package:tmdb/view/splash_screen.dart';

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
      case "/":
        return _navigate(const HomePage());
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
