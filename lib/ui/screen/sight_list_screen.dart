import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_detailed_screen.dart';
import '../styled_title.dart';
import '../../mocks.dart' as mockdata;

class SightListScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: SightDetails(mockdata.mocks[0]),
    // );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(top: 50,left: 30),
          child: StyledTitle('list of', 'interesting places'),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children:[
              SizedBox(height: 30,),
              SightCard(sight:mockdata.mocks[0]),
              SizedBox(height: 30,),
              SightCard(sight:mockdata.mocks[1]),
              SizedBox(height: 30,),
              SightCard(sight:mockdata.mocks[2]),
              SizedBox(height: 30,),
              SightCard(sight:mockdata.mocks[3])
            ]
            ),
        ),
      ),
    );
  }
}
