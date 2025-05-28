import 'package:flutter/material.dart';

final Color primaryTealBlue = const Color(0xFF4C8DAE);

final TextTheme _textTheme = const TextTheme(
  displayLarge: TextStyle(fontFamily: 'SpaceMono', fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
  displayMedium: TextStyle(fontFamily: 'SpaceMono', fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
  displaySmall: TextStyle(fontFamily: 'SpaceMono', fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
  headlineLarge: TextStyle(fontFamily: 'SpaceMono', fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white),
  headlineMedium: TextStyle(fontFamily: 'SpaceMono', fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
  headlineSmall: TextStyle(fontFamily: 'SpaceMono', fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
  titleLarge: TextStyle(fontFamily: 'SpaceMono', fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
  titleMedium: TextStyle(fontFamily: 'SpaceMono', fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
  titleSmall: TextStyle(fontFamily: 'SpaceMono', fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
  bodyLarge: TextStyle(fontFamily: 'SpaceMono', fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
  bodyMedium: TextStyle(fontFamily: 'SpaceMono', fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white70),
  bodySmall: TextStyle(fontFamily: 'SpaceMono', fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white60),
  labelLarge: TextStyle(fontFamily: 'SpaceMono', fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
  labelMedium: TextStyle(fontFamily: 'SpaceMono', fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white),
  labelSmall: TextStyle(fontFamily: 'SpaceMono', fontSize: 10, fontWeight: FontWeight.w500, color: Colors.white),
);

final ThemeData theme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF131B21),
  primaryColor: primaryTealBlue,
  cardColor: const Color(0xFF1A2229),
  canvasColor: const Color(0xFF1A2229),
  dividerColor: const Color(0xFF2F3E48),

  textTheme: _textTheme,

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryTealBlue,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  ),

  chipTheme: ChipThemeData(
    backgroundColor: const Color(0xFF172026),
    labelStyle: TextStyle(color: primaryTealBlue),
    side: BorderSide(color: const Color(0xFF3E4F5A), width: 1.5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xFF10171D),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'SpaceMono',
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  ),
);
