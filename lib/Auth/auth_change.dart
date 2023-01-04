import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Screen/home_screen.dart';
import 'Login Page/login_page.dart';

class AuthChangeScreen extends StatefulWidget {
  const AuthChangeScreen({super.key});

  @override
  State<AuthChangeScreen> createState() => _AuthChangeScreenState();
}

class _AuthChangeScreenState extends State<AuthChangeScreen> {
  User? user;

  Future<void> onRefresh(userCred) async {
    setState(() {
      user = userCred;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return LoginPage(
        signInWithEmailAndPassFunction: (userCred) => onRefresh(userCred),
      );
    }
    return HomeScreen(
      signOutFunction: (userCred) => onRefresh(userCred),
    );
  }
}
