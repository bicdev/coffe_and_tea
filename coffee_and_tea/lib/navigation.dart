import 'package:yeet/yeet.dart';

import 'Views/fast_input_screen.dart';
import 'Views/managing_screen.dart';
import 'main.dart';

// YEET
Yeet getMyYeet() {
  return Yeet(
    children: [
      Yeet(
        path: '/',
        builder: (_) => MyHomePage(),
      ),
      Yeet(
        path: '/fast_input',
        builder: (_) => FastInput(),
      ),
      Yeet(
        path: '/managing',
        builder: (_) => Managing(),
      ),
    ],
  );
  ;
}
// YEET