import 'package:coffee_app/main.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:coffee_app/db/db.dart';

class CreateEntryForm extends StatefulWidget {
  const CreateEntryForm({super.key});

  @override
  CreateEntryFormState createState() => CreateEntryFormState();
}

class CreateEntryFormState extends State<CreateEntryForm> {
  final _formKey = GlobalKey<FormState>();

  // Saving form answers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _tastingNotesController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();

  // Declaring database
  late Db _database;

  @override
  void initState() {
    super.initState();
    _database = Db(); // Initialises Drift database
  }

  // Method to save data to the database
  Future<void> _saveDataToDatabase() async {
    final name = _nameController.text;
    final tastingNotes = _tastingNotesController.text;
    final rating = int.tryParse(_ratingController.text);

    if (name.isEmpty || tastingNotes.isEmpty || rating == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields and ensure the rating is a number')),
      );
      return;
    }

    // Create an entry to insert into the database
    final entry = CoffeeInfoCompanion(
      name: Value(name),
      tastingNotes: Value(tastingNotes),
      rating: Value(rating),
    );

    try {
      // Insert the entry into the database
      await _database.into(_database.coffeeInfo).insert(entry);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data saved successfully')),
      );

      // Redirects back to home page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to save data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child:  Column(
        children: <Widget>[
          // Add TextFormFields and ElevatedButton here.
          TextFormField(
            controller: _nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter coffee name';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'Coffee Name'),
          ),

          TextFormField(
            controller: _tastingNotesController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter tasting notes';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'Tasting Notes'),
          ),

          TextFormField(
            controller: _ratingController,
            validator: (value) {
              if (value == null || value.isEmpty || int.tryParse(value) == null) {
                return 'Please enter a valid rating (numeric)';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'Rating'),
            keyboardType: TextInputType.number,
          ),

          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, save data to Drift
                _saveDataToDatabase();
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}