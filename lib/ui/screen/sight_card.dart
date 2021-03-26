import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard({this.sight});

  @override
  Widget build(BuildContext context) {
    return Container(
      //set the size of the card
      constraints: BoxConstraints(maxHeight: 250, maxWidth: 400),
      child: Column(
        children: [
          // type of widget which is taking as much space as it can in order to fill the parrent widget
          Expanded(
              child: Container(
            //set all Alignment of container's elements relative to expanded parrent
            alignment: Alignment.topLeft,

            decoration: BoxDecoration(
                //image is not required as part of 4.4
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(this.sight.url)),
                //should be something like
                //color: Colors.red,

                //set the radius of upper left/righe corners
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),

            child: Container(
                //set the space of container's childs relative to container parrent
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  //set the childs of row to take as much space between as they can 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      this.sight.type,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    //icon is not requred as part of 4.4
                    Icon(
                      Icons.bookmark,
                      color: Colors.white,
                    )
                    //should be something like this
                    //Container(height:10,weight:10,color: Colors.black)
                  
                  ],
                )),
          )),
          Expanded(
            child: Container(

              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Container(
                
                padding: EdgeInsets.only(top: 20, left: 20, right: 100),
                child: Column(
                    //set the alignment to left in column
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        this.sight.name,
                        // in order to prevent overflow from card
                        maxLines: 2, 
                        // will add 3 dots at the end of text in case text is to big and doesn't fit into parrent 
                        overflow: TextOverflow.ellipsis, 
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      //add empty space between childrens in column
                      SizedBox(height: 10),
                      Text(
                        this.sight.details,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey),
                      )
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
