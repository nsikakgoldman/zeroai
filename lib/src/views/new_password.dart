import 'package:flutter/material.dart';
import 'package:zeroai/src/util/macros.dart';
import 'package:zeroai/src/views/new_password_change.dart';

import '../widgets/app_confirm_password_field.dart';
import '../widgets/app_password_field.dart';
import '../widgets/main_button.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _formKey = GlobalKey<FormState>();
  final Widget _fieldVerticalSpacing = const SizedBox(height: 8);
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                  const SizedBox(
                    width: 295,
                    child: Text(
                      'Create new password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 331,
                    child: Text(
                      'Your new password must be unique from those previously used',
                      style: TextStyle(
                        color: Color(0xFF9E9E9E),
                        fontSize: 16,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 47,
                  ),
                  AppPasswordField(label: 'Password', controller: _password),
                  _fieldVerticalSpacing,
                  _fieldVerticalSpacing,
                  AppConfirmPasswordFiled(
                      label: 'Confirm password', controller: _confirmPassword),
                  _fieldVerticalSpacing,
                  AppElevatedButton(
                      buttonLable: "Confirm Password",
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
        MaterialPageRoute(builder: (context) => const NewPasswordChange()),
      );
    }
  }
}
