import 'package:flutter/material.dart';
import 'package:gofit/app_themes.dart';
import 'package:gofit/main.dart';
import 'package:gofit/pages/auth/log_in_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> logOut() async {
    await supabase.auth.signOut();
    if (!mounted) return;
    Navigator.push(context, MaterialPageRoute(builder: (_) => LogInPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appThemes[1],
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: logOut,
            child: Text('Log out'),
          ),
        ),
      ),
    );
  }
}