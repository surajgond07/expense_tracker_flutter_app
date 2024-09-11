import 'package:expense_tracker_app/model/expense.dart';
import 'package:expense_tracker_app/widget/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;

  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      //  Dismissible using to remove data from swipe
      itemBuilder: (ctx, index) => Dismissible(
        // creating key for unique Cally identify the value to remove data from swipe
        key: ValueKey(expenses[index]),
        // onDismiss want function as value
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
