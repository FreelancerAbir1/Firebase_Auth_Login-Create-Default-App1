
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.phonenumberController,
  }) : super(key: key);

  final TextEditingController phonenumberController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phonenumberController,
      decoration: const InputDecoration(hintText: 'Enter your number'),
    );
  }
}
