import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widget/new_expense.dart';

import 'package:expense_tracker_app/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker_app/model/expense.dart';
import 'package:expense_tracker_app/widget/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  // method for + Add Overlay
  void _openAddExpenseOverlay() {
    // Showing Model
    showModalBottomSheet(
      isScrollControlled: true, // Model controll take full overlay height
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  //  remove expense method using swipe data from Dismissible() widget
  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // remove any message might still have on the screen
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Expense delted.'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              //  getting back delted item by .inset(index, expense)
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. start adding some!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          // Toolbar with Add Button => Row()
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
