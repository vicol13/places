import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/sight_type.dart';

///
/// this scren is used for picking a SightType
/// when a sight is created
///
/// ?todo on scroll left value is no passed
///
class SightTypesScreen extends StatefulWidget {
  ///
  /// in case user navigate back to change it
  ///
  SightType type;
  SightTypesScreen({this.type});
  @override
  _SightTypesScreenState createState() => _SightTypesScreenState();
}

class _SightTypesScreenState extends State<SightTypesScreen> {
  Map<SightType, bool> map =
      SightType.values.asMap().map((key, value) => MapEntry(value, false));

  @override
  void initState() {
    super.initState();
    if (widget.type != null) {
      map[widget.type] = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: TextButton(
            onPressed: _navigateBack,
            child: SvgPicture.asset(
              "res/assets/arrow_of_back_button.svg",
              color: Theme.of(context).primaryColor,
              height: 20,
              width: 20,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Categories",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        body: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(children: [
              for (var type in SightType.values)
                _SightFilterListCard(
                  isSelected: map[type],
                  onTap: () {
                    _updateSelectedIndex(type);
                  },
                  name: type.toUiString(),
                ),
              Expanded(child: Container()),
              ///
              /// Save button
              ///
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: MaterialButton(
                  onPressed: _navigateBack,
                  height: 50,
                  minWidth: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Save",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: Colors.white, fontSize: 18))
                    ],
                  ),
                  color: Theme.of(context).buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  elevation: 0,
                ),
              ),
            ])));
  }

  ///
  /// update values in map
  ///
  void _updateSelectedIndex(SightType newSelectedType) {
   
    setState(() {
      map = map.map((key, value) {
        if (key == newSelectedType) {
          return MapEntry(key, !map[newSelectedType]);
        }
        return MapEntry(key, false);
      });
    });
  }

  ///
  /// pick element from [map] which has value true
  /// and pop it to previous screen
  ///
  void _navigateBack() {
    var selecteSightType =
        map.entries.firstWhere((element) => element.value, orElse: () => null);
    Navigator.of(context).pop(selecteSightType?.key);
  }
}

class _SightFilterListCard extends StatelessWidget {
  VoidCallback onTap;
  String name;
  bool isSelected;
  _SightFilterListCard(
      {Key key,
      @required this.onTap,
      @required this.isSelected,
      @required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                name,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Theme.of(context).primaryColor, fontSize: 16),
              ),
            ),
            isSelected
                ? Container(
                    padding: EdgeInsets.only(right: 15),
                    child: SvgPicture.asset(
                      "res/assets/done.svg",
                      color: Theme.of(context).buttonColor,
                      height: 10,
                      width: 10,
                    ),
                  )
                : Container(),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 0.1,
          color: Colors.grey,
          width: double.infinity,
        )
      ]),
    );
  }
}
