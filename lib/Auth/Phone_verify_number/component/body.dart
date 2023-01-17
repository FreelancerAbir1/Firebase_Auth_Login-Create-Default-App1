// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'; 
import 'package:flutter_application_1/Screen/home_screen.dart';

import 'custom_text_field.dart';
import 'verify_btn.dart';

class Body extends StatelessWidget {
  Body({super.key});
  final auth = FirebaseAuth.instance;
  Future verifyPhoneNumber(context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      //! Veriy phone number
      phoneNumber: '+88${phonenumberController.text}',
      //! Verify complete
      verificationCompleted: (PhoneAuthCredential credential) async {
        final result = await auth.signInWithCredential(credential);
        User? user = result.user;
        if (user != null) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeScreen(signOutFunction: () => null),
          ));
        }
      },
      //! Verify failed
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The provided phone number is not valid.'),
            ),
          );
        }
      },
      //! Resend code
      codeSent: (String verificationId, int? resendToken) {},
      //! Resend timeout
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  final TextEditingController phonenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(phonenumberController: phonenumberController),
        VerifyBtn(
          press: () {
            verifyPhoneNumber(context);
          },
          text: 'Verify',
        ),
      ],
    );
  }
}
