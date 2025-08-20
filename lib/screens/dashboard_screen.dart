import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart'; // modern icon package

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Text(
                "Welcome Back 👋",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Your daily skincare companion",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),

              // Grid of Cards
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _buildFeatureCard(
                      context,
                      icon: LucideIcons.camera,
                      title: "Scan",
                      color: Colors.pinkAccent,
                      onTap: () {
                        Navigator.pushNamed(context, '/scan');
                      },
                    ),
                    _buildFeatureCard(
                      context,
                      icon: LucideIcons.bookOpen,
                      title: "Journal",
                      color: Colors.teal,
                      onTap: () {
                        Navigator.pushNamed(context, '/journal');
                      },
                    ),
                    _buildFeatureCard(
                      context,
                      icon: LucideIcons.helpCircle,
                      title: "Help",
                      color: Colors.indigo,
                      onTap: () {
                        Navigator.pushNamed(context, '/help');
                      },
                    ),
                    _buildFeatureCard(
                      context,
                      icon: LucideIcons.info,
                      title: "About Us",
                      color: Colors.orange,
                      onTap: () {
                        Navigator.pushNamed(context, '/aboutus');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context,
      {required IconData icon,
      required String title,
      required Color color,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(0.15),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
