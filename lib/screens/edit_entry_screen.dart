import 'package:flutter/material.dart';

class EditEntryScreen extends StatelessWidget {
  EditEntryScreen({Key? key}) : super(key: key); // Added Key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Entries')),
      body:
          const Center(child: Text('form here to edit existing entries in db')),
    );
  }
}