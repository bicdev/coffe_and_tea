import 'package:coffee_and_tea/navigation.dart';
import 'package:flutter/material.dart';
import 'package:yeet/yeet.dart';

import 'Views/FastInputScreen.dart';
import 'Views/ManagingScreen.dart';

void main() {
  runApp(const MyApp());
  // runApp(const FastInputScreen());
  // runApp(const ManagingScreen());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final yeet = getMyYeet();
    return MaterialApp.router(
      routeInformationParser: YeetInformationParser(),
      routerDelegate: YeeterDelegate(yeet: yeet),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final yeet = getMyYeet();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You are in the tester screen!!',
            ),
            ElevatedButton(
              child: Text("Go to FastInputScreen"),
              onPressed: () {
                /// nav >> fast_input
                context.yeetOnTop('/fast_input');
              },
            ),
            ElevatedButton(
              child: Text("Go to ManagingScreen"),
              onPressed: () {
                // nav >> managing
                context.yeetOnTop('/managing');
              },
            ),
          ],
        ),
      ),
    );
  }
}
