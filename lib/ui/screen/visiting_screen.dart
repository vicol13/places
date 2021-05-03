import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/serivce/sights_service.dart';
import 'package:places/ui/screen/res/svgs.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/screen/widgets/center_message.dart';
import 'package:places/ui/screen/widgets/visited_sight_card.dart';
import 'package:places/ui/screen/widgets/want_to_visit_sight_card.dart';

///
///  widget used to display sigts which user visited or want to visit
///
class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  SightService service = SightService.instance;

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
              style: Theme.of(context).textTheme.subtitle1,
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 40, right: 40),
                  child: Container(
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: TabBar(
                        tabs: [Tab(text: "Wish List"), Tab(text: "Visited")],
                      ),
                    ),
                  ),
                )),
          ),
          body: TabBarView(
            children: [_wantToVisitTab(), _vistedTab()],
          ),
        ));
  }

  ///
  /// check if want to visit sigts list is empty
  /// and if it's empty disaplay the message
  /// otherwise list the sights
  ///
  Widget _wantToVisitTab() {
    return this.service.wantToVisit.isNotEmpty
        ? _listWantToVisitSights()
        : _message(
            PHOTO, "Mark places you want to visit and they will apear here");
  }

  ///
  /// check if visted sigts list is empty
  /// and if it's empty disaplay the message
  /// otherwise list the sights
  ///
  Widget _vistedTab() {
    return this.service.visited.isNotEmpty
        ? _listVisitedSights()
        : _message(
            ROUTE, "Finish route and sights will apear here");
  }

  ///
  /// display a message in center of screen
  ///
  Widget _message(String iconPath, String message) {
    return CenterMessage(
        icon: SvgPicture.asset(
          iconPath,
          height: 100,
          width: 100,
          color: lt_grey_text,
        ),
        message: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "Empty\n\n",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 20),
                children: [
                  TextSpan(
                      text: message,
                      style: Theme.of(context).textTheme.bodyText2)
                ])));
  }

  Widget _listVisitedSights() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          for (var sight in service.visited)
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: VisitedSightCard(
                key: ValueKey(sight.id),
                sight: sight,
                onDelete: () {
                  setState(() {
                    service.visited.remove(sight);
                  });
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _listWantToVisitSights() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          for (var sight in service.wantToVisit)
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: WantToVisitSightCard(
                key: ValueKey(sight.id),
                sight: sight,
                onDelete: () {
                  setState(() {
                    service.wantToVisit.remove(sight);
                  });
                },
              ),
            )
        ],
      ),
    );
  }
}
