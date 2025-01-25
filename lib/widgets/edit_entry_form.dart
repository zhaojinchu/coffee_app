import 'package:flutter/material.dart';
import 'package:coffee_app/db/db.dart';
import 'package:drift/drift.dart' hide Column;

class EditEntryForm extends StatefulWidget {
  final CoffeeInfoData entry;
  final void Function(CoffeeInfoCompanion) onSave; // Callback for saving

  const EditEntryForm({
    Key? key,
    required this.entry,
    required this.onSave,
  }) : super(key: key);

  @override
  State<EditEntryForm> createState() => _EditEntryFormState();
}

class _EditEntryFormState extends State<EditEntryForm> {
  late TextEditingController _nameController;
  late TextEditingController _tastingNotesController;
  late TextEditingController _ratingController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.entry.name);
    _tastingNotesController =
        TextEditingController(text: widget.entry.tastingNotes);
    _ratingController =
        TextEditingController(text: widget.entry.rating.toString());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _tastingNotesController.dispose();
    _ratingController.dispose();
    super.dispose();
  }

  void _handleSave() {
    final updatedEntry = CoffeeInfoCompanion(
      id: Value(widget.entry.id),
      name: Value(_nameController.text),
      tastingNotes: Value(_tastingNotesController.text),
      rating: Value(int.tryParse(_ratingController.text) ?? widget.entry.rating),
    );

    widget.onSave(updatedEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(labelText: 'Name'),
        ),
        TextField(
          controller: _tastingNotesController,
          decoration: const InputDecoration(labelText: 'Tasting Notes'),
        ),
        TextField(
          controller: _ratingController,
          decoration: const InputDecoration(labelText: 'Rating'),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _handleSave,
          child: const Text('Save Changes'),
        ),
      ],
    );
  }
}
