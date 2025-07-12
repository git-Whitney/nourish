import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart'; // 👈 This must point to your custom screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nourish',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const WelcomeScreen(), // 👈 This is the key line!
    );
  }
}
