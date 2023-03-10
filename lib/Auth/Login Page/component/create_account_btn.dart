import 'package:flutter/material.dart';


class CreateAccountButton extends StatelessWidget {
  final GestureTapCallback press;
  const CreateAccountButton({
    Key? key,
    required this.text, required this.press,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(text),
    );
  }
}
