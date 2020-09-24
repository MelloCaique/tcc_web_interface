import 'package:flutter/material.dart';
import 'package:web_interface/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'DI/RE', home: Login());
  }
}
