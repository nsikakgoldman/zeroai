import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zeroai/src/views/onboarding.dart';
import 'package:zeroai/src/views/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();

    // Simulate some loading time (e.g., fetching data, initializing resources)
    Future.delayed(const Duration(seconds: 2), () async {
      // Navigate to the next screen after the splash screen
      bool loggedIn = await isUserLoggedIn();
      if (loggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Onboarding()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Welcome()),
        );
      }
    });
  }

  Future<bool> isUserLoggedIn() async {
    try {
      User? user = _auth.currentUser;
      return user != null;
    } catch (e) {
      print("this error occured trying to login user $e");
      return false;
    }
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
