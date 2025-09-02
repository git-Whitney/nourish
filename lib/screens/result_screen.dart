import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    final skinType = args?['skinType'] ?? 'Unknown';
    final tip = args?['tip'] ?? 'No tip provided.';
    final verse = args?['verse'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Result'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Success animation at top
            Lottie.asset(
              'assets/lottie/success_check.json',
              height: 120,
              repeat: false,
            ),
            const SizedBox(height: 20),

            // Card with results
            Expanded(
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            const Icon(LucideIcons.user, color: Colors.green),
                            const SizedBox(width: 8),
                            Text(
                              'Detected Skin Type',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          skinType,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),

                        const SizedBox(height: 20),
                        const Divider(),
                        const SizedBox(height: 10),

                        Row(
                          children: [
                            const Icon(LucideIcons.sparkles,
                                color: Colors.orange),
                            const SizedBox(width: 8),
                            Text(
                              'Skincare Tip',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          tip,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),

                        const SizedBox(height: 20),

                        Row(
                          children: [
                            const Icon(LucideIcons.book, color: Colors.purple),
                            const SizedBox(width: 8),
                            Text(
                              'Verse of the Day',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
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
            ),

            const SizedBox(height: 20),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(LucideIcons.rotateCcw, color: Colors.white),
                  label: const Text('Rescan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Implement share feature
                  },
                  icon: const Icon(LucideIcons.share, color: Colors.green),
                  label: const Text(
                    'Share',
                    style: TextStyle(color: Colors.green),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: const BorderSide(color: Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
