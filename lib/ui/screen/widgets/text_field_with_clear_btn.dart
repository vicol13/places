import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/screen/res/svgs.dart';

///
/// custom input text field
///
class TextInputWithClearButton extends StatefulWidget {
  TextEditingController controller;
  String title;
  FocusNode focusNode;
  VoidCallback onSubmit;
  bool isMultiLine;
  TextInputWithClearButton(
      {Key key,
      @required this.controller,
      @required this.focusNode,
      @required this.title,
      @required this.onSubmit,
      this.isMultiLine = false})
      : super(key: key);

  @override
  _TextInputWithClearButton createState() => _TextInputWithClearButton();
}

class _TextInputWithClearButton extends State<TextInputWithClearButton> {
  String text;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          child: Text(
        widget.title,
        style: Theme.of(context).textTheme.bodyText2,
      )),
      SizedBox(
        height: 10,
      ),
      TextField(
        keyboardType: TextInputType.text,
        minLines: this.widget.isMultiLine ? 3 : 1,
        maxLines: this.widget.isMultiLine ? 6 : 1,
        focusNode: widget.focusNode,
        controller: widget.controller,
        onSubmitted: (_) {
          // this value is ignored because it's saved usign onChanged(String value)
          widget.onSubmit();
        },
        style: Theme.of(context).textTheme.bodyText1,
        onChanged: (String value) {
          setState(() {
            this.text = value;
          });
        },
        decoration: InputDecoration(
            focusColor: Color.fromRGBO(76, 175, 80, 1),
            suffixIcon: this.widget.controller.text.isNotEmpty &&
                    widget.focusNode.hasFocus
                ? _getCleaButton()
                : null,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1.2, color: Theme.of(context).buttonColor),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 0.5, color: Theme.of(context).buttonColor),
                borderRadius: BorderRadius.circular(15)),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 0.5, color: Theme.of(context).buttonColor),
                borderRadius: BorderRadius.circular(15))),
      ),
    ]);
  }

  Widget _getCleaButton() {
    return TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ))),
        onPressed: () {
          widget.controller.clear();
          //wil remove button if text field is empty Abce
          setState(() {});
        },
        child: SvgPicture.asset(
          CLEAR_WITH_OUTLINE,
          color: Theme.of(context).primaryColor,
        ));
  }

  @override
  void initState() {
    super.initState();
    this.widget.focusNode.addListener(() {
      setState(() {});
    });
  }
}
