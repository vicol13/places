import 'package:cupertino_range_slider/cupertino_range_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/serivce/search_service.dart';
import 'package:places/ui/screen/res/svgs.dart';
import 'package:places/ui/screen/widgets/filter_card.dart';
import 'dart:math' as Math;
import '../../mocks.dart' as mockdata;

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  ///
  /// Intialization should not be here
  ///
  Map<SightType, bool> selectedFilterMap = {
    SightType.RESTAURANT: false,
    SightType.HOTEL: false,
    SightType.SPECIAL_PLACE: false,
    SightType.PARK: false,
    SightType.MUSEUM: false,
    SightType.COFFE: false
  };

  SearchService service = SearchService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            actions: [
              //
              //  clear filter button
              //
              Container(
                padding: EdgeInsets.only(right: 20),
                child: TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith((states) =>
                          Theme.of(context).buttonColor.withOpacity(0.2)),
                    ),
                    onPressed: _clearFilterCallback,
                    child: Text(
                      "Clear",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Theme.of(context).buttonColor, fontSize: 20),
                    )),
              )
            ],
            //
            //  back button
            //
            title: Container(
              padding: EdgeInsets.only(left: 5),
              child: TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith((states) =>
                        Theme.of(context).primaryColor.withOpacity(0.1))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset(
                  LEFT_ARROW,
                  color: Theme.of(context).primaryColor,
                  height: 20,
                  width: 20,
                ),
              ),
            )),
        //
        // main screen
        //
        body: Container(
          padding: EdgeInsets.only(left: 25, right: 25, top: 30),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Categories",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 20)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                //
                //  filters grid
                //
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    //hotel
                    FilterCard(
                      onTap: () {
                        _switchFilterState(SightType.HOTEL);
                      },
                      icon: SvgPicture.asset(HOTEL,
                          color: Theme.of(context).buttonColor),
                      isSelected: selectedFilterMap[SightType.HOTEL],
                      type: SightType.HOTEL.toUiString(),
                    ),
                    //restaurant
                    FilterCard(
                      onTap: () {
                        _switchFilterState(SightType.RESTAURANT);
                      },
                      icon: SvgPicture.asset(RESTAURANT,
                          color: Theme.of(context).buttonColor),
                      isSelected: selectedFilterMap[SightType.RESTAURANT],
                      type: SightType.RESTAURANT.toUiString(),
                    ),
                    //special place
                    FilterCard(
                      onTap: () {
                        _switchFilterState(SightType.SPECIAL_PLACE);
                      },
                      icon: SvgPicture.asset(STAR,
                          color: Theme.of(context).buttonColor),
                      isSelected: selectedFilterMap[SightType.SPECIAL_PLACE],
                      type: SightType.SPECIAL_PLACE.toUiString(),
                    ),
                    //park
                    FilterCard(
                      onTap: () {
                        _switchFilterState(SightType.PARK);
                      },
                      icon: SvgPicture.asset(TREE,
                          color: Theme.of(context).buttonColor),
                      isSelected: selectedFilterMap[SightType.PARK],
                      type: SightType.MUSEUM.toUiString(),
                    ),
                    //  museum
                    FilterCard(
                      onTap: () {
                        _switchFilterState(SightType.MUSEUM);
                      },
                      icon: SvgPicture.asset(MUSEUM,
                          color: Theme.of(context).buttonColor),
                      isSelected: selectedFilterMap[SightType.MUSEUM],
                      type: SightType.MUSEUM.toUiString(),
                    ),
                    // cafe
                    FilterCard(
                      onTap: () {
                        _switchFilterState(SightType.COFFE);
                      },
                      icon: SvgPicture.asset(CAFFE,
                          color: Theme.of(context).buttonColor),
                      isSelected: selectedFilterMap[SightType.COFFE],
                      type: SightType.COFFE.toUiString(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              //
              //  information about selected range
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Distance",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Theme.of(context).primaryColor, fontSize: 18),
                  ),
                  Text(
                      "from ${this.service.minKmRangeValue.round()} to ${this.service.maxKmRangeValue.round()} km",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 15))
                ],
              ),
              SizedBox(height: 20),
              //
              //  slider
              //
              Container(
                width: double.infinity,
                child: CupertinoRangeSlider(
                  max: 10000,
                  min: 99,
                  maxValue: service.maxKmRangeValue,
                  minValue: service.minKmRangeValue,
                  onMaxChanged: (newValue) {
                    setState(() {
                      // this._maxKmRange = newValue;
                      service.maxKmRange = newValue;
                    });
                  },
                  onMinChanged: (newValue) {
                    setState(() {
                      service.minKmRange = newValue;
                    });
                  },
                  activeColor: Theme.of(context).buttonColor,
                ),
              ),
              // added to push button at the button of screen
              Expanded(child: Container()),
              //
              // show button
              // !todo split to another widget
              MaterialButton(
                onPressed: () {
                  print("Show callback");
                },
                height: 50,
                minWidth: double.infinity,
                child: Text("Show (${_countMatches()})",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.white, fontSize: 18)),
                color: Theme.of(context).buttonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                elevation: 0,
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }

  void _clearFilterCallback() {
    setState(() {
      selectedFilterMap[SightType.COFFE] = false;
      selectedFilterMap[SightType.HOTEL] = false;
      selectedFilterMap[SightType.MUSEUM] = false;
      selectedFilterMap[SightType.PARK] = false;
      selectedFilterMap[SightType.SPECIAL_PLACE] = false;
      selectedFilterMap[SightType.RESTAURANT] = false;
      service.maxKmRange = 10000;
      service.minKmRange = 100;
    });
  }

  ///
  /// will switch filter state
  ///
  void _switchFilterState(SightType type) {
    setState(() {
      selectedFilterMap[type] = !selectedFilterMap[type];
    });
  }

  ///
  ///  will return number of sights matching the criteria
  ///
  int _countMatches() {
    var selectedFilters = Map.from(selectedFilterMap)
      ..removeWhere((key, value) => !value)
      ..keys.toSet();

    return mockdata.mocks
        .where((it) => selectedFilters.containsKey(it.type))
        .where((it) => service.isMatchingRangeFilter(it))
        .length;
  }
}
