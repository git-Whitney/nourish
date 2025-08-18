import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart'; // 👈 Custom screen
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/scan_screen.dart';
import 'screens/result_screen.dart';
import 'screens/journal_screen.dart';
import 'screens/help_screen.dart';
import 'screens/about_us_screen.dart';
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

      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/scan': (context) => const ScanScreen(),
        '/result': (context) => const ResultScreen(),
        '/journal': (context) => const JournalScreen(),
        '/help': (context) => const HelpScreen(),
        '/about': (context) => const AboutUsScreen(),
      }, // 👈 Start from Welcome
    );
  }
}
