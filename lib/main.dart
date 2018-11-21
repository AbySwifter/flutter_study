import 'package:flutter/material.dart';
// 导入单例模型
import 'package:first_flutter_application/MainPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return new MaterialApp(
     title: 'startup name generator',
     home: new MainPage(),
     theme: new ThemeData(
//       primaryColor: Colors.white,
      primaryColor: Colors.blue,
     ),
   );
  }
}



