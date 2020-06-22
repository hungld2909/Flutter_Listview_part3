import 'package:flutter/material.dart';
import 'listViewExample.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final materialApp = new MaterialApp(
      title: "",
      home: listViewExample(),
    );
    return materialApp;
  }
}