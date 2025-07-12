import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & Tips')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text('💡 How to Use the App', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text('• Scan your skin to get a diagnosis.'),
            Text('• Read personalized tips and devotionals.'),
            Text('• Use the journal to track your emotions and prayers.'),
            Text('• Navigate using the dashboard.'),
          ],
        ),
      ),
    );
  }
}
