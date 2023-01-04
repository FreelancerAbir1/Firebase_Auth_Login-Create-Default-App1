
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
    );
  }
}
