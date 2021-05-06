import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/screen/res/svgs.dart';

///
/// button for adding photos whene adding a sight
///
class AddPhotoButton extends StatelessWidget {
  final VoidCallback onTap;
  const AddPhotoButton({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 60,
            width: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Theme.of(context).buttonColor)),
            child: SvgPicture.asset(
              PLUS,
              height: 40,
              width: 40,
              color: Theme.of(context).buttonColor,
            ),
          ),
        ),
      ),
    );
  }
}
