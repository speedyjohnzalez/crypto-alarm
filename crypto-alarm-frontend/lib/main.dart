import 'package:crypto_alarm/features/home/home-layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          elevation: 0.0,
        ),
      ),
      home: Home_layout(), // Set FrontPage as the main screen
    );
  }
}