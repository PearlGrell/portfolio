import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color primaryTealBlue = const Color(0xFF4C8DAE);

final TextTheme baseTextTheme = GoogleFonts.spaceMonoTextTheme();

final TextTheme _textTheme = baseTextTheme.copyWith(
  displayLarge: baseTextTheme.displayLarge?.copyWith(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  displayMedium: baseTextTheme.displayMedium?.copyWith(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  displaySmall: baseTextTheme.displaySmall?.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  headlineLarge: baseTextTheme.headlineLarge?.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  ),
  headlineMedium: baseTextTheme.headlineMedium?.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
  headlineSmall: baseTextTheme.headlineSmall?.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
  titleLarge: baseTextTheme.titleLarge?.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
  titleMedium: baseTextTheme.titleMedium?.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
  titleSmall: baseTextTheme.titleSmall?.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
  bodyLarge: baseTextTheme.bodyLarge?.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  ),
  bodyMedium: baseTextTheme.bodyMedium?.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
  ),
  bodySmall: baseTextTheme.bodySmall?.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white60,
  ),
  labelLarge: baseTextTheme.labelLarge?.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
  labelMedium: baseTextTheme.labelMedium?.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
  labelSmall: baseTextTheme.labelSmall?.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
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
    titleTextStyle: GoogleFonts.ibmPlexMono(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  ),
);
