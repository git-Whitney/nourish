import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart'; // for date formatting

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String today = DateFormat('EEEE, d MMMM').format(DateTime.now());

    // Example daily tips list (you can later fetch from backend/Firestore)
    final List<String> dailyTips = [
      "Drink at least 8 glasses of water today 💧",
      "Always wear sunscreen before going outside ☀️",
      "Don’t forget to moisturize after cleansing 🧴",
      "Get 7–8 hours of sleep for healthier skin 😴",
      "Eat more fruits and vegetables for glowing skin 🥦🍎",
    ];

    // Pick a random tip based on the day
    String todayTip = dailyTips[DateTime.now().day % dailyTips.length];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Greeting Header
              Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage:
                        AssetImage("assets/images/profile.png"), // placeholder
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome Back 👋",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        today,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                "Your daily skincare companion",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),

              /// 🌟 Daily Tip Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(LucideIcons.sparkles, color: Colors.green),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        todayTip,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              /// Grid of Feature Cards
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
