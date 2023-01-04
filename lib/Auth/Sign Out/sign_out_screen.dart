import 'package:flutter/material.dart';

import '../Login Page/login_page.dart';

class SignOutScreen extends StatelessWidget { 
 final Function signOutFunction;

  const SignOutScreen({super.key, required this.signOutFunction});
  Future<void> signOut(context) async {
    try {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>
            LoginPage(signInWithEmailAndPassFunction: () => null),
      ));
    } catch (e) {
        Text(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => signOut(context),
      child: const Text('Sign Out'),
    );
  }
}
