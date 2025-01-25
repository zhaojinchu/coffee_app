import 'package:flutter/material.dart';

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