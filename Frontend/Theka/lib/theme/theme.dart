// theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  // Primary brand color
  static const Color primaryColor = Color(0xFF93E1D8);

  // Light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true, // For modern Material 3 styling
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(primaryColor),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        fixedSize: const WidgetStatePropertyAll(Size(300, 60)),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor:const Color(0xFFFFFDF5), // background color
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.black54,
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.blue,
          width: 2,
        ),
      ),
      labelStyle: const TextStyle(
        color: Colors.black87,
        fontSize: 16,
      ),
      hintStyle: const TextStyle(
        color: Colors.grey,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    ),
  );
}
