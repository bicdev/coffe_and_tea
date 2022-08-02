import 'package:yeet/yeet.dart';

import 'Views/FastInputScreen.dart';
import 'Views/ManagingScreen.dart';
import 'main.dart';


// YEET
Yeet getMyYeet(){
  return Yeet(
  children: [
    Yeet(
      path: '/',
      builder: (_) => MyHomePage(title:'Tester hub'),
    ),
    Yeet(
      path: '/fast_input',
      builder: (_) => FastInput(title:'Fast Input Screen'),
    ),
    Yeet(
      path: '/managing',
      builder: (_) => Managing(title:'Managing Screen'),
    ),
  ],
);;
}
// YEET