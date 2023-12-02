import 'package:flutter/material.dart';

class LoginSubHeading extends StatelessWidget {
  const LoginSubHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: Container(
          // width: 121,
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Color(0xFFE8ECF4),
              ),
            ),
          ),
        )),
        const SizedBox(
          width: 8,
        ),
        const Text(
          'Or Login with',
          style: TextStyle(
            color: Color(0xFF6A707C),
            fontSize: 14,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            child: Container(
          // width: 121,
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Color(0xFFE8ECF4),
              ),
            ),
          ),
        ))
      ],
    );
  }
}
