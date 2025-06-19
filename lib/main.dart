import 'package:flutter/material.dart';
import 'logo_screen.dart'; // should load first
import 'splash_screen.dart';
import 'language_selection_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Skill Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const LogoScreen(), // 👈 This should be first
    );
  }
}
