import 'package:flutter/material.dart';
import 'package:portfolio/layout.dart';
import 'package:portfolio/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      themeMode: ThemeMode.dark,
      home: Layout(),
    );
  }
}
