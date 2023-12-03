import 'package:flutter/material.dart';
import 'package:zeroai/src/views/new_password.dart';
import 'package:zeroai/src/widgets/main_button.dart';
import 'package:zeroai/src/widgets/pin_input_field.dart';

class OTPVerifaction extends StatefulWidget {
  const OTPVerifaction({super.key});

  @override
  State<OTPVerifaction> createState() => _OTPVerifactionState();
}

class _OTPVerifactionState extends State<OTPVerifaction> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();
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
                        'OTP Verification',
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
                        'Enter the verification code sent to the email address',
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
                    AppPinInputFiled(
                      controller: _pinController,
                      focusNode: _focusNode,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Please enter pin you can remember',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF9E9E9E),
                        fontSize: 16,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w500,
                        height: 0.09,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppElevatedButton(
                        buttonLable: 'Send Code', onPressed: _validatePinFied)
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

  void _backtoLogin() {
    Navigator.pop(context);
  }

  void _validatePinFied() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // Form is valid, perform actions here
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const NewPassword()));
    }
  }
}
