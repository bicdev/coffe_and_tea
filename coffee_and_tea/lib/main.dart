import 'package:coffee_and_tea/navigation.dart';
import 'package:flutter/material.dart';
import 'package:yeet/yeet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final yeet = getMyYeet();
    return  MaterialApp.router(
      routeInformationParser: YeetInformationParser(),
      routerDelegate: YeeterDelegate(yeet: yeet),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final yeet = getMyYeet();

    int current = 0;
    final routes = ['/', '/managing', '/fast_input'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Tester hub"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You are in the tester screen!!',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), label: "Hub"),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search), label: "Managing"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart), label: "Fast Input"),
        ],
        currentIndex: current,
        onTap: (int newRoute) {
          context.yeetOnTop(routes[newRoute]);
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
    );
  }
}
