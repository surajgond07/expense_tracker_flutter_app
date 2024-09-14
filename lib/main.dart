import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widget/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

// Creating Dark Mode Color Variable
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness:
      Brightness.dark, // tell flutter this bellow Color for Dark Brighter

  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(MaterialApp(
    // Dark Mode Theme
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kDarkColorScheme,
      cardTheme: CardTheme(
        color: kDarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        ),
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: kDarkColorScheme.onSecondaryContainer,
        fontSize: 19,
      )),
    ),

    // The Light Mode Theme
    theme: ThemeData(
      useMaterial3: true, // Enable Material 3 directly
      colorScheme: kColorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor:
            kColorScheme.primary, // Use primary color for the AppBar background
        foregroundColor:
            kColorScheme.onPrimary, // Use color for the AppBar text/icons
      ),
      // Apply for all the Card default setting
      cardTheme: CardTheme(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      // Apply for all the Elevated Button default setting
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer,
        ),
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: kColorScheme.onSecondaryContainer,
        fontSize: 19,
      )),
    ),
    // themeMode: ThemeMode.system,
    home: const Expenses(),
  ));
}
