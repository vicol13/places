import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/screen/res/svgs.dart';

///
/// Seach bar
///
class SearchBar extends StatefulWidget {
  ///
  /// when user press SearchBar callback
  ///
  VoidCallback onTap;

  ///
  /// callback on value change
  ///
  ValueChanged<String> onChange;


  Function(String) onSubmit;

  ///
  /// will atach functionality to clear button
  ///
  VoidCallback onClearPresed;

  ///
  /// expose text controller to parrent widget
  ///
  TextEditingController textEditingController;


  Widget sufix;

  String hint;
  FocusNode focusNode;
  bool autofocus;
  bool enabled;
  SearchBar(
      {this.hint,
      this.onChange,
      this.onSubmit,
      this.onTap,
      this.focusNode,
      this.autofocus = false,
      this.enabled = true,
      this.textEditingController,
      this.onClearPresed,
      this.sufix});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  ///
  /// if is not enabled
  /// controller will not initilizided
  ///
  @override
  void initState() {
    super.initState();
    if (widget.enabled) {
      this.widget.textEditingController =
          this.widget.textEditingController == null
              ? TextEditingController()
              : this.widget.textEditingController;
      this.widget.textEditingController.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    // Call the dispose() method of the TextEditingController
    // here, and remember to do it before the super call, as
    // per official documentation:
    // https://api.flutter.dev/flutter/widgets/TextEditingController-class.html
    this.widget?.textEditingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, bottom: 10, right: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12)),
        height: 40,
        child: Row(children: [
          Expanded(
            child: InkWell(
              onTap: widget.onTap,
              child: Row(
                children: [
                  ///
                  /// search icon in app bar
                  ///
                  SizedBox(width: 10),
                  Container(child: SvgPicture.asset(SEARCH)),
                  SizedBox(width: 10),

                  ///
                  /// text input in app bar
                  ///
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(bottom: 3),
                    child: Container(
                      child: TextField(
                        autofocus: widget.autofocus,
                        enabled: widget.enabled,
                        controller: widget.textEditingController,
                        onChanged: widget.onChange,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                            hintStyle: Theme.of(context).textTheme.bodyText2),
                        onSubmitted: widget.onSubmit,
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),

          ///
          /// filter buton OR clear button
          ///
          SizedBox(width: 10),
          _getButon(),
          SizedBox(width: 15)
        ]),
      ),
    );
  }

  ///
  /// display certain buton depending on user input
  /// if input is empty filter buton will be displayed
  /// if input is not empty clear button will be displayed
  ///
  Widget _getButon() {
    if (this.widget?.textEditingController?.text?.isEmpty == null) {
      return showSuffix();
    }
    if (this.widget?.textEditingController?.text?.isEmpty == true) {
      return showSuffix();
    }
    return showClearButton();
  }

  Widget showClearButton() {
    return InkWell(
      onTap: () {
        widget.textEditingController.clear();
        widget.onClearPresed();
      },
      child: Container(
          child: SvgPicture.asset(
        CLEAR_WITH_OUTLINE,
        color: Theme.of(context).primaryColor,
      )),
    );
  }


  Widget showSuffix() {
    return widget.sufix == null ? Container() : widget.sufix;
  }
}
