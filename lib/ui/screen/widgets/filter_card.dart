import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


///
/// represent Filter Icon and title
///
class FilterCard extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final Widget icon;
  final String type;

  FilterCard(
      {Key key,
      @required this.isSelected,
      @required this.onTap,
      @required this.icon,
      @required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor:
          MaterialStateColor.resolveWith((states) => Colors.transparent),
      highlightColor:
          MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: onTap,
      child: Column(children: [
        Expanded(
          child: AspectRatio(
            //fix the position of marker
            aspectRatio: 1,
            child: Stack(
              children: [
                ///
                /// icon of filter
                ///
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).buttonColor.withOpacity(0.3)),
                  child: Padding(
                    child: icon,
                    padding: EdgeInsets.all(20),
                  ),
                ),
                _isSelected(context, this.isSelected)
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        ///
        /// title of filter
        ///
        Text(
          this.type,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Theme.of(context).primaryColor),
        )
      ]),
    );
  }

  //
  //  return the selected filter mark
  //
  Widget _isSelected(BuildContext context, bool input) {
    return input
        ? Container(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: SvgPicture.asset(
                  'res/assets/done.svg',
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ),
          )
        : Container();
  }
}
