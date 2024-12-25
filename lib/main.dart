import 'package:flutter/material.dart';

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
      )),
    );
  }
}

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

class CreateEntryScreen extends StatelessWidget {
  CreateEntryScreen({Key? key}) : super(key: key); // Added Key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Entries')),
      body: const Center(
          child: Text('form displayed here to create new entries')),
    );
  }
}

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

// Custom button implementation
class Button extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const Button({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: onPressed, // Assign the passed onPressed function
        child: Center(
          child: Text(buttonText), // Display the passed button text
        ),
      )
    );
  }
}
