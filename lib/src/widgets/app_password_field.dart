import 'package:flutter/material.dart';

class AppPasswordField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  const AppPasswordField(
      {super.key, required this.label, required this.controller});

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscureText = true;
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
      obscureText: _obscureText,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          border: const OutlineInputBorder(),
          labelText: widget.label,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off))),
    );
  }
}
