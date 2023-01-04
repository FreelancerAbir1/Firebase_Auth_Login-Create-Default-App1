import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/Create%20User%20Screen/component/body.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create User Account'),
      ),
      body: Body(),
    );
  }
}
