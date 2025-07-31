import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.yellow[700],
    hintColor: Colors.yellow[700],
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0,
      titleTextStyle: TextStyle(color: Colors.yellow[700], fontSize: 20),
      iconTheme: IconThemeData(color: Colors.yellow[700]),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[900],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      hintStyle: TextStyle(color: Colors.grey),
    ),
  );
}
