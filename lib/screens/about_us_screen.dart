import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Us')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('🌿 Nourish — Skin & Soul Care App',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text('Created by a passionate student team for a university hackathon.'),
            SizedBox(height: 20),
            Text('👥 Team Members:'),
            Text('- Whitney (Lead & Integration)'),
            Text('- Wilson (UI/UX)'),
            Text('- Selina (Scan & AI)'),
            Text('- Joan (Journal & Devotional)'),
            Text('- Steve (Testing & Deployment)'),
            Text('- Patience (Content & Help)'),
            SizedBox(height: 20),
            Text('🧭 Our mission is to support both physical and emotional wellness.'),
          ],
        ),
      ),
    );
  }
}
