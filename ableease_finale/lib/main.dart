import 'package:ableeasefinale/pages/UI/homePage.dart';
import 'package:ableeasefinale/pages/UI/loginPage.dart';
import 'package:ableeasefinale/pages/UI/parentPage.dart';
import 'package:flutter/material.dart';

import 'pages/disability_page.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ParentPage(),
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeMode.dark,
    );
  }
}
