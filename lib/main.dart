import 'package:flutter/material.dart';
import 'package:places/my_stateless_widget.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyStateLessWidget(),
    );
  }
}

