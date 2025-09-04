import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  String userName = "Whitney Nyaviage";
  String userRole = "Skincare Enthusiast";

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path); // ✅ updates UI
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile Header with editable photo
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage, // 👈 Tap to change photo
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.green,
                      child: CircleAvatar(
                        radius: 52,
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!)
                            : null,
                        child: _profileImage == null
                            ? const Icon(
                                Icons.person,
                                size: 52,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    userName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userRole,
                    style: TextStyle(
                      color: themeProvider.isDarkMode
                          ? Colors.white70
                          : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Account Section
            _buildSectionCard(
              context,
              title: "Account",
              children: [
                _buildListTile(
                  Icons.person,
                  "Edit Profile",
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditProfileScreen(
                          currentName: userName,
                          currentRole: userRole,
                        ),
                      ),
                    );
                    if (result != null && mounted) {
                      setState(() {
                        userName = result["name"];
                        userRole = result["role"];
                      });
                    }
                  },
                ),
                _buildListTile(Icons.lock, "Change Password"),
              ],
            ),

            // Preferences Section
            _buildSectionCard(
              context,
              title: "Preferences",
              children: [
                _buildListTile(Icons.notifications, "Notifications"),
                _buildSwitchTile(
                  context,
                  Icons.dark_mode,
                  "Dark Mode",
                  themeProvider,
                ),
              ],
            ),

            // About Section
            _buildSectionCard(
              context,
              title: "About",
              children: [
                _buildListTile(
                  Icons.info,
                  "About Us",
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/dashboard',
                      arguments: 4, // 👈 "About" index in bottom nav
                    );
                  },
                ),
                _buildListTile(
                  Icons.help,
                  "Help & Support",
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/dashboard',
                      arguments: 3, // 👈 "Help" index in bottom nav
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Logout button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("Confirm Logout"),
                      content: const Text("Are you sure you want to log out?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/login');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text("Logout"),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text("Logout"),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Reusable Card Section
  static Widget _buildSectionCard(BuildContext context,
      {required String title, required List<Widget> children}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            ...children,
          ],
        ),
      ),
    );
  }

  // Reusable ListTile
  static Widget _buildListTile(IconData icon, String title,
      {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  // Dark Mode Switch
  static Widget _buildSwitchTile(BuildContext context, IconData icon,
      String title, ThemeProvider themeProvider) {
    return SwitchListTile(
      secondary: Icon(icon, color: Colors.green),
      title: Text(title),
      value: themeProvider.isDarkMode,
      onChanged: (val) {
        themeProvider.toggleTheme(val);
      },
    );
  }}