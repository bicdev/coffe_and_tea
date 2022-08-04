import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:yeet/yeet.dart';

import '../Pods/expenses_pod.dart';
import '../expense.dart';
import '../navigation.dart';
import 'fast_input_screen.dart';


class Managing extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesChangeNotifier = ref.watch(expensesChangeNotifierProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("Managing"),
        ),
        body: Center(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: expensesChangeNotifier.expenses.length,
              itemBuilder: (BuildContext _, int index) {
                print(expensesChangeNotifier.expenses[index].total);
                return expenseCard(expensesChangeNotifier.expenses[index]);
              }),
        ));
  }

  Widget expenseCard(Expense expense) {
    return ListTile(
      title: Text('${expense.description}'),
      subtitle: Text('${expense.total}', textAlign: TextAlign.right),
      leading: Icon(Icons.hexagon),
    );
  }
}
