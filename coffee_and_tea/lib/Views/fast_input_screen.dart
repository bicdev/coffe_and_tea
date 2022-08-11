import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:yeet/yeet.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../Model/expense.dart';
import '../Pods/expenses_pod.dart';
import '../navigation.dart';

// class FastInputScreen extends StatelessWidget {
//   const FastInputScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final yeet = getMyYeet();
//     return MaterialApp.router(
//       routeInformationParser: YeetInformationParser(),
//       routerDelegate: YeeterDelegate(yeet: yeet),
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//     );
//   }
// }

class FastInput extends ConsumerWidget {
  bool is_not_decimal = true;
  final TextEditingController controller = TextEditingController(text: "");

  double convert(String text){
    return double.parse(text);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesChangeNotifier = ref.watch(expensesChangeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Fast Input'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: LayoutGrid(
                areas: '''
                  total total total
                  b7 b8 b9
                  b4 b5 b6
                  b1 b2 b3
                  b0 bdot bdot99
                ''',
                columnSizes: const [auto, auto, auto],
                rowSizes: const [
                  auto,
                  auto,
                  auto,
                  auto,
                  auto,
                ],
                columnGap: 12,
                rowGap: 12,
                children: [
                  TextFormField(
                    controller: controller,
                    readOnly: true,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      suffixIcon: ElevatedButton(
                        child: Icon(Icons.cancel),
                        onPressed: () {
                            is_not_decimal = true;
                            controller.text = "";
                        },
                        ),
                      labelText: 'Total',
                      border: OutlineInputBorder(),
                    ),
                  ).inGridArea('total'),
                  ElevatedButton(
                    child: Text("9"),
                    onPressed: () {
                      controller.text += "9";
                    },
                  ).inGridArea('b9'),
                  ElevatedButton(
                    child: Text("8"),
                    onPressed: () {
                      controller.text += "8";
                    },
                  ).inGridArea('b8'),
                  ElevatedButton(
                    child: Text("7"),
                    onPressed: () {
                      controller.text += "7";
                    },
                  ).inGridArea('b7'),
                  ElevatedButton(
                    child: Text("6"),
                    onPressed: () {
                      controller.text += "6";
                    },
                  ).inGridArea('b6'),
                  ElevatedButton(
                    child: Text("5"),
                    onPressed: () {
                      controller.text += "5";
                    },
                  ).inGridArea('b5'),
                  ElevatedButton(
                    child: Text("4"),
                    onPressed: () {
                      controller.text += "4";
                    },
                  ).inGridArea('b4'),
                  ElevatedButton(
                    child: Text("3"),
                    onPressed: () {
                      controller.text += "3";
                    },
                  ).inGridArea('b3'),
                  ElevatedButton(
                    child: Text("2"),
                    onPressed: () {
                      controller.text += "2";
                    },
                  ).inGridArea('b2'),
                  ElevatedButton(
                    child: Text("1"),
                    onPressed: () {
                      controller.text += "1";
                    },
                  ).inGridArea('b1'),
                  ElevatedButton(
                    child: Text(".99"),
                    onPressed: () {
                      if (is_not_decimal) {
                        is_not_decimal = false;
                        controller.text += ".99";
                      }
                    },
                  ).inGridArea('bdot99'),
                  ElevatedButton(
                    child: Text("."),
                    onPressed: () {
                      if (is_not_decimal) {
                        is_not_decimal = false;
                        controller.text += ".";
                      }
                    },
                  ).inGridArea('bdot'),
                  ElevatedButton(
                    child: Text("0"),
                    onPressed: () {
                      controller.text += "0";
                    },
                  ).inGridArea('b0')
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed: () {
          Expense expense = Expense(total: convert(controller.text), description: 'descricao', flavour: 'sabor');
          expensesChangeNotifier.add(expense);
          context.yeet();
        },
      ),
    );
  }
}
