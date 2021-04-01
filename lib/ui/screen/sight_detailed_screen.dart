import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class SightDetails extends StatelessWidget {
  Sight sight;

  SightDetails(this.sight);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          
          alignment:Alignment.topLeft,
          padding: EdgeInsets.only(left: 30,top: 50),
         
          //not requeired int 4.6 should be empty container .
          // color: Colors.red,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(this.sight.url),
            ),
          ),
          constraints:
              BoxConstraints(maxWidth: double.infinity, maxHeight: 400),
                //should be different button or empty container 
              child: Icon(
                Icons.backspace,
                color: Colors.white,
                size: 40,
              ),
        ),
        Expanded(
          child: Container(
            color: Colors.blueGrey[50],
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
            //maybe should be single scroll child ?
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(this.sight.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  SizedBox(height: 15),
                  Row( //should not be hardcoded
                    children: [
                      Text(this.sight.type,style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: 15),
                      Text("closed after 9",style: TextStyle(color:Colors.grey),)],
                  ),
                  SizedBox(height: 40),
                  Text(this.sight.details),
                  SizedBox(height: 25),
                  Container(color:Colors.lightGreen,height: 50,),
                  SizedBox(height: 15),
                  Container(color:Colors.grey,height: 1,),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(child: Container(color: Colors.lightGreen,height: 50,)),
                      SizedBox(width: 15,),
                      Expanded(child: Container(color: Colors.lightGreen,height: 50,))
                    ],
                  )

              ],
            ),
          ),
        )
      ]),
    );
  }
}
