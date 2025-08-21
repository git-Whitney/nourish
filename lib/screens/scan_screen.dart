import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:lottie/lottie.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  Uint8List? _webImage;
  bool _isProcessing = false;
  bool _scanComplete = false;

  final List<String> _tips = [
    "Stay hydrated for healthy skin.",
    "Use sunscreen daily.",
    "Moisturize twice a day.",
    "Get enough sleep to refresh your skin.",
  ];

  int _tipIndex = 0;

  Future<void> pickImage(ImageSource source) async {
    setState(() {
      _isProcessing = true;
      _scanComplete = false;
    });

    final XFile? image = await _picker.pickImage(source: source);

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

      // Simulate AI processing delay
      await Future.delayed(const Duration(seconds: 3));

      setState(() {
        _isProcessing = false;
        _scanComplete = true;
      });

      // Hide success animation after 2 seconds
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        _scanComplete = false;
      });
    } else {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  void _nextTip() {
    setState(() {
      _tipIndex = (_tipIndex + 1) % _tips.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB2F7EF), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Lottie Animation / Image
                  SizedBox(
                    height: 150,
                    child: _isProcessing
                        ? Lottie.asset('assets/lottie/loading_dots.json', repeat: true)
                        : _scanComplete
                            ? Lottie.asset('assets/lottie/success_check.json', repeat: false)
                            : Lottie.asset('assets/lottie/camera_scanning.json', repeat: true),
                  ),

                  const SizedBox(height: 16),
                  const Text(
                    "Scan your face to begin analysis",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  /// Upload Buttons
                  if (!_isProcessing && !_scanComplete)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          heroTag: "camera",
                          onPressed: () => pickImage(ImageSource.camera),
                          backgroundColor: Colors.green,
                          child: const Icon(Icons.camera_alt),
                        ),
                        const SizedBox(width: 24),
                        FloatingActionButton(
                          heroTag: "gallery",
                          onPressed: () => pickImage(ImageSource.gallery),
                          backgroundColor: Colors.green,
                          child: const Icon(Icons.photo),
                        ),
                      ],
                    ),

                  const SizedBox(height: 24),

                  /// Image Preview
                  if (!_isProcessing && !_scanComplete && _selectedImage != null)
                    Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: kIsWeb
                                  ? Image.memory(
                                      _webImage!,
                                      width: 220,
                                      height: 220,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      File(_selectedImage!.path),
                                      width: 220,
                                      height: 220,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedImage = null;
                                    _webImage = null;
                                  });
                                },
                                child: const CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.red,
                                  child: Icon(Icons.close, size: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
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
                                'verse':
                                    'You are altogether beautiful, my darling; there is no flaw in you.',
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text("Analyze Photo"),
                        ),
                      ],
                    ),

                  const SizedBox(height: 24),

                  /// Skincare Tips Carousel
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    color: Colors.green.shade50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              _tips[_tipIndex],
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios, size: 16),
                            onPressed: _nextTip,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
