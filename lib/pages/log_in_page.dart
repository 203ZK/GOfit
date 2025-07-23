import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gofit/main.dart';
import 'package:gofit/app_themes.dart';
import 'package:gofit/pages/sign_up_page.dart';
import 'package:gofit/pages/trainer.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _logInFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signUp(context) async {
    final response = await supabase.auth.signInWithPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    final user = response.user;
    print(user?.email);

    if (user != null) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => const TrainerClientsPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemes[0].scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: SizedBox(
            width: 400,
            child: Form(
              key: _logInFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Log in with your account'),
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
                      if (_logInFormKey.currentState!.validate()) {
                        signUp(context);
                      }
                    },
                    child: Text('Log in'),
                  ),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Don\'t have an account yet? Create one '),
                        TextSpan(
                          text: 'here',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => SignUpPage()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
