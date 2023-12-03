import 'package:flutter/material.dart';

class AppConfirmPasswordFiled extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  const AppConfirmPasswordFiled(
      {super.key, required this.label, required this.controller});

  @override
  State<AppConfirmPasswordFiled> createState() =>
      _AppConfirmPasswordFiledState();
}

class _AppConfirmPasswordFiledState extends State<AppConfirmPasswordFiled> {
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
    ;
  }
}
