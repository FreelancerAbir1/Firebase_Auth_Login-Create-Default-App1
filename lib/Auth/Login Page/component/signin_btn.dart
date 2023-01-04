
import 'package:flutter/material.dart';

class SigninButton extends StatelessWidget {
  final GestureTapCallback press;

  const SigninButton({super.key, required this.press});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: const Text('Sign in'),
    );
  }
}