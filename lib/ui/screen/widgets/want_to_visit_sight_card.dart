import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/network_image.dart';
import 'sight_card.dart';
import 'package:places/domain/sight_type.dart';

///
/// represent want to visit sight card
///
class WantToVisitSightCard extends StatelessWidget {
  final Sight sight;
  const WantToVisitSightCard({this.sight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            alignment: Alignment.topRight,
                      children:[ Column(
              children: [
                ///
                /// card header (same as default card)
                ///
                Expanded(
                    child: SightCardHeader(
                  sightType: this.sight.type.toUiString(),
                  sightUrl: this.sight.url,
                )),
                ///
                /// card body (same as default card)
                /// 
                Expanded(
                    child: SightCardBody(
                  sightDetails: this.sight.details,
                  sightName: this.sight.name,
                )),
              ],
            ),
            ///
            /// ripple
            ///
            Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    print("card pressed callback");
                  },
                ),
              ),
            Padding(
                padding: EdgeInsets.only(right: 5, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:[ 
                    ///
                    /// schedule place button
                    ///
                    MaterialButton(
                    height: 40,
                    minWidth: 40,
                    onPressed: () {
                      print("schedule to visit callback");
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset('res/assets/calendar.svg',
                          color: Colors.white.withOpacity(1)),
                    ),
                  ),
                  ///
                  /// remove button
                  ///
                  MaterialButton(
                    height: 40,
                    minWidth: 40,
                    onPressed: () {
                      print("remove callback");
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset('res/assets/remove.svg',
                          color: Colors.white),
                    ),
                  )
                  
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
