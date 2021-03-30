import 'package:flutter/material.dart';

///
///  represent app styled text where input are 2 words
///  { firstWord[0]->green, firstWord[..1]->black,
///    secondWord[0]->yellow, secondWord[..1]->black}
///
class StyledTitle extends StatelessWidget {
  final String _firstWord;
  final String _secondWord;
  final double fontSize;
  const StyledTitle(this._firstWord, this._secondWord, {this.fontSize = 25});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
          text: '${_firstWord[0]}',
          style: TextStyle(color: Colors.green, fontSize: this.fontSize,fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: '${_firstWord.substring(1, _firstWord.length)}\n',
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                      text: '${_secondWord[0]}',
                      style: TextStyle(color: Colors.yellow),
                      children: [
                        TextSpan(
                            text:
                                '${_secondWord.substring(1, _secondWord.length)}',
                            style: TextStyle(color: Colors.black))
                      ])
                ]),
          ]),
    );
  }
}
