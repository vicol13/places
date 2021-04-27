import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/res/svgs.dart';
import 'package:places/ui/screen/widgets/network_image.dart';
import 'package:places/domain/sight_type.dart';

///
/// display data of sight
///
class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard({this.sight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(alignment: Alignment.topRight, children: [
              Column(
                children: [
                  ///
                  /// Card header
                  ///
                  Expanded(
                      child: SightCardHeader(
                    sightType: this.sight.type.toUiString(),
                    sightUrl: this.sight.url,
                  )),

                  ///
                  /// Card body
                  ///
                  Expanded(
                    child: SightCardBody(
                      sightDetails: this.sight.details,
                      sightName: this.sight.name,
                    ),
                  ),
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

              ///
              /// want to visit button
              ///
              Padding(
                padding: EdgeInsets.only(right: 20, top: 20),
                child: MaterialButton(
                  height: 40,
                  minWidth: 40,
                  onPressed: () {
                    print("want to visit callback");
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset(HEART, color: Colors.white),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class SightCardHeader extends StatelessWidget {
  final String sightUrl;
  final String sightType;

  SightCardHeader({this.sightType, this.sightUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: NetworkImageWithLoader(
            url: sightUrl,
            fit: BoxFit.fill,
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sightType,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontSize: 15, color: Colors.white),
                ),
              ],
            )),
      ],
    );
  }
}

class SightCardBody extends StatelessWidget {
  final String sightName;
  final String sightDetails;

  SightCardBody({this.sightDetails, this.sightName});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Container(
        color: Theme.of(context).cardColor,
        padding: EdgeInsets.only(top: 20, left: 20, right: 100),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            sightName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            sightDetails,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText2,
          )
        ]),
      ),
    );
  }
}
