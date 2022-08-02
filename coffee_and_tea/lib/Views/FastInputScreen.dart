import 'package:flutter/material.dart';
import 'package:yeet/yeet.dart';

import '../navigation.dart';

class FastInputScreen extends StatelessWidget {
  const FastInputScreen({Key? key}) : super(key: key);

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

class FastInput extends StatefulWidget {
  const FastInput({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FastInput> createState() => _FastInputState();
}

class _FastInputState extends State<FastInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You are in the FAST INPUT SCREEN!',
            ),
            ElevatedButton(
              child: Text("Go to ManagingScreen"),
              onPressed: () {
                // nav >> ManagingScreen
                context.yeetOnTop('/managing');
              },
            ),
            ElevatedButton(
              child: Text("Go to tester hub"),
              onPressed: () {
                // nav >> hub
                context.yeet();
              },
            ),
          ],
        ),
      ),
    );
  }
}
