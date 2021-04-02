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
                  child: _SightCardHeader(
                sightType: this.sight.type,
                sightUrl: this.sight.url,
              )),
              Expanded(
                  child: _SightCardBody(
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

class _SightCardHeader extends StatelessWidget {
  final String sightUrl;
  final String sightType;

  _SightCardHeader({this.sightType, this.sightUrl});

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

class _SightCardBody extends StatelessWidget {
  final String sightName;
  final String sightDetails;

  _SightCardBody({this.sightDetails, this.sightName});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Container(
        color: Colors.grey[300],
        padding: EdgeInsets.only(top: 20, left: 20, right: 100),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            sightName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            sightDetails,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey),
          )
        ]),
      ),
    );
  }
}
