import 'package:flutter/material.dart';

///
/// will display a message in center of screen
///
class CenterMessage extends StatelessWidget {
  final Widget message;
  final Widget icon;
  const CenterMessage({@required this.icon, @required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        width: 250,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              SizedBox(
                height: 20,
              ),
              message
            ]),
      ),
    );
    ;
  }
}
