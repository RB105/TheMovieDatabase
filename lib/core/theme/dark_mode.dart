import 'package:flutter/material.dart';

class DarkMode {

  // colors
  static Color primary = Colors.white70;
  static Color neutral = const Color(0xff1E1F27);

  // text styles
  static TextStyle primaryStyle = TextStyle(color: primary);
  static TextStyle titleStyle = TextStyle(color: primary,fontSize: 20);

  // widget styles
  static ThemeData theme = ThemeData(scaffoldBackgroundColor: neutral);
}
