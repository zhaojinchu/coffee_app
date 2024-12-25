import 'package:flutter/material.dart';

class ViewEntryScreen extends StatelessWidget {
  ViewEntryScreen({Key? key}) : super(key: key); // Added Key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('View Entries')),
      body: const Center(child: Text('database entries to be displayed')),
    );
  }
}

