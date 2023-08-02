import 'package:catalog_app/pages/home_page.dart';
import 'package:catalog_app/pages/login_page.dart';
import 'package:catalog_app/utils/myroutes.dart';
import 'package:catalog_app/widgets/myThems.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: myAllThems.lightThemeData,
      darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,

      // Initialization route
      initialRoute: MyAppRoutes.homeRoute,
      // Create Route
      routes: {
        MyAppRoutes.homeRoute: (context) => const Home(),
        MyAppRoutes.loginRoute: (context) => const Login(),
        MyAppRoutes.registerRoute: (context) => const Home(),
        "/profile": (context) => const Home(),
        "/dashboard": (context) => const Home(),
      },
    );
  }
}
