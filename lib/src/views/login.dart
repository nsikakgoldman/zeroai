import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zeroai/src/util/macros.dart';
import 'package:zeroai/src/views/forget_password.dart';
import 'package:zeroai/src/widgets/all_social_media.dart';
import 'package:zeroai/src/widgets/app_email_field.dart';
import 'package:zeroai/src/widgets/app_password_field.dart';
import 'package:zeroai/src/widgets/auth_sub_heading.dart';
import 'package:zeroai/src/widgets/main_button.dart';

import 'register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future? _loginFuntion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _body(),
    );
  }

  void _validateEmailFied() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // Form is valid, perform actions here
      print(_email.value.text);
      print(_password.value.text);
      setState(() {
        _loginFuntion = _login(_email.value.text, _password.value.text);
      });
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => const Onboarding()));
      //
    }
  }

  void _navigateToOnboardingScreen() => Navigator.of(context)
      .pushNamedAndRemoveUntil('/onboarding', (route) => false);

  void _forgetPasswordLogic() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ForgetPassword()));
  }

  void _moveToRegister() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Register()));
  }

  Future<void> _login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      _navigateToOnboardingScreen();
    } catch (e) {
      print('Error signing in: $e');

      String errorMessage =
          "An error occurred during sign-in. Please try again.";
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'user-not-found':
            errorMessage = 'No user found with this email address.';
            break;
          case 'wrong-password':
            errorMessage = 'Incorrect password.';
            break;
          // Add more cases as needed
        }
      }
    }
  }

  // sign in with google
  Future<UserCredential?> _loginWithGoogle() async {
    try {
      // final Google
    } catch (e) {
      print(e.toString());
    }
  }

  Widget _loginButton() =>
      AppElevatedButton(buttonLable: "Login", onPressed: _validateEmailFied);

  Widget _body() => Stack(children: [
        Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              AppEmailField(
                  label: 'Enter your email address', controller: _email),
              const SizedBox(
                height: 16,
              ),
              AppPasswordField(
                  label: "Enter your Password", controller: _password),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: _forgetPasswordLogic,
                    child: const Text(
                      'Forgot Password?',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF6A707C),
                        fontSize: 14,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: _loginFuntion,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return _loginButton();
                      case ConnectionState.waiting:
                        return const Center(
                          child: Text("Login in..."),
                        );
                      case ConnectionState.active:
                        return const CircularProgressIndicator();
                      case ConnectionState.done:
                        return _loginButton();
                    }
                  }),
              const SizedBox(
                height: 32,
              ),
              const AuthSubHeading(label: "or login with"),
              const SizedBox(
                height: 16,
              ),
              const AllSocialMedia()
            ],
          ),
        ),
        Positioned(
          bottom: 42,
          left: 0,
          right: 0,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
                onPressed: () => _moveToRegister(),
                child: const Text("Create Account")),
            TextButton(
                onPressed: () => print("object"), child: const Text("Or Login"))
          ]),
        )
      ]);
}
