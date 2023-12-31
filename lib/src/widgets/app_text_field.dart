import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const AppTextField(
      {super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }

        return null;
      },
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          contentPadding: const EdgeInsets.all(8)),
    );
  }
}
