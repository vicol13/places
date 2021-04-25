import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/screen/res/svgs.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/screen/widgets/center_message.dart';

///
/// widgtes which display previous search of user in search screen
///
class PreviousSearchList extends StatefulWidget {
  List<String> previousSearches;
  Function(String) onElementPick;
  PreviousSearchList(
      {@required this.previousSearches, @required this.onElementPick});

  @override
  _PreviousSearchListState createState() => _PreviousSearchListState();
}

class _PreviousSearchListState extends State<PreviousSearchList> {
  @override
  Widget build(BuildContext context) {
    return this.widget.previousSearches.isNotEmpty
        ? _displayList()
        : _noPreviousSearch();
  }

  Widget _noPreviousSearch() {
    return CenterMessage(
        icon: SvgPicture.asset(
          SEARCH,
          color: Colors.grey,
          height: 100,
          width: 100,
        ),
        message: Text(
          "No saved previous searchs",
          style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 15),
        ));
  }

  ///
  /// display the list of items (previouse searches)
  ///
  Widget _displayList() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ///
          /// title
          ///
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "You searched",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),

          ///
          /// iterate throught list and display items
          ///
          for (int i = 0; i < widget.previousSearches.length; i++)
            _SearchCard(
              name: widget.previousSearches[i],
              isFirst: i == 0,
              onRemove: () {
                setState(() {
                  this.widget.previousSearches.removeAt(i);
                });
              },
              onTapCard: this.widget.onElementPick,
            ),
          SizedBox(
            height: 10,
          ),

          ///
          /// remove  all previous search button
          ///
          Container(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                setState(() {
                  this.widget.previousSearches.clear();
                });
              },
              child: Container(
                width: 75,
                height: 40,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Clear all",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Theme.of(context).buttonColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

///
/// used to view previous search string
///
class _SearchCard extends StatelessWidget {
  bool isFirst;
  String name;
  Function(String) onTapCard;
  VoidCallback onRemove;
  _SearchCard({
    @required this.name,
    this.onRemove,
    this.onTapCard,
    this.isFirst = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        _showSplitLine(!isFirst),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///
            ///card
            ///
            Expanded(
                child: InkWell(
              onTap: () {
                onTapCard(name);
              },

              ///
              /// card text
              ///
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  style: TextStyle(color: Colors.grey),
                ),
                height: 50,
              ),
            )),

            ///
            /// remove button
            ///
            TextButton(
                onPressed: onRemove,
                child: SvgPicture.asset(
                  CLEAR,
                  color: Colors.grey,
                  height: 15,
                  width: 15,
                ))
          ],
        ),
      ],
    ));
  }

  Widget _showSplitLine(bool display) {
    return display
        ? Container(
            height: 0.75,
            color: lt_grey,
          )
        : Container();
  }
}
