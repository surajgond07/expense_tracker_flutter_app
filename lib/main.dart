import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widget/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true, // Enable Material 3 directly
      colorScheme: kColorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor:
            kColorScheme.primary, // Use primary color for the AppBar background
        foregroundColor:
            kColorScheme.onPrimary, // Use color for the AppBar text/icons
      ),
    ),
    home: const Expenses(),
  ));
}
