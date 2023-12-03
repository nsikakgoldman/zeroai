import 'package:flutter/material.dart';
import 'package:zeroai/src/util/macros.dart';
import 'package:zeroai/src/views/forget_password.dart';
import 'package:zeroai/src/views/onboarding.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
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
              AppElevatedButton(
                  buttonLable: "Login", onPressed: _validateEmailFied),
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
          child: InkWell(
            onTap: _moveToRegister,
            child: Align(
              alignment: Alignment.center,
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
          ),
        )
      ]),
    );
  }

  void _validateEmailFied() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // Form is valid, perform actions here
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/onboarding', (route) => false);
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => const Onboarding()));
      //
    }
  }

  void _forgetPasswordLogic() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ForgetPassword()));
  }

  void _moveToRegister() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Register()));
  }
}
