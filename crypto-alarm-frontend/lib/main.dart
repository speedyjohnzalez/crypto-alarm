import 'package:crypto_alarm/features/home/home-layout.dart';
import 'package:flutter/material.dart';
import 'package:crypto_alarm/features/services/crypto_data_service.dart'; //KEEP!!!!!

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Wrap your app in MaterialApp
      title: 'Crypto Prices',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FrontPage(), // Set the initial screen
    );
  }
}

class FrontPage extends StatelessWidget {
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