import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  final String imageString;
  final String name;
  const OnboardingItem(
      {super.key, required this.imageString, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2),
      width: 163,
      height: 83,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.white.withOpacity(0.10000000149011612),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Stack(
        children: [
          Container(
            // height: 84.16,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: -3.40,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, 0.0)
                      ..rotateZ(0.46),
                    child: Container(
                      width: 88,
                      height: 63.97,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/$imageString"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
