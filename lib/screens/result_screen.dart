import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    final skinType = args?['skinType'] ?? 'Unknown';
    final tip = args?['tip'] ?? 'No tip provided.';
    final verse = args?['verse'] ?? '';

    return Scaffold(
      appBar: AppBar(title: const Text('Scan Result')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Detected Skin Type:', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                Text(
                  skinType,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),
                Text('Skincare Tip', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(tip, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                Text('Verse of the Day', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(
                  verse,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
