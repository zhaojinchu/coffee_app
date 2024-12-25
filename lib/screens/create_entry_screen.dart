import 'package:flutter/material.dart';
import 'package:coffee_app/widgets/create_entry_form.dart';

class CreateEntryScreen extends StatelessWidget {
  CreateEntryScreen({Key? key}) : super(key: key); // Added Key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Entries')),
      body: const Center(
        child: Column(
          children: [
            Text('form displayed here to create new entries'),
            CreateEntryForm()
          ]
        )
      )
    );
  }
}

