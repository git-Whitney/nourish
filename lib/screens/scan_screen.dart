import 'package:flutter/material.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skin Scan"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.camera_alt, size: 100, color: Colors.green),
            const SizedBox(height: 20),
            const Text("Scan your face to begin skin analysis",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Call image picker
              },
              icon: const Icon(Icons.upload),
              label: const Text("Upload or Take Photo"),
            ),
          ],
        ),
      ),
    );
  }
}
