import 'package:flutter/material.dart';

class AppTelField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  const AppTelField({super.key, required this.label, required this.controller});

  @override
  State<AppTelField> createState() => _AppTelFieldState();
}

class _AppTelFieldState extends State<AppTelField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }

        return null;
      },
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        labelText: widget.label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
