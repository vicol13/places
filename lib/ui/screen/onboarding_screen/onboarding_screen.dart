import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/main.dart';
import 'package:places/ui/screen/res/svgs.dart';
import 'package:places/ui/screen/res/themes.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController;
  int hightlited = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          ///
          /// skip button
          ///
          Container(
            padding: EdgeInsets.only(right: 15),
            child: TextButton(
              onPressed: () {
                navigateToMainScree(context);
              },
              child: Text(
                "Skip",
                style: TextStyle(color: lt_green),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            ///
            ///  cards view
            ///
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  this.hightlited = value;
                });
              },
              children: [
                _OnboardingItem(
                  heading: "Welcome\nto Places",
                  body: "Find new places and\nsave special ones",
                  csvPath: ROUTE_WOOD_SIGN,
                ),
                _OnboardingItem(
                  heading: "Build Route\nand start the trip",
                  body: "Achive your target fast\n and easy",
                  csvPath: BACKPACK,
                ),
                _OnboardingItem(
                  heading: "Add places,\nwhich you finded",
                  body: "Share with your best and\nhelp us to be better",
                  csvPath: TAP,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///
                  /// carousel
                  ///
                  Container(
                    width: 75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < 3; i++)
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: i == hightlited ? lt_green : Colors.grey,
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),

                  ///
                  /// button
                  ///
                  hightlited == 2 ? _displayButton(context) : Container()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void navigateToMainScree(BuildContext ctx) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => MainScreen()), (_) => false);
  }

  Widget _displayButton(BuildContext ctx) {
    return MaterialButton(
      onPressed: () {
        navigateToMainScree(ctx);
      },
      height: 50,
      minWidth: double.infinity,
      child: Text(
        "Start",
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(color: Colors.white, fontSize: 18),
      ),
      color: Theme.of(context).buttonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 0,
    );
  }
}

class _OnboardingItem extends StatelessWidget {
  String heading;
  String body;
  String csvPath;
  _OnboardingItem({
    this.heading,
    this.body,
    this.csvPath,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            SvgPicture.asset(
              csvPath,
              color: lt_blue,
              height: 150,
              width: 150,
            ),
            SizedBox(height: 20),
            Text(
              heading,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: lt_blue),
            ),
            SizedBox(height: 15),
            Text(
              body,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
