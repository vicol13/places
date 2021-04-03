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
            backgroundColor: Colors.white,
            title: Text(
              "Favorites",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                height: 45,
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30)),
                  child: TabBar(
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: Colors.grey,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(59, 62, 91, 1)),
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
