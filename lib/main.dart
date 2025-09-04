import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart'; // ✅ required
import 'theme_provider.dart';

// Your custom screens
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/scan_screen.dart';
import 'screens/result_screen.dart';
import 'screens/journal_screen.dart';
import 'screens/help_screen.dart';
import 'screens/about_us_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

   return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Nourish',
  theme: ThemeData.light().copyWith(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: const Color(0xFFF5F6FA),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontFamily: 'Roboto'),
    ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const MainScreen(),
        '/scan': (context) => const ScanScreen(),
        '/result': (context) => const ResultScreen(),
        '/journal': (context) => const JournalScreen(),
        '/help': (context) => const HelpScreen(),
        '/about': (context) => const AboutUsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

/// Main screen with Bottom Navigation
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    DashboardScreen(), // 0
    ScanScreen(),      // 1
    JournalScreen(),   // 2
    HelpScreen(),      // 3
    AboutUsScreen(),   // 4
    ProfileScreen(),   // 5
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 👇 Check if arguments were passed from Navigator.pushReplacementNamed
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is int && args >= 0 && args < _screens.length) {
      setState(() {
        _currentIndex = args;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.camera),
            label: "Scan",
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.bookOpen),
            label: "Journal",
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.helpCircle),
            label: "Help",
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.info),
            label: "About",
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.user),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
