
import 'package:flutter/material.dart';

class VerifyBtn extends StatelessWidget {
  const VerifyBtn({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(text),
    );
  }
}
