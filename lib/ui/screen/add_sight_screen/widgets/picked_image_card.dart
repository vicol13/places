import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/screen/res/svgs.dart';

///
/// small card which stands for images picked from user gallery
///
class PickedImageCard extends StatelessWidget {
  String imageurl;
  VoidCallback onDismissed;
  VoidCallback onLongPress;

  PickedImageCard({this.imageurl, this.onDismissed, this.onLongPress, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Dismissible(
        direction: DismissDirection.up,
        onDismissed: (direction) {
          onDismissed();
        },
        secondaryBackground: Container(),
        background: Container(),
        key: UniqueKey(),
        child: Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Stack(alignment: Alignment.topRight, children: [
            GestureDetector(
              onLongPress: onLongPress,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(imageurl), fit: BoxFit.cover)),
                ),
              ),
            ),
            //
            // remove button
            //
            Material(
              type: MaterialType.transparency,
              child: InkWell(
                // should the same thing as onDismissed
                onTap: onDismissed,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    padding: EdgeInsets.only(right: 5, top: 5),
                    child: Container(
                      child: SvgPicture.asset(
                        CLEAR_WITH_OUTLINE,
                        height: 17,
                        width: 17,
                        color: Theme.of(ctx).backgroundColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
