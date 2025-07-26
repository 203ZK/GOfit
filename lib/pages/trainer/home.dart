import 'package:flutter/material.dart';
import 'package:gofit/pages/client.dart';

class TrainerHomePage extends StatefulWidget {
  const TrainerHomePage({super.key});

  @override
  State<TrainerHomePage> createState() => _TrainerHomePageState();
}

class _TrainerHomePageState extends State<TrainerHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = ClientsPage();
      default:
        page = ClientsPage();
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(child: page),
        ],
      ),
    );
  }
}