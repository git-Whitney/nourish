import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  Uint8List? _webImage;
  bool _loading = false;

  Future<void> pickImage() async {
    setState(() {
      _loading = true;
    });

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      if (kIsWeb) {
        final bytes = await image.readAsBytes();
        setState(() {
          _webImage = bytes;
        });
      }

      setState(() {
        _selectedImage = image;
      });
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Skin Scan")),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.camera_alt, size: 80, color: Colors.green),
              const SizedBox(height: 16),
              const Text(
                "Scan your face to begin analysis",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              ElevatedButton.icon(
                onPressed: pickImage,
                icon: const Icon(Icons.photo_camera),
                label: const Text("Upload or Take Photo"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),

              const SizedBox(height: 24),

              if (_loading)
                const CircularProgressIndicator()
              else if (_selectedImage != null)
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: kIsWeb
                          ? Image.memory(_webImage!, width: 200, height: 200, fit: BoxFit.cover)
                          : Image.file(File(_selectedImage!.path), width: 200, height: 200, fit: BoxFit.cover),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/result',
                          arguments: {
                            'skinType': 'Dry',
                            'tip': 'Use a gentle hydrating moisturizer twice daily.',
                            'verse': 'You are altogether beautiful, my darling; there is no flaw in you.',
                          },
                        );
                      },
                      child: const Text("Analyze Photo"),
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
