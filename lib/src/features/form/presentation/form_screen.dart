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
      return 'Bitte geben Sie eine gültige E-Mail-Adresse ein';
    }
    if (!input.contains('@')) {
      return 'Die E-Mail-Adresse muss ein @-Zeichen enthalten';
    }
    if (!input.endsWith('.com') && !input.endsWith('.de')) {
      return 'Die E-Mail-Adresse muss mit .com oder .de enden';
    }
    return null;
  }

  String? validatePw(String? input) {
    if (input == null || input.isEmpty) {
      return 'Bitte geben Sie ein Passwort ein';
    }
    if (input.length < 6 || input.length > 12) {
      return 'Das Passwort muss zwischen 6 und 12 Zeichen lang sein';
    }
    return null;
  }
}
