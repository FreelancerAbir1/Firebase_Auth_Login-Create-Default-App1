
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
    );
  }
}