import 'package:flutter/material.dart';

class Expense {
  double total = 0;
  String? description;
  String? flavour; //TODO: make Flavour class

  Expense({required this.total, this.description, this.flavour});

  Expense get expense => this;
}