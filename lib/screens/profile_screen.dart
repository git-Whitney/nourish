import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "Whitney Nyaviage";
  String userRole = "Skincare Enthusiast";

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

            // Profile Header
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.green,
                    child: const CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('assets/avatar.png'),
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
                _buildListTile(Icons.info, "About Us"),
                _buildListTile(Icons.help, "Help & Support"),
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
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
  }
}

class EditProfileScreen extends StatefulWidget {
  final String currentName;
  final String currentRole;

  const EditProfileScreen(
      {super.key, required this.currentName, required this.currentRole});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _roleController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _roleController = TextEditingController(text: widget.currentRole);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _roleController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    Navigator.pop(context, {
      "name": _nameController.text.trim(),
      "role": _roleController.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _roleController,
              decoration: const InputDecoration(
                labelText: "Role / Bio",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _saveProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
