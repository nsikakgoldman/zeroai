import 'package:flutter/material.dart';

class AppAddressField extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  const AppAddressField(
      {super.key, required this.label, required this.controller});

  @override
  State<AppAddressField> createState() => _AppAddressFieldState();
}

class _AppAddressFieldState extends State<AppAddressField> {
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
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        labelText: widget.label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
