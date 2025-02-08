import 'package:flutter/material.dart';

/// A Counter-Strike 1.6 inspired dark theme for Flutter applications.
///
/// This theme provides a retro aesthetic with **dark green tones, amber accents,**
/// and **pixelated-style fonts** to match the classic CS16 UI.
///
/// ## Features:
/// - **Dark-themed background** with CS16-inspired colors.
/// - **Custom font styles** for a pixelated retro look.
/// - **Styled buttons, AppBars, and text themes** for consistency.
/// - **No rounded corners** to maintain the **low-resolution FPS game feel**.

class CS16Theme {
  /// Returns the **Counter-Strike 1.6 styled dark theme**.
  ///
  /// This theme applies:
  /// - A **dark green background** (`scaffoldBackgroundColor`)
  /// - A **light amber accent** (`primaryColor`)
  /// - Custom **text styles, buttons, and AppBar designs**
  static ThemeData get darkTheme {
    return ThemeData(
      /// Sets the **brightness to dark mode**.
      brightness: Brightness.dark,

      /// Defines the **background color for the entire app**.
      scaffoldBackgroundColor: const Color(0xFF4A5942), // Dark green

      /// The **primary accent color** used for buttons and active elements.
      primaryColor: const Color(0xFFC4B550), // Amber-like accent

      /// Defines the **color scheme** for dark mode.
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF3E4637), // Secondary background (Dark green)
        secondary: Color(0xFF958831), // Secondary accent (Muted amber)
        surface: Color(0xFF4A5942), // Background surface color
        onPrimary: Color(0xFFDEDFD6), // Primary text color (Light)
        onSecondary: Color(0xFFD8DED3), // Secondary text color (Muted white)
      ),

      /// Defines the **global text styles** for the theme.
      textTheme: const TextTheme(
        /// Large body text used for paragraphs and descriptions.
        bodyLarge: TextStyle(
          color: Color(0xFFDEDFD6), // Light text for readability
          fontSize: 16,
          fontFamily: 'ArialPixel', // Pixel-style retro font
        ),

        /// Medium-sized body text.
        bodyMedium: TextStyle(
          color: Color(0xFFDEDFD6), // Light text
          fontSize: 14,
          fontFamily: 'ArialPixel',
        ),

        /// Large button and label text.
        labelLarge: TextStyle(
          color: Colors.white, // White text for contrast
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'ArialPixel',
        ),

        /// Large title text (used for headings and AppBar).
        titleLarge: TextStyle(
          color: Color(0xFFDEDFD6), // Title text color
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'ArialPixel',
        ),
      ),

      /// Customizes the **AppBar appearance** to match CS16 UI.
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF3E4637), // Dark green header
        elevation: 2, // Slight shadow for depth
        titleTextStyle: TextStyle(
          color: Color(0xFFDEDFD6), // Light-colored title text
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'ArialPixel',
        ),
      ),

      /// Customizes the **appearance of elevated buttons**.
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3E4637), // Dark green button
          foregroundColor: Colors.white, // White text for contrast
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 10), // Adds padding
          shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.zero, // No rounded corners for a classic CS16 look
          ),
          side: const BorderSide(
            color: Color(0xFF8C9284), // Light grey border
            width: 2, // Slightly thick border for a retro feel
          ),
          shadowColor: Colors.black.withOpacity(0.8), // Dark shadow for depth
          elevation: 4, // Raised button effect
        ),
      ),
    );
  }
}
