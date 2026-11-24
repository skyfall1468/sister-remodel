import 'package:flutter/material.dart';

class SisterColors {
  static const navy = Color(0xFF142B4A);
  static const blue = Color(0xFF245A9A);
  static const sky = Color(0xFFEAF2FB);
  static const teal = Color(0xFF20A69A);
  static const ink = Color(0xFF1C2B3A);
  static const muted = Color(0xFF718096);
  static const background = Color(0xFFF5F7FB);
  static const line = Color(0xFFE4EAF1);
}

class SisterTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: SisterColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: SisterColors.blue),
        appBarTheme: const AppBarTheme(
          backgroundColor: SisterColors.background,
          foregroundColor: SisterColors.navy,
          elevation: 0,
          centerTitle: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: SisterColors.line),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: SisterColors.line),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: SisterColors.blue, width: 1.5),
          ),
        ),
      );
}
