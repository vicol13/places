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
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: fontSize,color: Colors.green),
          children: [
            TextSpan(
                text: '${_firstWord.substring(1, _firstWord.length)}\n',
                style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: fontSize),
                children: [
                  TextSpan(
                      text: '${_secondWord[0]}',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.yellow,fontSize: fontSize),
                      children: [
                        TextSpan(
                            text:
                                '${_secondWord.substring(1, _secondWord.length)}',
                            style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: fontSize)
                            )
                      ])
                ]),
          ]),
    );
  }
}
