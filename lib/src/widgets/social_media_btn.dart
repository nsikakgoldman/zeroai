import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  final String imagePath;
  const SocialMediaButton({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: InkWell(
      onTap: () => print("hi"),
      child: Container(
        width: 108.67,
        height: 56,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFDADADA)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 26,
              height: 26,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 23.64,
                    height: 23.64,
                    child: Stack(children: [
                      Center(
                        child: Image.asset("assets/$imagePath"),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
