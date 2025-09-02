import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  final String _appDescription = 
      "Nourish is a wellness companion designed to help you track your skin health, "
      "document personal reflections, and access helpful resources. Our mission is to make "
      "self-care simple, personal, and accessible.";

  final List<Map<String, String>> _team = const [
    {
      "name": "Whitney Nyaviage",
      "role": "Team Lead & Developer",
    },
    {
      "name": "Wilson Thoma",
      "role": "UI/UX Designer",
    },
    {
      "name": "Selina",
      "role": "Scan & AI Specialist",
    },
    {
      "name": "Joan",
      "role": "Journal & Verse",
    },
    {
      "name": "Steve",
      "role": "Testing & Deployment",
    },
    {
      "name": "Patience",
      "role": "Content & Help",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // App Mission
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(LucideIcons.heart, size: 40, color: Colors.pink),
                  const SizedBox(height: 12),
                  const Text(
                    "Our Mission",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _appDescription,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Meet the Team",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // Team Members
          ..._team.map(
            (member) => Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(LucideIcons.user),
                title: Text(
                  member["name"]!,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(member["role"]!),
              ),
            ),
          ),

          const SizedBox(height: 30),

          Center(
            child: Text(
              "© 2025 Nourish App",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic,
              ),
            ),
          )
        ],
      ),
    );
  }
}
