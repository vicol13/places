import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/screen/res/svgs.dart';

///
///
///
class AddPhotoButton extends StatelessWidget {
  final VoidCallback onTap;
  const AddPhotoButton({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 60,
            width: 60,
            // color: Colors.red,
            alignment: Alignment.center,
            decoration: BoxDecoration(
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

