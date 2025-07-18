import 'package:flutter/material.dart';
import 'package:gofit/main.dart';
import 'package:gofit/app_themes.dart';
import 'package:gofit/pages/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signUpFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signUp(context) async {
    final response = await supabase.auth.signUp(
      email: emailController.text,
      password: passwordController.text,
    );
    final user = response.user;
    print(user?.email);

    if (user != null) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => const LogInPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemes[0].scaffoldBackgroundColor,
      body: Center(
        child: SizedBox(
          width: 400,
          child: Form(
            key: _signUpFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Create an your account'),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  controller: emailController,
                ),
                SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  controller: passwordController,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_signUpFormKey.currentState!.validate()) {
                      signUp(context);
                    }
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
