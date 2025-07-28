import 'package:flutter/material.dart';
import 'package:gofit/app_themes.dart';
import 'package:gofit/main.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  bool _isLoading = true;
  String _username = '';
  List<String> _clientNames = [];

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

      final clients = await supabase
          .from('clients')
          .select('profiles(username)')
          .eq('trainer_id', userId);


      setState(() {
        _username = response?['username'];
        _clientNames = (clients as List)
          .map((client) => client['profiles']['username'] as String)
          .toList();
      });

    } catch (err) {
      throw Exception("No such profile found");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Client names: $_clientNames');
    return Theme(
      data: appThemes[1],
      child: Scaffold(
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Text('Welcome, client $_username'),
                  for (var name in _clientNames)
                    Text(name),
                ],
              ),
      ),
    );
  }
}
