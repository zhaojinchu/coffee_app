import 'package:flutter/material.dart';
import 'package:coffee_app/widgets/button.dart';
import 'package:coffee_app/screens/create_entry_screen.dart';
import 'package:coffee_app/screens/view_entry_screen.dart';
import 'package:coffee_app/screens/edit_entry_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Added Key parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(), // Use const where possible
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key); // Added Key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
          child: Column(
          children: [
            const Text('Welcome to the Coffee App'),
            Button(
              buttonText: "Create Entries",
              onPressed: () {
                // Navigate to the CoffeeDetailsScreen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateEntryScreen()),
                );
              },
            ),
            Button(
              buttonText: "View Entries",
              onPressed: () {
                // Navigate to the CoffeeDetailsScreen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewEntryScreen()),
                );
              },
            ),
            Button(
              buttonText: "Edit Entries",
              onPressed: () {
                // Navigate to the CoffeeDetailsScreen when the button is pressed
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditEntryScreen()));
              },
            ),
          ],
        )
      ),
    );
  }
}
