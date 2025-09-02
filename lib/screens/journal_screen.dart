import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart'; // For formatting dates

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final List<Map<String, dynamic>> _entries = [];

  void _addEntry() {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("New Journal Entry"),
        content: TextField(
          controller: controller,
          maxLines: 6,
          decoration: const InputDecoration(
            hintText: "Write your thoughts or prayers...",
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton.icon(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                setState(() {
                  _entries.insert(0, {
                    "text": controller.text,
                    "date": DateTime.now(),
                  });
                });
              }
              Navigator.pop(context);
            },
            icon: const Icon(LucideIcons.save),
            label: const Text("Save"),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat("EEE, MMM d • h:mm a").format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Journal"),
      ),
      body: _entries.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(LucideIcons.bookOpen, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    "No journal entries yet.\nTap + to add one!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _entries.length,
              itemBuilder: (context, index) {
                final entry = _entries[index];
                return Dismissible(
                  key: Key(entry["date"].toString()), // unique key
                  direction: DismissDirection.endToStart, // swipe left
                  onDismissed: (_) {
                    setState(() {
                      _entries.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Entry deleted")),
                    );
                  },
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.red.shade400,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(LucideIcons.trash2, color: Colors.white),
                  ),
                  child: Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: const Icon(LucideIcons.feather,
                          color: Colors.deepPurple),
                      title: Text(
                        entry["text"],
                        style: const TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(
                        _formatDate(entry["date"]),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEntry,
        child: const Icon(LucideIcons.plus),
      ),
    );
  }
}
