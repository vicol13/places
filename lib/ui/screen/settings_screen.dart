import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/provider/theme_provider.dart';
import 'package:provider/provider.dart';


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              "Settings",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          body: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dark theme",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 16, color: Theme.of(context).primaryColor),
                    ),
                    CupertinoSwitch(
                        value: provider.isDarkTheme,
                        onChanged: (_) {
                          provider.switchTheme();
                        })
                        
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 0.3,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Watch tutorial",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor),
                      ),
                      Icon(
                        Icons.info,
                        color: Theme.of(context).buttonColor,
                      )
                    ]),
              
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 0.3,
                  width: double.infinity,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
