 
import 'package:flutter/material.dart'; 
import 'component/body.dart'; 
class PhoneVerify extends StatelessWidget {
  const PhoneVerify({super.key});
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify your number'),
      ),
      body: Body(),
    );
  }
}
