import 'package:flutter/material.dart';

class CreateEntryForm extends StatefulWidget {
  const CreateEntryForm({super.key});

  @override
  CreateEntryFormState createState() => CreateEntryFormState();
}

class CreateEntryFormState extends State<CreateEntryForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child:  Column(
        children: <Widget>[
          // Add TextFormFields and ElevatedButton here.
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
            return null;
            },
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
            return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text('Submit'),
          ),
          // TODO: ADD DATABASE LINK

        ],
      ),
    );
  }
}