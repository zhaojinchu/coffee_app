import 'package:flutter/material.dart';
import 'package:coffee_app/db/db.dart';
import 'package:coffee_app/widgets/edit_entry_form.dart'; 

class EditEntryScreen extends StatefulWidget {
  const EditEntryScreen({Key? key}) : super(key: key);

  @override
  State<EditEntryScreen> createState() => _EditEntryScreenState();
}

class _EditEntryScreenState extends State<EditEntryScreen> {
  late Future<List<CoffeeInfoData>> _entriesFuture;
  CoffeeInfoData? _selectedEntry; // Track the selected entry

  @override
  void initState() {
    super.initState();
    _entriesFuture = Db().getSortedEntriesByName(); // Fetch all entries
  }

  // Save changes callback
  Future<void> _saveChanges(CoffeeInfoCompanion updatedEntry) async {
    try {
      await Db().updateCoffeeEntry(updatedEntry);
      print('Entry updated: ${updatedEntry.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Entry updated successfully.')),
      );
      setState(() {
        _selectedEntry = null; // Reset selection after saving
        _entriesFuture = Db().getSortedEntriesByName(); // Refresh entries list
      });
    } catch (e) {
      print('Error updating entry: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update entry.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Entries')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<CoffeeInfoData>>(
                future: _entriesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error loading entries: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No entries found.'));
                  }

                  final entries = snapshot.data!;
                  return ListView.builder(
                    itemCount: entries.length,
                    itemBuilder: (context, index) {
                      final entry = entries[index];
                      return ListTile(
                        title: Text(entry.name),
                        subtitle: Text('Rating: ${entry.rating}'),
                        onTap: () {
                          setState(() {
                            _selectedEntry = entry; // Set the selected entry
                          });
                        },
                      );
                    },
                  );
                },
              ),
            ),
            if (_selectedEntry != null) ...[
              const Divider(),
              Text(
                'Editing: ${_selectedEntry!.name}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              EditEntryForm(
                entry: _selectedEntry!,
                onSave: _saveChanges,
              ),
            ],
          ],
        ),
      ),
    );
  }
}