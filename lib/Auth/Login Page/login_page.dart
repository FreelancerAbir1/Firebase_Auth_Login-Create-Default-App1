 
import 'package:flutter/material.dart';

import 'component/body.dart'; 
class LoginPage extends StatelessWidget {
  final Function signInWithEmailAndPassFunction;
  const LoginPage({super.key, required this.signInWithEmailAndPassFunction});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Body(signInWithEmailAndPassFunction: signInWithEmailAndPassFunction,)
    );
  }
}
