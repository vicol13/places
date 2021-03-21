import 'package:flutter/material.dart';

class MyStateLessWidget extends StatelessWidget {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    print('print ${_counter++}');
    return Container(child: Text("aaa"));
  }
}
