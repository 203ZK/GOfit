import 'package:flutter/material.dart';
import 'package:gofit/app_themes.dart';
import 'package:gofit/main.dart';
import 'package:gofit/pages/auth/log_in_page.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  bool _isLoading = true;
  String _username = '';

  @override
  void initState() {
    super.initState();
    getTrainerDetails();
  }

  Future<void> getTrainerDetails() async {
    setState(() => _isLoading = true);

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
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> logOut() async {
    await supabase.auth.signOut();
    if (!mounted) return;
    Navigator.push(context, MaterialPageRoute(builder: (_) => LogInPage()));
  }

  @override
  Widget build(BuildContext context) {
    print('Got here');
    return Theme(
      data: appThemes[1],
      child: Scaffold(
        body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Text('Welcome, client $_username'),
              ],
            ),
      ),
    );
  }
}
