import 'package:flutter/material.dart';
import 'package:gofit/app_themes.dart';
import 'package:gofit/main.dart';
import 'package:gofit/pages/auth/log_in_page.dart';

class TrainerClientsPage extends StatefulWidget {
  const TrainerClientsPage({super.key});

  @override
  State<TrainerClientsPage> createState() => _TrainerClientsPageState();
}

class _TrainerClientsPageState extends State<TrainerClientsPage> {
  String _username = '';

  @override
  void initState() {
    super.initState();
    getTrainerDetails();
  }

  Future<void> getTrainerDetails() async {
    final userId = supabase.auth.currentUser!.id;

    try {
      final response = await supabase
          .from('profiles')
          .select()
          .eq('user_id', userId)
          .maybeSingle();

      setState(() => _username = response?['username']);
    } catch (err) {
      throw Exception("No such profile found");
    }
  }

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
        body: Column(
          children: [
            Text('Welcome, $_username'),
            ElevatedButton(onPressed: logOut, child: Text('Log out')),
          ],
        ),
      ),
    );
  }
}
