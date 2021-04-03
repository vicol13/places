import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/network_image.dart';
import './sight_card.dart';

class VisitedSightCard extends StatelessWidget {
  final Sight sight;

  const VisitedSightCard({this.sight});

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
                  child: _VisitedSightCardHeader(
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

class _VisitedSightCardHeader extends StatelessWidget {
  final String sightUrl;
  final String sightType;

  _VisitedSightCardHeader({this.sightType, this.sightUrl});

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
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Row(children: [
                  Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.close,
                    color: Colors.white,
                  )
                ])
              ],
            )),
      ],
    );
  }
}
