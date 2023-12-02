import 'package:flutter/material.dart';
import 'package:zeroai/src/widgets/app_email_field.dart';
import 'package:zeroai/src/widgets/app_text_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Form(
              child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              AppTextField(label: "Username", controller: _username),
              const SizedBox(
                height: 8,
              ),
              AppEmailField(label: "Email address", controller: _email)
            ],
          ))
        ],
      ),
    );
  }
}
