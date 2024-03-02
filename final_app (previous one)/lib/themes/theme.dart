import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: Color(0xffFBF9FF),
      primary: Color(0xffFFFFFF),
      secondary: Color(0xffEA3EF7),

      onPrimary: Color(0xff000000), // Head_Text
      onSecondary: Color(0xff86878A), // Sub_Text
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Color(0xff191025),
      primary: Color(0xff251C31),
      secondary: Color(0xffEA3EF7),

      onPrimary: Color(0xffFFFFFF), // Head_Text
      onSecondary: Color(0xff8E889A), // Sub_Text
    ));
