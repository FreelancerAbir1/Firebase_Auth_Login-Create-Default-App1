
import 'package:flutter/material.dart';

class GoogleLogin extends StatelessWidget {
  final GestureTapCallback press;
  final String text;
  const GoogleLogin({
    Key? key,
    required this.press,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(text),
    );
  }
}
