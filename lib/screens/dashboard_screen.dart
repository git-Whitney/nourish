import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nourish Dashboard'),
        centerTitle: true,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          _DashboardTile(
            icon: Icons.camera_alt,
            label: 'Scan',
            onTap: () {
              Navigator.pushNamed(context, '/scan');
            },
          ),
          _DashboardTile(
            icon: Icons.edit_note,
            label: 'Journal',
            onTap: () {
              Navigator.pushNamed(context, '/journal');
            },
          ),
          _DashboardTile(
            icon: Icons.help_outline,
            label: 'Help',
            onTap: () {
              Navigator.pushNamed(context, '/help');
            },
          ),
          _DashboardTile(
            icon: Icons.info_outline,
            label: 'About Us',
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }
}

class _DashboardTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DashboardTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green[100],
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.green[700]),
              const SizedBox(height: 10),
              Text(label, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
