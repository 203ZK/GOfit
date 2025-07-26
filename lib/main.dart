import 'package:flutter/material.dart';
import 'package:gofit/constants/role_constants.dart';
import 'package:gofit/pages/clients/client.dart';
import 'package:gofit/pages/auth/log_in_page.dart';
import 'package:gofit/pages/trainer/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ypyqotxcjbxetjhvcrym.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlweXFvdHhjamJ4ZXRqaHZjcnltIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE4ODQ5MTQsImV4cCI6MjA2NzQ2MDkxNH0.J_J_dZ4TctK6uubuGTSmJ_TFs3tRkthW7QYYOG1_yxU',
  );
  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'GOfit', home: AuthGate());
  }
}

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  int? _role;

  final session = supabase.auth.currentSession;

  Future<void> getUserDetails() async {
    final userId = supabase.auth.currentUser!.id;

    try {
      final response = await supabase
          .from('profiles')
          .select()
          .eq('user_id', userId)
          .maybeSingle();

      setState(() => _role = response?['role']);
    } catch (err) {
      print("No profile found");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (session == null) {
      return const LogInPage();
    } else {
      getUserDetails();
      if (_role == trainerRole) {
        return const TrainerHomePage();
      } else {
        return const ClientsPage();
      }
    }
  }
}
