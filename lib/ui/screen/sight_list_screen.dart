import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/screen/res/svgs.dart';
import 'package:places/ui/screen/search_screen/search_screen.dart';
import 'package:places/ui/screen/widgets/search_bar.dart';
import 'package:places/ui/screen/widgets/sight_card.dart';
import 'add_sight_screen/add_sight_screen.dart';
import 'widgets/styled_title.dart';
import '../../mocks.dart' as mockdata;
import 'filters_screen.dart';

class SightListScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Theme.of(context).backgroundColor,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: SearchBar(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
              enabled: false,
              ///
              /// sufix icon in search bar [filter button]
              ///
              sufix: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FiltersScreen()),
                  );
                },
                child: Container(
                    child: SvgPicture.asset(
                  FILTERS,
                  color: Theme.of(context).buttonColor,
                )),
              ),
            ),
          ),
          title: Column(
            children: [StyledTitle('list of', 'interesting places')],
          ),
        ),
      ),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Center(
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              SightCard(sight: mockdata.mocks.last),
              SizedBox(
                height: 30,
              ),
              SightCard(sight: mockdata.mocks[1]),
              SizedBox(
                height: 30,
              ),
              SightCard(sight: mockdata.mocks[2]),
              SizedBox(
                height: 30,
              ),
              SightCard(sight: mockdata.mocks[3])
            ]),
          ),
        ),

        ///
        /// add new sight button
        ///
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddSightScreen()));
            },
            child: Container(
              width: 170,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(252, 221, 61, 1),
                    Color.fromRGBO(76, 175, 80, 1),
                  ])),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset(
                    PLUS,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Add new place",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
