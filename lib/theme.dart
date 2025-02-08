import 'package:flutter/material.dart';

class CS16Theme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF4A5942), // Background color
      primaryColor: const Color(0xFFC4B550), // Accent color
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF3E4637), // Secondary background
        secondary: Color(0xFF958831), // Secondary accent
        surface: Color(0xFF4A5942), // Background surface
        onPrimary: Color(0xFFDEDFD6), // Primary text color
        onSecondary: Color(0xFFD8DED3), // Secondary text color
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Color(0xFFDEDFD6), // Light text color
          fontSize: 16,
          fontFamily: 'ArialPixel', // Retro font
        ),
        bodyMedium: TextStyle(
          color: Color(0xFFDEDFD6),
          fontSize: 14,
          fontFamily: 'ArialPixel',
        ),
        labelLarge: TextStyle(
          color: Colors.white, // Button text color
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'ArialPixel',
        ),
        titleLarge: TextStyle(
          color: Color(0xFFDEDFD6), // AppBar title color
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'ArialPixel',
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF3E4637), // AppBar background
        elevation: 2, // Minimal shadow
        titleTextStyle: TextStyle(
          color: Color(0xFFDEDFD6),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'ArialPixel',
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3E4637), // Button background
          foregroundColor: Colors.white, // Button text
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // No rounded corners
          ),
          side: const BorderSide(
            color: Color(0xFF8C9284), // Border color
            width: 2,
          ),
          shadowColor: Colors.black.withOpacity(0.8), // Button shadow
          elevation: 4,
        ),
      ),
    );
  }
}
