import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/Sign%20Out/sign_out_screen.dart';

class HomeScreen extends StatelessWidget {
  final Function signOutFunction;
  const HomeScreen({super.key, required this.signOutFunction});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: SignOutScreen(
          signOutFunction: signOutFunction,
        )),
      ),
    );
  }
}
