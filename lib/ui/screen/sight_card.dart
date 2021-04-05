import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/network_image.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard({this.sight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              Expanded(
                  child: SightCardHeader(
                sightType: this.sight.type,
                sightUrl: this.sight.url,
              )),
              Expanded(
                  child: SightCardBody(
                sightDetails: this.sight.details,
                sightName: this.sight.name,
              )),
            ],
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
                  style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 15,color: Colors.white),
                ),
                Icon(
                  Icons.bookmark,
                  color: Colors.white,
                )
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
