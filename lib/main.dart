import 'package:aie_task/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        textTheme:  const TextTheme(
          displayLarge:  TextStyle(
            fontFamily: 'Lato',
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
          ),
          displayMedium: TextStyle(
            fontFamily: 'Lato',
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
          ),
          displaySmall: TextStyle(
            fontFamily: 'Lato',
            fontSize: 16.0,
          ),
          labelLarge: TextStyle(
            fontFamily: 'Lato',
            fontSize: 14.0,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

