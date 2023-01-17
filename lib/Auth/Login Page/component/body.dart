// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart'; 
import '../../Create User Screen/create_user_screen.dart';
import 'create_account_btn.dart';
import 'email_field.dart';
import 'google_sign.dart'; 
import 'signin_btn.dart'; 

class Body extends StatelessWidget {
  final Function signInWithEmailAndPassFunction;
  Body({
    Key? key,
    required this.signInWithEmailAndPassFunction,
  }) : super(key: key);
//! sign in with email and password
  Future<void> signInWithEmailAndPassword(context) async {
    _form.currentState?.validate();
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      signInWithEmailAndPassFunction(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('user-not-found'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('wrong-password'),
          ),
        );
      }
    }
  }

//! sign in with google
  Future signInWithGoogle(context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Google Sign In failed'),
        ),
      );
    }
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _form = GlobalKey<FormState>(); //for storing form state.
  @override
  Widget build(BuildContext context) {
    return Form( 
      key: _form,
      child: Column(
        children: [
          CustomTextField(
            controller: emailController,
            hintText: 'Email',
          ),
          CustomTextField(
            controller: passwordController,
            hintText: 'Password',
          ),
          SigninButton(
            press: () {
              signInWithEmailAndPassword(context);
            },
          ),
          const Text('Already have account?'),
          CreateAccountButton(
            text: 'Create Account',
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CreateUserScreen(),
              ));
            },
          ),
          GoogleLogin(
            text: 'Google Sign in',
            press: () {
              signInWithGoogle(context);
            },
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Facebook Sign in'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Google Sign'),
          ),
        ],
      ),
    );
  }
}
 