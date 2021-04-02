import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/network_image.dart';

class SightDetails extends StatelessWidget {
  Sight sight;

  SightDetails(this.sight);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: Stack(children: [
            Container(
              width: double.infinity,
              child: NetworkImageWithLoader(
                url: this.sight.url,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 70, left: 30),
              child: Icon(
                Icons.backspace,
                color: Colors.white,
                size: 40,
              ),
            )
          ]),
        ),

        Expanded(
          child: Column(children: [
            Container(
              color: Colors.blueGrey[50],
              alignment: Alignment.topLeft,
              padding:
                  EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 20),
              //maybe should be single scroll child ?
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.sight.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(height: 15),
                  Row(
                    //should not be hardcoded
                    children: [
                      Text(
                        this.sight.type,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 15),
                      Text(
                        "closed after 9",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  SizedBox(height: 40),
                  Text(this.sight.details),
                  SizedBox(height: 25),
                  Container(
                    color: Colors.lightGreen,
                    height: 50,
                  ),
                  SizedBox(height: 15),
                  Container(
                    color: Colors.grey,
                    height: 1,
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        color: Colors.lightGreen,
                        height: 50,
                      )),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: Container(
                        color: Colors.lightGreen,
                        height: 50,
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
