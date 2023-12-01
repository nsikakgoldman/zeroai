import 'package:flutter/material.dart';
import 'package:zeroai/src/views/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate some loading time (e.g., fetching data, initializing resources)
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the next screen after the splash screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Welcome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 186,
            height: 193,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("assets/ac8fe8037cdecfc011c3fa70f72ebd6e.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(
            height: 49,
          ),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '(Your name) ',
                  style: TextStyle(
                    color: Color(0xFF899CFF),
                    fontSize: 30,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: 'AI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          )
        ],
      )),
    );
  }
}
