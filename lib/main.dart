import 'package:flutter/material.dart';
import 'package:gofit/pages/sign_up_page.dart';
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
    return MaterialApp(
      title: 'GOfit',
      home: SignUpPage(),
    );
  }
}