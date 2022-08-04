import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../expense.dart';

class ExpensesChangeNotifier extends ChangeNotifier{
  final List<Expense> _expenses = [];

  UnmodifiableListView<Expense> get expenses => UnmodifiableListView(_expenses);

  void add(Expense expense){
    _expenses.add(expense);
    notifyListeners();
  }
}

final expensesChangeNotifierProvider = ChangeNotifierProvider<ExpensesChangeNotifier>((ref) {
  return ExpensesChangeNotifier();
});
