import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/res/svgs.dart';
import 'package:places/ui/screen/sight_details_screen/sight_detailed_screen.dart';
import 'package:places/ui/screen/widgets/center_message.dart';
import 'package:places/ui/screen/widgets/network_image.dart';
import 'package:places/domain/sight_type.dart';
///
/// Widget which display search results of sights in search screen
///
class SightListSearchResult extends StatelessWidget {
  Future<List<Sight>> sights;
  SightListSearchResult({this.sights});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sight>>(
        future: sights,
        builder: (ctx, snapshot) {
          // print("searching");
          if (snapshot.hasData) {
            if (snapshot.data.isEmpty) {
              return _noResultsMessage(ctx);
            }
            return _searchResults(snapshot.data);
          } else if (snapshot.hasError) {
            return _errorMessage(ctx);
          }
          // By default, show a loading spinner
          return Center(child: CupertinoActivityIndicator());
        });
  }
  ///
  /// will iterate throught list of sights and will display them
  ///
  Widget _searchResults(List<Sight> sights) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var sight in sights)
            Column(children: [
              SizedBox(
                height: 20,
              ),
              SightCardSearchResult(
                sight: sight,
              )
            ]),
        ],
      ),
    );
  }

  Widget _noResultsMessage(BuildContext ctx) {
    return CenterMessage(
        icon: SvgPicture.asset(
          SEARCH,
          height: 100,
          width: 100,
        ),
        message: Text(
          "No results matching criteria",
          style: Theme.of(ctx).textTheme.subtitle1.copyWith(color: Colors.grey),
        ));
  }

  Widget _errorMessage(BuildContext ctx) {
    //todo find different svg
    return CenterMessage(
        icon: SvgPicture.asset(
          SEARCH,
          height: 100,
          width: 100,
        ),
        message: Text(
          "Error occured",
          style: Theme.of(ctx).textTheme.subtitle1.copyWith(color: Colors.grey),
        ));
  }
}

///
/// Card which display sight search results
///
class SightCardSearchResult extends StatelessWidget {
  final Sight sight;
  const SightCardSearchResult({Key key, this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SightDetails(sight)),
                  );
              },
              child: Container(
                child: Row(
                  children: [
                    ///
                    /// image
                    ///
                    Container(
                      height: 75,
                      width: 75,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: NetworkImageWithLoader(url: sight.url)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ///
                    /// title of sight & type
                    ///
                    Expanded(
                        child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sight.name,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(height: 10),
                          Text(
                            sight.type.toUiString(),
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
