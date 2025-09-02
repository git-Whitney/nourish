import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  final List<Map<String, String>> _faq = const [
    {
      "question": "How do I scan my skin?",
      "answer":
          "Go to the Scan screen from the dashboard, take a clear photo in good lighting, and wait for the analysis."
    },
    {
      "question": "Are my journal entries private?",
      "answer":
          "Yes. All your notes are stored locally and will remain visible only to you unless you back them up."
    },
    {
      "question": "How do I reset my password?",
      "answer":
          "Go to the Login screen and tap 'Forgot Password'. Follow the instructions sent to your email."
    },
    {
      "question": "How can I contact support?",
      "answer":
          "You can reach us directly through the 'Contact Us' button below."
    },
  ];

  Future<void> _contactSupport() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@nourishapp.com', // <-- Replace with your support email
      queryParameters: {
        'subject': 'Nourish App Support',
      },
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw Exception('Could not launch email client');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & Support"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Frequently Asked Questions",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // FAQ List
          ..._faq.map(
            (faq) => Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ExpansionTile(
                leading: const Icon(LucideIcons.helpCircle),
                title: Text(
                  faq["question"]!,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(faq["answer"]!),
                  )
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Contact Support
          ElevatedButton.icon(
            onPressed: _contactSupport,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(LucideIcons.mail),
            label: const Text("Contact Us"),
          ),
        ],
      ),
    );
  }
}
