import 'package:flutter/material.dart';
import 'package:places/ui/screen/visited_sight_card.dart';
import '../../mocks.dart' as mockdata;



class VisitingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).backgroundColor,
            title: Text(
              "Favorites",
              style:Theme.of(context).textTheme.subtitle1,
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                height: 45,
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: "Wish List",
                      ),
                      Tab(text: "Visited")
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    VisitedSightCard(sight: mockdata.mocks[6]),
                    SizedBox(
                      height: 30,
                    ),
                    VisitedSightCard(sight: mockdata.mocks[7]),
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    VisitedSightCard(sight: mockdata.mocks[4]),
                    SizedBox(
                      height: 30,
                    ),
                    VisitedSightCard(sight: mockdata.mocks[5]),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
