import 'package:flutter/material.dart';
import 'package:gofit/pages/clients/client.dart';
import 'package:gofit/pages/trainer/profile.dart';
import 'package:gofit/widgets/trainer_navigation_bar.dart';

class TrainerHomePage extends StatefulWidget {
  const TrainerHomePage({super.key});

  @override
  State<TrainerHomePage> createState() => _TrainerHomePageState();
}

class _TrainerHomePageState extends State<TrainerHomePage> {
  int selectedIndex = 0;

  void onChangeNavigation(value) {
    setState(() => selectedIndex = value);
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = ClientsPage();
      default:
        page = ProfilePage();
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(child: page),
          SafeArea(child:
            TrainerNavigationBar(
              selectedIndex: selectedIndex,
              onChangeNavigation: onChangeNavigation,
            ),
          ),
        ],
      ),
    );
  }
}