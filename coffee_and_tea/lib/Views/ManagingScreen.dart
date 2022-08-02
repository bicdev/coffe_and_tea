import 'package:flutter/material.dart';
import 'package:yeet/yeet.dart';

import '../navigation.dart';

class ManagingScreen extends StatelessWidget {
  const ManagingScreen({Key? key}) : super(key: key);

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

class Managing extends StatefulWidget {
  const Managing({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Managing> createState() => _ManagingState();
}

class _ManagingState extends State<Managing> {
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
              'You are in the MANAGING SCREEN!',
            ),
            ElevatedButton(
              child: Text("Go to FastInputScreen"),
              onPressed: () {
                // nav >> FastInputScreen
                context.yeetOnTop('/fast_input');
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
