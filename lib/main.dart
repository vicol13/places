import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/provider/theme_provider.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      child: App(), create: (context) => ThemeProvider()));
}


class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (ctx, provider, child) {
      return MaterialApp(title: 'Places', theme: provider.isDarkTheme ? darkTheme: brightTheme, home: MainScreen());
    });
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
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
          children: [
            SightListScreen(),
            FiltersScreen(),
            VisitingScreen(),
            SettingsScreen()
          ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: _controller.index,
        onTap: (curentIndex) {
          _controller.animateTo(curentIndex);
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('res/assets/bottom_navigation/list.svg',
                  color: Theme.of(context).primaryColor),
              label: ""),
          BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: SvgPicture.asset('res/assets/bottom_navigation/map.svg',
                  color: Theme.of(context).primaryColor),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('res/assets/bottom_navigation/heart.svg',
                  color: Theme.of(context).primaryColor),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('res/assets/bottom_navigation/settings.svg',
                  color: Theme.of(context).primaryColor),
              label: ""),
        ],
      ),
    );
  }
}
