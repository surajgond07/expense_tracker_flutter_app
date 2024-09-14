import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, trave, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.trave: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  // formatting Date via Getter method

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpesnseBucket {
  const ExpesnseBucket({required this.category, required this.expenses});
  final Category category;
  final List<Expense> expenses;

  //  Using method to bring data
  double get totalExpenses {
    double sum = 0;
    // Using for-in loop
    for (final expense in expenses) {
      sum += expense.amount; // sum = sum + expense.ampunt
    }

    return sum;
  }
}
