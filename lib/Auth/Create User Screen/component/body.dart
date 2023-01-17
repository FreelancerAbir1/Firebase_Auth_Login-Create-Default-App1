import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/Phone_verify_number/phone_verify.dart';

import 'create_user_btn.dart';
import 'email_field.dart';
import 'password_field.dart';

class Body extends StatelessWidget {
  Body({super.key});

  Future<void> createUserWithEmailAndPassword(context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const PhoneVerify(),
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {}
    }
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmailField(emailController: emailController),
        PasswordField(passwordController: passwordController),
        TextFormField(),
        CreateUserButton(press: () {
          createUserWithEmailAndPassword(context);
        }),
      ],
    );
  }
}
