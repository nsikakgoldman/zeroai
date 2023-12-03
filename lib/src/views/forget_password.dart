import 'package:flutter/material.dart';
import 'package:zeroai/src/app.dart';
import 'package:zeroai/src/views/otp_verification.dart';
import 'package:zeroai/src/widgets/app_email_field.dart';
import 'package:zeroai/src/widgets/main_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Center(
              child: ListView(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                  children: [
                    const SizedBox(
                      width: 295,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(
                      width: 331,
                      child: Text(
                        'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                        style: TextStyle(
                          color: Color(0xFF9E9E9E),
                          fontSize: 16,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    AppEmailField(label: 'Email address', controller: _email),
                    const SizedBox(
                      height: 16,
                    ),
                    AppElevatedButton(
                        buttonLable: 'Reset Password',
                        onPressed: _validateEmailFied)
                  ]),
            ),
          ),
          Positioned(
            bottom: 42,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: _backtoLogin,
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  text: const TextSpan(
                    text: " Remember Password?",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Login',
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
        ],
      ),
    );
  }

  void _validateEmailFied() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // Form is valid, perform actions here
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const OTPVerifaction()));
    }
  }

  void _backtoLogin() {
    Navigator.pop(context);
  }
}
