import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/serivce/search_service.dart';
import 'package:places/ui/screen/search_screen/widgets/sight_list_search_result.dart';
import 'package:places/ui/screen/search_screen/widgets/previous_search_list_view.dart';
import 'package:places/ui/screen/widgets/search_bar.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FocusNode focusNode;
  TextEditingController controller;

  SearchService service;
  @override
  void initState() {
    super.initState();
    this.controller = TextEditingController();
    this.service = SearchService.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        ///
        /// title
        ///
        title: Text(
          "List of interesting places",
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18),
        ),
        ///
        /// search bar
        ///
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: SearchBar(
            autofocus: true,
            textEditingController: controller,
            focusNode: focusNode,
            onClearPresed: () {
              setState(() {});
            },
            onChange: (String input) {
              setState(() {});
            },
            onSubmit: (String str) {
              previousSearch.add(str);
            },
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          ///
          /// body
          /// if [controller.text] will be empty will display previoues searchs queries
          /// otherwise will show matches to user input
          ///
          /// if input is empty will show previouse search [PreviousSearchList]
          ///
          /// otherwise will display sights matching the criteria [SightListSearchResult]
          ///
          ///
          child: this.controller.text.isEmpty
              ? PreviousSearchList(
                  previousSearches: previousSearch,
                  onElementPick: (String selected) {
                    setState(() {
                      //update search bar with selected field
                      this.controller.text = selected;
                      //put cursor at the end of text
                      this.controller.selection = TextSelection.fromPosition(
                          TextPosition(offset: selected.length));
                    });
                  },
                )
              : SightListSearchResult(
                  sights: this.service.filterByName(this.controller.text))),
    );
  }
}

final previousSearch = ["Piazza", "Viena", "Chicago", "Las Vegas", "Moscow"];
