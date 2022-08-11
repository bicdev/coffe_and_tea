import 'package:flutter/material.dart';
import 'package:coffee_and_tea/Model/expense_node.dart';


import 'package:test/test.dart';

void main() {

  test('expense should be updateable', () {
    Expense expense = Expense(amount: 1);
    expect(expense.amount, 1);

    expense.amount = 2;
    expect(expense.amount, 2);
  });
  test('expense groups should start empty', () {
    ExpenseGroup eg = ExpenseGroup(children: []);

    expect(eg.children.length, 0);
  });
  test('expense groups can add child of both types', () {
    ExpenseGroup eg = ExpenseGroup(children: []);

    // adding lonely node
    eg.addChild(Expense(amount: 1));
    expect(eg.children.length, 1);

    // adding node with child
    ExpenseGroup eg2 = ExpenseGroup(children: [Expense(amount: 1)]);
    eg.addChild(eg2);
    expect(eg.children.length, 2);

    // adding node with multiple children
    eg.addChild(ExpenseGroup(children: [eg2]));
    expect(eg.children.length, 3);
  });
  
  test('expense groups can have multiple children independently', () {
    ExpenseGroup eg = ExpenseGroup(children: [Expense(amount: 1), Expense(amount: 2), Expense(amount: 3)]);
    ExpenseGroup eg2 = ExpenseGroup(children: [Expense(amount: 1), Expense(amount: 2), Expense(amount: 3)]);
    ExpenseGroup parent = ExpenseGroup(children: [eg, eg2]);

    expect(parent.children.length, 2);
  });

  test('expenses are still readable inside a expense group', () {
    Expense e = Expense(amount: 1, description: 'a', flavour: 'a');

    expect(e.amount, 1);
    expect(e.description, 'a');
    expect(e.flavour, 'a');
  });
  test('expenses can be converted into a group and its the new children', () {
    Expense e = Expense(amount: 1, description: 'a', flavour: 'a');

    ExpenseGroup eg = e.toGroup();
    expect(eg.description, 'a');
    expect(eg.flavour, 'a');

    Expense convertedExpense = eg.children[0];
    expect(convertedExpense.amount, 1);
    expect(convertedExpense.description, 'a child');
    expect(convertedExpense.flavour, 'a');
  });

  test('expense groups have a depth property', () {
    Expense d = Expense(amount: 1);

    ExpenseGroup f = ExpenseGroup(children: [d]);
    expect(f.getDepth(), 1);

    ExpenseGroup g = ExpenseGroup(children: [f]);
    expect(g.getDepth(), 2);

    ExpenseGroup b = ExpenseGroup(children: [d,f,g]);
    expect(b.getDepth(), 3);

    ExpenseGroup c = ExpenseGroup(children: [d,d,d]);
    expect(c.getDepth(), 1);

    ExpenseGroup a = ExpenseGroup(children: [b,c,d]);
    expect(a.getDepth(), 4);
  });
  
  test('expense groups have a total amount property', () {
    Expense d = Expense(amount: 1);

    ExpenseGroup h = ExpenseGroup(children: [d,d]);
    expect(h.getTotalAmount(), 2);

    ExpenseGroup f = ExpenseGroup(children: [d]);
    expect(f.getTotalAmount(), 1);

    ExpenseGroup g = ExpenseGroup(children: [h]);
    expect(g.getTotalAmount(), 2);

    ExpenseGroup b = ExpenseGroup(children: [d,f,g]);
    expect(b.getTotalAmount(), 4);

    ExpenseGroup c = ExpenseGroup(children: [d,d,d]);
    expect(c.getTotalAmount(), 3);

    ExpenseGroup a = ExpenseGroup(children: [b,c,d]);
    expect(a.getTotalAmount(), 8);
  });


}