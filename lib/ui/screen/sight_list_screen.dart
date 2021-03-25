import 'package:flutter/material.dart';
import 'styled_title.dart';

class SightListScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Colors.white, //??
          title: StyledTitle('list of', 'interesting places'),
        ),
      ),
      body: Center(child: Text('My first application')),
    );
  }
}