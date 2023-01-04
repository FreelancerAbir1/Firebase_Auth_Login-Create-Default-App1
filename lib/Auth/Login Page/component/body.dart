// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'create_account_btn.dart';
import 'email_field.dart';
import 'password_field.dart';
import 'signin_btn.dart';

class Body extends StatelessWidget {
  final Function signInWithEmailAndPassFunction;
  Body({
    Key? key,
    required this.signInWithEmailAndPassFunction,
  }) : super(key: key);

  Future<void> signInWithEmailAndPassword() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      signInWithEmailAndPassFunction(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {
      }
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
        SigninButton(
          press: signInWithEmailAndPassword,
        ),
        const Text('Already have account?'),
        const CreateAccountButton(text: 'Create Account'),
      ],
    );
  }
}



