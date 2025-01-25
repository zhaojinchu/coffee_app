import 'package:flutter/material.dart';
import 'package:coffee_app/widgets/entries_list.dart';
import 'package:coffee_app/db/db.dart';

class ViewEntryScreen extends StatelessWidget {
  ViewEntryScreen({Key? key}) : super(key: key); // Added Key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('View Entries')),
      body: Column(
        children: [
          //const Center(child: Text('database entries to be displayed')),
          Expanded(
            child: EntriesList(),
          ),
        ],
      )  
    );
  }
}


