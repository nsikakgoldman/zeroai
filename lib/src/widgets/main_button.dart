import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final String buttonLable;
  final Widget? navigateTo;
  const AppElevatedButton({
    super.key,
    required this.buttonLable,
    this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print("object"),
      child: Container(
        width: 342,
        height: 56,
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [
              Color(0xFF899CFF),
              Color(0xFF924FFF),
              Color(0xFFF442B5),
              Color(0xFFD61672)
            ],
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Login ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
