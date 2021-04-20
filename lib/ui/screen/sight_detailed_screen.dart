import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/res/svgs.dart';
import 'package:places/ui/screen/widgets/network_image.dart';
import 'package:places/domain/sight_type.dart';

///
/// represet the screen which will display the details of sight
///
///
class SightDetails extends StatelessWidget {
  Sight sight;

  SightDetails(this.sight);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,

          ///
          /// header
          ///
          children: [
            Expanded(
              child: Stack(children: [
                ///
                /// image gallery
                ///
                Container(
                  width: double.infinity,
                  child: NetworkImageWithLoader(
                    url: this.sight.url,
                    fit: BoxFit.fill,
                  ),
                ),

                ///
                /// Back button with arrow
                ///
                Padding(
                  padding: EdgeInsets.only(top: 70, left: 30),
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () {
                        print("back button callback");
                      },
                      child: Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context).backgroundColor,
                          ),
                          child: Container(
                              height: 20,
                              width: 20,
                              child: SvgPicture.asset(LEFT_ARROW,
                                  color: Theme.of(context).primaryColor))),
                    ),
                  ),
                ),
              ]),
            ),

            ///
            /// body
            ///
            Expanded(
              child: Column(children: [
                Container(
                  color: Theme.of(context).backgroundColor,
                  alignment: Alignment.topLeft,
                  padding:
                      EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 20),
                  //will be refactored to single scroll child
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///
                      /// Sight title
                      ///
                      Text(
                        this.sight.name,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: 25),
                      ),
                      SizedBox(height: 15),

                      ///
                      /// Sight type and short description
                      ///
                      Row(
                        //should not be hardcoded
                        children: [
                          Text(
                            this.sight.type.toUiString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "closed after 9",
                            style: Theme.of(context).textTheme.bodyText2,
                          )
                        ],
                      ),
                      SizedBox(height: 40),

                      ///
                      /// Sight details
                      ///
                      Text(this.sight.details,
                          style: Theme.of(context).textTheme.bodyText1),
                      SizedBox(height: 25),

                      ///
                      /// build route button
                      ///
                      MaterialButton(
                        onPressed: () {
                          print("build route callback");
                        },
                        height: 50,
                        minWidth: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              child: SvgPicture.asset(
                                ROUTE,
                                color: Colors.white,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Build Route",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        color: Colors.white, fontSize: 18))
                          ],
                        ),
                        color: Theme.of(context).buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        elevation: 0,
                      ),
                      SizedBox(height: 15),
                      Container(
                        color: Colors.grey,
                        height: 0.5,
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          ///
                          /// schedule button
                          ///
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                print("schedule callback");
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    child: SvgPicture.asset(
                                      CALENDAR,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .color,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Schedule",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          ),

                          ///
                          /// To favorites button
                          ///
                          Expanded(
                              child: TextButton(
                            onPressed: () {
                              print("to favorites callback");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: SvgPicture.asset(
                                    HEART,
                                    color: Theme.of(context).primaryColor,
                                    fit: BoxFit.fitWidth,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "To favorites",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                          fontSize: 18,
                                          color:
                                              Theme.of(context).primaryColor),
                                )
                              ],
                            ),
                          ))
                        ],
                      )
                    ],
                  ),
                )
              ]),
            )
          ]),
    );
  }
}
