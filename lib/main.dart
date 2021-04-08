import 'package:flutter/material.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Places',
        theme: brightTheme,
        home: MainScreen()
        );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
          controller: _controller,
           physics: NeverScrollableScrollPhysics(),
          children: [SightListScreen(), VisitingScreen()]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _controller.index,
        onTap: (curentIndex) {
          _controller.animateTo(curentIndex);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.reorder,size: 35), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,size: 35), label: "")
        ],
      ),
    );
  }
}
