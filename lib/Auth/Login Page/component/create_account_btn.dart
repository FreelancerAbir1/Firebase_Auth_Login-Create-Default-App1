import 'package:flutter/material.dart';

import '../../Create User Screen/create_user_screen.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    Key? key, required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CreateUserScreen(),
        ));
      },
      child: Text(text),
    );
  }
}
