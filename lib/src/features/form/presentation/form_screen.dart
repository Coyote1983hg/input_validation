import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  // Attribute
  // (keine)

  // Konstruktor
  const FormScreen({super.key});

  // Methoden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email"),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validateEmail,
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Passwort"),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validatePw,
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () {},
              child: const Text("Login"),
            ),
          ]),
        ),
      ),
    );
  }

  String? validateEmail(String? input) {
    if (input == null || input.isEmpty || input.length < 5) {
      return 'Please enter a valid email address';
    }
    if (!input.contains('@')) {
      return 'The email address must contain an @ sign';
    }
    if (!input.endsWith('.com') && !input.endsWith('.de')) {
      return 'The email address must end with .com or .de';
    }
    return null;
  }

  String? validatePw(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter a password';
    }
    if (input.length < 6 || input.length > 12) {
      return 'The password must be between 6 and 12 characters long';
    }
    return null;
  }
}
