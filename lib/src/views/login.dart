import 'package:flutter/material.dart';
import 'package:zeroai/src/widgets/app_email_field.dart';
import 'package:zeroai/src/widgets/app_password_field.dart';
import 'package:zeroai/src/widgets/login_sub_heading.dart';
import 'package:zeroai/src/widgets/main_button.dart';
import 'package:zeroai/src/widgets/social_media_btn.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(children: [
          Form(
            key: _formKey,
            child: ListView(
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
                      onPressed: () => print("hi"),
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
                AppElevatedButton(
                    buttonLable: "Login", onPressed: _validateEmailFied),
                const SizedBox(
                  height: 32,
                ),
                const LoginSubHeading(),
                const SizedBox(
                  height: 16,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialMediaButton(
                      imagePath: 'google_icgoogle.png',
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SocialMediaButton(
                      imagePath: 'cib_appleapple.png',
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SocialMediaButton(
                      imagePath: 'facebook_ic.png',
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 42,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () => print("hi"),
              child: RichText(
                text: const TextSpan(
                  text: " Don't have an account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Register Now',
                        style: TextStyle(
                          color: Color(0xFF899BFF),
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  void _validateEmailFied() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // Form is valid, perform actions here
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Register()));
    }
  }
}
