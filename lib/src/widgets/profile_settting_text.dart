import 'package:flutter/material.dart';

class ProfileSettingText extends StatelessWidget {
  final String text;
  const ProfileSettingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        height: 0.10,
        letterSpacing: 0.25,
      ),
    );
  }
}
