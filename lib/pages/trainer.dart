import 'package:flutter/material.dart';
import 'package:gofit/main.dart';

class TrainerClientsPage extends StatefulWidget {
  const TrainerClientsPage({super.key});

  @override
  State<TrainerClientsPage> createState() => _TrainerClientsPageState();
}

class _TrainerClientsPageState extends State<TrainerClientsPage> {
  String _username = '';

  Future<void> getTrainerDetails(context) async {
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

  @override
  Widget build(BuildContext context) {
    getTrainerDetails(context);
    return Column(children: [Text('Welcome, $_username')]);
  }
}
