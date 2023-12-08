import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zeroai/src/util/macros.dart';
import 'package:zeroai/src/views/login.dart';
import 'package:zeroai/src/views/onboarding.dart';
import 'package:zeroai/src/widgets/all_social_media.dart';
import 'package:zeroai/src/widgets/app_address_field.dart';
import 'package:zeroai/src/widgets/app_confirm_password_field.dart';
import 'package:zeroai/src/widgets/app_email_field.dart';
import 'package:zeroai/src/widgets/app_password_field.dart';
import 'package:zeroai/src/widgets/app_tel_field.dart';
import 'package:zeroai/src/widgets/app_text_field.dart';
import 'package:zeroai/src/widgets/auth_sub_heading.dart';
import 'package:zeroai/src/widgets/main_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future? _registerFunction;
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
                  bottom: bottomScreenPadding,
                  top: MediaQuery.of(context).size.height * 0.05,
                ),
                children: [
                  const SizedBox(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500,
                        height: 0.03,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 47,
                  ),
                  AppTextField(label: "Username", controller: _username),
                  _fieldVerticalSpacing(),
                  AppEmailField(label: "Email address", controller: _email),
                  _fieldVerticalSpacing(),
                  AppAddressField(label: "Address", controller: _address),
                  _fieldVerticalSpacing(),
                  AppTelField(label: 'Phone number', controller: _phone),
                  _fieldVerticalSpacing(),
                  AppPasswordField(label: 'Password', controller: _password),
                  _fieldVerticalSpacing(),
                  AppConfirmPasswordFiled(
                      label: 'Confirm password', controller: _confirmPassword),
                  _fieldVerticalSpacing(),
                  FutureBuilder(
                      future: _registerFunction,
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return _registerButton();
                          case ConnectionState.waiting:
                            return const Center(
                              child: Text("Registering User..."),
                            );
                          case ConnectionState.active:
                            return const Text("Registering User...");
                          case ConnectionState.done:
                            return _registerButton();
                        }
                      }),
                  _fieldVerticalSpacing(),
                  const AuthSubHeading(label: "Or Sign-up with"),
                  _fieldVerticalSpacing(),
                  const AllSocialMedia(),
                ],
              ))
        ],
      ),
    );
  }

  Widget _registerButton() =>
      AppElevatedButton(buttonLable: "Sign up", onPressed: _validateEmailFied);

  Widget _fieldVerticalSpacing() {
    return const SizedBox(
      height: 8,
    );
  }

  void _validateEmailFied() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // Form is valid, perform actions here
      if (_password.value.text == _confirmPassword.value.text) {
        setState(() {
          _registerFunction = _register(_username.value.text, _email.value.text,
              _address.value.text, _phone.value.text, _password.value.text);
        });
      }
      return;
    }
    return;
  }

  Future<void> _register(
    String username,
    String email,
    String address,
    String phoneNumber,
    String password,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String uid = userCredential.user!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'username': username,
        'email': email,
        'address': address,
        'phoneNumber': phoneNumber,
      }).then((value) => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login())));
      return;
    } catch (e) {
      print(e.toString());
      return;
    }
  }
}
