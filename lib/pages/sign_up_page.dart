import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gofit/main.dart';
import 'package:gofit/app_themes.dart';
import 'package:gofit/pages/log_in_page.dart';
import 'package:gofit/widgets/box_select.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signUpFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  int? accountRole = 0;

  Future<void> signUp(context) async {
    final response = await supabase.auth.signUp(
      email: emailController.text,
      password: passwordController.text,
    );
    final user = response.user;

    await supabase.from('profiles').insert({
      'user_id': user?.id,
      'username': usernameController.text,
      'role': accountRole,
    });

    if (accountRole == 0) {
      await supabase.from('trainers').insert({'id': user?.id});
    } else {
      await supabase.from('clients').insert({
        'id': user?.id,
        'trainer_id': null,
      });
    }

    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const LogInPage()));
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
              key: _signUpFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('New to GOfit? Create your account'),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                    controller: usernameController,
                  ),
                  SizedBox(height: 10),
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
                  SizedBox(height: 20),
                  BoxSelect(
                    initialValue: 0,
                    onSaved: (value) {
                      accountRole = value;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_signUpFormKey.currentState!.validate()) {
                        _signUpFormKey.currentState!.save();
                        signUp(context);
                      }
                    },
                    child: Text('Sign Up'),
                  ),
                  SizedBox(height: 30),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Already have an account yet? Login '),
                        TextSpan(
                          text: 'here',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => LogInPage()),
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
