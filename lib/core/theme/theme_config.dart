import 'package:flutter/material.dart';

class AppTheme {
  // Main colors
  static const Color primaryColor = Color(0xFF1E88E5);
  static const Color accentColor = Color(0xFF26A69A);
  static const Color backgroundColor = Color(0xFF121212);
  static const Color cardColor = Color(0xFF1E1E1E);
  static const Color scaffoldBackgroundStart = Color(0xFF0D1117);
  static const Color scaffoldBackgroundEnd = Color(0xFF1E2030);

  // Text colors
  static const Color textPrimaryColor = Color(0xFFFFFFFF);
  static const Color textSecondaryColor = Color(0xFFB0BEC5);

  // Rating colors
  static const Color ratingExcellent = Color(0xFF00C853);
  static const Color ratingGood = Color(0xFF2979FF);
  static const Color ratingAverage = Color(0xFFFF9100);
  static const Color ratingPoor = Color(0xFFFF3D00);

  // Button styles
  // Updated button styles in theme_config.dart
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 3,
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  );

  static final ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    foregroundColor: primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(color: primaryColor),
    ),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  );

  // Card styles
  static final BoxDecoration cardDecoration = BoxDecoration(
    color: cardColor,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withAlpha(50),
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
  );

  // Text styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
    letterSpacing: 0.5,
  );

  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textPrimaryColor,
    letterSpacing: 0.3,
  );

  static const TextStyle sectionTitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textPrimaryColor,
    letterSpacing: 0.2,
  );

  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16,
    color: textPrimaryColor,
    letterSpacing: 0.2,
  );

  static const TextStyle captionStyle = TextStyle(
    fontSize: 14,
    color: textSecondaryColor,
    letterSpacing: 0.1,
  );

  // Rating container decoration
  static BoxDecoration getRatingContainerDecoration(double rating) {
    return BoxDecoration(
      color: getRatingColor(rating).withAlpha(40),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: getRatingColor(rating).withAlpha(80), width: 1),
    );
  }

  // Get color based on rating value
  static Color getRatingColor(double rating) {
    if (rating >= 8) return ratingExcellent;
    if (rating >= 6) return ratingGood;
    if (rating >= 4) return ratingAverage;
    return ratingPoor;
  }

  // Create the theme data
  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      cardColor: cardColor,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: accentColor,
        surface: cardColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButtonStyle),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: false,
        foregroundColor: textPrimaryColor,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textPrimaryColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: headingStyle,
        displayMedium: subheadingStyle,
        titleLarge: sectionTitleStyle,
        bodyLarge: bodyTextStyle,
        bodyMedium: bodyTextStyle,
        bodySmall: captionStyle,
      ),
    );
  }

  // Gradient background decoration
  static BoxDecoration get backgroundGradient => const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [scaffoldBackgroundStart, scaffoldBackgroundEnd],
    ),
  );
}
