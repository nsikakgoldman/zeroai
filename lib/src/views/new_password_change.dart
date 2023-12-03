import 'package:flutter/material.dart';
import 'package:zeroai/src/views/login.dart';

import '../util/macros.dart';
import '../widgets/app_confirm_password_field.dart';
import '../widgets/app_password_field.dart';
import '../widgets/main_button.dart';

class NewPasswordChange extends StatefulWidget {
  const NewPasswordChange({super.key});

  @override
  State<NewPasswordChange> createState() => _NewPasswordChangeState();
}

class _NewPasswordChangeState extends State<NewPasswordChange> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Widget _fieldVerticalSpacing = const SizedBox(height: 8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Form(
              key: _formKey,
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(
                  left: leftScreenPadding,
                  right: rightScreenPadding,
                  top: MediaQuery.of(context).size.height * 0.1,
                ),
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 100,
                      height: 100,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: -0,
                            child: Container(
                              width: 100,
                              height: 100,
                              child: Stack(children: [
                                Image.asset("assets/Successmark.png")
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  const Center(
                    child: Text(
                      'Password Changed!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Center(
                    child: SizedBox(
                      width: 331,
                      child: Text(
                        'Your password has been changed successfully.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  AppElevatedButton(
                      buttonLable: "Return back",
                      onPressed: _validateEmailFied),
                  _fieldVerticalSpacing,
                ],
              ))
        ],
      ),
    );
  }

  void _validateEmailFied() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // Form is valid, perform actions here
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    }
  }
}
