import 'package:tobiachat/screens/Home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Tobia Chat';
    return MaterialApp(
      title: title,
      home: MyHomePage(),
    );
  }
}
