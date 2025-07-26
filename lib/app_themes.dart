import 'package:flutter/material.dart';
    
final List<ThemeData> appThemes = [
  // Theme 1
  ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
  ),
  // Theme 2
  ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: Colors.black, // optional for dark bg
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
    ),
  ),
];