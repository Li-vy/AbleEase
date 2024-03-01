import 'pages/detailsPage.dart';
import 'pages/homePage.dart';
import 'themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:final_app/pages/loginPage.dart';
import 'pages/meditationPage.dart';
// import 'package:disabilities_traning_app/pages/navigationBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeMode.system,
      routes: {
        '/loginPage': (context) => const LoginPage(),
        '/detailsPage': (context) => const DetailsPage(),
        '/homePage': (context) => const HomePage(),
        '/meditationPage': (context) => const MedPage(),
      },
    );
  }
}
