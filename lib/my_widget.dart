import 'package:flutter/material.dart';

class MyFirstWidget extends StatefulWidget {
  @override
  _MyFirstWidgetState createState() => _MyFirstWidgetState();
}

class _MyFirstWidgetState extends State<MyFirstWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    counter++;
    print('counter : [$counter]');
    return Container(
      child: Center(
        child: Text('Hello!'),
      ),
    );
  }

  Type _runTime() {
    return context.runtimeType;
  }
}
