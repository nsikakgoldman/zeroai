import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class AppPinInputFiled extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  const AppPinInputFiled(
      {super.key, required this.controller, required this.focusNode});

  @override
  State<AppPinInputFiled> createState() => _AppPinInputFiledState();
}

class _AppPinInputFiledState extends State<AppPinInputFiled> {
  @override
  void dispose() {
    widget.controller.dispose();
    widget.focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Pinput(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter a pin';
        } else if (value.length < 4) {
          return "Pin incomplete";
        } else {
          return null;
        }
      },
      controller: widget.controller,
    );
  }
}
