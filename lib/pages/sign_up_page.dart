import 'package:flutter/material.dart';

Future<void> signUp() async {}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signUpFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _signUpFormKey,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              controller: emailController,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              controller: passwordController,
            ),
            ElevatedButton(
              onPressed: () {
                if (_signUpFormKey.currentState!.validate()) {}
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
